import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:hardflix/HomePage.dart';
import 'package:hardflix/movie/Movies.dart';
import 'package:hardflix/Register.dart';

import 'login.dart/GoogleSignInProvider.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          home: const MyHomePage(title: 'Aplicativo de Filme'),
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

  @override
  void dispose () {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            const SizedBox(
              height: 50,
            ),
            Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("HARDFLIX", style: TextStyle(fontSize: 36,color: Color(0xFF7ea7ec),fontWeight: FontWeight.bold)),
              const Image(image: AssetImage("lib/images/cinema.webp") , height: 250, width: 300,),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                margin: const EdgeInsets.only(top: 10,bottom: 10),
                child: TextField(
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
                margin: const EdgeInsets.only(top: 10),
                child: TextField(
                  controller: passwordController,
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
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: style,
                  onPressed: signIn,
                  child: const Text("Login"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: style,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Register()),
                    );
                  },
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
              Padding(
                padding: const EdgeInsets.only(right: 100, left: 100),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black, backgroundColor: Colors.white,
                    minimumSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: const FaIcon(FontAwesomeIcons.google),
                  onPressed: () {
                    final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogin();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  label: const Text("Sign Up with Google"),
                ),
              ),
            ],
          ),
        );
  }
   Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
           Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      // TODO
      print(e); 
    }
   }
}
