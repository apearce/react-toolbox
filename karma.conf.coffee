webpack = require('webpack')

module.exports = (config) ->
  config.set
    browsers        : ['PhantomJS']
    singleRun       : true
    frameworks      : ['mocha']
    files           : ['./node_modules/phantomjs-polyfill/bind-polyfill.js',
                       './node_modules/react/dist/react-with-addons.js',
                       'tests.webpack.js']
    reporters       : ['dots']

    preprocessors:
      'tests.webpack.js' : ['webpack']

    webpack:
      resolve       : extensions: ['', '.cjsx', '.coffee', '.js', '.json', '.styl']

      module:
        loaders: [
          test      : /\.cjsx$/,    loader: 'coffee-jsx-loader'
        ,
          test      : /\.coffee$/,  loader: 'coffee-jsx-loader'
        ,
          test      : /\.styl$/,    loader: 'css-loader!stylus-loader'
        ]

      watch         : true

    webpackServer:
      noInfo        : true