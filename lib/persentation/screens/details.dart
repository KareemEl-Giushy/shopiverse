import 'package:flutter/material.dart';
import 'package:shopiverse/core/theme/color_manger.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Order Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: ColorManger.primary,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width * 0.85,
              decoration: BoxDecoration(
                color: ColorManger.grey,
                border: Border.all(color: ColorManger.primary, width: 2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8wvy8H117i_nZSl7iemEXWOHEklUW_Q_EXg&s",
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Details: ",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              Flexible(
                                child: Text(
                                  "Some Details about the product",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Location: ",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              Flexible(
                                child: Text(
                                  "Tanta",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Payment: ",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              Flexible(
                                child: Text(
                                  "Cash",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Customer Name: ",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              Flexible(
                                child: Text(
                                  "Kareem",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Phone Number: ",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              Flexible(
                                child: Text(
                                  "0000000",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "OTP: ",
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                              Flexible(
                                child: Text(
                                  "123",
                                  style: TextStyle(fontFamily: "Poppins"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
