class RemoveColumnFromAnswers < ActiveRecord::Migration
  def change
  	remove_column  :answers, :is_checked
  end
end
