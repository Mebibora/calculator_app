import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  String statement = "";  //variable to keep track of text to be displayed
  String statement2 = ""; //variable to specifically keep track of text displayed after operator
  String leftSide = "";
  String rightSide = "";
  String operator = "";   //variable to track which operator is being used
  int leftInt = 0;        //variable to track left side of integer before the operator
  int rightInt = 0;       //variable to track right side of integer before the operator
  bool operatorActive = false;  //variale to check if an operator has appeared in statement yet

  void addToStatement(x){ //function to update statement
    setState(() {
      statement = statement + x;
    });
  }

  void addToStatement2(x){  //function to update statement2
    setState(() {
      statement2 = statement2 + x;
    });
  }

  void deleteCharacter(){   //function to remove the last character from statement and statement2
    setState(() {
      statement = statement.substring(0, statement.length -1);
      if (statement2.isNotEmpty){
        statement2 = statement2.substring(0, statement2.length -1);
      }
    });
  }

  String getOperator(op){   //function to read operator and trigger operatorActive to be true
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
  
  int getLeftSide(){    //converts statement from string to integer
    leftSide = statement;
    leftInt = int.parse(leftSide);
    return leftInt;
  }

  int getRightSide(){   //converts statement2 from string to integer
    rightSide = statement2;
    rightInt = int.parse(rightSide);
    return rightInt;
  }

  void evaluate(){      //evaluates statement using leftInt, operator, and rightInt
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

      operatorActive = false;  //resets all the variables besides statement
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
      operatorActive = false;   //resets all the variables including statement
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
    
    return Scaffold(
      appBar: AppBar(        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,       
        title: Text(widget.title),
      ),
      body: Center(       //begins calculator display
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(    //container for statement to be displayed
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
