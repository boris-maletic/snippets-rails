class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.references :user, null: false, index: true

      t.string :filename, null: false
      t.text :content, null: false
      t.text :execution_output

      t.integer :comments_count, null: false, default: 0

      t.timestamps null: false
    end
  end
end
