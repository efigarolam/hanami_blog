Hanami::Model.migration do
  change do
    alter_table :comments do
      add_index :post_id
    end
  end
end
