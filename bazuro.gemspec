# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bazuro/version'

Gem::Specification.new do |spec|
  spec.name          = "bazuro"
  spec.version       = Bazuro::VERSION
  spec.authors       = ["Adrian Cepillo", "Iñigo Ranedo"]
  spec.email         = ["adrian.cepillo@gmail.com"]
  spec.summary       = %q{Bazuro-PDF2DOCX allows convert from PDF to DOCX, through MS-WORD 2013 or later, using a macro}
  spec.description   = %q{Bazuro-PDF2DOCX allows convert from PDF to DOCX, through MS-WORD 2013 or later, using a macro}
  spec.homepage      = "https://github.com/adriancm/bazuro-pdf2docx"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
