require "bazuro/version"
require "yaml"

module Bazuro

  @config = YAML.load_file("lib/generators/bazuro_config.yml")

  class Pdf2docx
    def initialize(pdf)
      @pdf = pdf
      @docx = nil
    end

    def send(pdf)

    end

    def respond_to(user)

    end

    def test(docx)

    end

    def convert(path)
      system("cd #{path} && #{CONFIG[:winword]} /mPDF2DOCX /q #{@pdf}")
    end
  end
end
