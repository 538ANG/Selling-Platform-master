
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//TODO: create cart class

 class Cart   {
  String UserID;
  String ProductIDs;
  int TotalPrice;
  var CreationDate;
  var LastUpdateDate;

  void addProdcutToCart() {
    print("Product Added to Cart");
  }
     void removeProdcutFromCart(){
     print("Product removed to Cart");}

     void EmptyCart(){
       print("Products Removed from Cart");}

       void SaveCartStatusInCLoud(){
         print("Cart Status Saved in Cloud");}

         void UpdateLastUpdateDate() {
           print("var LastUpdateDate updated");
         }
         void AgeCalculator() {
        print("age difference calculated");}
      }


/*
Contains the cart class with all of its attributes and functions:
Attributes: - Cart owner -> UserID
            - current products in cart -> productIDs
            - total price -> summation of all products' prices currently in cart
            - date created
            - date last updated
            -

Methods:    - add a product to cart
            - remove  a product
            - empty cart
            - save cart status in cloud
            - update 'date last updated' variable
            - age calculator -> diff. between creation and current timestamps
*/