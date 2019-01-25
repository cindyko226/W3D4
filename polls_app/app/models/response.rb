# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#

class Response < ApplicationRecord
    # validate :respondent_already_answered?
    belongs_to :answer_choice,
        primary_key: :id,
        foreign_key: :answer_choice_id,
        class_name: :AnswerChoice
    
    belongs_to :respondent,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User
    
    has_one :question,
      through: :answer_choice,
      source: :question 


    # def sibling_responses 
    #     if self.id.nil? 
    #       question.responses 
    #     else 
    #       question.responses.where.not("responses.id = ?", self.id)
    #     end 
    # end

    # def respondent_already_answered? 
    #    siblings = sibling_responses
    #    siblings.each do |sibling| 
    #     if sibling.user_id == self.user_id 
    #         errors[:user_id] << "Already responded"
    #     end 
    #    end 
    # end 
end
