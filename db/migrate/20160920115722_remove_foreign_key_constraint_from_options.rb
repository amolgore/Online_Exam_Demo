class RemoveForeignKeyConstraintFromOptions < ActiveRecord::Migration
  def change
  	remove_foreign_key :answers, :options
  end
end
