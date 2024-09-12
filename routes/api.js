const express = require('express');
const router = express.Router();
const { encryptData, decryptData } = require('../controllers/encryption');

// Ruta POST para encriptar datos
router.post('/encrypt', (req, res) => {
    const { data } = req.body;
    const encrypted = encryptData(data);
    const decrypted = decryptData(encrypted);
    res.json({ encrypted, decrypted });
});

// Ruta para recibir datos de la API
router.post('/callback', (req, res) => {
    console.log('Solicitud recibida en /api/callback');
    
    const { encData } = req.body;
    if (!encData) {
        console.error('No se recibió el parámetro encData');
        return res.status(400).json({ Status: 'Error', message: 'No se recibió encData' });
    }
    
    const decrypted = decryptData(encData);
    console.log('Datos desencriptados:', decrypted);

    // Enviar respuesta al API con el parámetro Status
    res.json({ Status: 'Success' });
});

module.exports = router;
