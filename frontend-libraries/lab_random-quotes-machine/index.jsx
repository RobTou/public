// import ReactDOM from "react-dom";
// import App from "./App";
// ReactDOM.render(<App />,  document.getElementById("root"));

// import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
// import { config } from '@fortawesome/fontawesome-svg-core'
// import '@fortawesome/fontawesome-svg-core/styles.css'
// config.autoAddCss = false

const { useState } = React;

const QUOTES = [
  { quote: "Be yourself; everyone else is already taken.", author: "Oscar Wilde" },
  { quote: "So many books, so little time.", author: "Frank Zappa" },
  { quote: "A room without books is like a body without a soul.", author: "Marcus Tullius Cicero" },
  { quote: "You only live once, but if you do it right, once is enough.", author: "Mae West" },
  { quote: "Be the change that you wish to see in the world.", author: "Mahatma Gandhi" },
  { quote: "If you tell the truth, you don't have to remember anything.", author: "Mark Twain" },
  { quote: "In three words I can sum up everything I've learned about life: it goes on.", author: "Robert Frost" },
  { quote: "To live is the rarest thing in the world. Most people exist, that is all.", author: "Oscar Wilde" },
  { quote: "Without music, life would be a mistake.", author: "Friedrich Nietzsche" },
  { quote: "We accept the love we think we deserve.", author: "Stephen Chbosky" },
  { quote: "Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring.", author: "Marilyn Monroe" },
  { quote: "There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.", author: "Albert Einstein" },
  { quote: "Good friends, good books, and a sleepy conscience: this is the ideal life.", author: "Mark Twain" },
  { quote: "Life is what happens to us while we are making other plans.", author: "Allen Saunders" },
  { quote: "It is better to be hated for what you are than to be loved for what you are not.", author: "André Gide" },
  { quote: "Everything you can imagine is real.", author: "Pablo Picasso" },
  { quote: "Logic will get you from A to Z; imagination will get you everywhere.", author: "Albert Einstein" },
  { quote: "Sometimes the questions are complicated and the answers are simple.", author: "Dr. Seuss" },
  { quote: "The only way out of the labyrinth of suffering is to forgive.", author: "John Green" },
  { quote: "We are all in the gutter, but some of us are looking at the stars.", author: "Oscar Wilde" },
  { quote: "The purpose of our lives is to be happy.", author: "Dalai Lama" },
  { quote: "Get busy living or get busy dying.", author: "Stephen King" },
  { quote: "You have within you right now, everything you need to deal with whatever the world can throw at you.", author: "Brian Tracy" },
  { quote: "Believe you can and you're halfway there.", author: "Theodore Roosevelt" },
  { quote: "The only impossible journey is the one you never begin.", author: "Tony Robbins" },
  { quote: "Act as if what you do makes a difference. It does.", author: "William James" },
  { quote: "Success is not how high you have climbed, but how you make a positive difference to the world.", author: "Roy T. Bennett" },
  { quote: "Happiness is not something ready made. It comes from your own actions.", author: "Dalai Lama" },
  { quote: "Turn your wounds into wisdom.", author: "Oprah Winfrey" },
  { quote: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney" },
  { quote: "Don't let yesterday take up too much of today.", author: "Will Rogers" },
  { quote: "It's not whether you get knocked down, it's whether you get up.", author: "Vince Lombardi" },
  { quote: "If you are working on something exciting, it will keep you motivated.", author: "Steve Jobs" },
  { quote: "Success is not in what you have, but who you are.", author: "Bo Bennett" },
  { quote: "The harder you work for something, the greater you'll feel when you achieve it.", author: "Unknown" },
  { quote: "Dream bigger. Do bigger.", author: "Unknown" },
  { quote: "Don't watch the clock; do what it does. Keep going.", author: "Sam Levenson" },
  { quote: "Great things never come from comfort zones.", author: "Unknown" },
  { quote: "Push yourself, because no one else is going to do it for you.", author: "Unknown" },
  { quote: "Sometimes later becomes never. Do it now.", author: "Unknown" },
  { quote: "Little things make big days.", author: "Unknown" },
  { quote: "It's going to be hard, but hard does not mean impossible.", author: "Unknown" },
  { quote: "Don't wait for opportunity. Create it.", author: "Unknown" },
  { quote: "Success doesn't just find you. You have to go out and get it.", author: "Unknown" },
  { quote: "The key to success is to focus on goals, not obstacles.", author: "Unknown" },
  { quote: "Dream it. Wish it. Do it.", author: "Unknown" },
  { quote: "Sometimes we're tested not to show our weaknesses, but to discover our strengths.", author: "Unknown" },
  { quote: "The only limit to our realization of tomorrow will be our doubts of today.", author: "Franklin D. Roosevelt" },
  { quote: "Creativity is intelligence having fun.", author: "Albert Einstein" },
  { quote: "Do what you can with all you have, wherever you are.", author: "Theodore Roosevelt" },
  { quote: "What you get by achieving your goals is not as important as what you become by achieving your goals.", author: "Zig Ziglar" },
  { quote: "To see what is right and not do it is a lack of courage.", author: "Confucius" },
  { quote: "Reading is to the mind, as exercise is to the body.", author: "Brian Tracy" },
  { quote: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt" },
  { quote: "The best way to predict the future is to create it.", author: "Peter Drucker" },
  { quote: "You are never too old to set another goal or to dream a new dream.", author: "C.S. Lewis" },
  { quote: "Try to be a rainbow in someone's cloud.", author: "Maya Angelou" },
  { quote: "You do not find the happy life. You make it.", author: "Camilla Eyring Kimball" },
  { quote: "The most wasted of all days is one without laughter.", author: "Nicolas Chamfort" },
  { quote: "You must do the things you think you cannot do.", author: "Eleanor Roosevelt" },
  { quote: "It always seems impossible until it's done.", author: "Nelson Mandela" },
  { quote: "Keep your face always toward the sunshine—and shadows will fall behind you.", author: "Walt Whitman" },
  { quote: "What lies behind us and what lies before us are tiny matters compared to what lies within us.", author: "Ralph Waldo Emerson" },
  { quote: "The only way to do great work is to love what you do.", author: "Steve Jobs" },
  { quote: "Difficult roads often lead to beautiful destinations.", author: "Unknown" },
  { quote: "Believe in yourself and all that you are.", author: "Christian D. Larson" },
  { quote: "Start where you are. Use what you have. Do what you can.", author: "Arthur Ashe" },
  { quote: "You are braver than you believe, stronger than you seem, and smarter than you think.", author: "A.A. Milne" },
  { quote: "Happiness is not by chance, but by choice.", author: "Jim Rohn" },
  { quote: "Life is short, and it's up to you to make it sweet.", author: "Sarah Louise Delany" },
  { quote: "The best revenge is massive success.", author: "Frank Sinatra" },
  { quote: "The mind is everything. What you think you become.", author: "Buddha" },
  { quote: "An unexamined life is not worth living.", author: "Socrates" },
  { quote: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs" },
  { quote: "The journey of a thousand miles begins with one step.", author: "Lao Tzu" },
  { quote: "That which does not kill us makes us stronger.", author: "Friedrich Nietzsche" },
  { quote: "Life is what happens when you're busy making other plans.", author: "John Lennon" },
  { quote: "When the going gets tough, the tough get going.", author: "Joe Kennedy" },
  { quote: "You must be the change you wish to see in the world.", author: "Mahatma Gandhi" },
  { quote: "You only live once, but if you do it right, once is enough.", author: "Mae West" },
  { quote: "Tough times never last but tough people do.", author: "Robert H. Schuller" },
  { quote: "Get busy living or get busy dying.", author: "Stephen King" },
  { quote: "Whether you think you can or you think you can't, you're right.", author: "Henry Ford" },
  { quote: "The best way to get started is to quit talking and begin doing.", author: "Walt Disney" },
  { quote: "Don't let yesterday take up too much of today.", author: "Will Rogers" },
  { quote: "It's not whether you get knocked down, it's whether you get up.", author: "Vince Lombardi" },
  { quote: "If you are working on something exciting, it will keep you motivated.", author: "Steve Jobs" },
  { quote: "Success is not in what you have, but who you are.", author: "Bo Bennett" },
  { quote: "The harder you work for something, the greater you'll feel when you achieve it.", author: "Unknown" },
  { quote: "Dream bigger. Do bigger.", author: "Unknown" },
  { quote: "Don't watch the clock; do what it does. Keep going.", author: "Sam Levenson" },
  { quote: "Great things never come from comfort zones.", author: "Unknown" },
  { quote: "Push yourself, because no one else is going to do it for you.", author: "Unknown" },
  { quote: "Sometimes later becomes never. Do it now.", author: "Unknown" },
  { quote: "Little things make big days.", author: "Unknown" },
  { quote: "It's going to be hard, but hard does not mean impossible.", author: "Unknown" },
  { quote: "Don't wait for opportunity. Create it.", author: "Unknown" },
  { quote: "Success doesn't just find you. You have to go out and get it.", author: "Unknown" },
  { quote: "The key to success is to focus on goals, not obstacles.", author: "Unknown" },
  { quote: "Dream it. Wish it. Do it.", author: "Unknown" },
  { quote: "Sometimes we're tested not to show our weaknesses, but to discover our strengths.", author: "Unknown" }
];

const COLORS = [
  "#16a085", "#27ae60", "#2c3e50", "#f39c12", "#e74c3c", "#9b59b6", "#FB6964", "#342224",
  "#472E32", "#BDBB99", "#77B1A9", "#73A857", "#ffadad", "#ffd6a5", "#fdffb6", "#caffbf",
  "#9bf6ff", "#a0c4ff", "#bdb2ff", "#ffc6ff", "#fffffc", "#b5ead7", "#ffdac1", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb",
  "#b5ead7", "#c7ceea", "#ffb7b2", "#ff9aa2", "#f6abb6", "#b5ead7", "#d4a5a5", "#e2f0cb"
];

function getRandomIndex(arr) {
  return Math.floor(Math.random() * arr.length);
}

export const QuoteSelector = () => {

  const [index, setIndex] = useState(getRandomIndex(QUOTES));
  const [color, setColor] = useState(COLORS[getRandomIndex(COLORS)]);

  const handleToggleQuote = () => {
    let newIndex;
    do {
      newIndex = getRandomIndex(QUOTES)
    } while (newIndex === index);
    setIndex(newIndex);
    setColor(COLORS[getRandomIndex(COLORS)]);
  }

  const { quote, author } = QUOTES[index];

  return (
    <div
      id="quote-box"
      style={{ backgroundColor: color}}
    >
      <div id="quote-frame">
        <p id="text">``{quote}´´</p>
        <p id="author">- {author}</p>
        <div id="button-row">
          <a
            id="tweet-quote"
            href={`https://twitter.com/intent/tweet?text=${encodeURIComponent('"' + quote + '" - ' + author)}`}
            target="_blank"
            rel="noopener noreferrer"
            style={{ backgroundColor: color, display: "inline-block" }}
          >
            <i class="fa-brands fa-twitter"></i>
          </a>
          <button
            onClick={handleToggleQuote}
            id="new-quote"
            style={{ backgroundColor: color}}
          >New Quote</button>
        </div>
      </div>
    </div>
  );

};
