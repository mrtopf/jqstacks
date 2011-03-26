# jqStacks - stacked content panels for jQuery

## Description

If you know #NewTwitter then you know what jqStacks was inspired by. It allows
you to create new panels with content which slide out from an existing panel
like you can see it in #NewTwitter if you e.g. click on a tweet.

jqStacks can do more though in that you can add not only only level of new
panels but as many as you like. The canvas containing the layers will simply
scroll accordingly.

## How to use

First you need to include both jQuery and jqStacks in your page:

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="jqStacks.js"></script>

In your body you then need to write some HTML:

    <div id="stacks">
        <div id="mainpanel" class="panel">
            <p>
                This is the main panel which e.g. contains some directory listing:
            </p>
            <ul>
                <li><a href="#" rel="panel-1" class="panellink">Folder 1</li>
                <li><a href="#" rel="panel-2" class="panellink">Folder 2</li>
            </ul>

            <div id="panel-1" class="panel">
                This is Folder 1
            </div>

            <div id="panel-2" class="panel">
                <ul>
                    <li><a href="#" rel="panel-2-1" class="panellink">Folder
                    2/1</a>
                </ul>
                <div id="panel-2-1" class="panel">
                    Folder 2/1
                </div>
            </div>

        </div>
    </div>

This means the following:

 * The `stacks` element defines the canvas on which the panel slide in and out
 * The 
