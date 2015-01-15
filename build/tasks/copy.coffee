module.exports = ->
  @loadNpmTasks "grunt-contrib-copy"
  @config "copy",
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
