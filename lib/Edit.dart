import 'package:flutter/material.dart';
import 'package:hardflix/Movie.dart';


import 'DateField.dart';

class Edit extends StatefulWidget {
  late Movie movie;
  final Function onEdit;

  Edit(this.movie, {Key? key, required this.onEdit}) : super(key: key);

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {

    onDateClick(value) {
      widget.movie.date = value;
    }
    TextEditingController myControllerImage = TextEditingController();
    TextEditingController myControllerTitle = TextEditingController();
    TextEditingController myControllerDescription = TextEditingController();
    TextEditingController myControllerAgeRating = TextEditingController();
    TextEditingController myControllerGenre = TextEditingController();
    TextEditingController myControllerDuration = TextEditingController();
    TextEditingController myControllerLanguage = TextEditingController();
    TextEditingController myControllerRatingBar = TextEditingController();
    myControllerImage.text = widget.movie.image;
    myControllerTitle.text = widget.movie.title;
    myControllerDescription.text = widget.movie.description;
    myControllerAgeRating.text = widget.movie.ageRating.toString();
    myControllerGenre.text = widget.movie.genre;
    myControllerDuration.text = widget.movie.duration.toString();
    myControllerLanguage.text = widget.movie.language;
    myControllerRatingBar.text = widget.movie.ratingBar.toString();
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edite o Filme"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: myControllerImage,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Capa do filme',
                  hintText: "Utilize uma url valida"    
                 ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  controller: myControllerTitle,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Título do filme',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  controller: myControllerDescription,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Descrição do filme',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  controller: myControllerAgeRating,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Classificação etária',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  controller: myControllerGenre,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Gênero',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  controller: myControllerDuration,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Duração',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  controller: myControllerLanguage,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Idioma',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: TextField(
                  controller: myControllerRatingBar,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nota',
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: DateField(widget.movie.date, onDateClick: onDateClick)),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    widget.movie.image = myControllerImage.text;
                    widget.movie.title = myControllerTitle.text;
                    widget.movie.description = myControllerDescription.text;
                    widget.movie.ageRating = int.parse(myControllerAgeRating.text);
                    widget.movie.genre = myControllerGenre.text;
                    widget.movie.duration = myControllerDuration.text;
                    widget.movie.language = myControllerLanguage.text;
                    widget.movie.ratingBar = int.parse(myControllerRatingBar.text);

                    widget.onEdit(widget.movie);
                    Navigator.pop(context);
                  },
                  child: const Text("Editar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
