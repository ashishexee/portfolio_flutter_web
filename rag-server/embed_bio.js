const fs = require('fs');
const path = require('path');

function loadContext() {
  const dataDir = path.join(__dirname, '..', 'rag-server/data');
  const files = fs.readdirSync(dataDir);
  let context = '';

  for (const file of files) {
    const content = fs.readFileSync(path.join(dataDir, file), 'utf8');
    context += content + '\n\n';
  }

  return context;
}

module.exports = loadContext;
