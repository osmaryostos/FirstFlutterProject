import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Booking',
      theme:  ThemeData(primarySwatch: Colors.red),
      home: new ExamBooking(),
    );
  }
}

class ExamBooking extends StatefulWidget {
  const ExamBooking({Key? key}) : super(key: key);

  @override
  State<ExamBooking> createState() => _ExamBookingState();
}

class _ExamBookingState extends State<ExamBooking> {
  int _adult = 0;
  int _children = 0;

  void addAdult() {
    setState(() {
      _adult++;
    });
  }
  void minusAdult() {
    setState(() {
      if(_adult <= 0) return;
      _adult--;
    });
  }
  void addChild() {
    setState(() {
      _children++;
    });
  }
  void minusChild() {
    setState(() {
      if(_children <= 0) return;
      _children--;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('$_adult Adult(s)', style: TextStyle(fontSize: 50),),
              FloatingActionButton(
                  onPressed: addAdult,
                child:  Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                backgroundColor: Colors.blue,
              ),
              FloatingActionButton(
                  onPressed: minusAdult,
                  child:  Icon(
                    Icons.remove,
                    color: Colors.teal,
                  ) ,),
              Text('$_children Children', style: TextStyle(fontSize: 50),),
              FloatingActionButton(
                onPressed: addChild,
                child:  Icon(
                  Icons.add,
                  color: Colors.blue,
                ),
                backgroundColor: Colors.blue,
              ),
              FloatingActionButton(
                onPressed: minusChild,
                child:  Icon(
                  Icons.remove,
                  color: Colors.teal,
                ) ,),
              ElevatedButton(
                onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Booking is done =)", style: TextStyle(fontSize: 24),),
                        action: SnackBarAction(
                          onPressed: (){
                            //if action button is pressed
                          },
                          label: "I did it!!!",
                        ),
                      )
                  );
                },
                child: Text("Book now", style: TextStyle(fontSize: 50),),
              ),
            ],
          ),
        )

      ),

    );
  }
}


