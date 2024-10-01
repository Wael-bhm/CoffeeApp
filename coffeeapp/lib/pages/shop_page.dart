import 'package:coffeeapp/components/coffee_tile.dart';
import 'package:coffeeapp/models/coffee.dart';
import 'package:coffeeapp/models/coffee_shop.dart';
import 'package:coffeeapp/pages/nombre_cafe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> with SingleTickerProviderStateMixin {
  // TabController to manage the tabs
  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // 3 tabs: Coffee, Tea, Others
  }
  List<Coffee> _getFilteredCoffees(List<Coffee> coffees) {
  if (_searchQuery.isEmpty) {
    return coffees; // If the search query is empty, show all coffees
  } else {
    return coffees
        .where((coffee) => coffee.name.toLowerCase().contains(_searchQuery))
        .toList(); // Filter coffees by name
  }
}


  // Function to navigate to the coffee selection page
  void navigate(Coffee coffee) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Nombrecafe(coffee: coffee)));
  }

  @override
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('CACTUS COFFEE SHOP'),
      bottom: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Coffee'),
          Tab(text: 'Tea'),
          Tab(text: 'Others'),
        ],
      ),
    ),
    drawer: Drawer(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:30.0,bottom: 30),
            child: Image.asset('images/drawerimage.png'),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Cart'),
            onTap: () {
              // Add action here to navigate to the cart page
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Action to navigate to home page
            },
          ),
        ],
      ),
    ),
    body: TabBarView(
      controller: _tabController,
      children: [
        // Coffee Tab
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Consumer<CoffeeShop>(
            builder: (context, value, child) => SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Search bar
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search Coffee',
                        hintText: 'Enter coffee name',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onChanged: (query) {
                        setState(() {
                          _searchQuery = query.toLowerCase(); // Update search query
                        });
                      },
                    ),
                    const SizedBox(height: 25),

                    const Text(
                      "How would you like your coffee?",
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(height: 25),

                    // Filtered list of coffees based on search query
                    Expanded(
                      child: ListView.builder(
                        itemCount: _getFilteredCoffees(value.coffeshop).length,
                        itemBuilder: (context, index) {
                          Coffee eachCoffee = _getFilteredCoffees(value.coffeshop)[index];
                          return CoffeeTile(
                            coffee: eachCoffee,
                            onPressed: () => navigate(eachCoffee), // Navigate to Nombrecafe
                            icon: const Icon(Icons.add),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // Tea Tab
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.local_drink, size: 100, color: Colors.brown),
              SizedBox(height: 20),
              Text(
                'Explore Tea Varieties!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text('Tea selection coming soon...', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),

        // Others Tab
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.fastfood, size: 100, color: Colors.brown),
              SizedBox(height: 20),
              Text(
                'Discover Other Items!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text('Other items selection coming soon...', style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ],
    ),
  );
}

}
