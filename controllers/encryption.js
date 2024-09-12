const crypto = require('crypto');
const key = 'PortalCCSecretKeyIntellectProofs'; // 32 bytes for AES-256
const iv = Buffer.alloc(16,0); // Vector de inicialización
console.log(key);
// Encriptar
exports.encrypt = (text) => {
    const cipher = crypto.createCipheriv('aes-256-cbc', key, iv);
    let encrypted = cipher.update(text, 'utf8', 'base64');
    encrypted += cipher.final('base64');
    return { iv: iv.toString('base64'), encryptedData: encrypted };
};

// Desencriptar
exports.decrypt = (encryptedText) => {
    const decipher = crypto.createDecipheriv('aes-256-cbc', key, iv);
    let decrypted = decipher.update(encryptedText, 'base64', 'utf8');
    decrypted += decipher.final('utf8');
    return decrypted;
};