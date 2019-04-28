import 'package:chak/pages/new_dog_page.dart';
import 'package:flutter/material.dart';
import 'dog_model.dart';
import 'dog_card.dart';
import 'dog_list.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cute Dogs Home',
        theme: ThemeData(brightness: Brightness.dark),
        home: MyHomePage(title: 'Cute Dogs Home'));
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.black87,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _showNewDogForm,
            )
          ],
        ),
        body: Container(
          child: Center(
            child: DogList(initialDoggos),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[500],
              ]
            )
          ),
        ));
  }
  Future _showNewDogForm() async {
    Dog newDog = await Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) {
        return AddDogFormPage();
      })
    );

    if(newDog != null) {
      initialDoggos.add(newDog);
    }
  }
}
