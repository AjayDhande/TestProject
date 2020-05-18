class Image < ApplicationRecord
  has_many_attached :image_file
  validate :image_file_validation

  def image_file_validation
    if image_file.attached?
      image_file.attachments.each do |attachment|
        if attachment.blob.byte_size > 500000
          attachment.purge
          errors[:base] << I18n.t('validation_messages.image_size')
        elsif !attachment.blob.content_type.starts_with?('image/')
          attachment.purge
          errors[:base] << I18n.t('validation_messages.image_format')
        end
      end
    end
  end  
end
