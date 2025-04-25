import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderHistoryScreen extends StatefulWidget{
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState()=> _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen>{

  

  @override
  Widget build(BuildContext conext){
    return 
    DefaultTabController(
      length:3,
      child: Scaffold(
      appBar:AppBar(
        title:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text("Order History", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
              Text("Today-7 April 2025", style: TextStyle(fontSize: 12,), textAlign: TextAlign.center,),
            ]
          ),
        ), 
        toolbarHeight: 100,
        elevation: 10,
        actions:[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(FontAwesomeIcons.magnifyingGlass),
                SizedBox(width:20,),
                FaIcon(FontAwesomeIcons.calendar)
              ]
            ),
          )
        ]
      ),
    
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [  
            TabBar(
              unselectedLabelColor: Colors.blueAccent,
            tabs: [
              Tab( text: "All (0)"),
              Tab(text: "Pending (0)"),
              Tab(text: "Delivered (0)"),
            ],
          ),
    
    
           Expanded(
            child:TabBarView(
              physics:BouncingScrollPhysics(),
          children: [
            Center(child: Text("All")),
            Center(child: Text("Pending Tab")),
            Center(child: Text("Delivered Tab")),
          ],
        ), )       
          ],
        ),
      )
      )
    );
  }
}