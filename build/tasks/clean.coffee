module.exports = ->
  @loadNpmTasks "grunt-contrib-clean"
  @config "clean",
    dist:
      src: ['dist/']
