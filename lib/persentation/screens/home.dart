import 'package:flutter/material.dart';
import 'package:shopiverse/core/router.dart';
import 'package:shopiverse/core/theme/color_manger.dart';
import 'package:shopiverse/persentation/widgets/item_card.dart';
import 'package:shopiverse/persentation/widgets/list_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: Drawer(child: Container()),
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
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(Icons.person, color: ColorManger.primary),
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
                      const Text(
                        "Hi, Mohammed",
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
                onPressed: () {},
                child: Text("See All", style: TextStyle(color: Colors.black)),
              ),
            ),
            Column(children: [ItemCard(), ItemCard(), ItemCard(), ItemCard()]),
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
