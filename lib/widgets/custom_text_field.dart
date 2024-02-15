import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key, required this.hintText, required this.isPassword, required this.icon, this.validator, required this.controller,
  });
  final String hintText;
  final bool isPassword;
  final IconData icon;
  final String? Function(String?)? validator;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showHidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword && showHidePassword,
        validator: widget.validator,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword ? IconButton(icon:showHidePassword? Icon(Icons.visibility): Icon(Icons.visibility_off), onPressed: (){
            setState(() {
            showHidePassword = !showHidePassword;
            });
          },):SizedBox(),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.blue,
          ),
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue,width: 2)
            ),
             errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.red,width: 2)
            )
            ),
      ),
    );
  }
}