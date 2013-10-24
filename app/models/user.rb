# -*- coding: utf-8 -*-
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
#  devise :database_authenticatable, :registerable,
#         :recoverable, :rememberable, :trackable, :validatable

  devise :database_authenticatable, :omniauthable, :rememberable

  has_many :tweets
  has_many :friendships
  has_many :friends, :through => :friendships


  # self. というのはクラスメソッドを表す
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name: auth.extra.raw_info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         email: "#{auth.uid}@example.com",
                         screen_name: auth.extra.raw_info.screen_name)
    end
    user
  end
end
