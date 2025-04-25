import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget{
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState()=>_ChangePasswordStateScreen();
}

class _ChangePasswordStateScreen extends State<ChangePasswordScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
        toolbarHeight: 120,
        elevation: 8,
      ),
    );
  }
}