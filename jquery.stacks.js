(function() {
  var $, Stack, active_panels;
  $ = jQuery;
  active_panels = [];
  Stack = function(_a, _b) {
    this.conf = _b;
    this.root = _a;
    this.slider = $(this.root).children();
    this.main_panel = this.slider.find(this.conf.main);
    this.main_panel.css({
      left: 0,
      display: 'block'
    });
    this.initialize_panel(this.main_panel, 1);
    return this;
  };
  Stack.panels = [];
  Stack.prototype.initialize_panel = function(panel, level) {
    var conf, links, slider, that;
    links = panel.find(this.conf.links);
    conf = this.conf;
    slider = this.slider;
    that = this;
    return links.each(function(i, link) {
      var rel;
      rel = $(link).attr("rel");
      return $(link).click(function() {
        var final, initial, l, new_panel, new_panel_width, panel_width;
        new_panel = $("#" + rel);
        panel_width = panel.outerWidth();
        new_panel_width = new_panel.width();
        l = panel.position().left;
        final = (l + panel_width) - conf.padding;
        initial = final - new_panel_width - conf.padding;
        new_panel.css({
          left: initial,
          display: 'block',
          position: 'absolute',
          'z-index': 100 - level
        });
        new_panel.animate({
          left: final
        }, conf.speed);
        return that.initialize_panel(new_panel, level + 1);
      });
    });
  };
  $.fn.stacks = function(options) {
    var config;
    config = $.extend({}, $.fn.stacks.defaults, options);
    return this.each(function(i, stack) {
      return new Stack(stack, config);
    });
  };
  $.fn.stacks.defaults = {
    main: 'div:first',
    links: 'ul:first a',
    padding: 10,
    speed: 100,
    on_click: function() {
      return null;
    }
  };
})();
