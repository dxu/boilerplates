module.exports = (grunt) ->
  grunt.initConfig
    watch: 'hi'
    coffee:
      client:
        expand: true
        cwd: 'client/coffee'
        src: '**/*.coffee'
        dest: 'dist/scripts'
        ext: '.js'
    copy:
      client:
        expand: true
        cwd: 'client/'
        src: ['stylesheets/**/*', 'assets/**/*', 'templates/**/*']
        dest: 'dist/'
    nodemon:
      dev:
        script: 'server/app.coffee'
        options:
          args: []
          nodeArgs: []
          callback: (nodemon) ->
            nodemon.on 'log', (event) ->
              console.log event.colour
          env:
            PORT: 3000
          cwd: __dirname
          ignore: []
          ext: 'coffee, html'
          # dist is created from watch task
          watch: ['./server', './dist/templates']
          delay: 1000
          legacyWatch: true



  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-nodemon'
