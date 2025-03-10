import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import '../components/custom_button.dart';
import '../components/custom_text_form_field.dart';
import '../components/navigate.dart';
import '../constants/color.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget{
   RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController=TextEditingController();

  var passwordController=TextEditingController();

   final FocusNode _emailFocusNode = FocusNode();

   final FocusNode _passwordFocusNode = FocusNode();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: rbackgroundcolor,
      appBar: AppBar(
        backgroundColor: rbackgroundcolor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset('assets/images/bank_12202822.png' ,
                        height: 100,
                        color: rmaincolor,

                      ),
                    ),
                    SizedBox(height: 40,),
                    Text(
                      'REGESTER',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: rmaincolor,
                        fontSize: 50,// Change to your desired color
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomTextFormField(
                      controller: emailController,
                      focusNode: _emailFocusNode,
                      onFieldSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      hintText: 'Enter UserName',
                      labelText: 'User Name',
                      prefixIcon: Icons.supervised_user_circle,
                      prefixIconColor: rmaincolor,
                    ),
                    SizedBox(height: 20),
                    CustomTextFormField(
                      controller: passwordController,
                      focusNode: _passwordFocusNode,
                      onFieldSubmitted: (data) {
                        if (formKey.currentState!.validate()) {}
                      },
                      hintText: 'Enter your Password',
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      prefixIconColor: rmaincolor,
                      suffixIcon: Icons.visibility_outlined,
                      suffixIconToggle: Icons.visibility_off_outlined,
                      isPassword: true,
                    ),
                    SizedBox(height: 30),
                    ConditionalBuilder(
                      condition: true,
                      builder: (context)=>CustomButton(
                        text: 'Regester'.toUpperCase(),
                        onTap: (){
                          if(formKey.currentState!.validate()){
                            navigateAndFinish(context,LoginScreen());
                          }
                        },),
                      fallback: (context)=>Center(child: CircularProgressIndicator()),

                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('already have account'),
                        DefoultTextButtom(
                            onpressed: (){
                              navigateAndFinish(context,LoginScreen());
                            },
                            text: 'Login',
                            color:rmaincolor
                        ),
                      ],)
                  ]),
            ),
          ),
        ),
      ),
    );

  }
}