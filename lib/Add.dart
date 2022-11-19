import 'package:flutter/material.dart';
import 'package:hardflix/Movie.dart';


class Add extends StatefulWidget {
  final Function onAdd;

  const Add({Key? key, required this.onAdd}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final myControllerImage =TextEditingController();
  final myControllerTitle = TextEditingController();
  final myControllerDescription = TextEditingController();
  final myControllerAgeRating = TextEditingController();
  final myControllerGenre = TextEditingController();
  final myControllerDuration = TextEditingController();
  final myControllerLanguage = TextEditingController();
  final myControllerRatingBar = TextEditingController();
  final myControllerDate = TextEditingController();
  late String title;
  late String description;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    myControllerDate.text = '${date.day}/${date.month}/${date.year}';
    myControllerAgeRating.text.isEmpty ? myControllerAgeRating.text = '0' : myControllerAgeRating.text;
    myControllerRatingBar.text.isEmpty ? myControllerRatingBar.text = '0' : myControllerRatingBar.text;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicione um filme"),
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
                child: TextField(
                  readOnly: true,
                  onTap: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2000),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));
                    if (newDate == null) return;
                    setState(() {
                      date = newDate;
                    });
                  },
                  controller: myControllerDate,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Data de Lançamento',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    widget.onAdd(Movie(myControllerImage.text, myControllerTitle.text, myControllerDescription.text, int.parse(myControllerAgeRating.text), myControllerGenre.text, myControllerDuration.text, myControllerLanguage.text, int.parse(myControllerRatingBar.text), date));
                    Navigator.pop(context);
                  },
                  child: const Text("Adicionar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
