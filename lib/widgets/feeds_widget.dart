import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:store_api_flutter_course/services/api.dart';
import 'package:store_api_flutter_course/services/product.dart';

class FeedsWidget extends StatefulWidget {
  const FeedsWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedsWidgetState createState() => _FeedsWidgetState();
}

class _FeedsWidgetState extends State<FeedsWidget> {
  late Future<Product> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    fetchProducts();

    return Scaffold(
        appBar: AppBar(
          title: Text('products'),
        ),
        body: Center(
          child: Column(
            children: [
              FutureBuilder<Product>(
                future: futureProducts,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data!.title,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Image.network(
                            width: 230,
                            snapshot.data!.image,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Price: \$${snapshot.data!.price.toString()}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                },
              ),
            ],
          ),
        ));
  }
}
