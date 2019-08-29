class CreateProblems < ActiveRecord::Migration[5.0]
  def change
    create_table :problems do |t|
        t.string :title
        t.text :description
        t.string :code
        t.integer :difficulty
        t.boolean :is_public
        t.integer :author_id
        t.integer :point
        t.integer :solve_count
        t.text :input_string
        t.text :output_string
        t.bigint :time_limit
        t.bigint :memory_limitz
        t.timestamps
    end
  end
end
