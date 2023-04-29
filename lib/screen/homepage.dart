import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../contoller/theamcontroller.dart';

import '../helper/apihelpers.dart';

import '../model/apimodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<String> currencyCode = [
    "AFN",
    "ALL",
    "DZD",
    "USD",
    "EUR",
    "AOA",
    "XCD",
    "ARS",
    "AMD",
    "AWG",
    "AUD",
    "EUR",
    "AZN",
    "BSD",
    "BHD",
    "BDT",
    "BBD",
    "BYR",
    "EUR",
    "BZD",
    "XOF",
    "BMD",
    "BTN",
    "BOB",
    "BAM",
    "BWP",
    "NOK",
    "BRL",
    "BND",
    "BGN",
    "XOF",
    "BIF",
    "KHR",
    "XAF",
    "CAD",
    "CVE",
    "KYD",
    "XAF",
    "CLP",
    "CNY",
    "AUD",
    "COP",
    "KMF",
    "NZD",
    "CRC",
    "HRK",
    "CUP",
    "CYP",
    "CZK",
    "CDF",
    "DKK",
    "DJF",
    "DOP",
    "EGP",
    "SVC",
    "XAF",
    "ERN",
    "EEK",
    "ETB",
    "FKP",
    "DKK",
    "FJD",
    "EUR",
    "XPF",
    "XAF",
    "GMD",
    "GEL",
    "EUR",
    "GHC",
    "GIP",
    "GTQ",
    "GNF",
    "XOF",
    "GYD",
    "HTG",
    "AUD",
    "HNL",
    "HKD",
    "HKD",
    "ISK",
    "INR",
    "IDR",
    "IRR",
    "IQD",
    "ILS",
    "XOF",
    "JMD",
    "JPY",
    "JOD",
    "KZT",
    "KES",
    "KWD",
    "KGS",
    "LAK",
    "LVL",
    "LBP",
    "LSL",
    "LRD",
    "LYD",
    "CHF",
    "LTL",
    "MOP",
    "MKD",
    "MGA",
    "MWK",
    "MYR",
    "MVR",
    "XOF",
    "MTL",
    "MRO",
    "ZWD",
    "ZMK",
    "YER",
    "MAD",
    "XPF",
    "VND",
    "VEF",
    "VUV",
    "UZS",
    "UYU",
    "GBP",
    "AED",
    "UAH",
    "UGX",
    "TMM",
    "TRY",
    "TND",
    "TTD",
    "TOP",
    "NZD",
    "XOF",
    "THB",
    "TZS",
    "TJS",
    "TWD",
    "SYP",
    "CHF",
    "SEK",
    "SZL",
    "SRD",
    "SDD",
    "LKR",
    "KRW",
    "GBP",
    "ZAR",
    "SOS",
    "SBD",
    "SKK",
    "SGD",
    "SLL",
    "SCR",
    "RSD",
    "XOF",
    "SAR",
    "WST",
    "SHP",
    "RWF",
    "RUB",
    "RON",
    "PLN",
    "NZD",
    "PHP",
    "PEN",
    "PYG",
    "PGK",
    "PAB",
    "ILS",
    "PKR",
    "OMR",
    "KPW",
  ];

  late Future<CurrencyConvert?> future;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    future = CurrencyConvertAPI.currencyConvertAPI
        .currencyConvertorAPI(from: "USD", to: "INR", amount: 1);

    textEditingController.text = "1";
  }

  String fromCurrency = "USD";
  String toCurrency = "INR";

  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffE5E4E2),
        centerTitle: true,
        title: const Text("Currency Convertor",style: TextStyle( color: Colors.black)),
        actions: [
          IconButton(
            onPressed: () {
              themeController.themeMode(false);
              setState(() {});
            },
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode_rounded,color: Colors.black),
          ),
        ],
      ),
      body: FutureBuilder(
        future: future,
        builder: (context, snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Text(
                "${snapShot.error}",
              ),
            );
          } else if (snapShot.hasData) {
            CurrencyConvert? data = snapShot.data;

            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  SizedBox(
                    height: h * 0.03,
                  ),
                  const Text(
                    "Amount : ",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "From",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                value: fromCurrency,
                                onChanged: (val) {
                                  setState(() {
                                    fromCurrency = val!;
                                  });
                                },
                                items: currencyCode.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "To",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              DropdownButtonFormField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                value: toCurrency,
                                onChanged: (val) {
                                  setState(() {
                                    toCurrency = val!;
                                  });
                                },
                                items: currencyCode.map((e) {
                                  return DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: h * 0.1,
                    width: w * 0.7,
                    decoration: BoxDecoration(
                      color: Color(0xff728FCE),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Result: ${data!.result}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      int amt = int.parse(textEditingController.text);
                      setState(() {
                        future = CurrencyConvertAPI.currencyConvertAPI
                            .currencyConvertorAPI(
                          from: fromCurrency,
                          to: toCurrency,
                          amount: amt,
                        );
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: h * 0.07,
                      width: w * 0.7,
                      decoration: BoxDecoration(
                        color: Color(0xff728FCE),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "CONVERT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
       backgroundColor: Color(0xffDBE9FA),
    );
  }
}