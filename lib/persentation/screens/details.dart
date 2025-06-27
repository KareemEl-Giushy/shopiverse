import 'package:flutter/material.dart';
import 'package:shopiverse/core/theme/color_manger.dart';
import 'package:shopiverse/domain/models/order.dart';
import 'package:shopiverse/domain/services/orders_service.dart';

class DetailsPage extends StatefulWidget {
  final OrderModel order;
  const DetailsPage({super.key, required this.order});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _handleLogin() async {
    if (_formKey.currentState?.validate() != true) return;
    setState(() {
      _isLoading = true;
    });

    final success = await OrdersService().confirmOrder(
      _otpController.text.trim(),
    );
    setState(() {
      _isLoading = false;
    });
    if (success) {
      Navigator.of(context).pushReplacementNamed("/home");
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Confirmation successful!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Confirmation failed"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Order ID: ",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                            Flexible(
                              child: Text(
                                widget.order.orderID,
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
                              "Username: ",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                            Flexible(
                              child: Text(
                                widget.order.username,
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
                                widget.order.address,
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
                                widget.order.phone,
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
                                widget.order.paymentMethod,
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
                              "Total Price: ",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                            Flexible(
                              child: Text(
                                "${widget.order.finalPrice} EGP",
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
                              "Created At: ",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                            Flexible(
                              child: Text(
                                widget.order.createdAt,
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
                              "Note: ",
                              style: TextStyle(fontFamily: "Poppins"),
                            ),
                            Flexible(
                              child: Text(
                                widget.order.note,
                                style: TextStyle(fontFamily: "Poppins"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OTP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 8),
                        Form(
                          key: _formKey,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorManger.primary,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: TextFormField(
                              controller: _otpController,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Can't be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "1234",
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                hintStyle: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 16,
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),

                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              disabledBackgroundColor: Colors.green[300],
                            ),
                            child: _isLoading
                                ? SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  )
                                : Text(
                                    'Confirm Order',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
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
