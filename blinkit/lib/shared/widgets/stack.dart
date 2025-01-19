import 'package:flutter/material.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({super.key});

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            //color: Colors.amber,
            child: Image.asset("assets/parachute.jpg",fit: BoxFit.cover,),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration:BoxDecoration( color: Colors.amber,borderRadius: BorderRadius.circular(15)),
          ),
        ),
        Positioned(top: 25,
        left: 30,
          child: Text("Hairs oils for\nlong&thick hair",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
        Positioned(top: 100,
        left: 30,
          child: Text("explore the parachute\nAdvansed range",style: TextStyle(fontSize: 15),)),
 
 Positioned(
  left: MediaQuery.of(context).size.width*0.052,
  bottom: MediaQuery.of(context).size.height*0.025,
   child: Padding(
     padding: const EdgeInsets.all(8.0),
     child: TextButton(onPressed:(){}, child: Text("shop now"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black),foregroundColor: MaterialStateProperty.all(Colors.amber[100])),),
   ),
 )
      ],
    );
  }
}