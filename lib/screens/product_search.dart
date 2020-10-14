import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_demo_app/helpers/common.dart';
import 'package:shopping_demo_app/helpers/style.dart';
import 'package:shopping_demo_app/provider/product.dart';
import 'package:shopping_demo_app/screens/product_details.dart';
import 'package:shopping_demo_app/widgets/custom_text.dart';
import 'package:shopping_demo_app/widgets/product_card.dart';

class ProductSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: CustomText(
          text: "Products",
          size: 20,
        ),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
        ],
      ),
      body: productProvider.productsSearched.length < 1
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      color: grey,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CustomText(
                      text: "No products Found",
                      color: grey,
                      weight: FontWeight.w300,
                      size: 22,
                    ),
                  ],
                )
              ],
            )
          : ListView.builder(
              itemCount: productProvider.productsSearched.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () async {
                      changeScreen(
                          context,
                          ProductDetails(
                              product:
                                  productProvider.productsSearched[index]));
                    },
                    child: ProductCard(
                        product: productProvider.productsSearched[index]));
              }),
    );
  }
}
