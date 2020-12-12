import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];

  final _saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List'),
        centerTitle: true,
        actions: [_listButton()],
      ),
      body: _buildSuggestions(),
    );
  }

  IconButton _listButton() {
    return IconButton(
        icon: Icon(Icons.list),
        onPressed: () {
          _navigationToFavorite();
        });
  }

  _navigationToFavorite() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      final tiles = _saved.map((favorite) {
        return ListTile(
          title: Text(favorite.asPascalCase),
        );
      });

      final divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(
          title: Text('Favoritos'),
        ),
        body: ListView(
          children: divided,
        ),
      );
    }));
  }

  ListView _buildSuggestions() {
    return ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return Divider();
      final index = i ~/ 2;
      if (index >= _suggestions.length) {
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final bool isFavorite = _saved.contains(pair);

    return ListTile(
      title: Text(pair.asPascalCase),
      trailing: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.redAccent : Colors.blueGrey,
        size: 30,
      ),
      onTap: () {
        setState(() {
          isFavorite ? _saved.remove(pair) : _saved.add(pair);
        });
      },
    );
  }
}
