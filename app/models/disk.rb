class Disk < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :title,               length: { in: 1..50 }
    validates :file
  end

  mount_uploader :file, AudioFileUploader
  validates :on_public,           inclusion: {in: [true, false]}

  has_one_attached :jacket_image

  validates :introduction, length: { maximum: 50 }

  def get_jacket_image
    if jacket_image.attached?
      jacket_image.variant( resize: "160x160" ).processed
    else
      jacket_image = 'no_image.jpg'
    end
  end

end
