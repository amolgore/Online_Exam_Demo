class AddOptionIdToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :option, index: true, foreign_key: true
  end
end
