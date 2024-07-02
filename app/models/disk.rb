class Disk < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :title,               length: { in: 1..50 }
    validates :file
    validates :is_active,           inclusion: {in: [true, false]}
  end
  
  has_one_attached :jacket_image
  
  validates :introduction, length: { maximum: 50 }

end
