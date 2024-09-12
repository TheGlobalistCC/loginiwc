const express = require('express');
const bodyParser = require('body-parser');
const apiRoutes = require('./routes/api');
const app = express();
const port = 3000;

// Middleware para manejar solicitudes POST
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Ruta para servir el frontend (index.html)
app.use(express.static('public'));

// API Routes
app.use('/api', apiRoutes);

// Escucha en el puerto 3000
app.listen(port, () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
