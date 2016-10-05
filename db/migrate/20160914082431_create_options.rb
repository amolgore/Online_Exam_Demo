class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :question, index: true, foreign_key: true
      t.string :option_text

      t.timestamps null: false
    end
  end
end
