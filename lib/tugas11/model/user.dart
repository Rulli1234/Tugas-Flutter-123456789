// import 'dart:convert';

// class Game {
//   final String judul;
//   final String kategori;
//   final String tahun;
//   Game({required this.judul, required this.kategori, required this.tahun});

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'judul': judul,
//       'kategori': kategori,
//       'tahun': tahun,
//     };
//   }

//   factory Game.fromMap(Map<String, dynamic> map) {
//     return Game(
//       judul: map['judul'],
//       kategori: map['kategori'],
//       tahun: map['tahun'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Game.fromJson(String source) =>
//       Game.fromMap(json.decode(source) as Map<String, dynamic>);
// }

class Game {
  final int? id;
  final String judul;
  final String kategori;
  final String tahun;

  Game({
    this.id,
    required this.judul,
    required this.kategori,
    required this.tahun,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'judul': judul,
      'kategori': kategori,
      'tahun': tahun,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'],
      judul: map['judul'],
      kategori: map['kategori'],
      tahun: map['tahun'],
    );
  }
}
