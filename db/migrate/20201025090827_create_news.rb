class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.text :content
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
