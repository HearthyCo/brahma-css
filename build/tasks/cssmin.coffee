module.exports = ->
  @loadNpmTasks "grunt-contrib-cssmin"
  @config "cssmin",
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
