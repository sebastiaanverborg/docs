var gulp  = require('gulp');
var shell = require('gulp-shell');

gulp.task('build', shell.task('rake build'));

gulp.task('watch', ['build'], function() {
	console.log('Watching for changes in ./source');
	gulp.watch('source/**/*', ['build']);
});

gulp.task('default', ['build']);
