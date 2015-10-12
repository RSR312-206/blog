class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.references :post, index: true
      t.references :tag, index: true
      t.timestamps null: false
    end
  end
end
