class AddParentIdReferencesToComment < ActiveRecord::Migration
  def change
  	add_reference :comments, :parent, index: true
		add_foreign_key :comments, :comments, column: 'parent_id'
  end
end
