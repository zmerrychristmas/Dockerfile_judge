# == Schema Information
#
# Table name: problem_data
#
#  id         :integer          not null, primary key
#  problem_id :integer
#  path       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_problem_data_on_problem_id  (problem_id)
#

class ProblemDatum < ApplicationRecord
end
