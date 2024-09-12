[1mdiff --git a/.DS_Store b/.DS_Store[m
[1mnew file mode 100644[m
[1mindex 0000000..296d392[m
Binary files /dev/null and b/.DS_Store differ
[1mdiff --git a/README.md b/README.md[m
[1mdeleted file mode 100644[m
[1mindex 1987325..0000000[m
[1m--- a/README.md[m
[1m+++ /dev/null[m
[36m@@ -1 +0,0 @@[m
[31m-# loginiwc[m
\ No newline at end of file[m
[1mdiff --git a/app.js b/app.js[m
[1mnew file mode 100644[m
[1mindex 0000000..234cd59[m
[1m--- /dev/null[m
[1m+++ b/app.js[m
[36m@@ -0,0 +1,20 @@[m
[32m+[m[32mconst express = require('express');[m
[32m+[m[32mconst bodyParser = require('body-parser');[m
[32m+[m[32mconst apiRoutes = require('./routes/api');[m
[32m+[m[32mconst app = express();[m
[32m+[m[32mconst port = 3000;[m
[32m+[m
[32m+[m[32m// Middleware para manejar solicitudes POST[m
[32m+[m[32mapp.use(bodyParser.json());[m
[32m+[m[32mapp.use(bodyParser.urlencoded({ extended: true }));[m
[32m+[m
[32m+[m[32m// Ruta para servir el frontend (index.html)[m
[32m+[m[32mapp.use(express.static('public'));[m
[32m+[m
[32m+[m[32m// API Routes[m
[32m+[m[32mapp.use('/api', apiRoutes);[m
[32m+[m
[32m+[m[32m// Escucha en el puerto 3000[m
[32m+[m[32mapp.listen(port, () => {[m
[32m+[m[32m  console.log(`Servidor escuchando en http://localhost:${port}`);[m
[32m+[m[32m});[m
[1mdiff --git a/controllers/encryption.js b/controllers/encryption.js[m
[1mnew file mode 100644[m
[1mindex 0000000..56dbfa1[m
[1m--- /dev/null[m
[1m+++ b/controllers/encryption.js[m
[36m@@ -0,0 +1,22 @@[m
[32m+[m[32mconst crypto = require('crypto');[m
[32m+[m
[32m+[m[32mconst key = "PortalCCSecretKeyIntellectProofs";//crypto.createHash('sha256').update('PortalCCSecretKeyIntellectProofs').digest();[m
[32m+[m[32mconst iv = Buffer.alloc(16, 0);  // Vector de inicialización[m
[32m+[m[32mconsole.log(key);[m
[32m+[m[32m// Función para encriptar datos[m
[32m+[m[32mfunction encryptData(data) {[m
[32m+[m[32m    const cipher = crypto.createCipheriv('aes-256-cbc', key, iv);[m
[32m+[m[32m    let encrypted = cipher.update(data, 'utf8', 'base64');[m
[32m+[m[32m    encrypted += cipher.final('base64');[m
[32m+[m[32m    return encrypted;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m// Función para desencriptar datos[m
[32m+[m[32mfunction decryptData(encrypted) {[m
[32m+[m[32m    const decipher = crypto.createDecipheriv('aes-256-cbc', key, iv);[m
[32m+[m[32m    let decrypted = decipher.update(encrypted, 'base64', 'utf8');[m
[32m+[m[32m    decrypted += decipher.final('utf8');[m
[32m+[m[32m    return decrypted;[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mmodule.exports = { encryptData, decryptData };[m
[1mdiff --git a/node_modules/.bin/mime b/node_modules/.bin/mime[m
[1mnew file mode 120000[m
[1mindex 0000000..fbb7ee0[m
[1m--- /dev/null[m
[1m+++ b/node_modules/.bin/mime[m
[36m@@ -0,0 +1 @@[m
[32m+[m[32m../mime/cli.js[m
\ No newline at end of file[m
[1mdiff --git a/node_modules/.package-lock.json b/node_modules/.package-lock.json[m
[1mnew file mode 100644[m
[1mindex 0000000..9a1baf9[m
[1m--- /dev/null[m
[1m+++ b/node_modules/.package-lock.json[m
[36m@@ -0,0 +1,913 @@[m
[32m+[m[32m{[m
[32m+[m[32m  "name": "login-iwc",[m
[32m+[m[32m  "version": "1.0.0",[m
[32m+[m[32m  "lockfileVersion": 3,[m
[32m+[m[32m  "requires": true,[m
[32m+[m[32m  "packages": {[m
[32m+[m[32m    "node_modules/accepts": {[m
[32m+[m[32m      "version": "1.3.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/accepts/-/accepts-1.3.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-PYAthTa2m2VKxuvSD3DPC/Gy+U+sOA1LAuT8mkmRuvw+NACSaeXEQ+NHcVF7rONl6qcaxV3Uuemwawk+7+SJLw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "mime-types": "~2.1.34",[m
[32m+[m[32m        "negotiator": "0.6.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/array-flatten": {[m
[32m+[m[32m      "version": "1.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/array-flatten/-/array-flatten-1.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-PCVAQswWemu6UdxsDFFX/+gVeYqKAod3D3UVm91jHwynguOwAvYPhx8nNlM++NqRcK6CxxpUafjmhIdKiHibqg==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/asynckit": {[m
[32m+[m[32m      "version": "0.4.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Oei9OH4tRh0YqU3GxhX79dM/mwVgvbZJaSNaRk+bshkj0S5cfHcgYakreBjrHwatXKbz+IoIdYLxrKim2MjW0Q==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/axios": {[m
[32m+[m[32m      "version": "1.7.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/axios/-/axios-1.7.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-S4kL7XrjgBmvdGut0sN3yJxqYzrDOnivkBiN0OFs6hLiUam3UPvswUo0kqGyhqUZGEOytHyumEdXsAkgCOUf3Q==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "follow-redirects": "^1.15.6",[m
[32m+[m[32m        "form-data": "^4.0.0",[m
[32m+[m[32m        "proxy-from-env": "^1.1.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/body-parser": {[m
[32m+[m[32m      "version": "1.20.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/body-parser/-/body-parser-1.20.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-7rAxByjUMqQ3/bHJy7D6OGXvx/MMc4IqBn/X0fcM1QUcAItpZrBEYhWGem+tzXH90c+G01ypMcYJBO9Y30203g==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "bytes": "3.1.2",[m
[32m+[m[32m        "content-type": "~1.0.5",[m
[32m+[m[32m        "debug": "2.6.9",[m
[32m+[m[32m        "depd": "2.0.0",[m
[32m+[m[32m        "destroy": "1.2.0",[m
[32m+[m[32m        "http-errors": "2.0.0",[m
[32m+[m[32m        "iconv-lite": "0.4.24",[m
[32m+[m[32m        "on-finished": "2.4.1",[m
[32m+[m[32m        "qs": "6.13.0",[m
[32m+[m[32m        "raw-body": "2.5.2",[m
[32m+[m[32m        "type-is": "~1.6.18",[m
[32m+[m[32m        "unpipe": "1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8",[m
[32m+[m[32m        "npm": "1.2.8000 || >= 1.4.16"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/body-parser/node_modules/qs": {[m
[32m+[m[32m      "version": "6.13.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/qs/-/qs-6.13.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-+38qI9SOr8tfZ4QmJNplMUxqjbe7LKvvZgWdExBOmd+egZTtjLB67Gu0HRX3u/XOq7UU2Nx6nsjvS16Z9uwfpg==",[m
[32m+[m[32m      "license": "BSD-3-Clause",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "side-channel": "^1.0.6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/bytes": {[m
[32m+[m[32m      "version": "3.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/bytes/-/bytes-3.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-/Nf7TyzTx6S3yRJObOAV7956r8cr2+Oj8AC5dt8wSP3BQAoeX58NoHyCU8P8zGkNXStjTSi6fzO6F0pBdcYbEg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/call-bind": {[m
[32m+[m[32m      "version": "1.0.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/call-bind/-/call-bind-1.0.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-GHTSNSYICQ7scH7sZ+M2rFopRoLh8t2bLSW6BbgrtLsahOIB5iyAVJf9GjWK3cYTDaMj4XdBpM1cA6pIS0Kv2w==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "es-define-property": "^1.0.0",[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "function-bind": "^1.1.2",[m
[32m+[m[32m        "get-intrinsic": "^1.2.4",[m
[32m+[m[32m        "set-function-length": "^1.2.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/combined-stream": {[m
[32m+[m[32m      "version": "1.0.8",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz",[m
[32m+[m[32m      "integrity": "sha512-FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "delayed-stream": "~1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/content-disposition": {[m
[32m+[m[32m      "version": "0.5.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/content-disposition/-/content-disposition-0.5.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-FveZTNuGw04cxlAiWbzi6zTAL/lhehaWbTtgluJh4/E95DqMwTmha3KZN1aAWA8cFIhHzMZUvLevkw5Rqk+tSQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "safe-buffer": "5.2.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/content-type": {[m
[32m+[m[32m      "version": "1.0.5",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/content-type/-/content-type-1.0.5.tgz",[m
[32m+[m[32m      "integrity": "sha512-nTjqfcBFEipKdXCv4YDQWCfmcLZKm81ldF0pAopTvyrFGVbcR6P/VAAd5G7N+0tTr8QqiU0tFadD6FK4NtJwOA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cookie": {[m
[32m+[m[32m      "version": "0.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cookie/-/cookie-0.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-U71cyTamuh1CRNCfpGY6to28lxvNwPG4Guz/EVjgf3Jmzv0vlDp1atT9eS5dDjMYHucpHbWns6Lwf3BKz6svdw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/cookie-signature": {[m
[32m+[m[32m      "version": "1.0.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/cookie-signature/-/cookie-signature-1.0.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-QADzlaHc8icV8I7vbaJXJwod9HWYp8uCqf1xa4OfNu1T7JVxQIrUgOWtHdNDtPiywmFbiS12VjotIXLrKM3orQ==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/crypto": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/crypto/-/crypto-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-VxBKmeNcqQdiUQUW2Tzq0t377b54N2bMtXO/qiLa+6eRRmmC4qT3D4OnTGoT/U6O9aklQ/jTwbOtRMTTY8G0Ig==",[m
[32m+[m[32m      "deprecated": "This package is no longer supported. It's now a built-in Node module. If you've depended on crypto, you should switch to the one that's built-in.",[m
[32m+[m[32m      "license": "ISC"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/debug": {[m
[32m+[m[32m      "version": "2.6.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/debug/-/debug-2.6.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-bC7ElrdJaJnPbAP+1EotYvqZsb3ecl5wi6Bfi6BJTUcNowp6cvspg0jXznRTKDjm/E7AdgFBVeAPVMNcKGsHMA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ms": "2.0.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/define-data-property": {[m
[32m+[m[32m      "version": "1.1.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/define-data-property/-/define-data-property-1.1.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-rBMvIzlpA8v6E+SJZoo++HAYqsLrkg7MSfIinMPFhmkorw7X+dOXVJQs+QT69zGkzMyfDnIMN2Wid1+NbL3T+A==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "es-define-property": "^1.0.0",[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "gopd": "^1.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/delayed-stream": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZySD7Nf91aLB0RxL4KGrKHBXl7Eds1DAmEdcoVawXnLD7SDhpNgtuII2aAkg7a7QS41jxPSZ17p4VdGnMHk3MQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/depd": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/depd/-/depd-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-g7nH6P6dyDioJogAAGprGpCtVImJhpPk/roCzdb3fIh61/s/nPsfR6onyMwkCAR/OlC3yBC0lESvUoQEAssIrw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/destroy": {[m
[32m+[m[32m      "version": "1.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/destroy/-/destroy-1.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-2sJGJTaXIIaR1w4iJSNoN0hnMY7Gpc/n8D4qSCJw8QqFWXf7cuAgnEHxBpweaVcPevC2l3KpjYCx3NypQQgaJg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8",[m
[32m+[m[32m        "npm": "1.2.8000 || >= 1.4.16"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ee-first": {[m
[32m+[m[32m      "version": "1.1.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ee-first/-/ee-first-1.1.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-WMwm9LhRUo+WUaRN+vRuETqG89IgZphVSNkdFgeb6sS/E4OrDIN7t48CAewSHXc6C8lefD8KKfr5vY61brQlow==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/encodeurl": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/encodeurl/-/encodeurl-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Q0n9HRi4m6JuGIV1eFlmvJB7ZEVxu93IrMyiMsGC0lrMJMWzRgx6WGquyfQgZVb31vhGgXnfmPNNXmxnOkRBrg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-define-property": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-define-property/-/es-define-property-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-jxayLKShrEqqzJ0eumQbVhTYQM27CfT1T35+gCgDFoL82JLsXqTJ76zv6A0YLOgEnLUMvLzsDsGIrl8NFpT2gQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "get-intrinsic": "^1.2.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/es-errors": {[m
[32m+[m[32m      "version": "1.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/es-errors/-/es-errors-1.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Zf5H2Kxt2xjTvbJvP2ZWLEICxA6j+hAmMzIlypy4xcBg1vKVnx89Wy0GbS+kf5cwCVFFzdCFh2XSCFNULS6csw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/escape-html": {[m
[32m+[m[32m      "version": "1.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/escape-html/-/escape-html-1.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-NiSupZ4OeuGwr68lGIeym/ksIZMJodUGOSCZ/FSnTxcrekbvqrgdUxlJOMpijaKZVjAJrWrGs/6Jy8OMuyj9ow==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/etag": {[m
[32m+[m[32m      "version": "1.8.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/etag/-/etag-1.8.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-aIL5Fx7mawVa300al2BnEE4iNvo1qETxLrPI/o05L7z6go7fCw1J6EQmbK4FmJ2AS7kgVF/KEZWufBfdClMcPg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/express": {[m
[32m+[m[32m      "version": "4.20.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/express/-/express-4.20.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-pLdae7I6QqShF5PnNTCVn4hI91Dx0Grkn2+IAsMTgMIKuQVte2dN9PeGSSAME2FR8anOhVA62QDIUaWVfEXVLw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "accepts": "~1.3.8",[m
[32m+[m[32m        "array-flatten": "1.1.1",[m
[32m+[m[32m        "body-parser": "1.20.3",[m
[32m+[m[32m        "content-disposition": "0.5.4",[m
[32m+[m[32m        "content-type": "~1.0.4",[m
[32m+[m[32m        "cookie": "0.6.0",[m
[32m+[m[32m        "cookie-signature": "1.0.6",[m
[32m+[m[32m        "debug": "2.6.9",[m
[32m+[m[32m        "depd": "2.0.0",[m
[32m+[m[32m        "encodeurl": "~2.0.0",[m
[32m+[m[32m        "escape-html": "~1.0.3",[m
[32m+[m[32m        "etag": "~1.8.1",[m
[32m+[m[32m        "finalhandler": "1.2.0",[m
[32m+[m[32m        "fresh": "0.5.2",[m
[32m+[m[32m        "http-errors": "2.0.0",[m
[32m+[m[32m        "merge-descriptors": "1.0.3",[m
[32m+[m[32m        "methods": "~1.1.2",[m
[32m+[m[32m        "on-finished": "2.4.1",[m
[32m+[m[32m        "parseurl": "~1.3.3",[m
[32m+[m[32m        "path-to-regexp": "0.1.10",[m
[32m+[m[32m        "proxy-addr": "~2.0.7",[m
[32m+[m[32m        "qs": "6.11.0",[m
[32m+[m[32m        "range-parser": "~1.2.1",[m
[32m+[m[32m        "safe-buffer": "5.2.1",[m
[32m+[m[32m        "send": "0.19.0",[m
[32m+[m[32m        "serve-static": "1.16.0",[m
[32m+[m[32m        "setprototypeof": "1.2.0",[m
[32m+[m[32m        "statuses": "2.0.1",[m
[32m+[m[32m        "type-is": "~1.6.18",[m
[32m+[m[32m        "utils-merge": "1.0.1",[m
[32m+[m[32m        "vary": "~1.1.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/finalhandler": {[m
[32m+[m[32m      "version": "1.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/finalhandler/-/finalhandler-1.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-5uXcUVftlQMFnWC9qu/svkWv3GTd2PfUhK/3PLkYNAe7FbqJMt3515HaxE6eRL74GdsriiwujiawdaB1BpEISg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "debug": "2.6.9",[m
[32m+[m[32m        "encodeurl": "~1.0.2",[m
[32m+[m[32m        "escape-html": "~1.0.3",[m
[32m+[m[32m        "on-finished": "2.4.1",[m
[32m+[m[32m        "parseurl": "~1.3.3",[m
[32m+[m[32m        "statuses": "2.0.1",[m
[32m+[m[32m        "unpipe": "~1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/finalhandler/node_modules/encodeurl": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-TPJXq8JqFaVYm2CWmPvnP2Iyo4ZSM7/QKcSmuMLDObfpH5fi7RUGmd/rTDf+rut/saiDiQEeVTNgAmJEdAOx0w==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/follow-redirects": {[m
[32m+[m[32m      "version": "1.15.9",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/follow-redirects/-/follow-redirects-1.15.9.tgz",[m
[32m+[m[32m      "integrity": "sha512-gew4GsXizNgdoRyqmyfMHyAmXsZDk6mHkSxZFCzW9gwlbtOW44CDtYavM+y+72qD/Vq2l550kMF52DT8fOLJqQ==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "individual",[m
[32m+[m[32m          "url": "https://github.com/sponsors/RubenVerborgh"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "peerDependenciesMeta": {[m
[32m+[m[32m        "debug": {[m
[32m+[m[32m          "optional": true[m
[32m+[m[32m        }[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/form-data": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/form-data/-/form-data-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-ETEklSGi5t0QMZuiXoA/Q6vcnxcLQP5vdugSpuAyi6SVGi2clPPp+xgEhuMaHC+zGgn31Kd235W35f7Hykkaww==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "asynckit": "^0.4.0",[m
[32m+[m[32m        "combined-stream": "^1.0.8",[m
[32m+[m[32m        "mime-types": "^2.1.12"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/forwarded": {[m
[32m+[m[32m      "version": "0.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/forwarded/-/forwarded-0.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-buRG0fpBtRHSTCOASe6hD258tEubFoRLb4ZNA6NxMVHNw2gOcwHo9wyablzMzOA5z9xA9L1KNjk/Nt6MT9aYow==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/fresh": {[m
[32m+[m[32m      "version": "0.5.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/fresh/-/fresh-0.5.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-zJ2mQYM18rEFOudeV4GShTGIQ7RbzA7ozbU9I/XBpm7kqgMywgmylMwXHxZJmkVoYkna9d2pVXVXPdYTP9ej8Q==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/function-bind": {[m
[32m+[m[32m      "version": "1.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/function-bind/-/function-bind-1.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-7XHNxH7qX9xG5mIwxkhumTox/MIRNcOgDrxWsMt2pAr23WHp6MrRlN7FBSFpCpr+oVO0F744iUgR82nJMfG2SA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/get-intrinsic": {[m
[32m+[m[32m      "version": "1.2.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/get-intrinsic/-/get-intrinsic-1.2.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-5uYhsJH8VJBTv7oslg4BznJYhDoRI6waYCxMmCdnTrcCrHA/fCFKoTFz2JKKE0HdDFUF7/oQuhzumXJK7paBRQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "function-bind": "^1.1.2",[m
[32m+[m[32m        "has-proto": "^1.0.1",[m
[32m+[m[32m        "has-symbols": "^1.0.3",[m
[32m+[m[32m        "hasown": "^2.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/gopd": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/gopd/-/gopd-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-d65bNlIadxvpb/A2abVdlqKqV563juRnZ1Wtk6s1sIR8uNsXR70xqIzVqxVf1eTqDunwT2MkczEeaezCKTZhwA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "get-intrinsic": "^1.1.3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-property-descriptors": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-property-descriptors/-/has-property-descriptors-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-55JNKuIW+vq4Ke1BjOTjM2YctQIvCT7GFzHwmfZPGo5wnrgkid0YQtnAleFSqumZm4az3n2BS+erby5ipJdgrg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "es-define-property": "^1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-proto": {[m
[32m+[m[32m      "version": "1.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-proto/-/has-proto-1.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-SJ1amZAJUiZS+PhsVLf5tGydlaVB8EdFpaSO4gmiUKUOxk8qzn5AIy4ZeJUmh22znIdk/uMAUT2pl3FxzVUH+Q==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/has-symbols": {[m
[32m+[m[32m      "version": "1.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/has-symbols/-/has-symbols-1.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-l3LCuF6MgDNwTDKkdYGEihYjt5pRPbEg46rtlmnSPlUbgmB8LOIrKJbYYFBSbnPaJexMKtiPO8hmeRjRz2Td+A==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/hasown": {[m
[32m+[m[32m      "version": "2.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/hasown/-/hasown-2.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-0hJU9SCPvmMzIBdZFqNPXWa6dqh7WdH0cII9y+CyS8rG3nL48Bclra9HmKhVVUHyPWNH5Y7xDwAB7bfgSjkUMQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "function-bind": "^1.1.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/http-errors": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/http-errors/-/http-errors-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-FtwrG/euBzaEjYeRqOgly7G0qviiXoJWnvEH2Z1plBdXgbyjv34pHTSb9zoeHMyDy33+DWy5Wt9Wo+TURtOYSQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "depd": "2.0.0",[m
[32m+[m[32m        "inherits": "2.0.4",[m
[32m+[m[32m        "setprototypeof": "1.2.0",[m
[32m+[m[32m        "statuses": "2.0.1",[m
[32m+[m[32m        "toidentifier": "1.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/iconv-lite": {[m
[32m+[m[32m      "version": "0.4.24",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/iconv-lite/-/iconv-lite-0.4.24.tgz",[m
[32m+[m[32m      "integrity": "sha512-v3MXnZAcvnywkTUEZomIActle7RXXeedOR31wwl7VlyoXO4Qi9arvSenNQWne1TcRwhCL1HwLI21bEqdpj8/rA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "safer-buffer": ">= 2.1.2 < 3"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.10.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/inherits": {[m
[32m+[m[32m      "version": "2.0.4",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz",[m
[32m+[m[32m      "integrity": "sha512-k/vGaX4/Yla3WzyMCvTQOXYeIHvqOKtnqBduzTHpzpQZzAskKMhZ2K+EnBiSM9zGSoIFeMpXKxa4dYeZIQqewQ==",[m
[32m+[m[32m      "license": "ISC"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ipaddr.js": {[m
[32m+[m[32m      "version": "1.9.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ipaddr.js/-/ipaddr.js-1.9.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-0KI/607xoxSToH7GjN1FfSbLoU0+btTicjsQSWQlh/hZykN8KpmMf7uYwPW3R+akZ6R/w18ZlXSHBYXiYUPO3g==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/media-typer": {[m
[32m+[m[32m      "version": "0.3.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/media-typer/-/media-typer-0.3.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-dq+qelQ9akHpcOl/gUVRTxVIOkAJ1wR3QAvb4RsVjS8oVoFjDGTc679wJYmUmknUF5HwMLOgb5O+a3KxfWapPQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/merge-descriptors": {[m
[32m+[m[32m      "version": "1.0.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/merge-descriptors/-/merge-descriptors-1.0.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-gaNvAS7TZ897/rVaZ0nMtAyxNyi/pdbjbAwUpFQpN70GqnVfOiXpeUUMKRBmzXaSQ8DdTX4/0ms62r2K+hE6mQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/sindresorhus"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/methods": {[m
[32m+[m[32m      "version": "1.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/methods/-/methods-1.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-iclAHeNqNm68zFtnZ0e+1L2yUIdvzNoauKU4WBA3VvH/vPFieF7qfRlwUZU+DA9P9bPXIS90ulxoUoCH23sV2w==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/mime": {[m
[32m+[m[32m      "version": "1.6.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/mime/-/mime-1.6.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-x0Vn8spI+wuJ1O6S7gnbaQg8Pxh4NNHb7KSINmEWKiPE4RKOplvijn+NkmYmmRgP68mc70j2EbeTFRsrswaQeg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "bin": {[m
[32m+[m[32m        "mime": "cli.js"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/mime-db": {[m
[32m+[m[32m      "version": "1.52.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/mime-db/-/mime-db-1.52.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-sPU4uV7dYlvtWJxwwxHD0PuihVNiE7TyAbQ5SWxDCB9mUYvOgroQOwYQQOKPJ8CIbE+1ETVlOoK1UC2nU3gYvg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/mime-types": {[m
[32m+[m[32m      "version": "2.1.35",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/mime-types/-/mime-types-2.1.35.tgz",[m
[32m+[m[32m      "integrity": "sha512-ZDY+bPm5zTTF+YpCrAU9nK0UgICYPT0QtT1NZWFv4s++TNkcgVaT0g6+4R2uI4MjQjzysHB1zxuWL50hzaeXiw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "mime-db": "1.52.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/ms": {[m
[32m+[m[32m      "version": "2.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ms/-/ms-2.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-Tpp60P6IUJDTuOq/5Z8cdskzJujfwqfOTkrwIwj7IRISpnkJnT6SyJ4PCPnGMoFjC9ddhal5KVIYtAt97ix05A==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/negotiator": {[m
[32m+[m[32m      "version": "0.6.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/negotiator/-/negotiator-0.6.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-+EUsqGPLsM+j/zdChZjsnX51g4XrHFOIXwfnCVPGlQk/k5giakcKsuxCObBRu6DSm9opw/O6slWbJdghQM4bBg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/object-inspect": {[m
[32m+[m[32m      "version": "1.13.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/object-inspect/-/object-inspect-1.13.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-IRZSRuzJiynemAXPYtPe5BoI/RESNYR7TYm50MC5Mqbd3Jmw5y790sErYw3V6SryFJD64b74qQQs9wn5Bg/k3g==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/on-finished": {[m
[32m+[m[32m      "version": "2.4.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/on-finished/-/on-finished-2.4.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-oVlzkg3ENAhCk2zdv7IJwd/QUD4z2RxRwpkcGY8psCVcCYZNq4wYnVWALHM+brtuJjePWiYF/ClmuDr8Ch5+kg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "ee-first": "1.1.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/parseurl": {[m
[32m+[m[32m      "version": "1.3.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/parseurl/-/parseurl-1.3.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-CiyeOxFT/JZyN5m0z9PfXw4SCBJ6Sygz1Dpl0wqjlhDEGGBP1GnsUVEL0p63hoG1fcj3fHynXi9NYO4nWOL+qQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/path-to-regexp": {[m
[32m+[m[32m      "version": "0.1.10",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/path-to-regexp/-/path-to-regexp-0.1.10.tgz",[m
[32m+[m[32m      "integrity": "sha512-7lf7qcQidTku0Gu3YDPc8DJ1q7OOucfa/BSsIwjuh56VU7katFvuM8hULfkwB3Fns/rsVF7PwPKVw1sl5KQS9w==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/proxy-addr": {[m
[32m+[m[32m      "version": "2.0.7",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/proxy-addr/-/proxy-addr-2.0.7.tgz",[m
[32m+[m[32m      "integrity": "sha512-llQsMLSUDUPT44jdrU/O37qlnifitDP+ZwrmmZcoSKyLKvtZxpyV0n2/bD/N4tBAAZ/gJEdZU7KMraoK1+XYAg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "forwarded": "0.2.0",[m
[32m+[m[32m        "ipaddr.js": "1.9.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.10"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/proxy-from-env": {[m
[32m+[m[32m      "version": "1.1.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/proxy-from-env/-/proxy-from-env-1.1.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-D+zkORCbA9f1tdWRK0RaCR3GPv50cMxcrz4X8k5LTSUD1Dkw47mKJEZQNunItRTkWwgtaUSo1RVFRIG9ZXiFYg==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/qs": {[m
[32m+[m[32m      "version": "6.11.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/qs/-/qs-6.11.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-MvjoMCJwEarSbUYk5O+nmoSzSutSsTwF85zcHPQ9OrlFoZOYIjaqBAJIqIXjptyD5vThxGq52Xu/MaJzRkIk4Q==",[m
[32m+[m[32m      "license": "BSD-3-Clause",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "side-channel": "^1.0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.6"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/range-parser": {[m
[32m+[m[32m      "version": "1.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/range-parser/-/range-parser-1.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-Hrgsx+orqoygnmhFbKaHE6c296J+HTAQXoxEF6gNupROmmGJRoyzfG3ccAveqCBrwr/2yxQ5BVd/GTl5agOwSg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/raw-body": {[m
[32m+[m[32m      "version": "2.5.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/raw-body/-/raw-body-2.5.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-8zGqypfENjCIqGhgXToC8aB2r7YrBX+AQAfIPs/Mlk+BtPTztOvTS01NRW/3Eh60J+a48lt8qsCzirQ6loCVfA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "bytes": "3.1.2",[m
[32m+[m[32m        "http-errors": "2.0.0",[m
[32m+[m[32m        "iconv-lite": "0.4.24",[m
[32m+[m[32m        "unpipe": "1.0.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/safe-buffer": {[m
[32m+[m[32m      "version": "5.2.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-rp3So07KcdmmKbGvgaNxQSJr7bGVSVk5S9Eq1F+ppbRo70+YeaDxkw5Dd8NPN+GD6bjnYm2VuPuCXmpuYvmCXQ==",[m
[32m+[m[32m      "funding": [[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "github",[m
[32m+[m[32m          "url": "https://github.com/sponsors/feross"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "patreon",[m
[32m+[m[32m          "url": "https://www.patreon.com/feross"[m
[32m+[m[32m        },[m
[32m+[m[32m        {[m
[32m+[m[32m          "type": "consulting",[m
[32m+[m[32m          "url": "https://feross.org/support"[m
[32m+[m[32m        }[m
[32m+[m[32m      ],[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/safer-buffer": {[m
[32m+[m[32m      "version": "2.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/safer-buffer/-/safer-buffer-2.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-YZo3K82SD7Riyi0E1EQPojLz7kpepnSQI9IyPbHHg1XXXevb5dJI7tpyN2ADxGcQbHG7vcyRHk0cbwqcQriUtg==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/send": {[m
[32m+[m[32m      "version": "0.19.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/send/-/send-0.19.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-dW41u5VfLXu8SJh5bwRmyYUbAoSB3c9uQh6L8h/KtsFREPWpbX1lrljJo186Jc4nmci/sGUZ9a0a0J2zgfq2hw==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "debug": "2.6.9",[m
[32m+[m[32m        "depd": "2.0.0",[m
[32m+[m[32m        "destroy": "1.2.0",[m
[32m+[m[32m        "encodeurl": "~1.0.2",[m
[32m+[m[32m        "escape-html": "~1.0.3",[m
[32m+[m[32m        "etag": "~1.8.1",[m
[32m+[m[32m        "fresh": "0.5.2",[m
[32m+[m[32m        "http-errors": "2.0.0",[m
[32m+[m[32m        "mime": "1.6.0",[m
[32m+[m[32m        "ms": "2.1.3",[m
[32m+[m[32m        "on-finished": "2.4.1",[m
[32m+[m[32m        "range-parser": "~1.2.1",[m
[32m+[m[32m        "statuses": "2.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/send/node_modules/encodeurl": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-TPJXq8JqFaVYm2CWmPvnP2Iyo4ZSM7/QKcSmuMLDObfpH5fi7RUGmd/rTDf+rut/saiDiQEeVTNgAmJEdAOx0w==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/send/node_modules/ms": {[m
[32m+[m[32m      "version": "2.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/serve-static": {[m
[32m+[m[32m      "version": "1.16.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/serve-static/-/serve-static-1.16.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-pDLK8zwl2eKaYrs8mrPZBJua4hMplRWJ1tIFksVC3FtBEBnl8dxgeHtsaMS8DhS9i4fLObaon6ABoc4/hQGdPA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "encodeurl": "~1.0.2",[m
[32m+[m[32m        "escape-html": "~1.0.3",[m
[32m+[m[32m        "parseurl": "~1.3.3",[m
[32m+[m[32m        "send": "0.18.0"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/serve-static/node_modules/encodeurl": {[m
[32m+[m[32m      "version": "1.0.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/encodeurl/-/encodeurl-1.0.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-TPJXq8JqFaVYm2CWmPvnP2Iyo4ZSM7/QKcSmuMLDObfpH5fi7RUGmd/rTDf+rut/saiDiQEeVTNgAmJEdAOx0w==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/serve-static/node_modules/ms": {[m
[32m+[m[32m      "version": "2.1.3",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/ms/-/ms-2.1.3.tgz",[m
[32m+[m[32m      "integrity": "sha512-6FlzubTLZG3J2a/NVCAleEhjzq5oxgHyaCU9yYXvcLsvoVaHJq/s5xXI6/XXP6tz7R9xAOtHnSO/tXtF3WRTlA==",[m
[32m+[m[32m      "license": "MIT"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/serve-static/node_modules/send": {[m
[32m+[m[32m      "version": "0.18.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/send/-/send-0.18.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-qqWzuOjSFOuqPjFe4NOsMLafToQQwBSOEpS+FwEt3A2V3vKubTquT3vmLTQpFgMXp8AlFWFuP1qKaJZOtPpVXg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "debug": "2.6.9",[m
[32m+[m[32m        "depd": "2.0.0",[m
[32m+[m[32m        "destroy": "1.2.0",[m
[32m+[m[32m        "encodeurl": "~1.0.2",[m
[32m+[m[32m        "escape-html": "~1.0.3",[m
[32m+[m[32m        "etag": "~1.8.1",[m
[32m+[m[32m        "fresh": "0.5.2",[m
[32m+[m[32m        "http-errors": "2.0.0",[m
[32m+[m[32m        "mime": "1.6.0",[m
[32m+[m[32m        "ms": "2.1.3",[m
[32m+[m[32m        "on-finished": "2.4.1",[m
[32m+[m[32m        "range-parser": "~1.2.1",[m
[32m+[m[32m        "statuses": "2.0.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/set-function-length": {[m
[32m+[m[32m      "version": "1.2.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/set-function-length/-/set-function-length-1.2.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-pgRc4hJ4/sNjWCSS9AmnS40x3bNMDTknHgL5UaMBTMyJnU90EgWh1Rz+MC9eFu4BuN/UwZjKQuY/1v3rM7HMfg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "define-data-property": "^1.1.4",[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "function-bind": "^1.1.2",[m
[32m+[m[32m        "get-intrinsic": "^1.2.4",[m
[32m+[m[32m        "gopd": "^1.0.1",[m
[32m+[m[32m        "has-property-descriptors": "^1.0.2"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/setprototypeof": {[m
[32m+[m[32m      "version": "1.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/setprototypeof/-/setprototypeof-1.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-E5LDX7Wrp85Kil5bhZv46j8jOeboKq5JMmYM3gVGdGH8xFpPWXUMsNrlODCrkoxMEeNi/XZIwuRvY4XNwYMJpw==",[m
[32m+[m[32m      "license": "ISC"[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/side-channel": {[m
[32m+[m[32m      "version": "1.0.6",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/side-channel/-/side-channel-1.0.6.tgz",[m
[32m+[m[32m      "integrity": "sha512-fDW/EZ6Q9RiO8eFG8Hj+7u/oW+XrPTIChwCOM2+th2A6OblDtYYIpve9m+KvI9Z4C9qSEXlaGR6bTEYHReuglA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "call-bind": "^1.0.7",[m
[32m+[m[32m        "es-errors": "^1.3.0",[m
[32m+[m[32m        "get-intrinsic": "^1.2.4",[m
[32m+[m[32m        "object-inspect": "^1.13.1"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4"[m
[32m+[m[32m      },[m
[32m+[m[32m      "funding": {[m
[32m+[m[32m        "url": "https://github.com/sponsors/ljharb"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/statuses": {[m
[32m+[m[32m      "version": "2.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/statuses/-/statuses-2.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-RwNA9Z/7PrK06rYLIzFMlaF+l73iwpzsqRIFgbMLbTcLD6cOao82TaWefPXQvB2fOC4AjuYSEndS7N/mTCbkdQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/toidentifier": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/toidentifier/-/toidentifier-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-o5sSPKEkg/DIQNmH43V0/uerLrpzVedkUh8tGNvaeXpfpuwjKenlSox/2O/BTlZUtEe+JG7s5YhEz608PlAHRA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">=0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/type-is": {[m
[32m+[m[32m      "version": "1.6.18",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/type-is/-/type-is-1.6.18.tgz",[m
[32m+[m[32m      "integrity": "sha512-TkRKr9sUTxEH8MdfuCSP7VizJyzRNMjj2J2do2Jr3Kym598JVdEksuzPQCnlFPW4ky9Q+iA+ma9BGm06XQBy8g==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "dependencies": {[m
[32m+[m[32m        "media-typer": "0.3.0",[m
[32m+[m[32m        "mime-types": "~2.1.24"[m
[32m+[m[32m      },[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.6"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/unpipe": {[m
[32m+[m[32m      "version": "1.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/unpipe/-/unpipe-1.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-pjy2bYhSsufwWlKwPc+l3cN7+wuJlK6uz0YdJEOlQDbl6jo/YlPi4mb8agUkVC8BF7V8NuzeyPNqRksA3hztKQ==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/utils-merge": {[m
[32m+[m[32m      "version": "1.0.1",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/utils-merge/-/utils-merge-1.0.1.tgz",[m
[32m+[m[32m      "integrity": "sha512-pMZTvIkT1d+TFGvDOqodOclx0QWkkgi6Tdoa8gC8ffGAAqz9pzPTZWAybbsHHoED/ztMtkv/VoYTYyShUn81hA==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.4.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
[32m+[m[32m    "node_modules/vary": {[m
[32m+[m[32m      "version": "1.1.2",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/vary/-/vary-1.1.2.tgz",[m
[32m+[m[32m      "integrity": "sha512-BNGbWLfd0eUPabhkXUVm0j8uuvREyTh5ovRa/dyow/BqAbZJyC+5fU+IzQOzmAKzYqYRAISoRhdQr3eIZ/PXqg==",[m
[32m+[m[32m      "license": "MIT",[m
[32m+[m[32m      "engines": {[m
[32m+[m[32m        "node": ">= 0.8"[m
[32m+[m[32m      }[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m[32m}[m
[1mdiff --git a/node_modules/accepts/HISTORY.md b/node_modules/accepts/HISTORY.md[m
[1mnew file mode 100644[m
[1mindex 0000000..cb5990c[m
[1m--- /dev/null[m
[1m+++ b/node_modules/accepts/HISTORY.md[m
[36m@@ -0,0 +1,243 @@[m
[32m+[m[32m1.3.8 / 2022-02-02[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.34[m
[32m+[m[32m    - deps: mime-db@~1.51.0[m
[32m+[m[32m  * deps: negotiator@0.6.3[m
[32m+[m
[32m+[m[32m1.3.7 / 2019-04-29[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: negotiator@0.6.2[m
[32m+[m[32m    - Fix sorting charset, encoding, and language with extra parameters[m
[32m+[m
[32m+[m[32m1.3.6 / 2019-04-28[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.24[m
[32m+[m[32m    - deps: mime-db@~1.40.0[m
[32m+[m
[32m+[m[32m1.3.5 / 2018-02-28[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.18[m
[32m+[m[32m    - deps: mime-db@~1.33.0[m
[32m+[m
[32m+[m[32m1.3.4 / 2017-08-22[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.16[m
[32m+[m[32m    - deps: mime-db@~1.29.0[m
[32m+[m
[32m+[m[32m1.3.3 / 2016-05-02[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.11[m
[32m+[m[32m    - deps: mime-db@~1.23.0[m
[32m+[m[32m  * deps: negotiator@0.6.1[m
[32m+[m[32m    - perf: improve `Accept` parsing speed[m
[32m+[m[32m    - perf: improve `Accept-Charset` parsing speed[m
[32m+[m[32m    - perf: improve `Accept-Encoding` parsing speed[m
[32m+[m[32m    - perf: improve `Accept-Language` parsing speed[m
[32m+[m
[32m+[m[32m1.3.2 / 2016-03-08[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.10[m
[32m+[m[32m    - Fix extension of `application/dash+xml`[m
[32m+[m[32m    - Update primary extension for `audio/mp4`[m
[32m+[m[32m    - deps: mime-db@~1.22.0[m
[32m+[m
[32m+[m[32m1.3.1 / 2016-01-19[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.9[m
[32m+[m[32m    - deps: mime-db@~1.21.0[m
[32m+[m
[32m+[m[32m1.3.0 / 2015-09-29[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.7[m
[32m+[m[32m    - deps: mime-db@~1.19.0[m
[32m+[m[32m  * deps: negotiator@0.6.0[m
[32m+[m[32m    - Fix including type extensions in parameters in `Accept` parsing[m
[32m+[m[32m    - Fix parsing `Accept` parameters with quoted equals[m
[32m+[m[32m    - Fix parsing `Accept` parameters with quoted semicolons[m
[32m+[m[32m    - Lazy-load modules from main entry point[m
[32m+[m[32m    - perf: delay type concatenation until needed[m
[32m+[m[32m    - perf: enable strict mode[m
[32m+[m[32m    - perf: hoist regular expressions[m
[32m+[m[32m    - perf: remove closures getting spec properties[m
[32m+[m[32m    - perf: remove a closure from media type parsing[m
[32m+[m[32m    - perf: remove property delete from media type parsing[m
[32m+[m
[32m+[m[32m1.2.13 / 2015-09-06[m
[32m+[m[32m===================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.6[m
[32m+[m[32m    - deps: mime-db@~1.18.0[m
[32m+[m
[32m+[m[32m1.2.12 / 2015-07-30[m
[32m+[m[32m===================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.4[m
[32m+[m[32m    - deps: mime-db@~1.16.0[m
[32m+[m
[32m+[m[32m1.2.11 / 2015-07-16[m
[32m+[m[32m===================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.3[m
[32m+[m[32m    - deps: mime-db@~1.15.0[m
[32m+[m
[32m+[m[32m1.2.10 / 2015-07-01[m
[32m+[m[32m===================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.2[m
[32m+[m[32m    - deps: mime-db@~1.14.0[m
[32m+[m
[32m+[m[32m1.2.9 / 2015-06-08[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.1[m
[32m+[m[32m    - perf: fix deopt during mapping[m
[32m+[m
[32m+[m[32m1.2.8 / 2015-06-07[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.1.0[m
[32m+[m[32m    - deps: mime-db@~1.13.0[m
[32m+[m[32m  * perf: avoid argument reassignment & argument slice[m
[32m+[m[32m  * perf: avoid negotiator recursive construction[m
[32m+[m[32m  * perf: enable strict mode[m
[32m+[m[32m  * perf: remove unnecessary bitwise operator[m
[32m+[m
[32m+[m[32m1.2.7 / 2015-05-10[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: negotiator@0.5.3[m
[32m+[m[32m    - Fix media type parameter matching to be case-insensitive[m
[32m+[m
[32m+[m[32m1.2.6 / 2015-05-07[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.11[m
[32m+[m[32m    - deps: mime-db@~1.9.1[m
[32m+[m[32m  * deps: negotiator@0.5.2[m
[32m+[m[32m    - Fix comparing media types with quoted values[m
[32m+[m[32m    - Fix splitting media types with quoted commas[m
[32m+[m
[32m+[m[32m1.2.5 / 2015-03-13[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.10[m
[32m+[m[32m    - deps: mime-db@~1.8.0[m
[32m+[m
[32m+[m[32m1.2.4 / 2015-02-14[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * Support Node.js 0.6[m
[32m+[m[32m  * deps: mime-types@~2.0.9[m
[32m+[m[32m    - deps: mime-db@~1.7.0[m
[32m+[m[32m  * deps: negotiator@0.5.1[m
[32m+[m[32m    - Fix preference sorting to be stable for long acceptable lists[m
[32m+[m
[32m+[m[32m1.2.3 / 2015-01-31[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.8[m
[32m+[m[32m    - deps: mime-db@~1.6.0[m
[32m+[m
[32m+[m[32m1.2.2 / 2014-12-30[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.7[m
[32m+[m[32m    - deps: mime-db@~1.5.0[m
[32m+[m
[32m+[m[32m1.2.1 / 2014-12-30[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.5[m
[32m+[m[32m    - deps: mime-db@~1.3.1[m
[32m+[m
[32m+[m[32m1.2.0 / 2014-12-19[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: negotiator@0.5.0[m
[32m+[m[32m    - Fix list return order when large accepted list[m
[32m+[m[32m    - Fix missing identity encoding when q=0 exists[m
[32m+[m[32m    - Remove dynamic building of Negotiator class[m
[32m+[m
[32m+[m[32m1.1.4 / 2014-12-10[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.4[m
[32m+[m[32m    - deps: mime-db@~1.3.0[m
[32m+[m
[32m+[m[32m1.1.3 / 2014-11-09[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.3[m
[32m+[m[32m    - deps: mime-db@~1.2.0[m
[32m+[m
[32m+[m[32m1.1.2 / 2014-10-14[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: negotiator@0.4.9[m
[32m+[m[32m    - Fix error when media type has invalid parameter[m
[32m+[m
[32m+[m[32m1.1.1 / 2014-09-28[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: mime-types@~2.0.2[m
[32m+[m[32m    - deps: mime-db@~1.1.0[m
[32m+[m[32m  * deps: negotiator@0.4.8[m
[32m+[m[32m    - Fix all negotiations to be case-insensitive[m
[32m+[m[32m    - Stable sort preferences of same quality according to client order[m
[32m+[m
[32m+[m[32m1.1.0 / 2014-09-02[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * update `mime-types`[m
[32m+[m
[32m+[m[32m1.0.7 / 2014-07-04[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * Fix wrong type returned from `type` when match after unknown extension[m
[32m+[m
[32m+[m[32m1.0.6 / 2014-06-24[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: negotiator@0.4.7[m
[32m+[m
[32m+[m[32m1.0.5 / 2014-06-20[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m * fix crash when unknown extension given[m
[32m+[m
[32m+[m[32m1.0.4 / 2014-06-19[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * use `mime-types`[m
[32m+[m
[32m+[m[32m1.0.3 / 2014-06-11[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * deps: negotiator@0.4.6[m
[32m+[m[32m    - Order by specificity when quality is the same[m
[32m+[m
[32m+[m[32m1.0.2 / 2014-05-29[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * Fix interpretation when header not in request[m
[32m+[m[32m  * deps: pin negotiator@0.4.5[m
[32m+[m
[32m+[m[32m1.0.1 / 2014-01-18[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * Identity encoding isn't always acceptable[m
[32m+[m[32m  * deps: negotiator@~0.4.0[m
[32m+[m
[32m+[m[32m1.0.0 / 2013-12-27[m
[32m+[m[32m==================[m
[32m+[m
[32m+[m[32m  * Genesis[m
[1mdiff --git a/node_modules/accepts/LICENSE b/node_modules/accepts/LICENSE[m
[1mnew file mode 100644[m
[1mindex 0000000..0616607[m
[1m--- /dev/null[m
[1m+++ b/node_modules/accepts/LICENSE[m
[36m@@ -0,0 +1,23 @@[m
[32m+[m[32m(The MIT License)[m
[32m+[m
[32m+[m[32mCopyright (c) 2014 Jonathan Ong <me@jongleberry.com>[m
[32m+[m[32mCopyright (c) 2015 Douglas Christopher Wilson <doug@somethingdoug.com>[m
[32m+[m
[32m+[m[32mPermission is hereby granted, free of charge, to any person obtaining[m
[32m+[m[32ma copy of this software and associated documentation files (the[m
[32m+[m[32m'Software'), to deal in the Software without restriction, including[m
[32m+[m[32mwithout limitation the rights to use, copy, modify, merge, publish,[m
[32m+[m[32mdistribute, sublicense, and/or sell copies of the Software, and to[m
[32m+[m[32mpermit persons to whom the Software is furnished to do so, subject to[m
[32m+[m[32mthe following conditions:[m
[32m+[m
[32m+[m[32mThe above copyright notice and this permission notice shall be[m
[32m+[m[32mincluded in all copies or substantial portions of the Software.[m
[32m+[m
[32m+[m[32mTHE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,[m
[32m+[m[32mEXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF[m
[32m+[m[32mMERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.[m
[32m+[m[32mIN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY[m
[32m+[m[32mCLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,[m
[32m+[m[32mTORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE[m
[32m+[m[32mSOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.[m
[1mdiff --git a/node_modules/accepts/README.md b/node_modules/accepts/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..82680c5[m
[1m--- /dev/null[m
[1m+++ b/node_modules/accepts/README.md[m
[36m@@ -0,0 +1,140 @@[m
[32m+[m[32m# accepts[m
[32m+[m
[32m+[m[32m[![NPM Version][npm-version-image]][npm-url][m
[32m+[m[32m[![NPM Downloads][npm-downloads-image]][npm-url][m
[32m+[m[32m[![Node.js Version][node-version-image]][node-version-url][m
[32m+[m[32m[![Build Status][github-actions-ci-image]][github-actions-ci-url][m
[32m+[m[32m[![Test Coverage][coveralls-image]][coveralls-url][m
[32m+[m
[32m+[m[32mHigher level content negotiation based on [negotiator](https://www.npmjs.com/package/negotiator).[m
[32m+[m[32mExtracted from [koa](https://www.npmjs.com/package/koa) for general use.[m
[32m+[m
[32m+[m[32mIn addition to negotiator, it allows:[m
[32m+[m
[32m+[m[32m- Allows types as an array or arguments list, ie `(['text/html', 'application/json'])`[m
[32m+[m[32m  as well as `('text/html', 'application/json')`.[m
[32m+[m[32m- Allows type shorthands such as `json`.[m
[32m+[m[32m- Returns `false` when no types match[m
[32m+[m[32m- Treats non-existent headers as `*`[m
[32m+[m
[32m+[m[32m## Installation[m
[32m+[m
[32m+[m[32mThis is a [Node.js](https://nodejs.org/en/) module available through the[m
[32m+[m[32m[npm registry](https://www.npmjs.com/). Installation is done using the[m
[32m+[m[32m[`npm install` command](https://docs.npmjs.com/getting-started/installing-npm-packages-locally):[m
[32m+[m
[32m+[m[32m```sh[m
[32m+[m[32m$ npm install accepts[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m## API[m
[32m+[m
[32m+[m[32m```js[m
[32m+[m[32mvar accepts = require('accepts')[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m### accepts(req)[m
[32m+[m
[32m+[m[32mCreate a new `Accepts` object for the given `req`.[m
[32m+[m
[32m+[m[32m#### .charset(charsets)[m
[32m+[m
[32m+[m[32mReturn the first accepted charset. If nothing in `charsets` is accepted,[m
[32m+[m[32mthen `false` is returned.[m
[32m+[m
[32m+[m[32m#### .charsets()[m
[32m+[m
[32m+[m[32mReturn the charsets that the request accepts, in the order of the client's[m
[32m+[m[32mpreference (most preferred first).[m
[32m+[m
[32m+[m[32m#### .encoding(encodings)[m
[32m+[m
[32m+[m[32mReturn the first accepted encoding. If nothing in `encodings` is accepted,[m
[32m+[m[32mthen `false` is returned.[m
[32m+[m
[32m+[m[32m#### .encodings()[m
[32m+[m
[32m+[m[32mReturn the encodings that the request accepts, in the order of the client's[m
[32m+[m[32mpreference (most preferred first).[m
[32m+[m
[32m+[m[32m#### .language(languages)[m
[32m+[m
[32m+[m[32mReturn the first accepted language. If nothing in `languages` is accepted,[m
[32m+[m[32mthen `false` is returned.[m
[32m+[m
[32m+[m[32m#### .languages()[m
[32m+[m
[32m+[m[32mReturn the languages that the request accepts, in the order of the client's[m
[32m+[m[32mpreference (most preferred first).[m
[32m+[m
[32m+[m[32m#### .type(types)[m
[32m+[m
[32m+[m[32mReturn the first accepted type (and it is returned as the same text as what[m
[32m+[m[32mappears in the `types` array). If nothing in `types` is accepted, then `false`[m
[32m+[m[32mis returned.[m
[32m+[m
[32m+[m[32mThe `types` array can contain full MIME types or file extensions. Any value[m
[32m+[m[32mthat is not a full MIME types is passed to `require('mime-types').lookup`.[m
[32m+[m
[32m+[m[32m#### .types()[m
[32m+[m
[32m+[m[32mReturn the types that the request accepts, in the order of the client's[m
[32m+[m[32mpreference (most preferred first).[m
[32m+[m
[32m+[m[32m## Examples[m
[32m+[m
[32m+[m[32m### Simple type negotiation[m
[32m+[m
[32m+[m[32mThis simple example shows how to use `accepts` to return a different typed[m
[32m+[m[32mrespond body based on what the client wants to accept. The server lists it's[m
[32m+[m[32mpreferences in order and will get back the best match between the client and[m
[32m+[m[32mserver.[m
[32m+[m
[32m+[m[32m```js[m
[32m+[m[32mvar accepts = require('accepts')[m
[32m+[m[32mvar http = require('http')[m
[32m+[m
[32m+[m[32mfunction app (req, res) {[m
[32m+[m[32m  var accept = accepts(req)[m
[32m+[m
[32m+[m[32m  // the order of this list is significant; should be server preferred order[m
[32m+[m[32m  switch (accept.type(['json', 'html'])) {[m
[32m+[m[32m    case 'json':[m
[32m+[m[32m      res.setHeader('Content-Type', 'application/json')[m
[32m+[m[32m      res.write('{"hello":"world!"}')[m
[32m+[m[32m      break[m
[32m+[m[32m    case 'html':[m
[32m+[m[32m      res.setHeader('Content-Type', 'text/html')[m
[32m+[m[32m      res.write('<b>hello, world!</b>')[m
[32m+[m[32m      break[m
[32m+[m[32m    default:[m
[32m+[m[32m      // the fallback is text/plain, so no need to specify it above[m
[32m+[m[32m      res.setHeader('Content-Type', 'text/plain')[m
[32m+[m[32m      res.write('hello, world!')[m
[32m+[m[32m      break[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  res.end()[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32mhttp.createServer(app).listen(3000)[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32mYou can test this out with the cURL program:[m
[32m+[m[32m```sh[m
[32m+[m[32mcurl -I -H'Accept: text/html' http://localhost:3000/[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m## License[m
[32m+[m
[32m+[m[32m[MIT](LICENSE)[m
[32m+[m
[32m+[m[32m[coveralls-image]: https://badgen.net/coveralls/c/github/jshttp/accepts/master[m
[32m+[m[32m[coveralls-url]: https://coveralls.io/r/jshttp/accepts?branch=master[m
[32m+[m[32m[github-actions-ci-image]: https://badgen.net/github/checks/jshttp/accepts/master?label=ci[m
[32m+[m[32m[github-actions-ci-url]: https://github.com/jshttp/accepts/actions/workflows/ci.yml[m
[32m+[m[32m[node-version-image]: https://badgen.net/npm/node/accepts[m
[32m+[m[32m[node-version-url]: https://nodejs.org/en/download[m
[32m+[m[32m[npm-downloads-image]: https://badgen.net/npm/dm/accepts[m
[32m+[m[32m[npm-url]: https://npmjs.org/package/accepts[m
[32m+[m[32m[npm-version-image]: https://badgen.net/npm/v/accepts[m
[1mdiff --git a/node_modules/accepts/index.js b/node_modules/accepts/index.js[m
[1mnew file mode 100644[m
[1mindex 0000000..e9b2f63[m
[1m--- /dev/null[m
[1m+++ b/node_modules/accepts/index.js[m
[36m@@ -0,0 +1,238 @@[m
[32m+[m[32m/*![m
[32m+[m[32m * accepts[m
[32m+[m[32m * Copyright(c) 2014 Jonathan Ong[m
[32m+[m[32m * Copyright(c) 2015 Douglas Christopher Wilson[m
[32m+[m[32m * MIT Licensed[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32m'use strict'[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Module dependencies.[m
[32m+[m[32m * @private[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mvar Negotiator = require('negotiator')[m
[32m+[m[32mvar mime = require('mime-types')[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Module exports.[m
[32m+[m[32m * @public[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mmodule.exports = Accepts[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Create a new Accepts object for the given req.[m
[32m+[m[32m *[m
[32m+[m[32m * @param {object} req[m
[32m+[m[32m * @public[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mfunction Accepts (req) {[m
[32m+[m[32m  if (!(this instanceof Accepts)) {[m
[32m+[m[32m    return new Accepts(req)[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  this.headers = req.headers[m
[32m+[m[32m  this.negotiator = new Negotiator(req)[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Check if the given `type(s)` is acceptable, returning[m
[32m+[m[32m * the best match when true, otherwise `undefined`, in which[m
[32m+[m[32m * case you should respond with 406 "Not Acceptable".[m
[32m+[m[32m *[m
[32m+[m[32m * The `type` value may be a single mime type string[m
[32m+[m[32m * such as "application/json", the extension name[m
[32m+[m[32m * such as "json" or an array `["json", "html", "text/plain"]`. When a list[m
[32m+[m[32m * or array is given the _best_ match, if any is returned.[m
[32m+[m[32m *[m
[32m+[m[32m * Examples:[m
[32m+[m[32m *[m
[32m+[m[32m *     // Accept: text/html[m
[32m+[m[32m *     this.types('html');[m
[32m+[m[32m *     // => "html"[m
[32m+[m[32m *[m
[32m+[m[32m *     // Accept: text/*, application/json[m
[32m+[m[32m *     this.types('html');[m
[32m+[m[32m *     // => "html"[m
[32m+[m[32m *     this.types('text/html');[m
[32m+[m[32m *     // => "text/html"[m
[32m+[m[32m *     this.types('json', 'text');[m
[32m+[m[32m *     // => "json"[m
[32m+[m[32m *     this.types('application/json');[m
[32m+[m[32m *     // => "application/json"[m
[32m+[m[32m *[m
[32m+[m[32m *     // Accept: text/*, application/json[m
[32m+[m[32m *     this.types('image/png');[m
[32m+[m[32m *     this.types('png');[m
[32m+[m[32m *     // => undefined[m
[32m+[m[32m *[m
[32m+[m[32m *     // Accept: text/*;q=.5, application/json[m
[32m+[m[32m *     this.types(['html', 'json']);[m
[32m+[m[32m *     this.types('html', 'json');[m
[32m+[m[32m *     // => "json"[m
[32m+[m[32m *[m
[32m+[m[32m * @param {String|Array} types...[m
[32m+[m[32m * @return {String|Array|Boolean}[m
[32m+[m[32m * @public[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mAccepts.prototype.type =[m
[32m+[m[32mAccepts.prototype.types = function (types_) {[m
[32m+[m[32m  var types = types_[m
[32m+[m
[32m+[m[32m  // support flattened arguments[m
[32m+[m[32m  if (types && !Array.isArray(types)) {[m
[32m+[m[32m    types = new Array(arguments.length)[m
[32m+[m[32m    for (var i = 0; i < types.length; i++) {[m
[32m+[m[32m      types[i] = arguments[i][m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  // no types, return all requested types[m
[32m+[m[32m  if (!types || types.length === 0) {[m
[32m+[m[32m    return this.negotiator.mediaTypes()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  // no accept header, return first given type[m
[32m+[m[32m  if (!this.headers.accept) {[m
[32m+[m[32m    return types[0][m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  var mimes = types.map(extToMime)[m
[32m+[m[32m  var accepts = this.negotiator.mediaTypes(mimes.filter(validMime))[m
[32m+[m[32m  var first = accepts[0][m
[32m+[m
[32m+[m[32m  return first[m
[32m+[m[32m    ? types[mimes.indexOf(first)][m
[32m+[m[32m    : false[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Return accepted encodings or best fit based on `encodings`.[m
[32m+[m[32m *[m
[32m+[m[32m * Given `Accept-Encoding: gzip, deflate`[m
[32m+[m[32m * an array sorted by quality is returned:[m
[32m+[m[32m *[m
[32m+[m[32m *     ['gzip', 'deflate'][m
[32m+[m[32m *[m
[32m+[m[32m * @param {String|Array} encodings...[m
[32m+[m[32m * @return {String|Array}[m
[32m+[m[32m * @public[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mAccepts.prototype.encoding =[m
[32m+[m[32mAccepts.prototype.encodings = function (encodings_) {[m
[32m+[m[32m  var encodings = encodings_[m
[32m+[m
[32m+[m[32m  // support flattened arguments[m
[32m+[m[32m  if (encodings && !Array.isArray(encodings)) {[m
[32m+[m[32m    encodings = new Array(arguments.length)[m
[32m+[m[32m    for (var i = 0; i < encodings.length; i++) {[m
[32m+[m[32m      encodings[i] = arguments[i][m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  // no encodings, return all requested encodings[m
[32m+[m[32m  if (!encodings || encodings.length === 0) {[m
[32m+[m[32m    return this.negotiator.encodings()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  return this.negotiator.encodings(encodings)[0] || false[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Return accepted charsets or best fit based on `charsets`.[m
[32m+[m[32m *[m
[32m+[m[32m * Given `Accept-Charset: utf-8, iso-8859-1;q=0.2, utf-7;q=0.5`[m
[32m+[m[32m * an array sorted by quality is returned:[m
[32m+[m[32m *[m
[32m+[m[32m *     ['utf-8', 'utf-7', 'iso-8859-1'][m
[32m+[m[32m *[m
[32m+[m[32m * @param {String|Array} charsets...[m
[32m+[m[32m * @return {String|Array}[m
[32m+[m[32m * @public[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mAccepts.prototype.charset =[m
[32m+[m[32mAccepts.prototype.charsets = function (charsets_) {[m
[32m+[m[32m  var charsets = charsets_[m
[32m+[m
[32m+[m[32m  // support flattened arguments[m
[32m+[m[32m  if (charsets && !Array.isArray(charsets)) {[m
[32m+[m[32m    charsets = new Array(arguments.length)[m
[32m+[m[32m    for (var i = 0; i < charsets.length; i++) {[m
[32m+[m[32m      charsets[i] = arguments[i][m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  // no charsets, return all requested charsets[m
[32m+[m[32m  if (!charsets || charsets.length === 0) {[m
[32m+[m[32m    return this.negotiator.charsets()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  return this.negotiator.charsets(charsets)[0] || false[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Return accepted languages or best fit based on `langs`.[m
[32m+[m[32m *[m
[32m+[m[32m * Given `Accept-Language: en;q=0.8, es, pt`[m
[32m+[m[32m * an array sorted by quality is returned:[m
[32m+[m[32m *[m
[32m+[m[32m *     ['es', 'pt', 'en'][m
[32m+[m[32m *[m
[32m+[m[32m * @param {String|Array} langs...[m
[32m+[m[32m * @return {Array|String}[m
[32m+[m[32m * @public[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mAccepts.prototype.lang =[m
[32m+[m[32mAccepts.prototype.langs =[m
[32m+[m[32mAccepts.prototype.language =[m
[32m+[m[32mAccepts.prototype.languages = function (languages_) {[m
[32m+[m[32m  var languages = languages_[m
[32m+[m
[32m+[m[32m  // support flattened arguments[m
[32m+[m[32m  if (languages && !Array.isArray(languages)) {[m
[32m+[m[32m    languages = new Array(arguments.length)[m
[32m+[m[32m    for (var i = 0; i < languages.length; i++) {[m
[32m+[m[32m      languages[i] = arguments[i][m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  // no languages, return all requested languages[m
[32m+[m[32m  if (!languages || languages.length === 0) {[m
[32m+[m[32m    return this.negotiator.languages()[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  return this.negotiator.languages(languages)[0] || false[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Convert extnames to mime.[m
[32m+[m[32m *[m
[32m+[m[32m * @param {String} type[m
[32m+[m[32m * @return {String}[m
[32m+[m[32m * @private[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mfunction extToMime (type) {[m
[32m+[m[32m  return type.indexOf('/') === -1[m
[32m+[m[32m    ? mime.lookup(type)[m
[32m+[m[32m    : type[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Check if mime is valid.[m
[32m+[m[32m *[m
[32m+[m[32m * @param {String} type[m
[32m+[m[32m * @return {String}[m
[32m+[m[32m * @private[m
[32m+[m[32m */[m
[32m+[m
[32m+[m[32mfunction validMime (type) {[m
[32m+[m[32m  return typeof type === 'string'[m
[32m+[m[32m}[m
[1mdiff --git a/node_modules/accepts/package.json b/node_modules/accepts/package.json[m
[1mnew file mode 100644[m
[1mindex 0000000..0f2d15d[m
[1m--- /dev/null[m
[1m+++ b/node_modules/accepts/package.json[m
[36m@@ -0,0 +1,47 @@[m
[32m+[m[32m{[m
[32m+[m[32m  "name": "accepts",[m
[32m+[m[32m  "description": "Higher-level content negotiation",[m
[32m+[m[32m  "version": "1.3.8",[m
[32m+[m[32m  "contributors": [[m
[32m+[m[32m    "Douglas Christopher Wilson <doug@somethingdoug.com>",[m
[32m+[m[32m    "Jonathan Ong <me@jongleberry.com> (http://jongleberry.com)"[m
[32m+[m[32m  ],[m
[32m+[m[32m  "license": "MIT",[m
[32m+[m[32m  "repository": "jshttp/accepts",[m
[32m+[m[32m  "dependencies": {[m
[32m+[m[32m    "mime-types": "~2.1.34",[m
[32m+[m[32m    "negotiator": "0.6.3"[m
[32m+[m[32m  },[m
[32m+[m[32m  "devDependencies": {[m
[32m+[m[32m    "deep-equal": "1.0.1",[m
[32m+[m[32m    "eslint": "7.32.0",[m
[32m+[m[32m    "eslint-config-standard": "14.1.1",[m
[32m+[m[32m    "eslint-plugin-import": "2.25.4",[m
[32m+[m[32m    "eslint-plugin-markdown": "2.2.1",[m
[32m+[m[32m    "eslint-plugin-node": "11.1.0",[m
[32m+[m[32m    "eslint-plugin-promise": "4.3.1",[m
[32m+[m[32m    "eslint-plugin-standard": "4.1.0",[m
[32m+[m[32m    "mocha": "9.2.0",[m
[32m+[m[32m    "nyc": "15.1.0"[m
[32m+[m[32m  },[m
[32m+[m[32m  "files": [[m
[32m+[m[32m    "LICENSE",[m
[32m+[m[32m    "HISTORY.md",[m
[32m+[m[32m    "index.js"[m
[32m+[m[32m  ],[m
[32m+[m[32m  "engines": {[m
[32m+[m[32m    "node": ">= 0.6"[m
[32m+[m[32m  },[m
[32m+[m[32m  "scripts": {[m
[32m+[m[32m    "lint": "eslint .",[m
[32m+[m[32m    "test": "mocha --reporter spec --check-leaks --bail test/",[m
[32m+[m[32m    "test-ci": "nyc --reporter=lcov --reporter=text npm test",[m
[32m+[m[32m    "test-cov": "nyc --reporter=html --reporter=text npm test"[m
[32m+[m[32m  },[m
[32m+[m[32m  "keywords": [[m
[32m+[m[32m    "content",[m
[32m+[m[32m    "negotiation",[m
[32m+[m[32m    "accept",[m
[32m+[m[32m    "accepts"[m
[32m+[m[32m  ][m
[32m+[m[32m}[m
[1mdiff --git a/node_modules/array-flatten/LICENSE b/node_modules/array-flatten/LICENSE[m
[1mnew file mode 100644[m
[1mindex 0000000..983fbe8[m
[1m--- /dev/null[m
[1m+++ b/node_modules/array-flatten/LICENSE[m
[36m@@ -0,0 +1,21 @@[m
[32m+[m[32mThe MIT License (MIT)[m
[32m+[m
[32m+[m[32mCopyright (c) 2014 Blake Embrey (hello@blakeembrey.com)[m
[32m+[m
[32m+[m[32mPermission is hereby granted, free of charge, to any person obtaining a copy[m
[32m+[m[32mof this software and associated documentation files (the "Software"), to deal[m
[32m+[m[32min the Software without restriction, including without limitation the rights[m
[32m+[m[32mto use, copy, modify, merge, publish, distribute, sublicense, and/or sell[m
[32m+[m[32mcopies of the Software, and to permit persons to whom the Software is[m
[32m+[m[32mfurnished to do so, subject to the following conditions:[m
[32m+[m
[32m+[m[32mThe above copyright notice and this permission notice shall be included in[m
[32m+[m[32mall copies or substantial portions of the Software.[m
[32m+[m
[32m+[m[32mTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR[m
[32m+[m[32mIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,[m
[32m+[m[32mFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE[m
[32m+[m[32mAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER[m
[32m+[m[32mLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,[m
[32m+[m[32mOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN[m
[32m+[m[32mTHE SOFTWARE.[m
[1mdiff --git a/node_modules/array-flatten/README.md b/node_modules/array-flatten/README.md[m
[1mnew file mode 100644[m
[1mindex 0000000..91fa5b6[m
[1m--- /dev/null[m
[1m+++ b/node_modules/array-flatten/README.md[m
[36m@@ -0,0 +1,43 @@[m
[32m+[m[32m# Array Flatten[m
[32m+[m
[32m+[m[32m[![NPM version][npm-image]][npm-url][m
[32m+[m[32m[![NPM downloads][downloads-image]][downloads-url][m
[32m+[m[32m[![Build status][travis-image]][travis-url][m
[32m+[m[32m[![Test coverage][coveralls-image]][coveralls-url][m
[32m+[m
[32m+[m[32m> Flatten an array of nested arrays into a single flat array. Accepts an optional depth.[m
[32m+[m
[32m+[m[32m## Installation[m
[32m+[m
[32m+[m[32m```[m
[32m+[m[32mnpm install array-flatten --save[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m## Usage[m
[32m+[m
[32m+[m[32m```javascript[m
[32m+[m[32mvar flatten = require('array-flatten')[m
[32m+[m
[32m+[m[32mflatten([1, [2, [3, [4, [5], 6], 7], 8], 9])[m
[32m+[m[32m//=> [1, 2, 3, 4, 5, 6, 7, 8, 9][m
[32m+[m
[32m+[m[32mflatten([1, [2, [3, [4, [5], 6], 7], 8], 9], 2)[m
[32m+[m[32m//=> [1, 2, 3, [4, [5], 6], 7, 8, 9][m
[32m+[m
[32m+[m[32m(function () {[m
[32m+[m[32m  flatten(arguments) //=> [1, 2, 3][m
[32m+[m[32m})(1, [2, 3])[m
[32m+[m[32m```[m
[32m+[m
[32m+[m[32m## License[m
[32m+[m
[32m+[m[32mMIT[m
[32m+[m
[32m+[m[32m[npm-image]: https://img.shields.io/npm/v/array-flatten.svg?style=flat[m
[32m+[m[32m[npm-url]: https://npmjs.org/package/array-flatten[m
[32m+[m[32m[downloads-image]: https://img.shields.io/npm/dm/array-flatten.svg?style=flat[m
[32m+[m[32m[downloads-url]: https://npmjs.org/package/array-flatten[m
[32m+[m[32m[travis-image]: https://img.shields.io/travis/blakeembrey/array-flatten.svg?style=flat[m
[32m+[m[32m[travis-url]: https://travis-ci.org/blakeembrey/array-flatten[m
[32m+[m[32m[coveralls-image]: https://img.shields.io/coveralls/blakeembrey/array-flatten.svg?style=flat[m
[32m+[m[32m[coveralls-url]: https://coveralls.io/r/blakeembrey/array-flatten?branch=master[m
[1mdiff --git a/node_modules/array-flatten/array-flatten.js b/node_modules/array-flatten/array-flatten.js[m
[1mnew file mode 100644[m
[1mindex 0000000..089117b[m
[1m--- /dev/null[m
[1m+++ b/node_modules/array-flatten/array-flatten.js[m
[36m@@ -0,0 +1,64 @@[m
[32m+[m[32m'use strict'[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Expose `arrayFlatten`.[m
[32m+[m[32m */[m
[32m+[m[32mmodule.exports = arrayFlatten[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Recursive flatten function with depth.[m
[32m+[m[32m *[m
[32m+[m[32m * @param  {Array}  array[m
[32m+[m[32m * @param  {Array}  result[m
[32m+[m[32m * @param  {Number} depth[m
[32m+[m[32m * @return {Array}[m
[32m+[m[32m */[m
[32m+[m[32mfunction flattenWithDepth (array, result, depth) {[m
[32m+[m[32m  for (var i = 0; i < array.length; i++) {[m
[32m+[m[32m    var value = array[i][m
[32m+[m
[32m+[m[32m    if (depth > 0 && Array.isArray(value)) {[m
[32m+[m[32m      flattenWithDepth(value, result, depth - 1)[m
[32m+[m[32m    } else {[m
[32m+[m[32m      result.push(value)[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  return result[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Recursive flatten function. Omitting depth is slightly faster.[m
[32m+[m[32m *[m
[32m+[m[32m * @param  {Array} array[m
[32m+[m[32m * @param  {Array} result[m
[32m+[m[32m * @return {Array}[m
[32m+[m[32m */[m
[32m+[m[32mfunction flattenForever (array, result) {[m
[32m+[m[32m  for (var i = 0; i < array.length; i++) {[m
[32m+[m[32m    var value = array[i][m
[32m+[m
[32m+[m[32m    if (Array.isArray(value)) {[m
[32m+[m[32m      flattenForever(value, result)[m
[32m+[m[32m    } else {[m
[32m+[m[32m      result.push(value)[m
[32m+[m[32m    }[m
[32m+[m[32m  }[m
[32m+[m
[32m+[m[32m  return result[m
[32m+[m[32m}[m
[32m+[m
[32m+[m[32m/**[m
[32m+[m[32m * Flatten an array, wi