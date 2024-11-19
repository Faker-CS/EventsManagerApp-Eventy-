class User {
  final int id;
  String name;
  String email;
  bool estAdmin;

  User({required this.id, required this.name, required this.email, this.estAdmin = false});
}
