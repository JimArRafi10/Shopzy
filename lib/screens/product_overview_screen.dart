import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';
import 'package:shop_app/widgets/products_grid.dart';
import 'package:shop_app/widgets/badge.dart';

import 'package:shop_app/providers/cart.dart';

enum FilterOptions {
  Favourites,
  All,

}

class ProductsOverviewScreen extends StatefulWidget {

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites= false;

  //get ch => null;

  @override
  Widget build(BuildContext context) {
    //final cart = Provider.of<Cart>;
   // final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
       appBar: AppBar(
         title: Text('MyShop'),
         actions: <Widget>[
           PopupMenuButton(
             onSelected: (FilterOptions selectedValue) {
               setState(() {
                 if(selectedValue == FilterOptions.Favourites){
                   _showOnlyFavorites = true;
                 }else{
                   _showOnlyFavorites = false;
                 }
               });
             },
             icon: Icon(Icons.more_vert,),
           itemBuilder: (_) => [
             PopupMenuItem(child: Text('Only Favourite'),
             value: FilterOptions.Favourites,),
             PopupMenuItem(child: Text('Show All'),
               value: FilterOptions.All,),
           ],
           ),
           Consumer<Cart> (builder: (_, cart, child) => badge(
              child: child ?? Container(),
             value: cart.itemCount.toString(),
             color: Colors.white,
             key: GlobalKey(),
    ),
        child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
    onPressed: () {

    },
    ),
    )


         ],
       ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
