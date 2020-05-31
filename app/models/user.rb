class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    #validates:,{presence:true}
    validates :email,{presence:true,uniqueness:true}
    has_many :posts,dependent: :destroy
    validates :introduce,length: { maximum: 50 }

    mount_uploader :image_name, ImageUploader
    def posts
      return Post.where(user_id: self.id)
    end
end
