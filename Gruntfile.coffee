# Generated on 2015-05-18 using generator-reveal 0.4.0
module.exports = (grunt) ->
    grunt.initConfig

        watch:

            livereload:
                options:
                    livereload: true
                files: [
                    'index.html'
                    'slides/{,*/}*.{md,html}'
                    'slides/*.{md,jpg,JPG,png,PNG}'
                    'js/*.js',
                    'css/*.css'
                ]

            index:
                files: [
                    'templates/_index.html'
                    'templates/_section.html'
                    'slides/*.{md,jpg,JPG,png,PNG}'
                ]
                tasks: [
                    'buildIndex'
                ]

            coffeelint:
                files: ['Gruntfile.coffee']
                tasks: ['coffeelint']

            jshint:
                files: ['js/*.js']

        connect:

            livereload:
                options:
                    port: 9000
                    # Change hostname to '0.0.0.0' to access
                    # the server from outside.
                    hostname: 'localhost'
                    base: '.'
                    open: true
                    livereload: true

        coffeelint:

            options:
                indentation:
                    value: 4
                max_line_length:
                    level: 'ignore'

            all: ['Gruntfile.coffee']

        jshint:

            options:
                jshintrc: '.jshintrc'

            all: ['js/*.js']

        copy:

            dist:
                files: [{
                    expand: true
                    src: [
                        'slides/**'
                        'bower_components/**'
                        'js/**'
                    ]
                    dest: 'dist/'
                },{
                    expand: true
                    src: ['index.html']
                    dest: 'dist/'
                    filter: 'isFile'
                }]




    # Load all grunt tasks.
    require('load-grunt-tasks')(grunt)

    grunt.registerTask 'buildIndex',
        'Build index.html from templates/_index.html and slides/list.json.',
        ->
            done = this.async()

            grunt.log.writeln 'Reading files..'
            fs = require 'fs'
            fs.readdir 'slides', (err, files) ->
                console.log(files)

                indexTemplate = grunt.file.read 'templates/_index.html'
                sectionTemplate = grunt.file.read 'templates/_section.html'
                slides = createIndex(files)

                html = grunt.template.process indexTemplate, data:
                    slides:
                        slides
                    section: (slide) ->
                        grunt.template.process sectionTemplate, data:
                            slide:
                                slide
                grunt.file.write 'index.html', html

                done()


    grunt.registerTask 'test',
        '*Lint* javascript and coffee files.', [
            'coffeelint'
            'jshint'
        ]

    grunt.registerTask 'serve',
        'Run presentation locally and start watch process (living document).', [
            'buildIndex'
            'connect:livereload'
            'watch'
        ]

    grunt.registerTask 'dist',
        'Save presentation files to *dist* directory.', [
            'test'
            'buildIndex'
            'copy'
        ]



    # Define default task.
    grunt.registerTask 'default', [
        'test'
        'serve'
    ]


createIndex = (files) ->
    screenSaver = 'attr':
        'class': 'screen-saver'
        'data-background': '#000'

    res = new Array
    i = 0
    while i < files.length
         # Check if its a image
        if files[i].match(/\.(jpg|png)/i)
            res.push 'attr':
                'class': 'image'
                'data-background': 'slides/' + files[i]
            res.push screenSaver
        else if files[i].match(/\.md/)
            res.push files[i].toString()
            res.push screenSaver
        i++
    return res
