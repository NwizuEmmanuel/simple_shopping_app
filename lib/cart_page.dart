import 'package:flutter/material.dart';
import 'models/product_models.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  double deliveryFee = 23.0;
  // var item = ProductModels.pickedItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductModels.pickedItems
        .where((element) => element.isAdded == true)
        .forEach((element) {element.totalCost = element.price * element.quantity;});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check out'),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ListTile(
              title: TextField(
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                ),
              ),
            ),
            const ListTile(
              title: TextField(
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
              ),
            ),
            const ListTile(
              title: TextField(
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  prefixIcon: Icon(Icons.map),
                  labelText: 'Location',
                ),
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'),
                  IconButton(
                    onPressed: () => _selectDate(context),
                    icon: const Icon(Icons.insert_invitation),
                  )
                ],
              ),
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(selectedTime.format(context)),
                  IconButton(
                    onPressed: () => _selectTime(context),
                    icon: const Icon(Icons.alarm),
                  )
                ],
              ),
            ),
            ListTile(
              title: const Text('Delivery fee'),
              trailing: Text(
                '\$$deliveryFee',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Shopping cost'),
              trailing: Text(
                '\$${ProductModels.pickedItems.map((e) => e.totalCost).toList().reduce((value, element) => value + element)}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: const Text('Total'),
              trailing: Text(
                '\$${deliveryFee + (ProductModels.pickedItems.map((e) => e.totalCost).toList().reduce((value, element) => value + element))}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              title: Container(
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    _showDialog2();
                  },
                  child: const Text(
                    'check out',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  Future<void> _showDialog2() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Success\nYour code: 34thj56'),
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
