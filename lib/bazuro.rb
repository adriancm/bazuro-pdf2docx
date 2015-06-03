require "bazuro/version"
require 'net/http'
require "yaml"

module Bazuro

  def self.config
    @config ||= YAML.load_file("lib/generators/bazuro_config.yml")
  end

  class Pdf2docx

    attr_accessor :pdf, :docx, :docname

    def initialize(pdf)
      @pdf = pdf
      @docx = nil
      @docname = nil
    end

    def request
      response = RestClient::Request.new(
          :method => :post,
          :url => Bazuro.config["remote"]["url"],
          :user => Bazuro.config["remote"]["username"],
          :password => Bazuro.config["username"]["password"],
          #:headers => { :accept => "",
          #              :content_type => :json }
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
