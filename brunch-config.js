exports.config = {
  // See http://brunch.io/#documentation for docs.
  files: {
    javascripts: {
      // joinTo: "js/app.js"

      // To use a separate vendor.js bundle, specify two files path
      // https://github.com/brunch/brunch/blob/stable/docs/config.md#files
      joinTo: {
       "js/app.js": /^(web\/static\/js)/,
       "js/admin/app.js": /^(web\/static\/js\/admin)/,
       "js/vendor.js": /^(web\/static\/vendor)|(deps)/,
       "js/admin/vendor.js": /^(bower_components)|(deps)/
      },
      //
      // To change the order of concatenation of files, explicitly mention here
      // https://github.com/brunch/brunch/tree/master/docs#concatenation
      order: {
        before: [
          "web/static/vendor/jquery.js",
          "web/static/vendor/bootstrap/js/bootstrap.js"
        ]
      }
    },
    stylesheets: {
        joinTo: {
            "css/app.css": /^(web\/static\/css)/,
            "css/admin/app.css": /^(web\/static\/css\/admin)/,
            "css/vendor.css": /^(web\/static\/vendor)/,
            "css/admin/vendor.css": /^(bower_components)/
        }
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "deps/phoenix/web/static",
      "deps/phoenix_html/web/static",
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      // Do not use ES6 compiler in vendor code
      ignore: [/web\/static\/vendor/]
    }
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"],
      "js/admin/app.js": ["web/static/js/admin/app"]
    }
  },

  npm: {
    enabled: true
  }
};
