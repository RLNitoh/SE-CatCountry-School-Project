class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :CatName
      t.string :CatNameDistractor1
      t.string :CatNameDistractor2
      t.string :CatNameDistractor3
      t.string :NameAnswer
      t.string :CatOrigin
      t.string :CatOriginDistractor1
      t.string :CatOriginDistractor2
      t.string :CatOriginDistractor3
      t.string :OriginAnswer
      t.string :CatPicture    
      t.integer :GameID

      t.timestamps
    end
  end
end
