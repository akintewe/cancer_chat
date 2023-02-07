import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String _email;
  final _SignUp=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();
  bool passToggle=true;
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[150],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
          child: Form(
            key: _SignUp,
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/haha.png',height: 200,width: 200,),
           SizedBox(height: 20,),
            Text(
              'Sign up for free',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 34,
            ),
            Container(
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:35 ),
                    child: Row(
                      children: [
                        Text('Email'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 3 ,right: 8),
                    child: TextFormField(

                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText:  'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                        validator:(value) {
                          if (value!.isEmpty) {
                            return "invalid email";
                          }
                            validator:
                              (String value) {
                            if (value.isEmpty) {
                              return "invalid email";
                            }
                            if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return 'invalid email';
                            }
                            return null;
                          };
                          onSaved:(String email) {
                            _email = email;
                          };
                        } ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Row(
                      children: [
                        Text('Password'),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8,left: 3,),
                    child: TextFormField(
                     controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(

                        isDense: true,
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              passToggle=!passToggle;
                            });
                          },
                          child: Icon(passToggle ? Icons.visibility_off:Icons.visibility_off),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),

                      ),
                    validator:(value) {
                      if (value!.isEmpty) {
                        return "!invalid password";
                      }
                    }  ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: isChecked,
                          activeColor: Colors.indigo,
                          onChanged: (newBool) {
                            setState(() {
                              isChecked = newBool;
                            });
                          }),
                      Text(
                        'Remember me',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Material(
              elevation: 5,
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(25),
              child: MaterialButton(
                onPressed: () {
                  if(_SignUp.currentState!.validate()){
                    print("sucess");
                    emailController.clear();
                    passController.clear();
                  }
                },
                minWidth: 320,
                height: 42,
                child: Text(
                  'Sign UP',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('or continue with'),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 180,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              'images/face.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'FaceBook',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Image.asset(
                              'images/Google.png',
                              width: 30,
                              height: 30,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Google',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('Already have an account?',style: TextStyle(fontWeight:FontWeight.w300,fontSize: 14),),
                  TextButton(

                     onPressed: () {},
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
            ),
          ),
        ),
      ),
    );
  }
}

