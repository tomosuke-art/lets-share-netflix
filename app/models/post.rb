class Post < ApplicationRecord
    mount_uploader :image, ImgUploader
    validates :title,:released_year,:image,:summary,:director,:cast,{presence:true}
    belongs_to :user
    
   # validates_uniqueness_of :post_id, scope: :user_id
end
