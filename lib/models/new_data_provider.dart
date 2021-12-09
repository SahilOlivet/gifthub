



import 'package:gifts_hub/models/universal_data_model.dart';

class NewDataModel extends UniversalDataModel {
  late String imageUrl;
  late String title ;
  late int price;
  late String description ;
  late String categories ;
  late int rating;
  late String length;
  late bool isLiked;



  NewDataModel({required this.imageUrl, required this.title, required this.price, required this.description,
      required this.categories, required this.rating, required this.length,required this.isLiked});


}
List<NewDataModel> newDataModelObject = [
  NewDataModel(imageUrl: 'https://i.pinimg.com/564x/dc/15/88/dc1588f423794f0235ba6c50379cb93b.jpg', title: 'Wedding Caricature',description: 'Creative customised caricature made by artists',categories: 'Wedding',length: '1:42',price:3499,rating:5,isLiked: false),
NewDataModel(imageUrl:'https://i.pinimg.com/564x/36/cf/90/36cf90539da8a69c3deee1d55840a5e9.jpg', title:'Wedding gift', price: 4999, description:'Customised gift', categories: 'Gift', rating: 4, length: '1:02',isLiked: false),
NewDataModel(imageUrl:'https://i.pinimg.com/564x/b9/8d/15/b98d151b8b1c9ecd549e17cafae4513a.jpg', title:'Wedding gift', price: 4999, description:'Customised gift', categories: 'Gift', rating: 4, length: '1:02',isLiked: false),
NewDataModel(imageUrl:'https://i.pinimg.com/564x/80/af/dc/80afdcfa07ec4b1ea70afe10aeedfd33.jpg', title:'Wedding gift', price: 4999, description:'Customised gift', categories: 'Gift', rating: 4, length: '1:02',isLiked: false),
NewDataModel(imageUrl:'https://i.pinimg.com/564x/48/5e/44/485e44cfe1e6abf4e19a8515d2a801ae.jpg', title:'Wedding gift', price: 4999, description:'Customised gift', categories: 'Gift', rating: 4, length: '1:02',isLiked: false),
NewDataModel(imageUrl:'https://i.pinimg.com/564x/a7/a0/c5/a7a0c5239d1651a15fc65c8dbba14731.jpg', title:'Wedding gift', price: 4999, description:'Customised gift', categories: 'Gift', rating: 4, length: '1:02',isLiked: false),
NewDataModel(imageUrl:'https://i.pinimg.com/564x/bb/88/cc/bb88cc8a7aaf4e3bf010c83088000b2f.jpg', title:'Wedding gift', price: 4999, description:'Customised gift', categories: 'Gift', rating: 4, length: '1:02',isLiked: false),
NewDataModel(imageUrl:'https://i.pinimg.com/564x/19/01/15/190115ba90f75052fd8cd0d4391b9eeb.jpg', title:'Wedding gift', price: 4999, description:'Customised gift', categories: 'Gift', rating: 4, length: '1:02',isLiked: false),


];
