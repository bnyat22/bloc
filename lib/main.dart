import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:question2/question.dart';
import 'package:question2/questionState.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => QuestionState(index: 0), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Question question = Question(
    questionText: "La capitale de la france est Paris?",
    isCorrect: true,
  );

  Question question1 = Question(
    questionText: "Macron est le president?",
    isCorrect: true,
  );
  Question question2 = Question(
    questionText: "Pogba porte le numéro 7?",
    isCorrect: false,
  );

  @override
  Widget build(BuildContext context) {
    List<Question> list = [question, question1, question2];
    bool isTrue = true;

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("Questions/Réponses"),
          centerTitle: true,
        ),
        body: BlocBuilder<QuestionState, int>(
          builder: (context, index) => Center(
            child: Container(
              alignment: Alignment.topCenter,
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                // horizontal).

                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset("assets/vvvv.jpg"),
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    child: Text(
                      list[context.read<QuestionState>().index].questionText,
                      style: TextStyle(color: Colors.white),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            bool b = list[context.read<QuestionState>().index]
                                .isCorrect;
                            if (b) {
                              isTrue = true;
                            } else {
                              isTrue = false;
                            }
                            context.read<QuestionState>().checkReponse();
                          },
                          child: Text("vrai")),
                      ElevatedButton(
                          onPressed: () {
                            bool b = list[context.read<QuestionState>().index]
                                .isCorrect;
                            if (!b) {
                              isTrue = true;
                            } else {
                              isTrue = false;
                            }
                            context.read<QuestionState>().checkReponse();
                          },
                          child: Text("faux")),
                      SizedBox(width: 20),
                      ElevatedButton(
                          onPressed: () {
                            context.read<QuestionState>().next(list.length);
                          },
                          child: Text("Suivant",
                              style: TextStyle(color: Colors.white))),
                    ],
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                      context.read<QuestionState>().rep == 0
                          ? list[context.read<QuestionState>().index].reposne
                          : isTrue
                              ? list[context.read<QuestionState>().index]
                                  .reponseCorrect
                              : list[context.read<QuestionState>().index]
                                  .reponseFaux,
                      style: TextStyle(color: Colors.white))
                ],
              ),
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
