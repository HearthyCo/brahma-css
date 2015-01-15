module.exports = ->
  @loadNpmTasks "grunt-contrib-compass"
  @config "compass",
    dist:
      options:
        config: 'config.rb'
        sassDir: 'src/sass/'
        cssDir: 'dist/'
