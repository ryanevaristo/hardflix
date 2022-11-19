import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hardflix/Movie.dart';
import 'package:hardflix/movie/MovieDetail.dart';

import '../Add.dart';

import '../login.dart/GoogleSignInProvider.dart';
import 'package:provider/provider.dart';


class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {

  List<Movie> tasks = [];

  onAddFunction(task) {
    setState(() {
      tasks.add(task);
    });
  }
  onEditFunction(task) {
      setState(() {
        task.id;
      });
  }

  onDeletedFunction(index) {
    setState(() {
      tasks.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.list),
        title: const Text("HARDFLIX"),
        actions: [
         ElevatedButton.icon(
                  icon: const FaIcon(FontAwesomeIcons.signOutAlt),
                  onPressed: () {
                    if (user.photoURL != null) {
                      final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.logout();
                      
                    } else {
                      FirebaseAuth.instance.signOut();
                    }

                  },
                  label: const Text("logout"),
                ),
        ],
      ),
      body: Column(
        children: [
          tasks.isEmpty?
          const SizedBox(
            height: 200,
            child: Center(
              child: Text("Nenhuma Filme Cadastrado"),
            ),
          )
          :GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridTile(
                  footer:  Material(
                    color: Colors.transparent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: GridTileBar(

                      backgroundColor: Colors.black45,
                      title: Text(tasks[index].title),
                      subtitle: Text("Nota: ${tasks[index].ratingBar.toString()}"),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetail(tasks[index], onEdit: onEditFunction, onDelete: onDeletedFunction, index: index),
                        ),
                      );
                    },
                    child: tasks[index].image.isEmpty
                        ? Image.network("https://i.stack.imgur.com/l60Hf.png")
                        : Image.network(tasks[index].image),
                  ),
                ),
              );
            }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Add(onAdd: onAddFunction)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
