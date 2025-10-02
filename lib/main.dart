import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String statement = "";
  String statement2 = "";
  String leftSide = "";
  String rightSide = "";
  String operator = "";
  int leftInt = 0;
  int rightInt = 0;
  bool operatorActive = false;

  void addToStatement(x){
    setState(() {
      statement = statement + x;
    });
  }

  void addToStatement2(x){
    setState(() {
      statement2 = statement2 + x;
    });
  }
  void deleteCharacter(){
    setState(() {
      statement = statement.substring(0, statement.length -1);
      statement2 = statement2.substring(0, statement2.length -1);
    });
  }

  String getOperator(op){
    switch(op){
        case "/":
        operator = "/";
        operatorActive = true;
        return "/";
        case "*":
        operator = "*";
        operatorActive = true;
        return "*";
        case "-":
        operator = "-";       
        operatorActive = true;
        return "-";
        case "+":
        operator = "+";
        operatorActive = true;
        return"+";
      }
    return "error";
  }
  
  int getLeftSide(){
    leftSide = statement;
    leftInt = int.parse(leftSide);
    return leftInt;
  }

  int getRightSide(){
    rightSide = statement2;
    rightInt = int.parse(rightSide);
    return rightInt;
  }

  void evaluate(){
    setState(() {
      int result = 0;

      switch(operator){
        case "/":
        result = leftInt ~/ rightInt;
        case "*":
        result = leftInt * rightInt;
        case "-":
        result = leftInt - rightInt;
        case "+":
        result = leftInt + rightInt;
      }

      
      statement = result.toString();

      operatorActive = false;  
      statement2 = "";
      leftSide = "";
      rightSide = "";
      operator = "";
      leftInt = 0;
      rightInt = 0;
  

    });
  }

  void clear() {
    setState((){
      operatorActive = false; 
      statement = ""; 
      statement2 = "";
      leftSide = "";
      rightSide = "";
      operator = "";
      leftInt = 0;
      rightInt = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2),
              ),
              child: Text(
                statement,
                style: TextStyle(
                  fontSize:30,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    addToStatement("7");
                    if (operatorActive){
                      addToStatement2("7");
                    }
                  }, 
                child: Text("7")),
                ElevatedButton(
                  onPressed: () {
                    addToStatement("8");
                    if (operatorActive){
                      addToStatement2("8");
                    }
                  }, 
                child: Text("8")),
                ElevatedButton(
                  onPressed: () {
                    addToStatement("9");
                    if (operatorActive){
                      addToStatement2("9");
                    }
                  }, 
                child: Text("9")),
                ElevatedButton(
                  onPressed: () {
                    getLeftSide();
                    addToStatement("/");
                    getOperator("/");
                  }, 
                child: Text("/")),

              ],
            ),
           Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    addToStatement("4");
                    if (operatorActive){
                      addToStatement2("4");
                    }
                  }, 
                child: Text("4")),
                ElevatedButton(
                  onPressed: () {
                    addToStatement("5");
                    if (operatorActive){
                      addToStatement2("5");
                    }
                  }, 
                child: Text("5")),
                ElevatedButton(
                  onPressed: () {
                    addToStatement("6");
                    if (operatorActive){
                      addToStatement2("6");
                    }
                  }, 
                child: Text("6")),
                ElevatedButton(
                  onPressed: () {
                    getLeftSide();
                    addToStatement("*");
                    getOperator("*");
                  }, 
                child: Text("*")),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    addToStatement("1");
                    if (operatorActive){
                      addToStatement2("1");
                    }
                  }, 
                child: Text("1")),
                ElevatedButton(
                  onPressed: () {
                    addToStatement("2");
                    if (operatorActive){
                      addToStatement2("2");
                    }
                  }, 
                child: Text("2")),
                ElevatedButton(
                  onPressed: () {
                    addToStatement("3");
                    if (operatorActive){
                      addToStatement2("3");
                    }
                  }, 
                child: Text("3")),
                ElevatedButton(
                  onPressed: () {
                    getLeftSide();
                    addToStatement("-");
                    getOperator("-");
                  }, 
                child: Text("-")),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    addToStatement("0");
                    if (operatorActive){
                      addToStatement2("0");
                    }
                  }, 
                child: Text("0")),
                ElevatedButton(
                  onPressed: () {
                    deleteCharacter();
                  }, 
                child: Text("<-")),
                ElevatedButton(
                  onPressed: () {
                    getRightSide();
                    evaluate();
                  }, 
                child: Text("enter")),
                ElevatedButton(
                  onPressed: () {
                    getLeftSide();
                    addToStatement("+");
                    getOperator("+");
                  }, 
                child: Text("+")),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    clear();
                  }, 
                child: Text("c")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
