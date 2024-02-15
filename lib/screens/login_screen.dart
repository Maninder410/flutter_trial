import 'package:chat_app/extensions/build_context_extension.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/screens/registeration_screen.dart';
import 'package:chat_app/styles/constant_styles.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("login page",
          style:titleTextStyle ,),
          CustomTextField( controller: emailController,  hintText: "Email", isPassword: false,icon: Icons.email,),
          CustomTextField(controller: passwordController,    hintText: "password", isPassword: true,icon: Icons.password,),
          ElevatedButton(onPressed: (){
              loginUser();
          }, child: Text("Login")),
            GestureDetector(
              onTap: (){
                  context.navigateToScreen(RegistrationScreen());
              },child: Text("New user? Register now !"),
            )

        ],
      ),
    );
  }

  Future<void> loginUser () async {
   await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
    context.navigateToScreen(ChatScreen(),isReplace: true);

    });
  }
}

