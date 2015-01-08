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
          cssDir: 'src/css/'

    copy:
      dist:
        files: [{
          expand: true
          flatten: true
          cwd: 'bower_components/purecss/src/'
          src: ['**/*.css']
          dest: 'src/pure/'
          rename: (dest, src)->
            return dest + src.replace(/\.css$/, ".scss")
        }]

    csslint:
      options:
        csslintrc: '.csslintrc'
      dist:
        src: 'src/css/*.css'

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
          cwd: 'src/css/'
          src: ['*.css']
          dest: 'dist/'
          ext: '.css'
        }]

    pure_grids:
      dist:
        dest: 'src/pure/grids-units.scss'
        options:
          units: [5, 24]

      responsive:
        dest: 'src/pure/grids-responsive.scss'
        options:
          mediaQueries:
            sm: 'screen and (min-width: 35.5em)' # 568px
            md: 'screen and (min-width: 48em)'   # 768px
            lg: 'screen and (min-width: 64em)'   # 1024px
            xl: 'screen and (min-width: 80em)'   # 1280px

    replace:
      pure:
        src: ['src/pure/*.scss']
        dest: 'src/pure/'
        replacements: [{
          from: 'pure-'
          to: 'brh-'
        }]

      dist:
        src: ['dist/*.css']
        dest: 'dist/'
        replacements: [{
          from: 'pure-'
          to: 'brh-'
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
  grunt.loadNpmTasks "grunt-pure-grids"
  grunt.loadNpmTasks "grunt-text-replace"
  grunt.loadNpmTasks "grunt-contrib-watch"

  grunt.registerTask "lint", ["csslint"]
  grunt.registerTask "pure", ["copy"]
  grunt.registerTask "css", ["pure_grids", "compass", "myth", "cssmin", "replace:dist"]
  grunt.registerTask "build", ["clean", "pure", "css"]
  grunt.registerTask "development", ["build"]
  grunt.registerTask "preproduction"
  grunt.registerTask "production"
  grunt.registerTask "default", ['development']
