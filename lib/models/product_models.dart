class ProductModels {
  late String name;
  late String imageUrl;
  late double price;
  late bool isAdded;
  late int quantity;
  late double totalCost;

  ProductModels(
      {required this.name,
      required this.imageUrl,
      required this.price,
      required this.isAdded,
      required this.quantity,
      required this.totalCost});

  static List<ProductModels> items = [
    ProductModels(
      name: 'Polo',
      imageUrl: 'images/polo1.jpg',
      price: 12,
      isAdded: false,
      quantity: 1,
      totalCost: 0,
    ),
    ProductModels(
        name: 'Scarf',
        imageUrl: 'images/scarf1.jpg',
        price: 7,
        isAdded: false,
        quantity: 1,
        totalCost: 0),
    ProductModels(
        name: 'Set of cloth(1)',
        imageUrl: 'images/set1.jpg',
        price: 102,
        isAdded: false,
        quantity: 1,
        totalCost: 0),
    ProductModels(
        name: 'Set of cloth(2)',
        imageUrl: 'images/set2.jpg',
        price: 132,
        isAdded: false,
        quantity: 1,
        totalCost: 0),
    ProductModels(
        name: 'Shirt',
        imageUrl: 'images/shirt1.jpg',
        price: 15,
        isAdded: false,
        quantity: 1,
        totalCost: 0),
    ProductModels(
        name: 'Suit',
        imageUrl: 'images/suit1.jpg',
        price: 140,
        isAdded: false,
        quantity: 1,
        totalCost: 0),
    ProductModels(
        name: 'Sweater',
        imageUrl: 'images/sweater.jpg',
        price: 60,
        isAdded: false,
        quantity: 1,
        totalCost: 0),
    ProductModels(
        name: 'Top',
        imageUrl: 'images/top1.jpg',
        price: 30,
        isAdded: false,
        quantity: 1,
        totalCost: 0)
  ];

  static List<ProductModels> dummyItems = [];

  static List<ProductModels> pickedItems = [];
}
