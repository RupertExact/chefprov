#
# Cookbook Name:: settings_windows
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


directory 'c:/temp'

template 'c:/temp/server-info.txt' do
	source 'server-info.txt.erb'
end