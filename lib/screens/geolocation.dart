import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';


class EventGeolocator extends StatefulWidget{
  @override
  _EventGeolocatorState createState() => _EventGeolocatorState();
  
}
  
class _EventGeolocatorState extends State<EventGeolocator> {
  List<Placemark> placemark = [];
  bool load = false;
  Future<List<Placemark>> addrlist() async {
    placemark = await Geolocator().placemarkFromAddress("Vp 23 22, Feira de Santana");
    return placemark;
  }
  Set<Marker> _markers = HashSet<Marker>();
  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;
  
  @override
  void initState(){
    //_setMarkerIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {   
    return FutureBuilder<List<Placemark>>(
      future: addrlist(),
      builder: (BuildContext context,AsyncSnapshot<List<Placemark>> snapshot){
        Widget children;
        if(snapshot.hasData){
          children = getLoc();
        }
        else{
          children = Scaffold(
            body:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Carregando Mapa..."),
                  )
                ]
              ),
            )
          );
        }
        return Material(
            child: children
        );
      }     
    );
  }

  void _setMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),"images/glasswine.png")
      .then((value){
        _markerIcon = value;
      });
  }

  void _onMapCreated(GoogleMapController controller){
    _mapController = controller;
  
    setState((){
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(placemark[0].position.latitude, placemark[0].position.longitude),
          infoWindow: InfoWindow(
            title:"evento",
            snippet: "seu evento",
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet)
        )
      );
    });
  }
  Widget getLoc(){
    return  Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
              //mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(placemark[0].position.latitude, placemark[0].position.longitude),
              zoom: 18
            ),
            markers: _markers,
          ),

          
      ],
    )
    );
  }
}

