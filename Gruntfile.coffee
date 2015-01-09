paths =
  sass: ["sass/*"]

module.exports = (grunt) ->

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    clean:
      dist:
        src: ['dist/']

    compass:
      dist:
        options:
          config: 'config.rb'
          sassDir: 'src/sass/'
          cssDir: 'dist/'

    copy:
      css:
        files: [
          {
            expand: true,
            cwd: 'dist/',
            src: ['**/*.css', '!**/*.min.css'],
            dest: 'dist/',
            rename: (dest, src) ->
              return dest + src.replace(/\.css$/, ".scss")
          }
        ]

    csslint:
      options:
        csslintrc: '.csslintrc'
      dist:
        src: 'dist/*.css'

    cssmin:
      options:
        keepSpecialComments: 0
      dist:
        files: [{
          expand: true
          cwd: 'dist/'
          src: ['*.css', '!*.min.css']
          dest: 'dist/'
          ext: '.min.css'
        }]

    myth:
      dist:
        files: [{
          expand: true
          cwd: 'dist/'
          src: ['*.css']
          dest: 'dist/'
          ext: '.scss'
        }]

    watch:
      options:
        spawn: false
      dev:
        files: paths.coffee
        tasks: ['lint', 'css']

  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-csslint"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-myth"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "lint", ["csslint"]
  grunt.registerTask "css", ["compass", "myth", "cssmin", "copy:css"]
  grunt.registerTask "build", ["clean", "css"]
  grunt.registerTask "development", ["build"]
  grunt.registerTask "preproduction"
  grunt.registerTask "production"
  grunt.registerTask "default", ['development']
