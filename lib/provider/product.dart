import 'package:flutter/material.dart';
import 'package:shopping_demo_app/models/product.dart';
import 'package:shopping_demo_app/services/product.dart';

class ProductProvider with ChangeNotifier {
  ProductServices _productServices = ProductServices();
  List<ProductModel> products = [];
  List<ProductModel> productsSearched = [];

  ProductProvider.initialize() {
    loadProducts();
  }

  loadProducts() async {
    products = await _productServices.getProducts();
    notifyListeners();
  }

  Future search({String productName}) async {
    productsSearched =
        await _productServices.searchProducts(productName: productName);
    notifyListeners();
  }
}
