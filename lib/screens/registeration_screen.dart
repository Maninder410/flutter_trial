
import 'dart:developer';
import 'package:chat_app/extensions/build_context_extension.dart';
import 'package:chat_app/model/users.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class RegistrationScreen extends StatefulWidget {
   RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Registration",
          ),
          CustomTextField(
            controller: nameController,
            hintText: 'Name',
            isPassword: false,
            icon: Icons.person,
          ),
          CustomTextField(
            controller: emailController,
            hintText: 'Email',
            isPassword: false,
            icon: Icons.email,
          ),
          CustomTextField(
            controller: passwordController,
            hintText: 'Password',
            isPassword: true,
            icon: Icons.lock,
          ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ElevatedButton(onPressed: (){
                registerNewUser();
             }, child: Text("Register Now")),
           ),
          GestureDetector(
            onTap: (){
                  Navigator.pop(context);
            },
            child: Text("Already a  user,Login instead"),
          ),
         
        ],
      ),
    );
  }

  Future<void> registerNewUser() async {
    final email = emailController.text;
    final password = passwordController.text;
    if(email.isNotEmpty && password.isNotEmpty){

     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
      log(value.user!.uid);
      addDataToDatabase(uid: value.user!.uid);
    });
    }
    
  }

  Future<void> addDataToDatabase({required String uid}) async {
    final user = Users(
        nameController.text,
        emailController.text,
        uid,
        passwordController.text,
        true,
        'maninder'
    );
    FirebaseFirestore.instance.collection('users').add(user.toJson()).then((value){
      log('User created Successfully');
      context.navigateToScreen(ChatScreen(),isReplace: true);
      
    }).catchError((e){
      log('failed to create user $e');
    });

  }
}