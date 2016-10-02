module PicturesHelper
  def choose_new_or_edit    # 追記したよ。dive03
      if action_name == 'new' || action_name == 'confirm'  # アクションが、newまたは、confirmの時にのみtrueを返却します。dive03
          confirm_pictures_path
      elsif action_name == 'edit'
          picture_path
      end
  end
    
  def insta_img(picture)
    return image_tag(picture.pic, alt: picture.title) if picture.pic?
    
  end  

end
