class AddColumnToAnswers < ActiveRecord::Migration
  def change
  	add_column :answers, :is_checked,  :boolean, :default => false
  end
end
