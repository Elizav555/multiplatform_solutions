class Corgi {
  final String name;
  final String email;
  final String image;

  Corgi(this.name, this.email, this.image);
}

final List<Corgi> corgis =
    _corgis.map((e) => Corgi(e['name'], e['email'], e['image'])).toList();

final List<Map<String, dynamic>> _corgis = List.generate(
  25,
  (index) => {
    'name': 'Corgi №$index',
    'email': 'puppy$index@gmail.com',
    'image': index % 2 == 0 ? 'images/corgi.jpg' : 'images/1.png',
  },
);
