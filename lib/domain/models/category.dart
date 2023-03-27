class Category {
  final int id;
  final String name;
  final String image;

  Category({required this.id, required this.name, required this.image});

  factory Category.empty() => Category(
        id: 0,
        name: '',
        image: '',
      );
}
