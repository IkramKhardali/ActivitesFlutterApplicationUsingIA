import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recognizeme_ia/Activites/CreateActivity.dart';
import 'package:recognizeme_ia/Activites/DetailActivity.dart';
import 'package:recognizeme_ia/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String selectedCategory = 'all';

  void _logout() async {
    await _auth.signOut();
  }

  void _filterByCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _filterByCategory('all'),
                child: Text('All'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _filterByCategory('Shopping'),
                child: Text('Shopping'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _filterByCategory('Sport'),
                child: Text('Sport'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('activite').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                var activities = snapshot.data!.docs
                    .map((doc) => doc.data() as Map<String, dynamic>)
                    .where((activity) {
                  var category = activity['categorie'].trim() ?? '';
                  return selectedCategory == 'all' || category == selectedCategory;
                }).toList();

                return ListView.builder(
                  itemCount: activities.length,
                  itemBuilder: (context, index) {
                    var activity = activities[index];

                    var imageUrl = activity['image'] ?? '';
                    var title = activity['titre'] ?? '';
                    var price = activity['prix'] ?? '';

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityDetailsScreen(activity),
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Container(
                          height: 150,
                          margin: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  image: DecorationImage(
                                    image: NetworkImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  color: Colors.black.withOpacity(0.5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        title,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\$$price',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Ajouter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CreateActivityScreen(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}