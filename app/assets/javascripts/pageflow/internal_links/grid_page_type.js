pageflow.react.registerPageTypeWithDefaultBackground('internal_links_grid', _.extend({
  prepareNextPageTimeout: 0,

  enhance: function(pageElement, configuration) {
    pageElement.on('click', 'nav .thumbnail', function() {
      pageflow.slides.goToByPermaId($(this).data('page'), {
        transition: $(this).data('pageTransition')
      });
      return false;
    });
  },

  update: function(pageElement, configuration) {
    this.updateDefaultPageContent(pageElement, configuration);

    pageElement.find('.shadow').css({
      opacity: configuration.get('gradient_opacity') / 100
    });

    pageElement.find('nav').attr('data-layout', configuration.get('linked_pages_layout'));
  }
}, pageflow.defaultPageContent));
