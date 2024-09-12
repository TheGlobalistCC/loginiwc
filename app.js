const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');
const apiRoutes = require('./routes/api');

const app = express();
const port = process.env.PORT || 3000;

// Middlewares
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Servir archivos estáticos
app.use(express.static(path.join(__dirname, 'public')));

// Rutas
app.use('/api', apiRoutes);

// Escuchar el servidor
app.listen(port, () => {
  console.log(`Servidor corriendo en el puerto ${port}`);
});
