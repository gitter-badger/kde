module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    // concat all

    concat: {
      options: {
      },
      dist: {
        src: ['less/*.less'],
        dest: 'deploy_tmp/deploy.less'
      }
    },

    // compile less to css

    less: {
      development: {
        options: {
          paths: ["less/"]
        },
        files: {
          "deploy_tmp/deploy.css": "deploy_tmp/deploy.less"
        }
      }
    },


    // minify css files

    cssmin: {

      deploy_min: {
        options: {
          banner: '/*! <%= pkg.name %> - v<%= pkg.version %> - ' +
          '<%= grunt.template.today("yyyy-mm-dd") %> */',
          keepSpecialComments: 0,
          stripBanners: true
        },

        files: [
           {
              expand: true,     // Enable dynamic expansion.
              cwd: 'deploy_tmp/',      // Src matches are relative to this path.
              src: ['deploy.css'], // Actual pattern(s) to match.
              dest: 'build/',   // Destination path prefix.
              ext: '.min.css'   // Dest filepaths will have this extension.
           }
        ]
      }

    },


    // clean up deploy files and folders

    clean: {
      build: {
        src: ["deploy_tmp"]
      }
    },

    // compile jade to html

    jade: {
      pages: {
        options: {
          data: {
            debug: false
          }
        },

        files: [
           {
              expand: true,     // Enable dynamic expansion.
              cwd: 'jade-pages/',      // Src matches are relative to this path.
              src: ['*.jade'], // Actual pattern(s) to match.
              dest: './',   // Destination path prefix.
              ext: '.html'   // Dest filepaths will have this extension.
           }
        ]
      },

      archives_pages: {
        options: {
          data: {
            debug: false
          }
        },

        files: [
          {
            expand: true,
            cwd: 'archives_jade/',
            src: ['*.jade'],
            dest: './archives',
            ext: '.html'
          }

        ]
      },

      join_pages: {
        options: {
          data: {
            debug: false
          }
        },

        files: [
          {
            expand: true,
            cwd: 'join_jade/',
            src: ['*.jade'],
            dest: './join',
            ext: '.html'
          }

        ]
      },

      news_pages: {
        options: {
          data: {
            debug: false
          }
        },

        files: [
          {
            expand: true,
            cwd: 'news_jade/',
            src: ['*.jade'],
            dest: './news',
            ext: '.html'
          }

        ]
      }
    },




  });

  // Load the plugin
  //grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-cssmin');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-jade');
  grunt.loadNpmTasks('grunt-shell');

  // Default task(s).
  grunt.registerTask('lessCopy', ['concat', 'less', 'cssmin', 'clean']);
  grunt.registerTask('default', ['jade', 'lessCopy']);


};
