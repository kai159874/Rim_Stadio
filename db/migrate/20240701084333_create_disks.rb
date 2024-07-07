class CreateDisks < ActiveRecord::Migration[6.1]
  def change
    create_table :disks do |t|

      t.references  :user,          null: false, foreign_key: true
      t.string      :title,         null: false
      t.string      :introduction
      t.string      :file,          null: false
      t.boolean     :on_public,     null: false, default: true


      t.timestamps
    end
  end
end
