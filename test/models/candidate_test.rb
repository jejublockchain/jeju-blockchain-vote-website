# == Schema Information
#
# Table name: candidates
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  main_image_data :text(65535)
#  description     :text(65535)
#  pledge          :text(65535)
#  policy          :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
