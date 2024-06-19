class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
