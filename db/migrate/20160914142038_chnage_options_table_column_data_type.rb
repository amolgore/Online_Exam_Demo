class ChnageOptionsTableColumnDataType < ActiveRecord::Migration
  def change
  	change_column :options, :is_correct?, :boolean ,:default => false
  end
end
