class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login]

  storytime_user

  # overriding 'devise' method for using background email sending
  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end

  ## Ability to use storytime_name or email for login

  validates :storytime_name,
            presence: true,
            uniqueness: {
                case_sensitive: false
            }
  validates_format_of :storytime_name,
                      with: /^[a-zA-Z0-9_\.]*$/,
                      multiline: true
  validate :validate_storytime_name_intersection_with_email

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(storytime_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:storytime_name) || conditions.has_key?(:email)
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_hash).first
    end
  end

  def login=(login)
    @login = login
  end

  def login
    # storytime_name override in storytime_user and return email if name is blank
    @login || storytime_name
  end

private

  def validate_storytime_name_intersection_with_email
    if User.where(email: storytime_name).exists?
      errors.add(:storytime_name, :invalid)
    end
  end
end
