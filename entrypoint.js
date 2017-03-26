const spawn = require('child_process').spawn;

const ide = spawn('node', [
    '/c9ide/server.js',
    '-w',
    '/workspace',
    '--port',
    8080,
    '--listen',
    '0.0.0.0',
    '--packed',
    '--auth',
    `${process.env.C9IDE_USERNAME}:${process.env.C9IDE_PASSWORD}`,
    '--collab'
]);
