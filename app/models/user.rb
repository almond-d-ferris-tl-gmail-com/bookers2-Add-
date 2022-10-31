class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # deviseは/bookers2/app/models/user.rbのみに記述する
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  has_one_attached :profile_image

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
  
  # def get_profile_image(width, height)
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpeg')
  #   end
  #   profile_image.variant(resize_to_limit: [width, height]).processed
  # end
  
  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name LIKE ?', content + '%')
    elsif method == 'backward'
      User.where('name LIKE ?', '%' + content)
    else
      User.where('name LIKE ?', '%' + content + '%')
    end
  end

end

