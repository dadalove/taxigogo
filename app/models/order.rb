class Order < ActiveRecord::Base
  belongs_to :car
  belongs_to :user

  validates :pickup_location,presence: true
  validates :destination,presence: true
  # validates :send_name,presence: true
  validates :tel,presence: true,numericality: {only_integer: true}
  validates :recipient,presence: true
  validates :recipient_tel,presence: true,numericality: {only_integer: true}
  # validates :email,presence: true

  def book_car!
    arr = Car.where( :status => "available").near(pickup_location)
    
    return false if arr.empty?

    car = arr.first
    car.status = "running"
    car.save

    self.status = "processed"
    self.car = car
    self.save

    return car
  end

  after_create :send_user_mail
  before_validation :strip_email
  
  def send_user_mail
    
  end

  def strip_email
    self.email = self.email.try(:strip)
  end



end
