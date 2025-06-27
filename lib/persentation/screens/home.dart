import 'package:flutter/material.dart';
import 'package:shopiverse/core/router.dart';
import 'package:shopiverse/core/theme/color_manger.dart';
import 'package:shopiverse/domain/models/order.dart';
import 'package:shopiverse/domain/models/profile.dart';
import 'package:shopiverse/domain/services/auth_service.dart';
import 'package:shopiverse/domain/services/delivery_profile.dart';
import 'package:shopiverse/domain/services/orders_service.dart';
import 'package:shopiverse/persentation/widgets/item_card.dart';
import 'package:shopiverse/persentation/widgets/list_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProfileModel profile = ProfileModel();
  List<OrderModel> orders = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final profileResult = await DeliveryProfile()
        .getProfile(); // call from api_service.dart

    if (profileResult is bool) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed Loading Data"),
          backgroundColor: Colors.red,
        ),
      );

      return;
    }

    setState(() {
      profile = profileResult;

      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(10),
          children: loading
              ? [
                  SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Center(child: CircularProgressIndicator())],
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      await AuthService().logout();
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil("/login", (Route r) => true);
                    },
                  ),
                ]
              : [
                  DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(fontSize: 42, color: Colors.black),
                            children: [
                              TextSpan(text: "Hi "),
                              TextSpan(
                                text:
                                    '${profile.firstName} ${profile.lastName},',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(profile.email),
                      ],
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      await AuthService().logout();
                      Navigator.of(
                        context,
                      ).pushNamedAndRemoveUntil("/login", (Route r) => true);
                    },
                  ),
                ],
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          Builder(
            builder: (context) {
              return IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.person, color: ColorManger.primary),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 90),
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(
                    color: ColorManger.primary,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Hi, ${profile.firstName}",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                      Center(
                        child: const Text(
                          "Ready to break the target!",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 250),
                Positioned.fill(
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: Icon(Icons.search, color: Colors.green),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.redAccent,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 25),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                "Orders Already Done",
                style: TextStyle(
                  color: ColorManger.primary,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.listRoute);
                },
                child: Text("See All", style: TextStyle(color: Colors.black)),
              ),
            ),
            FutureBuilder(
              future: OrdersService().getPendingOrders(),
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
            // Column(children: [ItemCard(), ItemCard(), ItemCard(), ItemCard()]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListButton(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.listRoute);
                },
              ),
            ),

            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
