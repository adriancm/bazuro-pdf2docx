require "bazuro/version"
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

    def request(pdf)

    end

    def test

    end

    def convert(path = Bazuro.config["local"]["temp_path"])
      @docname = "#{@pdf.split('/').last.split('.').first}.docx"
      @docx = "#{path}/#{@docname}"
      system("cd #{path} && #{Bazuro.config["local"]["winword_path"]} /mPDF2DOC /q #{@pdf}")
    end
  end
end
