module.exports = ->
  @loadNpmTasks "grunt-postcss"
  @config "postcss",
    autoprefixer:
      options:
        processors: [
          require('autoprefixer-core').postcss
        ]
      src: 'dist/*.css'
    csswring:
      options:
        processors: [
          require('csswring').postcss
        ]
      src: 'dist/*.css'

    all:
      options:
        processors: [
          require('autoprefixer-core').postcss
          require('csswring').postcss
        ]
      src: 'dist/*.css'
