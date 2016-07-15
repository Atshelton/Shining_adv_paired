require "yaml"
require "active_record"

db_configs = YAML.load_file(File.expand_path("./db/database.yml"))

ActiveRecord::Base.establish_connection(
  db_configs[ENV["RACK_ENV"]]
)
