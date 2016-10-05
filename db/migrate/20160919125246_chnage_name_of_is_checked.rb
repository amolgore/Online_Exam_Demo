class ChnageNameOfIsChecked < ActiveRecord::Migration
  def change
  	rename_column :options, :is_correct?, :is_correct
  end
end
