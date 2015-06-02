#!/usr/bin/env ruby

require 'sinatra'
#require 'bazuro'

get '/' do
  "It Works!"
end

post '/pdf2docx' do
  user = params['user']
  pass = params['password']
  tempfile = params['file'][:tempfile]
  filename = params['file'][:filename]
  File.copy(tempfile.path, "./files/#{filename}")
  send_file "./files/#{filename}", :filename => filename, :type => 'Application/octet-stream'
end