# == Schema Information
#
# Table name: users
#
#  id                      :integer          not null, primary key
#  email                   :string(255)      default(""), not null
#  encrypted_password      :string(255)      default(""), not null
#  reset_password_token    :string(255)
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :string(255)
#  last_sign_in_ip         :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  profile_img             :string(255)
#  wallet_account_id       :string(255)
#  wallet_account_password :string(255)
#  name                    :string(255)
#

class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
	
	has_many :identities, dependent: :destroy
  
  def self.find_for_oauth(auth, signed_in_resource = nil)
		
    # user와 identity가 nil이 아니라면 받는다
    identity = Identity.find_for_oauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    
    # user가 nil이라면 새로 만든다.
    if user.nil?
      
      # 이미 있는 이메일인지 확인한다.
      email = auth.info.email

      user = User.where(:email => email).first  
      unless self.where(email: auth.info.email).exists?
        
        # 없다면 새로운 데이터를 생성한다.
        if user.nil?
          # 카카오는 email을 제공하지 않음

          if auth.provider == "kakao"
            # provider(회사)별로 데이터를 제공해주는 hash의 이름이 다릅니다.

            # 각각의 omnaiuth별로 auth hash가 어떤 경로로, 어떤 이름으로 제공되는지 확인하고 설정해주세요.

            user = User.new(
							name: auth.info.name,
              profile_img: auth.info.image,
              # 이 부분은 AWS S3와 연동할 때 프로필 이미지를 저장하기 위해 필요한 부분입니다.

              # remote_profile_img_url: auth.info.image.gsub('http://','https://'),

              password: Devise.friendly_token[0,20]
            )

          else
            user = User.new(
              email: auth.info.email,
							name: auth.info.name,
              profile_img: auth.info.image,
              # remote_profile_img_url: auth.info.image.gsub('http://','https://'),

              password: Devise.friendly_token[0,20]
            )
          end
          user.save!
        end
        
      end
    
    end
    
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
    
  end
  
  def email_required?
    false
  end
 
  def email_changed?
    false
  end
end
