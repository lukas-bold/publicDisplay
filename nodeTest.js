

grunt.registerTask('generateSlideMap', 'some task', function() {
  // Force task into async mode and grab a handle to the "done" function.
  var done = this.async();
  // Run some sync stuff.
  grunt.log.writeln('Reading files..');

    var fs = require('fs');
   fs.readdir('slides', function (err, files) {
        console.log(files);
        createIndex(files);
        done();
    });
});
/*
function createIndex (files) {
    var res = new Array();
    for (var i = 0; i < files.length; i++) {
        // Check if its a image
        if (files[i].match(/\.{jpg,png}/)) {
            res.push(
                { "attr": {
                    "class" : "image",
                    "data-background": files[i].toString()
                    }
                }
            );
        } else if (files[i].match(/\.md/)) {
            res.push(files[i].toString());
        }
    }
    console.log(res);
}
*/
