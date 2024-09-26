import 'package:eshop/Helper/Color.dart';
import 'package:eshop/Model/Section_Model.dart';
import 'package:eshop/app/routes.dart';
import 'package:flutter/material.dart';

import '../../../Helper/Session.dart';
import '../../../ui/styles/DesignConfig.dart';

class FeaturedProductItem extends StatelessWidget {
  const FeaturedProductItem({
    super.key,
    required this.price,
    required this.offerPersontage,
    required this.product,
    required this.sectionPosition,
    required this.index,
  });

  final double price;
  final String? offerPersontage;
  final Product product;
  final int sectionPosition;
  final int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;

    return Card(
      elevation: 0.0,
      color: const Color.fromARGB(255, 233, 233, 233).withOpacity(0.5),
      margin: const EdgeInsetsDirectional.only(bottom: 2, end: 2),
      //end: pad ? 5 : 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 15),
            Expanded(
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    clipBehavior: Clip.none,
                    children: [
                      networkImageCommon(product.image!, width, false,
                          height: double.maxFinite, width: double.maxFinite),
                      product.availability == "0"
                          ? Container(
                              constraints: const BoxConstraints.expand(),
                              color: Theme.of(context).colorScheme.white70,
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(2),
                              child: Center(
                                child: Text(
                                  getTranslated(context, 'OUT_OF_STOCK_LBL')!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 10.0, top: 5, end: 5.0),
              child: Text(
                product.name!,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Theme.of(context).colorScheme.lightBlack),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
                padding: const EdgeInsetsDirectional.only(start: 10.0, top: 2),
                child: Text(
                    product.isSalesOn == "1"
                        ? getPriceFormat(
                            context,
                            double.parse(
                                product.prVarientList![0].saleFinalPrice!))!
                        : '${getPriceFormat(context, price)!} ',
                    style: const TextStyle(
                        fontSize: 11.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold))),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 10.0, bottom: 8, top: 2),
              child: offerPersontage != "0.00"
                  ? double.parse(product.prVarientList![0].disPrice!) != 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              double.parse(product
                                          .prVarientList![0].disPrice!) !=
                                      0
                                  ? getPriceFormat(
                                      context,
                                      double.parse(
                                          product.prVarientList![0].price!))!
                                  : "",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      letterSpacing: 0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .fontColor
                                          .withOpacity(0.6)),
                            ),
                            // Flexible(
                            //   child: Text(
                            //       " | "
                            //       "-${product.isSalesOn == "1" ? double.parse(product.saleDis!).toStringAsFixed(2) : offerPersontage}%",
                            //       maxLines: 1,
                            //       overflow: TextOverflow.ellipsis,
                            // style: Theme.of(context)
                            //     .textTheme
                            //     .labelSmall!
                            //     .copyWith(
                            //         color: Theme.of(context)
                            //             .colorScheme
                            //             .primarytheme,
                            //         letterSpacing: 0)),
                            // ),
                          ],
                        )
                      : Container(
                          height: 5,
                        )
                  : const SizedBox.shrink(),
            ),
            const Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 35,
              child: TextButton.icon(
                style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: () {
                  Product model = product;
                  // currentHero = homeHero;
                  print("GOING TO ROUTER");
                  Navigator.pushNamed(context, Routers.productDetails,
                      arguments: {
                        "secPos": sectionPosition,
                        "index": index,
                        "list": false,
                        "id": model.id!,
                      });
                  // if (_isProgress == false) {
                  //   addToCart(
                  //       index,
                  //       (int.parse(_controller[index].text) +
                  //               int.parse(model.qtyStepSize!))
                  //           .toString(),
                  //       2);
                  // }
                },
                label: Text(
                  "Add to cart",
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                      ),
                ),
                icon: Image.asset(
                  'assets/images/home/cart.png',
                  color: Colors.green,
                  width: 10,
                ),
              ),
            ),
          ],
        ),
        onTap: () {
          Product model = product;
          // currentHero = homeHero;
          print("GOING TO ROUTER");
          Navigator.pushNamed(context, Routers.productDetails, arguments: {
            "secPos": sectionPosition,
            "index": index,
            "list": false,
            "id": model.id!,
          });

          // Navigator.push(
          //   context,
          //   PageRouteBuilder(
          //       // transitionDuration: Duration(milliseconds: 150),
          //       pageBuilder: (_, __, ___) => ProductDetail(
          //             secPos: sectionPosition,
          //             index: index,
          //             list: false,
          //             id: model.id!,
          //
          //             //  title: featuredSectionList[secPos].title,
          //           )),
          // );
        },
      ),
    );
  }
}
