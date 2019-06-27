class InitDatabase < ActiveRecord::Migration[5.2]
  def change
  	create_table :posts do |t|
      t.string   :title,     null: false
      t.references :user, 
        null: false,
        foreign_key: true,
        on_update:   :cascade,
        on_delete:   :restrict
      t.string   :comment
      t.text     :url,       null: false
      t.text     :thumbnail, null: false

      t.timestamp
    end
  end
end
