class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.binary :document

      t.timestamps
    end
  end
end
