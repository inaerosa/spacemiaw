import 'package:flutter/material.dart';

import '../dbHelper/mongoModel.dart';
import '../dbHelper/mongodb.dart';
import 'my_homepage.dart';

class Ranking extends StatefulWidget {
  static const nomeRota = "/Ranking";

  _RankingState createState() => _RankingState();
}

class _RankingState extends State<Ranking> {
  int position = 0;

  void ranking() {
    setState(() {
      position++;
    });
  }

  @override
  void initState() {
    ranking();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/fundo.gif'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Placar',
              style: TextStyle(
                fontSize: 50,
                fontFamily: 'Silkscreen',
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Color.fromARGB(255, 255, 7, 181),
                    offset: Offset(5.0, 5.0),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: FutureBuilder(
                future: MongoDatabase.list(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text('loading...',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Silkscreen',
                        ));
                  } else {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return displayRanking(
                                MongoModel.fromJson(snapshot.data[index]),
                                index + 1);
                          });
                    } else {
                      return Text('There isnt data available');
                    }
                  }
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 7, 181)),
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage())),
              child: const Icon(Icons.keyboard_arrow_left_rounded),
            )
          ],
        ),
      ),
    );
  }

  Widget displayRanking(MongoModel data, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("# $index",
                style: const TextStyle(
                    fontFamily: 'Silkscreen',
                    color: Colors.white,
                    fontSize: 18)),
            Text("${data.name}",
                style: const TextStyle(
                    fontFamily: 'Silkscreen',
                    color: Colors.white,
                    fontSize: 18)),
            Text(
              "${data.points}",
              style: const TextStyle(
                  fontFamily: 'Silkscreen', color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }
}
