
class Movie{

  final String Poster;
  final String Title;
  final String Year;

  Movie({
    required this.Poster,
    required this.Title,
    required this.Year,
  });

  factory Movie.fromMap({required Map data}){
    return Movie(

        Poster: data['Poster'],
        Title: data['Title'],
        Year: data['Year']);
  }

  factory Movie.fromDB({required Map data}) {
    return  Movie(
        Poster: data['Poster'],
        Title: data['Title'],
        Year: data['Year']);
  }
}