import 'package:uuid/uuid.dart';


class Movie {
  final String _id = const Uuid().v1();
  String _image;
  String _title;
  String _description;
  int _ageRating;
  String _genre;
  String _duration;
  String _language;
  int _ratingBar;
  DateTime _date;

  Movie(this._image,this._title, this._description,this._ageRating,this._genre, this._duration, this._language, this._ratingBar, this._date);

  String get id => _id;

  String get image => _image;
  
  set image(String newImage) {
    _image = newImage;
  }


  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }

  int get ratingBar => _ratingBar;
  
  set ratingBar(int value) {
    _ratingBar = value;
  }

  String get language => _language;

  set language(String value) {
    _language = value;
  }

  String get duration => _duration;

  set duration(String value) {
    _duration = value;
  }

  String get genre => _genre;

  set genre(String value) {
    _genre = value;
  }

  int get ageRating => _ageRating;

  set ageRating(int value) {
    _ageRating = value;
  }

}
