
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hardflix/HomePage.dart';
import 'package:hardflix/main.dart';

import 'login.dart/GoogleSignInProvider.dart';


class Register extends StatelessWidget {
  const Register({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'HARDFLIX',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'Seu aplicativo de filme'),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ButtonStyle style = ElevatedButton.styleFrom(
      
      elevation: 3,
      backgroundColor: const Color.fromARGB(255, 42, 28, 233),
      textStyle: const TextStyle(fontSize: 20));
  final  emailController = TextEditingController();
  final passwordController = TextEditingController();
  final password2Controller = TextEditingController();
  //create formKey
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Form(
              key: formKey,
              child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("HARDFLIX", style: TextStyle(fontSize: 36,color: Color(0xFF7ea7ec),fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                const Text("CADASTRO", style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
            
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(top: 10,bottom: 10),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7ea7ec), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Color(0xFF7ea7ec)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: "Digite seu Email",
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Color(0xFF7ea7ec)),
                  ),
                ),
                
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: TextFormField(
                    controller: passwordController,
                    validator: (value) => value!.length < 6 ? 'Senha muito curta' : null,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7ea7ec), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Color(0xFF7ea7ec)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: "Digite sua Senha",
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: const TextStyle(color: Color(0xFF7ea7ec)),
                  ),
                ),
            
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    controller: password2Controller,
                    validator: ((value) => value != passwordController.text ? "Senhas não conferem" : null),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF7ea7ec), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      labelText: "Confirme sua Senha",
                      labelStyle: TextStyle(color: Color(0xFF7ea7ec)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: "Digite sua Senha Novamente",
                      hintStyle: TextStyle(color: Colors.grey)
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    style: const TextStyle(color: Color(0xFF7ea7ec)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: style,
                    onPressed: signUp,
                    child: const Text("Cadastrar"),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ]),
                const SizedBox(
                  height: 30,
                ),
                ],),
            ),
            ],
          ),
        );
  }
  Future signUp() async {

    final isValid = formKey.currentState!.validate();
    if(!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e); 
    }
   }
}
