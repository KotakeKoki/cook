class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :image
      t.string :title
      t.string :ingridient_1
      t.string :ingridient_2
      t.text :description
      t.text :sentence
      t.references :user

      t.timestamps
    end
  end
end
