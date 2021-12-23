require "onnxruntime"
require "mini_magick"

img = MiniMagick::Image.open("app/assets/images/bears.jpg")
pixels = img.get_pixels

model = OnnxRuntime::Model.new("lib/model.onnx")
result = model.predict({"inputs" => [pixels]})

num_detections = result["num_detections"]
detectionClasses = result["detection_classes"]

coco_labels = {
  23 => "bear",
  88 => "teddy bear"
}
# add more answer classes to model, return codes


def draw_box(img, label, box)
  width, height = img.dimensions

  # calculate box
  thickness = 2
  top = (box[0] * height).round - thickness
  left = (box[1] * width).round - thickness
  bottom = (box[2] * height).round + thickness
  right = (box[3] * width).round + thickness

  # draw box
  img.combine_options do |c|
    c.draw "rectangle #{left},#{top} #{right},#{bottom}"
    c.fill "none"
    c.stroke "red"
    c.strokewidth thickness
  end

  # draw text
  img.combine_options do |c|
    c.draw "text #{left},#{top - 5} \"#{label}\""
    c.fill "red"
    c.pointsize 18
  end
end

result["num_detections"].each_with_index do |n, idx|
  n.to_i.times do |i|
    label = result["detection_classes"][idx][i].to_i
    label = coco_labels[label] || label
    box = result["detection_boxes"][idx][i]
    draw_box(img, label, box)
  end
end

# save image
img.write("labeled.jpg")



