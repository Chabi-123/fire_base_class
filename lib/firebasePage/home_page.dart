import 'package:fire_base_class/Model/model_class.dart';
import 'package:fire_base_class/Services/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class PlacesListScreen extends StatelessWidget {
  PlacesServices _services = PlacesServices();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.toNamed('/add');
            },
          ),
        ],
      ),
      body: StreamBuilder<List<PlaceModel>>(
        stream: _services.fetchPlaces(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final places = snapshot.data!;
          return ListView.builder(
            itemCount: places.length,
            itemBuilder: (context, index) {
              final place = places[index];
              return ListTile(
                title: Text(place.name),
                subtitle: Text(place.location),
                leading: Image.network(place.imageUrl),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.toNamed('/update', arguments: place);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await _services.deletePlace(place.id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

