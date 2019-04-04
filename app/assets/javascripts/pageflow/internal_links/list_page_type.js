pageflow.react.registerPageTypeWithDefaultBackground('internal_links_list', _.extend({
  prepareNextPageTimeout: 0,

  enhance: function(pageElement, configuration) {
    pageElement.on('click', 'nav a[data-page]', function() {
      pageflow.slides.goToByPermaId($(this).data('page'), {
        transition: $(this).data('pageTransition')
      });
      return false;
    });
  },

  activated: function(pageElement) {
    this._updateThumbnailHeights(pageElement);
  },

  resize: function(pageElement) {
    this._updateThumbnailHeights(pageElement);
  },

  update: function(pageElement, configuration) {
    this.updateDefaultPageContent(pageElement, configuration);

    pageElement.find('.shadow').css({
      opacity: configuration.get('gradient_opacity') / 100
    });

    this._updateThumbnailHeights(pageElement);
  },

  _updateThumbnailHeights: function(pageElement) {
    pageElement.find('.page_link.custom_thumbnail').each(function() {
      var thumbnail = $('.page_thumbnail', this);
      var details = $('.details', this);

      if ($(this).hasClass('own_description')) {
        thumbnail.css('bottom', details.outerHeight() + 'px');
      }
      else {
        thumbnail.css('bottom', '0');
      }
    });
  }
}, pageflow.defaultPageContent));
