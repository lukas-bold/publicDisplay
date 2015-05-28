(function () {

    'use strict';

    Reveal.addEventListener( 'slidechanged', function() {

        Reveal.togglePause()
        window.setTimeout( function() {
            Reveal.togglePause();
        }, 2000);
    } );
})();
