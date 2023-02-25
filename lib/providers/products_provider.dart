// This is a mixin - merging of some properites/methods in
// existing class

import 'package:flutter/material.dart';

import '../models/product.dart';


class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
        id: 'o1',
        title: 'Baby Otter',
        description: 'Adorable baby otter in a tub',
        price: 39.99,
        imageUrl:
            'https://external-preview.redd.it/YGAt4FhuhmpfuGrlcqWrCnqqM5WGnsu5wPsbUk-SrVU.jpg?width=640&crop=smart&auto=webp&s=455a9d90ae06f9509402b1a212559180f5b218e3'),
    Product(
        id: 'o2',
        title: 'Otter guitarist',
        description: 'Otter holding a guitar!',
        price: 20.99,
        imageUrl:
            'https://preview.redd.it/3rfebt064zfz.jpg?width=640&crop=smart&auto=webp&s=3101ce3f41d795dd589ad2cc52c3e5f37cc28a1d'),
    Product(
        id: 'o3',
        title: 'Babies',
        description: 'Three cute baby otters!',
        price: 15.95,
        imageUrl:
            'https://www.southernliving.com/thmb/4sLCEg5kriwP0njIowTWj33tCo4=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/295668493_418356233610412_1346361379093055660_n-2000-fffca2f9314e48e0a6b956d3e95c47f5.jpg'),
    Product(
        id: 'o4',
        title: 'Otter sleeping',
        description: 'Sleeping sea otter',
        price: 14.5,
        imageUrl:
            'https://metro.co.uk/wp-content/uploads/2013/01/ay_102510013.jpg?quality=90&strip=all&w=1000&h=630&crop=1'),
  ];


  List<Product> get items {
    return [..._items]; // copy of _items object, if I return _items i would return a pointer
  }

  Product findById(String id){
    return _items.firstWhere((element) => element.id == id);
  }
  
  void addProduct() {
    // _items.add();
    notifyListeners(); // Notify listeners depending on certain resource that it has been changed
  }
}
