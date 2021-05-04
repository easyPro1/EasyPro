import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: RootPage(),
    );
  }
}

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EasyPro',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: CenterPage(),
    );
  }
}

class CenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        upPage(),
        photoGrid(),
      ],
    );
  }

  Widget upPage() => SliverToBoxAdapter(
        child: Expanded(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Cerca qui',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
          ),
        ),
      );

  Widget photoGrid() => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //numero di colonne
          childAspectRatio: 1, //aspetto della griglia
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildListDelegate(
          List.generate(
            24,
            (index) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('data:image/jpeg;base64,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'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
}
