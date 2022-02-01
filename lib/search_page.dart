import 'package:flutter/material.dart';

import 'models/product_models.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  _onSearch(String char) {
    setState(() {
      ProductModels.dummyItems = ProductModels.items
          .where((element) => element.name.toLowerCase().contains(char))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: TextField(
            onChanged: (value) => _onSearch(value),
            decoration: const InputDecoration(
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none
              ),
              hintText: 'Search',
              prefixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
      body: ProductModels.dummyItems.isNotEmpty
          ? ListView.builder(
              itemCount: ProductModels.dummyItems.length,
              itemBuilder: (context, index) {
                return buildItem(ProductModels.dummyItems[index]);
              },
            )
          : const Center(
              child: Text(
                'No items',
                style: TextStyle(color: Colors.blue),
              ),
            ),
    );
  }

  Widget buildItem(ProductModels productModels) {
    Future<void> _showDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: const Text('Do you want to remove item from cart?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    productModels.isAdded = !productModels.isAdded;
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              )
            ],
          );
        },
      );
    }

    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
              child: productModels.isAdded
                  ? TextButton(
                      onPressed: () {
                        _showDialog();
                      },
                      child: const Text('Added'),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          productModels.isAdded = !productModels.isAdded;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
