import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatefulWidget{
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState()=>_PrivacyPolicyStateScreen();
}

class _PrivacyPolicyStateScreen extends State<PrivacyPolicyScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        elevation: 8,
        toolbarHeight: 120,
      ),
    );
  }
}