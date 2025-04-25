import 'package:flutter/material.dart';

class RiderSupportScreen extends StatefulWidget{
  const RiderSupportScreen({super.key});

  @override
  State<RiderSupportScreen> createState()=>_RiderSupportScreenState();
}

class _RiderSupportScreenState extends State<RiderSupportScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Rider Support Screen"),
        toolbarHeight: 120,
        elevation: 8,
      ),
    );
  }
}