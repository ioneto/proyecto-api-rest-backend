class User < ApplicationRecord
	has_many :user_subjects
	has_many :subjects, :through => :user_subjects
end