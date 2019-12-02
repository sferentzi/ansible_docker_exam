const http = require('http');
const port = process.env.PORT || 8080;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.end('Exam Ansible');
});

server.listen(port, () => {
  console.log(`Server starts up on http://localhost:${port}/`);
});