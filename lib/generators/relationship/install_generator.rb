require 'rails/generators'
require 'rails/generators/active_record'

module Relationship
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.expand_path('../../generators/templates', __dir__)

    desc 'Generates migration file.'
    def create_migration_file
      migration_template 'add_relation.rb', 'db/migrate/add_relation.rb'
    end

    def migration_class_name
      if Rails::VERSION::MAJOR >= 5
        "ActiveRecord::Migration[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
      else
        'ActiveRecord::Migration'
      end
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        sleep 1 # make sure each time we get a different timestamp
        Time.new.utc.strftime('%Y%m%d%H%M%S')
      else
        format('%.3d', (current_migration_number(dirname) + 1))
      end
    end

    desc 'Copy controller model and routes for relationship.'
    def manifest
      # Controller
      copy_file "relations_controller.rb", "app/controllers/relations_controller.rb" 

      # Models
      copy_file "relation.rb", "app/models/relation.rb"

      # Route
      route "resources :relations, only: [ :create, :destroy ]"
    end
  end
end
