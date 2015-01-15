module.exports = ->
  @loadTasks "build/tasks"

  @registerTask "lint", ["csslint"]
  @registerTask "css", ["compass", "myth", "cssmin", "copy:css"]
  @registerTask "build", ["clean", "css"]
  @registerTask "development", ["build"]
  @registerTask "preproduction"
  @registerTask "production"
  @registerTask "default", ['development']
