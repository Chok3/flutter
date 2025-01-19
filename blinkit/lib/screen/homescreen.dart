import 'package:blinkit/shared/widgets/stack.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration( hintText: "Search For Sugar", 
                  fillColor: Color.fromARGB(255, 235, 235, 255),
                  filled: true,
                   prefixIcon: Icon(Icons.search,color: Colors.black,),
                   suffixIcon: Icon(Icons.mic,color: Colors.black,),
                   border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                   )),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.4,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [HomeStack(),HomeStack(),HomeStack()],
              
              ),
            )
          ],
        ),
      ),
    );
  }
}