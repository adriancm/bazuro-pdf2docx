class BazuroGenerator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__)))
  def copy_initializer
    copy_file 'bazuro_initializer.rb', 'config/initializers/bazuro_initializer.rb'
    copy_file 'bazuro_config.yml', 'config/bazuro_config.yml'
  end
end