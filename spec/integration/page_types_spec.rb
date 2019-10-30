require 'spec_helper'
require 'pageflow/lint'
require 'pageflow/used_file_test_helper'

Pageflow::Lint.page_type(Pageflow::InternalLinks.grid_page_type)
Pageflow::Lint.page_type(Pageflow::InternalLinks.list_page_type)

module Pageflow
  module InternalLinks
    describe 'page type', type: :helper do
      include RenderPageTestHelper
      include UsedFileTestHelper

      before do
        pageflow_configure do |config|
          config.plugin(InternalLinks.plugin)
          config.features.enable_by_default('page_type.internal_links_list')
        end

        helper.extend(Pageflow::FileThumbnailsHelper)
        helper.extend(Pageflow::PagesHelper)
      end

      describe 'grid' do
        it 'renders internal links' do
          revision = create(:revision)
          other_page = create(:page, revision: revision)
          page = create(:page,
                        template: InternalLinks.grid_page_type.name,
                        revision: revision,
                        configuration: {
                          internal_links: [
                            {
                              target_page_id: other_page.perma_id
                            }
                          ]
                        })

          html = render_page(page)

          expect(html).to have_selector("nav a[data-page=#{other_page.perma_id}]")
        end
      end

      describe 'list' do
        it 'renders internal links' do
          revision = create(:revision)
          other_page = create(:page, revision: revision)
          page = create(:page,
                        template: InternalLinks.list_page_type.name,
                        revision: revision,
                        configuration: {
                          internal_links: [
                            {
                              target_page_id: other_page.perma_id
                            }
                          ]
                        })

          html = render_page(page)

          expect(html).to have_selector("nav a[data-page=#{other_page.perma_id}]")
        end

        it 'looks up custom thumbnail by perma id' do
          revision = create(:revision)
          entry = Pageflow::PublishedEntry.new(create(:entry), revision)
          other_page = create(:page, revision: revision)
          image_file = create_used_file(:image_file, entry: entry)
          page = create(:page,
                        template: InternalLinks.list_page_type.name,
                        revision: revision,
                        configuration: {
                          internal_links: [
                            {
                              target_page_id: other_page.perma_id,
                              thumbnail_image_id: image_file.perma_id
                            }
                          ]
                        })

          html = render_page(page)

          expect(html)
            .to have_selector("nav a .pageflow_image_file_link_thumbnail_large_#{image_file.perma_id}")
        end
      end
    end
  end
end
