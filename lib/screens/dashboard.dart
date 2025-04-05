import 'package:flutter/material.dart';

class EcommerceDashboard extends StatelessWidget {
  const EcommerceDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.pink[600],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.shopping_bag, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 8),
              const Text(
                'Ready\neCommerce',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
        
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
      body: SafeArea(
        child: Column(
          children: [
        
            _buildOrderOverview(),
            _buildSalesInfo(),
          ],
        ),
      ),
    );
  }

 

  Widget _buildOrderOverview() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'ORDER OVERVIEW',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Icon(Icons.arrow_forward, color: Colors.purple[400]),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildOrderCard(
                  '4',
                  'Pending Orders',
                  const Color(0xFFFEEDDD),
                  Colors.orange[300]!,
                  Icons.hourglass_empty,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildOrderCard(
                  '1',
                  'Today\'s Orders',
                  const Color(0xFFE8F7F8),
                  Colors.teal[300]!,
                  Icons.receipt,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildOrderCard(
                  '0',
                  'To Pickup',
                  const Color(0xFFF0E9FF),
                  Colors.purple[400]!,
                  Icons.inventory,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildOrderCard(
                  '1',
                  'To Delivery',
                  const Color(0xFFE4F2FF),
                  Colors.blue[400]!,
                  Icons.local_shipping_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderCard(String count, String title, Color bgColor, Color iconColor, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                count,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  '\$0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Withdrawable Amount',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40,
            color: Colors.grey[700],
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  '\$0.00',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Sales This Month',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}


Widget _buildBottomNavigationBar(int selectedIndex, Function(int) onTap) {
  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.grid_view, 'label': 'Dashboard'},
    {'icon': Icons.shopping_basket_outlined, 'label': 'Orders'},
    {'icon': Icons.account_balance_wallet_outlined, 'label': 'Wallet'},
    {'icon': Icons.person_outline, 'label': 'Profile'},
  ];

  return Container(
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 10,
          offset: const Offset(0, -5),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(navItems.length, (index) {
        final item = navItems[index];
        final isActive = selectedIndex == index;
        return GestureDetector(
          onTap: () => onTap(index),
          child: _buildNavItem(
            item['icon'],
            item['label'],
            isActive,
          ),
        );
      }),
    ),
  );
}

Widget _buildNavItem(IconData icon, String label, bool isActive) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: isActive ? Colors.pink[50] : Colors.transparent,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: isActive ? Colors.pink[400] : Colors.grey[400],
          size: 22,
        ),
        if (isActive) ...[
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: Colors.pink[400],
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ],
    ),
  );
}
