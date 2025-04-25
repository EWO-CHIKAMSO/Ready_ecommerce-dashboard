import 'package:flutter/material.dart';

class TermsandConditionsScreen extends StatefulWidget{
  const TermsandConditionsScreen({super.key});

  @override
  State<TermsandConditionsScreen> createState()=>_TermsandConditionsStateScreen();
}

class _TermsandConditionsStateScreen extends State<TermsandConditionsScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Terms and Conditions"),
        toolbarHeight: 120,
        elevation: 8,
      ),
    );
  }
}