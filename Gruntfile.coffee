module.exports = ->
  @loadTasks "build/tasks"

  @registerTask "lint", ["csslint"]
  @registerTask "css", ["compass", "postcss:all", "copy:css"]
  @registerTask "build", ["clean", "css"]
  @registerTask "development", ["clean", "compass", "postcss:autoprefixer", "copy:css"]
  @registerTask "preproduction", ["build"]
  @registerTask "production", ["build"]
  @registerTask "default", ['development']
