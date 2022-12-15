import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genotechies_app/models/shop_model.dart';
import 'package:genotechies_app/theme/constants.dart';
import 'package:genotechies_app/views/auth/auth_controll_view.dart';
import 'package:genotechies_app/widgets/main_button.dart';
import 'package:genotechies_app/widgets/main_loader.dart';
import 'package:genotechies_app/widgets/shop_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Shops"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: defaultHeight * 4,
              ),
              MainButton(
                text: "Sign out",
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AutControllView()));
                },
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("shops").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const MainLoader();
          } else {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  ShopModel shopModel = ShopModel.fromDocumentSnapshot(
                      snapshot.data!.docs[index]);
                  return ShopCard(
                    shop: shopModel,
                  );
                });
          }
        },
      ),
    );
  }
}
