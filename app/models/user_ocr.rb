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
  
  def strip_zenkaku(args:)
    gargs.sub(/\A[ 　\t\r\n\f\v]*|[ 　\t\r\n\f\v\0]*\Z/, "/br")
  end
  
  def shaped_only_numbers(args:)
    # 全角を半角に変換後、半角数字を抽出
    args.tr("０-９", "0-9").delete("^0-9")
  end

  
end
