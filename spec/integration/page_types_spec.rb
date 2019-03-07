require 'spec_helper'
require 'pageflow/lint'

Pageflow::Lint.page_type(Pageflow::InternalLinks.grid_page_type)
Pageflow::Lint.page_type(Pageflow::InternalLinks.list_page_type)
