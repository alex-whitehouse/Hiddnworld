class Imageupload < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
    validates :user_id, presence: true # Make sure the owner's userid is present.
end
