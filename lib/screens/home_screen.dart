import 'package:crypto_market/controllers/coin_controller.dart';
import 'package:crypto_market/utlis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CoinController controller = Get.put(CoinController());
    return Scaffold(
      backgroundColor: const Color(0xff494F55),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CryptoMarket",
                style: textStyle(25, Colors.white, FontWeight.bold),
              ),
              Obx(
                () => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[700],
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey[700]!,
                                                offset: const Offset(4, 4),
                                                blurRadius: 5,
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Image.network(controller
                                                .coinsList[index].image),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              controller.coinsList[index].name,
                                              style: textStyle(18, Colors.white,
                                                  FontWeight.w600),
                                            ),
                                            Text(
                                              "${controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                              style: textStyle(18, Colors.grey,
                                                  FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$ ${controller.coinsList[index].currentPrice.round()}",
                                          style: textStyle(18, Colors.white,
                                              FontWeight.w600),
                                        ),
                                        Text(
                                          controller.coinsList[index].symbol
                                              .toUpperCase(),
                                          style: textStyle(
                                              18, Colors.grey, FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ]),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
