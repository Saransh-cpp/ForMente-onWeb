const express = require('express');
const cors = require('cors');
const pickle = require('pickle');
const { CountVectorizer } = require('scikit-learn');
const { pythonShell } = require('python-shell');
var bodyParser = require('body-parser')
 
var app = express()
 
// create application/json parser
var jsonParser = bodyParser.json()


// Annoying CORS
app.use(cors());

const labels = {
  0: 'anger',
  1: 'fear',
  2: 'happiness',
  3: 'love',
  4: 'sadness',
};

class DiaryText {
  constructor(text) {
    this.text = text;
  }
}

app.get('/', (req, res) => {
  res.json({ message: 'Please refer to the README for more information.' });
});

app.post('/predict', jsonParser, (req, res) => {
    console.log(req.body);
  const text = new DiaryText(req.body.text);
  const vector = pickle.loads('nlp_backend/vector.pickle');
  const model = pickle.loads('nlp_backend/model.pickle');
  const textVector = vector.transform([text]);
  model.predict(textVector).then((yPred) => {
    res.json({ category: labels[yPred[0]] });
  });
});

app.listen(8000, () => {
  console.log('Server started on http://localhost:8000');
});
