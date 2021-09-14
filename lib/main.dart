import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(MyApp());
  
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Startup Name Generator',
      home: RandomWord(),
    );
    //final wordPair = WordPair.random();

    //return MaterialApp(
      /*title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Welcome to listapp'),
          ),
          body: Center(
            child: RandomWord(),
          ),
        ),    
    );*/
  }
}
class RandomWord extends StatefulWidget {
  const RandomWord({ Key? key }) : super(key: key);

  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 30.0, color: Colors.teal);
   
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if(i.isOdd) return const Divider();

        final index = i ~/2;
        if (index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      }
    );
  }
  Widget _buildRow(WordPair pair){
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
}