module.exports = ->
  @loadNpmTasks "grunt-myth"
  @config "myth",
    dist:
      files: [{
        expand: true
        cwd: 'dist/'
        src: ['*.css']
        dest: 'dist/'
        ext: '.scss'
      }]
