class AddVector < ActiveRecord::Migration[7.0]
  def up
    add_column :prompts, :tsv, :tsvector
    add_index :prompts, :tsv, using: 'gin'
    execute <<-SQL
      CREATE TRIGGER prompts_tsv_update BEFORE INSERT OR UPDATE
      ON prompts FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(
        tsv,
        'pg_catalog.english',
        body
      );
      UPDATE prompts SET body = body;
    SQL
  end

  def down
    execute <<-SQL
      DROP TRIGGER IF EXISTS prompts_tsv_update on prompts;
    SQL
    remove_index :prompts, :tsv_body
    remove_column :prompts, :tsv_body
  end
end
