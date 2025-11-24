import 'package:flutter/material.dart';
import '../widget/widget.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CURRENSY BEST COIN'),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 5,
        separatorBuilder:(context, index) => const Divider(),
        itemBuilder: (context, index) {
          return CryptoListTile();
        },
      ),
    );
  }
}