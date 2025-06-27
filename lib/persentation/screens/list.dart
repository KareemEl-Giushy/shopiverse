import 'package:flutter/material.dart';
import 'package:shopiverse/core/theme/color_manger.dart';
import 'package:shopiverse/domain/services/orders_service.dart';
import 'package:shopiverse/persentation/widgets/item_card.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset("images/icon.png", width: 50),
            Text(
              "SHOPIVERSE",
              style: TextStyle(
                fontFamily: "Kadwa",
                color: Color.fromARGB(255, 15, 46, 124),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 10,
        shadowColor: ColorManger.black,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person, color: ColorManger.primary),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Orders List",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: ColorManger.primary,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: FutureBuilder(
              future: OrdersService().getDeliveredOrders(),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text("ERROR: ${snapshot.error}");
                } else if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.data != null) {
                  List torders = snapshot.data;
                  if (torders.isEmpty) {
                    return Center(child: Text("No Top Events"));
                  }
                  return Column(
                    children: [for (var o in torders) ItemCard(order: o)],
                  );
                }
                return Center(child: Text("Error"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
