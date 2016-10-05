class AddColumnToOptions < ActiveRecord::Migration
  def change
  	add_column :options, :is_correct?, :boolean ,:default => true
  end
end
