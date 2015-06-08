
Bazuro::CONFIG = YAML.load_file("#{Rails.root}/config/bazuro_config.yml")
Mime::Type.register "application/docx", :docx