import 'package:flutter/cupertino.dart';
import 'package:shop_app/providers/product.dart';


class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: 'p1',
        quantity: 1,
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl:
        'https://dhakabaazar.com/uploads/sss.jpg'
    ),
    Product(
        id: 'p2',
        quantity: 1,
        title: 'BlueT-Shirt',
        description: 'A blue T-shirt - it is pretty blue!',
        price: 19.99,
        imageUrl:
        'https://static-01.daraz.com.bd/p/92ebb6c594a45aaaf3c61dadfce86c36.jpg'
    ),
    Product(
        id: 'p3',
        quantity: 1,
        title: 'BlackJacket',
        description: 'A black jacket - it is pretty black!',
        price: 39.99,
        imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-H9G8TJ_VzAMJKQ9iNyzO3AfixOiMvTpQZA&usqp=CAU'
    ),
    Product(
        id: 'p4',
        quantity: 1,
        title: 'BlueJeans',
        description: 'A blue Jeans Pant - it is pretty blue!',
        price: 49.99,
        imageUrl:
        'https://static-01.daraz.com.bd/p/eeeafa3d9a13ec563e1dccd6a1bbe9ce.jpg'
    ),


  ];

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  var _showFavoritesOnly = false;

  List<Product> get items {
    if(_showFavoritesOnly){
      return _items.where((prodItem) => prodItem.isFavourite).toList();
    }
    return [..._items];
  }
  
  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }


  void showFavoritesOnly() {
    _showFavoritesOnly = true;
    notifyListeners();
  }
  void showAll() {
    _showFavoritesOnly = false;
    notifyListeners();
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }
}