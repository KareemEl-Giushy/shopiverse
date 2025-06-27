import 'package:flutter/material.dart';
import 'package:shopiverse/core/theme/color_manger.dart';
import 'package:shopiverse/domain/models/order.dart';
import 'package:shopiverse/persentation/screens/details.dart';

class ItemCard extends StatelessWidget {
  final OrderModel order;
  const ItemCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
      decoration: BoxDecoration(
        color: ColorManger.grey,
        border: Border.all(color: ColorManger.primary, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                // width: 150,
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.address,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    Text(
                      order.note,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    Text("Status: ${order.status}"),
                    Text("Payment: ${order.paymentMethod}"),
                    Text("Price: ${order.finalPrice} EGP"),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => DetailsPage(order: order)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00B14F), // Green background
                foregroundColor: Colors.white, // Text color
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
                elevation: 0, // Remove shadow if not needed
              ),
              child: Text('Order Details'),
            ),
          ),
        ],
      ),
    );
  }
}
