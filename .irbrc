#!/usr/bin/ruby
#require 'irb/completion'
#require 'irb/ext/save-history'
require 'rubygems'

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

IRB.conf[:PROMPT_MODE] = :SIMPLE

IRB.conf[:AUTO_INDENT] = true

def me
  User.find_by_username(ENV['USER'].strip)
end

def r
  reload!
end
