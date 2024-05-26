const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcryptjs');
const db = require('./db');

const app = express();
const port = 3306;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.post('/register', async (req, res) => {
  const { correoInstitucional, correoAlternativo, contrasena, confirmarContrasena } = req.body;

  if (contrasena !== confirmarContrasena) {
    return res.status(400).send('Las contraseñas no coinciden.');
  }

  const hashedPassword = await bcrypt.hash(contrasena, 10);

  const query = 'INSERT INTO Cat_Usuarios (Correo_Institucional_Usuario, Correo_Alternativo_Usuario, Contraseña_Usuario) VALUES (?, ?, ?)';

  db.query(query, [correoInstitucional, correoAlternativo, hashedPassword], (err, result) => {
    if (err) {
      if (err.code === 'ER_DUP_ENTRY') {
        return res.status(400).send('El correo institucional ya está registrado.');
      }
      return res.status(500).send('Error en el servidor.');
    }
    res.redirect('/menu.html');
  });
});

// Ruta para iniciar sesión
app.post('/login', (req, res) => {
    const { correoInstitucional, contrasena } = req.body;
  
    const query = 'SELECT * FROM Cat_Usuarios WHERE Correo_Institucional_Usuario = ?';
  
    db.query(query, [correoInstitucional], async (err, results) => {
      if (err) {
        return res.status(500).send('Error en el servidor.');
      }
  
      if (results.length === 0) {
        return res.status(400).send('Correo institucional no registrado.');
      }
  
      const user = results[0];
  
      const isPasswordValid = await bcrypt.compare(contrasena, user.Contraseña_Usuario);
  
      if (!isPasswordValid) {
        return res.status(400).send('Contraseña incorrecta.');
      }
  
      res.redirect('/menu.html');
    });
  });

//Recuperar contraseña
app.post('/recover_password', (req, res) => {
  const email = req.body.email;
  const query = 'SELECT Contraseña_Usuario FROM Cat_Usuarios WHERE Correo_Institucional_Usuario = ?';

  db.query(query, [email], (err, results) => {
      if (err) {
          console.error('Error en la consulta:', err);
          res.json({ success: false, message: 'Error en la base de datos.' });
          return;
      }

      if (results.length > 0) {
          const password = results[0].Contraseña_Usuario;
          const transporter = nodemailer.createTransport({
              service: 'gmail',
              auth: {
                  user: 'tu_correo@gmail.com',
                  pass: 'tu_contraseña'
              }
          });

          const mailOptions = {
              from: 'no-reply@tudominio.com',
              to: email,
              subject: 'Recuperación de contraseña',
              text: `Tu contraseña es: ${password}`
          };

          transporter.sendMail(mailOptions, (error, info) => {
              if (error) {
                  console.error('Error al enviar el correo:', error);
                  res.json({ success: false, message: 'Error al enviar el correo.' });
              } else {
                  console.log('Correo enviado: ' + info.response);
                  res.json({ success: true });
              }
          });
      } else {
          res.json({ success: false, message: 'Correo no encontrado.' });
      }
  });
});


app.listen(port, () => {
  console.log(`Servidor de http://localhost:${port}`);
});
