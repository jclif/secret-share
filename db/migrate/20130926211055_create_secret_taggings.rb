class CreateSecretTaggings < ActiveRecord::Migration
  def change
    create_table :secret_taggings do |t|
      t.references :secret
      t.references :tag

      t.timestamps
    end
    add_index :secret_taggings, :secret_id
    add_index :secret_taggings, :tag_id
  end
end
