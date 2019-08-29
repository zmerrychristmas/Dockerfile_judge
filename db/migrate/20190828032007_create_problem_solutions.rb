class CreateProblemSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :problem_solutions do |t|
      t.belongs_to :problem
      t.text    :description
      t.text    :source_code
      t.belongs_to :language
      t.integer :difficulty
      t.timestamps
    end
  end
end
