module.exports = ->
  @loadNpmTasks "grunt-contrib-watch"
  @config "watch",
    options:
      spawn: false
    dev:
      files: ['src/sass/**/*.sass']
      tasks: ['css']
