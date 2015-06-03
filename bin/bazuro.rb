#!/usr/bin/env ruby

require 'sinatra'
require 'bazuro'

get '/' do
  "It Works!"
end

post '/pdf2docx' do
  user = params['username']
  pass = params['password']
  if Bazuro.config.remote.username == user && Bazuro.config.remote.password == pass
    tempfile = params['file'][:tempfile]
    filename = params['file'][:filename]
    File.copy(tempfile.path, "./files/#{filename}")
    send_file "./files/#{filename}", :filename => filename, :type => 'Application/octet-stream'
  else
    "Restricted Area!"
  end
end