# == Schema Information
#
# Table name: problem_categories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ProblemCategory < ApplicationRecord
    has_many :problems
end
