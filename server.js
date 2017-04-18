#!/usr/bin/env node

var prerender = require('./lib');
var clearLocalStoragePlugin = require('prerender-clear-local-storage');


var server = prerender({
    workers: process.env.PRERENDER_NUM_WORKERS,
    iterations: process.env.PRERENDER_NUM_ITERATIONS
});


server.use(prerender.sendPrerenderHeader());
// server.use(prerender.basicAuth());
// server.use(prerender.whitelist());
server.use(prerender.blacklist());
// server.use(prerender.logger());
server.use(prerender.removeScriptTags());
server.use(prerender.httpHeaders());
server.use(prerender.s3HtmlCache());
server.use(clearLocalStoragePlugin(server));

server.start();