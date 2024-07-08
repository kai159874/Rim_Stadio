class Disk < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :title,               length: { in: 1..50 }
    validates :file
  end
  validates :on_public,           inclusion: {in: [true, false]}

  has_one_attached :jacket_image

  validates :introduction, length: { maximum: 50 }

end
