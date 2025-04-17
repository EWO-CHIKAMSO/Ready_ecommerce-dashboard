import 'package:flutter/material.dart';

class OrderDetailsPage extends StatefulWidget {
  final String orderId;
  final String status;
  final Color statusColor;
  final String date;
  final String customerName;

  const OrderDetailsPage({
    Key? key,
    required this.orderId,
    required this.status,
    required this.statusColor,
    required this.customerName,
    required this.date,
  }) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    bool isPending = widget.status == "Pending";
    bool isCompleted = widget.status == "Delivered" ||
        widget.status == "To Deliver" ||
        widget.status == "To Pickup";

    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Order Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        
        elevation: 1,
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: widget.statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  widget.status,
                  style: TextStyle(
                    color: widget.statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
              'Order Items (1)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                SizedBox(height: 12),
                  Row(
                    children: [
                      Image.network(
                        'https://i.imgur.com/QCNbOAo.png',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sony A6400 Mirrorless Camera With 18-135mm Lens',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 8),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '8 Pcs',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                 boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: Column(
                children: [
                  Center(
              child: Text(
                ' ORDER ID ${widget.orderId}',
                style: TextStyle(
                  color: Colors.pink[600],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
               ),
               SizedBox(height: 16),
                  _buildInfoRow('Order Placed', widget.date),
                  SizedBox(height: 12),
                  _buildInfoRow('Order Amount', '\$1820.0'),
                  SizedBox(height: 12),
                  _buildInfoRow('Payment Method', 'Cash'),

                         SizedBox(height: 20),
                    LayoutBuilder(
              builder: (context, constraints) {
                double dashWidth = 6.0;
                double dashHeight = 1.5;
                double dashSpace = 4.0;
                int dashCount =
                    (constraints.constrainWidth() / (dashWidth + dashSpace))
                        .floor();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(dashCount, (_) {
                    return Container(
                      width: dashWidth,
                      height: dashHeight,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(right: dashSpace),
                    );
                  }),
                );
              },
              ),
             SizedBox(height: 12),
              Center(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.file_download_outlined, color: Colors.black),
                label: Text(
                  'Open Invoice',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
                ],
              ),
            ),
           
            // Dotted Line Separator.
          
           
            SizedBox(height: 20),
          
            
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    SizedBox(height: 10),
            Text(
              'Shipping Info:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),SizedBox(height: 12),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey[300],
                        backgroundImage: NetworkImage(
                          'https://i.imgur.com/BoN9kdC.png',
                        ),
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'KM JASHIM',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '1711372759',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: Colors.red),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '675, Dhaka, Dhaka, Dhaka, 1206',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                   Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                border: Border.all(color: Colors.blueGrey.shade200),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.symmetric(horizontal: 5,vertical: 3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Between',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey.shade800,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.blueGrey.shade600,
                      ),
                      SizedBox(width: 8),
                      Text(
                        '1',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
                ],
              ),
            ),
            SizedBox(height: 20),
           
            SizedBox(height: 80),
          ],
        ),
      ),
      bottomNavigationBar: (isPending && !isCompleted) //Simplified condition
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red, width: 2),
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : null, // Return null to remove the bottomNavigationBar
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 15, color: Colors.black54),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
