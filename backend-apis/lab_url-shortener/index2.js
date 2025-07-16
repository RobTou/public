require('dotenv').config();
const express = require('express');
const cors = require('cors');
const app = express();
const dns = require('dns');

// Basic Configuration
const port = process.env.PORT || 3000;

const urlDatabase = {};
let urlCounter = 1; // This will be used to generate short URLs

app.use(cors());
app.use(express.json());
app.use('/public', express.static(`${process.cwd()}/public`));
app.use(express.urlencoded({ extended: true }));


app.get('/', function(req, res) {
  res.sendFile(process.cwd() + '/views/index.html');
});

// Your first API endpoint
app.get('/api/hello', function(req, res) {
  res.json({ greeting: 'hello API' });
});

// URL shortener
app.post('/api/shorturl', (req, res) => {
  const { url } = req.body;

  // Validate the URL format
  let parsedUrl;
  try {
    parsedUrl = new URL(url);
  } catch(err) {
    return res.json({ error: 'invalid url'});
  }

  dns.lookup(parsedUrl.hostname, (err) => {
    if (err)
      return res.json({ error: 'invalid url'});
    
    // Check if the URL is already in the database
    for (const key in urlDatabase) {
      if ( urlDatabase[key] === url ) {
        return res.json({ original_url: url, short_url: key});
      } 
    }
    
    const shortUrl = urlCounter++;
    urlDatabase[shortUrl] = url;
    
    res.json({original_url: url, short_url: shortUrl });
  })
})

// Redirect endpoint
app.get('/api/shorturl/:short_url', (req, res) => {
  const shortUrl = req.params.short_url;
  const originalUrl = urlDatabase[shortUrl];

  if (originalUrl) {
    return res.redirect(originalUrl);
  } else {
    return res.status(404).json({ error: 'short URL not found'});
  }
})

app.listen(port, function() {
  console.log(`Listening on port ${port}`);
});