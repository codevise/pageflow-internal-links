# Pageflow Internal Links

[![Gem Version](https://badge.fury.io/rb/pageflow-internal-links.svg)](http://badge.fury.io/rb/pageflow-internal-links)
[![Build Status](https://github.com/codevise/pageflow-internal-links/workflows/tests/badge.svg)](https://github.com/codevise/pageflow-internal-links/actions)

Page types for linking to pages inside a Pageflow.

## Installation

Add this line to your application's Gemfile:

    # Gemfile
    gem 'pageflow-internal-links'

Register the page types:

    # config/initializers/pageflow.rb
    Pageflow.configure do |config|
      config.plugin(Pageflow::InternalLinks.plugin)
    end

Include javascripts and stylesheets:

    # app/assets/javascripts/pageflow/application.js
    //= require pageflow/internal_links

    # app/assets/javascripts/pageflow/editor.js
    //= require pageflow/internal_links/editor

    # app/assets/stylesheets/pageflow/application.scss
    @import "pageflow/internal_links";

    # app/assets/stylesheets/pageflow/editor.scss
    @import "pageflow/internal_links/editor";

Import the default theme additions:

    # app/assets/stylesheets/pageflow/themes/default.scss

    @import "pageflow/internal_links/themes/default";
    @import "pageflow/internal_links/themes/default/list_as_multiple_choice";

Install dependencies:

    bundle install

Copy migrations of pageflow-internal-links into your project:

    bundle exec rake pageflow_internal_links:install:migrations

Migrate the database:

    bundle exec rake db:migrate

Restart the application server. The grid page type is available by
default. For the list page type enable the corresponding feature in
the tab *features*.

## Troubleshooting

If you run into problems while installing the page type, please also
refer to the
[Troubleshooting](https://github.com/codevise/pageflow/wiki/Troubleshooting)
wiki page in the
[Pageflow repository](https://github.com/codevise/pageflow). If that
doesn't help, consider
[filing an issue](https://github.com/codevise/pageflow-internal-links/issues).

## Contributing Locales

Edit the translations directly on the
[pageflow-internal-links](http://www.localeapp.com/projects/public?search=tf/pageflow-internal-links)
locale project.
