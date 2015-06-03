#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
#require 'app'
require 'bazuro'

use Rack::Auth::Basic, "Protected Area" do |username, password|
  username == Bazuro.config["remote"]["username"] && password == Bazuro.config["remote"]["password"]
end

get '/' do
  "It Works!"
end

post '/pdf2docx' do
  puts params.to_s
  tempfile = params["file"][:tempfile]
  filename = params["file"][:filename]
  input = "#{Bazuro.config["local"]["temp_path"]}/#{filename}"
  FileUtils.copy(tempfile.path, input)
  pdf2doc = Bazuro::Pdf2docx.new(input)
  if pdf2doc.convert()
    send_file pdf2doc.docx, :filename => pdf2doc.docname
    "Converted SUCCESS Mr. Bazuro!"
  else
    "NO Mr. Bazuro, you don't deserve it!"
  end
end