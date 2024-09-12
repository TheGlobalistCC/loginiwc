const express = require('express');
const axios = require('axios');
const router = express.Router();
const encryptionController = require('../controllers/encryption');

// Ruta para encriptar y enviar el POST al API externo
router.post('/encrypt', async (req, res) => {
    const { text } = req.body;
    const encrypted = encryptionController.encrypt(text);
    
    console.log('Texto encriptado: ', encrypted);

    try {
        // Enviar el POST al API externo
        const response = await axios.post('http://10.80.134.246:9080/WCUSTODY/RedirectVerServlet', {
            encData: encrypted.encryptedData
        }, {
            headers: {
                'Content-Type': 'application/json'
            }
        });

        console.log('Respuesta del API externo: ', response.data);

        // Responder al front con el resultado del API externo
        res.json({
            encData: encrypted.encryptedData,
            apiResponse: response.data
        });
    } catch (error) {
        console.error('Error al hacer POST al API externo: ', error.message);
        res.status(500).json({ error: 'Error al comunicarse con el API externo' });
    }
});

// Ruta para recibir el callback desde el API externo
router.post('/callback', (req, res) => {
    const { encData} = req.body;
    
    console.log('Recibido en callback: ', encData);

    const decrypted = encryptionController.decrypt(encData);
    console.log('Texto desencriptado: ', decrypted);

    // Enviar respuesta final con estado success
    res.json({ Status: 'Success' });
});

module.exports = router;
