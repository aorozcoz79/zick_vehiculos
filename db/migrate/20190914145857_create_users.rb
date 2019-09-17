class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.date :born_date
      t.string :identification
      t.string :profession
      t.string :email
      t.string :password_digest
      t.float :income
      t.integer :married
      t.timestamps
    end
  end
end
