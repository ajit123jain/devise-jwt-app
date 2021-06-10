class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  include Devise::JWT::RevocationStrategies::Allowlist

  has_many :allowlisted_jwts, foreign_key: :business_id,
                        as: :business,
                        dependent:   :destroy


  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: self

  def on_jwt_dispatch(token, payload) 
    super 
  end       
end
