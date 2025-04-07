import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> _tabs = [
    {'title': 'All', 'count': 3},
    {'title': 'Pending', 'count': 3},
    {'title': 'Confirm', 'count': 0},
    {'title': 'To Pickup', 'count': 0},
    {'title': 'To Delivery', 'count': 1},
    {'title': 'Delivered', 'count': null},
  ];


   final List<Map<String, dynamic>> orderItems = [
    {
      'orderId': '#ORD-001',
      'date': '2025-04-05',
      'customerName': 'John Doe',
      'status': 'Pending',
      'statusColor': Colors.orange,
    },
    {
      'orderId': '#ORD-002',
      'date': '2025-04-05',
      'customerName': 'Jane Smith',
      'status': 'Delivered',
      'statusColor': Colors.green,
    },
    {
      'orderId': '#ORD-003',
      'date': '2025-04-05',
      'customerName': 'Mike Johnson',
      'status': 'To Pickup',
      'statusColor': Colors.blue,
    },
    {
      'orderId': '#ORD-004',
      'date': '2025-04-05',
      'customerName': 'Sarah Wilson',
      'status': 'To Delivery',
      'statusColor': Colors.purple,
    },
    {
      'orderId': '#ORD-005',
      'date': '2025-04-05',
      'customerName': 'Tom Brown',
      'status': 'Confirm',
      'statusColor': Colors.teal,
    },
    {
      'orderId': '#ORD-006',
      'date': '2025-04-05',
      'customerName': 'Lisa Anderson',
      'status': 'Pending',
      'statusColor': Colors.orange,
    },
  ];

  final List<Map<String, dynamic>> buildOrderCards=[
    {
      'orderId': '#ORD-001',
      'orderAmount': '50.00',
      'paymentMethod': 'Credit Card',
      'location': '123 Main St, City',
      'date': '2025-04-05',
    },
    {
      'orderId': '#ORD-002',
      'orderAmount': '75.00',
      'paymentMethod': 'PayPal',
      'location': '456 Elm St, City',
      'date': '2025-04-05',
    },
    {
      'orderId': '#ORD-003',
      'orderAmount': '100.00',
      'paymentMethod': 'Cash on Delivery',
      'location': '789 Oak St, City',
      'date': '2025-04-05',
    },
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this, initialIndex: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Orders',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Today - Sat, Apr 05, 2025',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F0F0),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            
            // TabBar
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: const Color(0xFFE84C65),
                labelColor: const Color(0xFFE84C65),
                unselectedLabelColor: Colors.grey,
                indicatorWeight: 2,
                tabs: _tabs.map((tab) {
                  return Tab(
                    height: 40,
                    child: Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(tab['title']),
                          if (tab['count'] != null)
                            Text(
                              '(${tab['count']})',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            
            // TabBarView with order lists
                  Expanded(
                    child: TabBarView(
                    controller: _tabController,
                    children: [
                      // All orders
                      Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(15),
                      
                        children: List.generate(3, (index) => _buildOrderItem(
                          orderId: orderItems[index]['orderId'],
                          date: orderItems[index]['date'],
                          customerName: orderItems[index]['customerName'],
                          status: orderItems[index]['status'],
                          statusColor: orderItems[index]['statusColor'],
                        )),
                      ),
                      ),
                      // Confirm
                      Expanded(
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height:20,),
                            buildOrderCard(
                              orderId: '${buildOrderCards[0]['orderId']}',
                              orderAmount: '${buildOrderCards[0]['orderAmount']}',
                              paymentMethod: '${buildOrderCards[0]['paymentMethod']}',
                              location: '${buildOrderCards[0]['location']}',
                              date: '${buildOrderCards[0]['date']}',
                             
                            ),
                          ],
                        )
                      ),
                      ),
                      // To Pickup
                      const Expanded(
                      child: Center(
                        child: Text('No orders to pickup'),
                      ),
                      ),
                      // To Delivery
                      Expanded(
                      child: ListView(
                        padding: const EdgeInsets.all(15),
                        children: [
                          _buildOrderItem(
                            orderId: orderItems[3]['orderId'],
                            date: orderItems[3]['date'],
                            customerName: orderItems[3]['customerName'],
                            status: orderItems[3]['status'],
                            statusColor: orderItems[3]['statusColor'],
                          ),
                        ],
                      ),
                      ),
                      // Delivered
                      const Expanded(
                      child: Center(
                        child: Text('No delivered orders'),
                      ),
                      ),
                    ],
                    ),
                  ),    ],
        ),
      ),
    );
  }

  Widget _buildOrderItem({
    required String orderId,
    required String date,
    required String customerName,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      margin: EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border(
          
          bottom: BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            decoration: BoxDecoration(
              color:  Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  date,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
               const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                   Text(
                    orderId,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                   const SizedBox(width: 10),
                   const Icon(
                    Icons.paypal,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 15),
                  Text(
                    customerName,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
               
                  
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}




Widget buildOrderCard({
  required String orderId,
  required String orderAmount,
  required String paymentMethod,
  required String location,
  required String date,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          blurRadius: 4,
          offset: const Offset(0, 1),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with date and arrow
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              decoration: BoxDecoration(
                color:  Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    date,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                 const Icon(
                    Icons.chevron_right,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          
          // Order details row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ORDER ID",
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                    Text(
                      orderId,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Amount",
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                    Text(
                      "\$$orderAmount",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
      
              // Payment Method row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                    Text(
                      paymentMethod,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
          
          // Location row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(color: Colors.grey[400], fontSize: 12),
                    ),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        // Cancel action
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFFF6B6B)),
                        foregroundColor: const Color(0xFFFF6B6B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Confirm action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00D261),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      ),
                      child: const Text("Confirm"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}