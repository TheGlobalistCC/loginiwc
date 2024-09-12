const crypto = require('crypto');

const key = "PortalCCSecretKeyIntellectProofs";//crypto.createHash('sha256').update('PortalCCSecretKeyIntellectProofs').digest();
const iv = Buffer.alloc(16, 0);  // Vector de inicialización
console.log(key);
// Función para encriptar datos
function encryptData(data) {
    const cipher = crypto.createCipheriv('aes-256-cbc', key, iv);
    let encrypted = cipher.update(data, 'utf8', 'base64');
    encrypted += cipher.final('base64');
    return encrypted;
}

// Función para desencriptar datos
function decryptData(encrypted) {
    const decipher = crypto.createDecipheriv('aes-256-cbc', key, iv);
    let decrypted = decipher.update(encrypted, 'base64', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
}

module.exports = { encryptData, decryptData };
