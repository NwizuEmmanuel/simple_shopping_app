import 'package:flutter/material.dart';

import 'cart_page.dart';
import 'models/product_models.dart';

class ItemInCart extends StatefulWidget {
  const ItemInCart({Key? key}) : super(key: key);

  @override
  _ItemInCartState createState() => _ItemInCartState();
}

class _ItemInCartState extends State<ItemInCart> {
  
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    setState(() {
      ProductModels.pickedItems = ProductModels.items
          .where((element) => element.isAdded == true)
          .toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    var checkList = ProductModels.pickedItems;
    return Scaffold(
      body: ProductModels.pickedItems.isEmpty
          ? const Center(
              child: Text(
                'Nothing here',
                style: TextStyle(color: Colors.blue),
              ),
            )
          : loadItems(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (checkList.isEmpty) {
            _showDialog();
          } else {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return const CartPage();
              },
            ));
          }
        },
        child: const Icon(Icons.add_shopping_cart_sharp),
      ),
    );
  }
  
  Widget buildItem(ProductModels productModels) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          image: DecorationImage(
                            image: AssetImage(productModels.imageUrl),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      alignment: Alignment.topLeft,
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(productModels.name),
                          const SizedBox(
                            height: 20,
                          ),
                          Text('\$${productModels.price}')
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 100,
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        productModels.isAdded = false;
                        productModels.quantity = 1;
                        ProductModels.pickedItems = ProductModels.items
                            .where((element) => element.isAdded == true)
                            .toList();
                      });
                    },
                    icon: const Icon(Icons.delete),
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (productModels.quantity >= 1) {
                          productModels.quantity++;
                        }
                      });
                    },
                    icon: const Icon(Icons.add)),
                const SizedBox(
                  width: 10,
                ),
                Text(productModels.quantity.toString()),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (productModels.quantity > 1) {
                          productModels.quantity--;
                        }
                      });
                    },
                    icon: const Icon(Icons.remove)),
              ],
            )
          ],
        ),
      ),
    );
  }

  ListView loadItems() {
    return ListView.builder(
      itemCount: ProductModels.pickedItems.length,
      itemBuilder: (context, index) {
        return buildItem(ProductModels.pickedItems[index]);
      },
    );
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('No item found'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
