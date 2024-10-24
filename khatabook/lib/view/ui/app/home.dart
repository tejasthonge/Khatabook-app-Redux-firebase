




import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( 
        backgroundColor: Colors.blue.shade800,
        leading: const Icon(Icons.book,color: Colors.white,),
        title: Row(
          children: [
            Text("Amar",
              style:const TextStyle(color: Colors.white,fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 10,),
            Icon(Icons.arrow_drop_down_circle_outlined,color: Colors.white,)
          ],
        ),
  ),

    
    floatingActionButton: GestureDetector(onTap: (){},child: Container(
      width:200,
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      decoration: BoxDecoration( 
        color: Colors.pinkAccent.shade400,
        borderRadius: BorderRadius.circular(30)
      ),
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [ 
          Icon(Icons.person_add,color: Colors.white),
          // const SizedBox(width: ,),
          Text("ADD COUSTOMER",
          style: TextStyle(color: Colors.white),)
        ],
      ),
    ),),
    );
  }
}