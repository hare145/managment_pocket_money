class UserOcr < ApplicationRecord
  
  belongs_to :user
  
  
  def perform_ocr(image)
    return unless image.attached?
    image_path = Rails.root.join('tmp', 'uploads', image.filename.to_s)
    File.open(image_path, 'wb') { |file| file.write(image.download) }
    text = RTesseract.new(image_path).to_s
    
    File.delete(image_path) # 一時ファイルを削除

    text
  end
  
end
