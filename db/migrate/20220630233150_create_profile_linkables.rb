class CreateProfileLinkables < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_linkables do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :profile_linkable_external, polymorphic: true, null: false
      t.integer :kind, null: false

      t.timestamps
    end
  end
end
