class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # IDランダム生成
  generate_public_uid column: :public_uid
  def to_param
    public_uid
  end
  
  validates :public_uid, presence: true, format: { with: /\A[a-z0-9]+\z/i }, length: { maximum: 16 }, on: :update
  validates :is_active, inclusion: {in: [true, false]}
  validates :name, presence: true, length: { in: 1..10 }

  has_one_attached :profile_image

  scope :only_active, -> { where(is_active: true) }

  has_many :disks,         dependent: :destroy

  def get_profile_image
    if profile_image.attached?
      profile_image.variant( resize: "160x160" ).processed
    else
      profile_image = 'no_image.jpg'
    end
    return profile_image
  end


end
