class Choice
	include Mongoid::Document
	include Mongoid::Timestamps

	field :text, type: String
	field :correct, type: Boolean, default: false
  	belongs_to :question
end
