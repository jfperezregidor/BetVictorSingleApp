class CreateSports < ActiveRecord::Migration[5.1]
  def change
    create_table :sports do |t|
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
