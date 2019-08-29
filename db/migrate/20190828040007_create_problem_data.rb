class CreateProblemData < ActiveRecord::Migration[5.0]
  def change
    create_table :problem_data do |t|
      t.belongs_to :problem
      t.string :path
      t.timestamps
    end
  end
end
