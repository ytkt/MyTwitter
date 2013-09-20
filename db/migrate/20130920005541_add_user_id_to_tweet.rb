# -*- coding: utf-8 -*-
class AddUserIdToTweet < ActiveRecord::Migration
  def change
    add_column(:tweets, :user_id, :integer)
    # add_column(テーブル名 カラム名, タイプ [, オプション])
  end
end
