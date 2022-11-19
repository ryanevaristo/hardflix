
import 'package:flutter/material.dart';

import '../Edit.dart';
import '../Movie.dart';
class MovieDetail extends StatefulWidget {
  final Movie movie;
  final Function onEdit;
  final Function onDelete;
  final int index;
  const MovieDetail(this.movie, {Key? key, required this.onEdit, required this.onDelete, required this.index}) : super(key: key);  

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {

  new_onEdit (movie) {
    setState(() {
      widget.onEdit(movie);
        widget.movie.id;
      });
  }
  var styleText = const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold);
  var subtext = const TextStyle(color: Colors.white, fontSize: 14,);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Edit(widget.movie, onEdit: new_onEdit),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            AlertDialog(
                              title: const Text("Excluir tarefa"),
                              content: const Text("Deseja excluir a tarefa?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    widget.onDelete(widget.index);
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Sim"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Não"),
                                ),
                              ],
                            ));
            },
          ),
        ],
      ),
      body: ListView(
        children: [Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FittedBox(fit: BoxFit.fill,
            child: widget.movie.image.isEmpty
                        ? Image.network("https://i.stack.imgur.com/l60Hf.png")
                        : Image.network(widget.movie.image, height: 300,)),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [ 
                    const SizedBox(height: 10),
                     Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  <Widget>[
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(
                                        "Titulo: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget.movie.title,
                                    style: subtext,
                                  ),
                                ),
                                const SizedBox(width: 20,),
                                Text("Nota: ${widget.movie.ratingBar}",
                                style: styleText,),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                
                                 Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child:  Text(
                                    "Descrição do Filme:",
                                    style: styleText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 20),
                                  child: Text(
                                    widget.movie.description,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only( left: 8, bottom: 10),
                                  child: Text("Ano de Lançamento: ${widget.movie.date.year}"
                                  , style: subtext,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 10),
                                  child: Text("Gênero: ${widget.movie.genre}",
                                  style: subtext,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 10),
                                  child: Text("Duração: ${widget.movie.duration}",
                                  style: subtext,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 10),
                                  child: Text("Idioma: ${widget.movie.language}",
                                  style: subtext,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 10),
                                  child: Text("Classificação de Idade: ${widget.movie.ageRating}",
                                  style: subtext,),
                                ),
                                
                                const SizedBox(height: 50),
                                ],),
                                ),
                                ),
                    
                  ],
                )
              ],
            )
          ],
        ),]
      ),
    );
  }
}
