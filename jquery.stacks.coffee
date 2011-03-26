$=jQuery

active_panels = [] # list of active panels 

class Stack
    # actual implementation of a stack

    @panels: []

    constructor: (@root, @conf) ->
        @slider = $(@root).children() # the slideing area needs to be inside
        @main_panel = @slider.find(@conf.main) # get the main panel

        # show the main panel
        @main_panel.css({left: 0, display: 'block'})
        @initialize_panel(@main_panel, 1)

    initialize_panel: (panel, level) ->

        links = panel.find(@conf.links)
        conf = @conf
        slider = @slider
        that = @
        links.each( (i, link) ->
            rel = $(link).attr("rel")
            $(link).click( () ->
                new_panel = $("#"+rel)

                # compute the initial and final position
                panel_width =panel.outerWidth()
                new_panel_width =new_panel.width()
                l = panel.position().left
                final = (l+panel_width)-conf.padding
                initial = final - new_panel_width-conf.padding

                # set css and start animation
                new_panel.css({
                    left: initial
                    display: 'block'
                    position: 'absolute'
                    'z-index': 100-level
                })

                # check if we need to move the slider
                s_l = that.slider.position().left
                s_w = $(that.root).width()
                s_r = s_l + s_w
                np_w = new_panel.outerWidth()
                if ((np_w+final) > s_r) 
                    diff = (np_w+final) - s_r + conf.padding
                    that.slider.animate({left: -diff}, conf.speed, () ->
                        new_panel.animate({left: final},conf.speed)
                    )
                else
                    console.log("ok")
                    new_panel.animate({left: final},conf.speed)
                that.initialize_panel(new_panel, level+1)
            )
        )

$.fn.stacks = (options) ->
    config = $.extend({}, $.fn.stacks.defaults, options)

    this.each( (i, stack) ->
        new Stack(stack, config)
    )


$.fn.stacks.defaults =
    main: 'div:first'
    links: 'ul:first a'     # select links only from the first ul 
    padding: 10             # padding needed on the left of a panel (e.g. because of rounded corners 
    speed: 100

    on_click: () ->
        return


