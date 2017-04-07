class CreateDownFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :down_files do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
