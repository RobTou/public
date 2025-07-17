const express = require('express')
const app = express()
const cors = require('cors')
require('dotenv').config()

app.use(cors())
app.use(express.static('public'))
app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html')
});

// Middleware to parse incoming request bodies
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

let users = [];
let exercises = [];
let userIdCounter = 1;

// POST route to create a new user.
app.post('/api/users', (req, res) => {
  const username = req.body.username;
  const newUser = {
    username,
    _id: String(userIdCounter++)
  };
  users.push(newUser);
  res.json(newUser);
});

// Retrieve all users
app.get('/api/users', (req, res) => {
  res.json(users);
});

// Route to log an exercise for a user
app.post('/api/users/:_id/exercises', (req, res) => {
  const userId = req.params._id;
  const { description, duration, date } = req.body;
  const user = users.find(user => user._id === userId);

  if (!user) {
    return res.status(404).send('User not found');
  }

  const exerciseDate = date ? new Date(date): new Date();
  const newExercise = {
    description,
    duration: Number(duration),
    date: exerciseDate.toDateString()
  };

  exercises.push({userId, ...newExercise});
  res.json({
    username: user.username,
    _id: user._id,
    description: newExercise.description,
    duration: newExercise.duration,
    date: newExercise.date
  });
});

// Route to retrieve a user's exercise log
app.get('/api/users/:_id/logs', (req, res) => {
  const userId = req.params._id;
  const userExercises = exercises.filter(ex => ex.userId === userId);
  const user = users.find((user) => user._id === userId);

  if (!user) {
    return res.status(404).send('User not found');
  }

  let log = userExercises.map(ex => ({
    description: ex.description,
    duration: ex.duration,
    date: ex.date
  }));

  // Handle query parameters for filtering logs
  const { from, to, limit } = req.query;

  // Filter by date range
  if (from) {
    const fromDate = new Date(from);
    if (!isNaN(fromDate.getTime())) { // Check if the date is valid
      log = log.filter(ex => new Date(ex.date) >= fromDate);
    }
  }
  if (to) {
    const toDate = new Date(to);
    if (!isNaN(toDate.getTime())) { // Check if the date is valid
      log = log.filter(ex => new Date(ex.date) <= toDate);
    }
  }

  // Limit the number of logs
  if (limit) {
    const limitNumber = parseInt(limit);
    if (!isNaN(limitNumber) && limitNumber > 0) { // Ensure limit is a positive integer
      log = log.slice(0, limitNumber);
    }
  }

  res.json({
    username: user.username,
    count: log.length,
    _id: userId,
    log
  });
});

const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port)
})
