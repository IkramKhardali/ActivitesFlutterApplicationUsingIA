import 'package:flutter/material.dart';

class ActivityDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> activityDetails;

  ActivityDetailsScreen(this.activityDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Details'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                activityDetails['titre'],
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 20),
              _buildDetailCard('Lieu', activityDetails['lieu']),
              _buildDetailCard('Prix', '\$${activityDetails['prix']}'),
              _buildDetailCard('Nombre Minimum', '${activityDetails['nombreMinimum']}'),
              _buildDetailCard('Catégorie', activityDetails['categorie']),
              _buildDetailCard('Date de création', activityDetails['createAt'].toDate().toString()),
              SizedBox(height: 20),
              // Display the activity image
              activityDetails['image'] != null
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          activityDetails['image'],
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(), // Placeholder if no image available
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailCard(String label, String value) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}