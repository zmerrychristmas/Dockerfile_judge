# == Schema Information
#
# Table name: problems
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  code          :string
#  difficulty    :integer
#  is_public     :boolean
#  author_id     :integer
#  point         :integer
#  solve_count   :integer
#  input_string  :text
#  output_string :text
#  time_limit    :bigint(8)
#  memory_limitz :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Problem < ApplicationRecord
    belongs_to :problem_categories, optional: true
    has_many :languages
end
