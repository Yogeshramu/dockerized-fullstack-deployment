const express = require('express');
const app = express();
const port = process.env.APP_PORT || 3000;

app.get('/', (req, res) => {
  res.send('<h1>Welcome to the Dockerized Full-Stack Deployment!</h1>');
});

app.get('/api/health', (req, res) => {
  res.status(200).json({ status: 'success', message: 'Service is completely healthy.' });
});

app.get('/api/contact', (req, res) => {
  res.json({ email: 'hello@example.com', twitter: '@example' });
});

app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
