# == Schema Information
#
# Table name: problem_solutions
#
#  id          :integer          not null, primary key
#  problem_id  :integer
#  description :text
#  source_code :text
#  language_id :integer
#  difficulty  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_problem_solutions_on_language_id  (language_id)
#  index_problem_solutions_on_problem_id   (problem_id)
#

class ProblemSolution < ApplicationRecord
end
