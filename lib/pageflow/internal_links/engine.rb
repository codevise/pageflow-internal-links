module Pageflow
  module InternalLinks
    class Engine < Rails::Engine
      isolate_namespace Pageflow::InternalLinks

      if Rails.respond_to?(:autoloaders)
        lib = root.join('lib')

        config.autoload_paths << lib
        config.eager_load_paths << lib

        initializer 'pageflow_internal_links.autoloading' do
          Rails.autoloaders.main.ignore(
            lib.join('generators'),
            lib.join('pageflow-internal-links.rb'),
            lib.join('pageflow/internal_links/version.rb')
          )
        end
      else
        config.autoload_paths << File.join(config.root, 'lib')
      end

      config.i18n.load_path += Dir[config.root.join('config', 'locales', '**', '*.yml').to_s]
    end
  end
end
