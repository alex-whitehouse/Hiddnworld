class Imageupload < ApplicationRecord
    *app/model/ApplicationRecord.rb*
 
mount_uploader :image, ImageUploader
end
