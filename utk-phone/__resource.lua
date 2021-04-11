resource_manifest_version '77731fab-63ca-442c-a67b-abc70f28dfa5'

client_script {
	'client.lua',
	'client/twitter.lua',
 }

server_scripts { 
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
	'server.lua',
	'html/script.js',
	'server/twitter.lua',
}

exports {
	'data_transceiver',
}

ui_page('html/index.html')

files({
	"html/script.js",
	"html/jquery.min.js",
	"html/jquery-ui.min.js",
	"html/styles.css",
	"html/img/*.svg",
	"html/img/*.png",
	"html/img/*.jpg",
	"html/img/*.*",
	"html/img/app_assets/*.*",
	"html/*.*",
	"html/index.html",
})
