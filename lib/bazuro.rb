require "bazuro/version"
require 'net/http'
require "yaml"
require "rest-client"

module Bazuro

  CONFIG = YAML.load_file("lib/generators/bazuro_config.yml") if File.exists?("lib/generators/bazuro_config.yml")

  def self.config
    CONFIG
  end

  class Pdf2docx

    attr_accessor :pdf, :docx, :docname

    def initialize(pdf)
      @pdf = pdf
      @docx = nil
      @docname = nil
    end

    def request
      RestClient::Request.new(
          :method => :post,
          :url => Bazuro.config["remote"]["url"],
          :user => Bazuro.config["remote"]["username"],
          :password => Bazuro.config["remote"]["password"],
          :payload => {
              :file => @pdf
          }
      ).execute
    end

    def test

    end

    def convert(path = Bazuro.config["local"]["temp_path"])
      @docname = @pdf.split('/').last.gsub(".pdf", ".docx")
      @docx = "#{path}/#{@docname}"
      system("cd #{path} && #{Bazuro.config["local"]["winword_path"]} /mPDF2DOC /q #{@pdf}")
    end
  end
end
