class Address < ActiveRecord::Base
  attr_accessible :line1, :line2, :city, :state, :zip
  
  belongs_to :user
  has_many :orders
  
  validates_uniqueness_of :line1, :scope => :user_id
  validates_presence_of :line1, :city, :state, :zip, :user_id
  validates_numericality_of :zip
  validates_length_of :zip, :is => 5
  #validates_inclusion_of :state, :in => ["DC", "VA", "CA", "MD"]
  validates_format_of :state, :with => /^[A-Z]{2}$/, :message => "should be a capitalized two letter abbreviation"
  
  def to_s
    [line1, line2, city, state, zip].reject(&:blank?).join(", ")
  end
end
