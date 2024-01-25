class UserOcr < ApplicationRecord
  
  belongs_to :user
  
  
  has_one_attached :ocr_image
  
  
  def strip_zenkaku(args:)
    gargs.sub(/\A[ 　\t\r\n\f\v]*|[ 　\t\r\n\f\v\0]*\Z/, "/br")
  end
  
  def shaped_only_numbers(args:)
    # 全角を半角に変換後、半角数字を抽出
    args.tr("０-９", "0-9").delete("^0-9")
  end

  
end
