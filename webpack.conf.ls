require! <[fs webpack html-webpack-plugin extract-text-webpack-plugin path]>

module.exports =
  context: __dirname
  dev-server:
    content-base: \dist
    host: \0.0.0.0
    inline: true
    # port: opt.dev.port
    stats: {-chunk-modules, +colors}
  entry:
    app: path.resolve \app/App.jsx
  module:
    loaders:
      * test: /\.css$/, loader: extract-text-webpack-plugin.extract \style, \css
      * test: /\.(eot|ico|jpg|mp3|svg|ttf|woff2|woff|png?)($|\?)/, loader: \file
      * test: /\.jsx?$/, exclude: /node_modules/, loader: \babel, query: presets: <[es2015 react]>
      * test: /\.json$/, loader: \json
      * test: /\.pug$/, loader: \pug-loader
      # * test: /\.sass$/, loader: extract-text-webpack-plugin.extract \style, \css!sass
  resolve:
    alias:
      app: \app.ls
      jquery: \jquery/dist/jquery.min.js
      semanticJS:  \semantic-ui-css/semantic.min.js
      semanticCSS: \semantic-ui-css/semantic.min.css
  output:
    content-base: \dist
    filename: '[name].js'
    path: path.resolve \./dist
  plugins:
    * new extract-text-webpack-plugin '[name].css'
    * new webpack.ProvidePlugin do
        app: \app
        React: \react
        $: \jquery
        jQuery: \jquery
    * new html-webpack-plugin do
        chunks: <[app]>
        filename: \index.html
        title: \bentobox
        inject: true
        template: path.resolve \./app/index.pug

