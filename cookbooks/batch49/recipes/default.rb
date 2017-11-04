#
# Cookbook:: batch49
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
file '/tmp/hellow.txt' do
	content "Welcome to Chef Client. Some changes adding"
end

file '/tmp/hellow1.txt' do
        action :delete
end
