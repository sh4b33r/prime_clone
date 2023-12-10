class MovieModel {
  String? title;
  String? backdroppath;
  String? originaltitle;
  String? overview;
  String? posterpath;
  String voterating;
  String language;

  MovieModel(
      {required this.title,
      required this.language,
      required this.backdroppath,
      required this.originaltitle,
      required this.overview,
      required this.voterating,
      required this.posterpath});

  static MovieModel fromJson(Map<String, dynamic> frmAPi) {
    String data = frmAPi["name"] ?? frmAPi["title"];

    return MovieModel(
        title: data,
        language: frmAPi["original_language"],
        voterating: frmAPi["vote_average"] == null? "0"
            : frmAPi["vote_average"].toString(),
        posterpath: frmAPi["poster_path"],
        overview: frmAPi["overview"],
        originaltitle: frmAPi["original_title"],
        backdroppath: frmAPi["backdrop_path"]);
  }
}
