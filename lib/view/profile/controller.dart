

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:country_state_city/country_state_city.dart';

import '../../core/widgets/text_widgets.dart';
import '../../core/widgets/widgets.dart';


class ProfileController extends GetxController {
  var selectedOption = (-1).obs;
  var selectedUnit = ''.obs;
  var selectedWeightUnit = 'kg'.obs;
  var selectedEthnicity = ''.obs;
  var selectedDietaryPreference = ''.obs;
  var smokingStatus = ''.obs;
  var alcoholConsumption = ''.obs;
  var menopauseStatus = ''.obs;
  RxString selectedCountry = "".obs;



  final selectedCountryIso = ''.obs; // holds the ISO2 code
  final selectedCity = ''.obs;
  final cityList = <String>[].obs;

  final selectedState = ''.obs;


  final selectedStateCode = ''.obs;


  void selectOption(int index) {
    selectedOption.value = index;
  }

  //
  // void pickCity(BuildContext context) async {
  //   if (selectedCountryIso.isEmpty) {
  //     Get.snackbar("Error", "Please select a country first");
  //     return;
  //   }
  //
  //   final allCities = await getCountryCities(selectedCountryIso.value);
  //   final searchController = TextEditingController();
  //   final filteredCities = RxList<String>.from(
  //     allCities.map((e) => e.name ?? '').where((n) => n.isNotEmpty),
  //   );
  //
  //   cityList
  //     ..clear()
  //     ..addAll(filteredCities);
  //
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //     ),
  //     builder: (_) {
  //       final screenHeight = MediaQuery
  //           .of(context)
  //           .size
  //           .height;
  //
  //       return SizedBox(
  //         height: screenHeight * 0.7, // ✅ 70% height
  //         child: Padding(
  //           padding: const EdgeInsets.only(
  //               top: 16, left: 16, right: 16, bottom: 32),
  //           child: Column(
  //             children: [
  //               TextField(
  //                 style: TextStyle(color: Colors.black,fontFamily: "Montserrat",fontSize: 14),
  //                 controller: searchController,
  //                 decoration: InputDecoration(
  //
  //                   hintText: 'Search city',
  //                   prefixIcon: Icon(Icons.search),
  //
  //                   enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius: BorderRadius.circular(12)),
  //                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
  //                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
  //
  //                   border: OutlineInputBorder(
  //                       borderSide: BorderSide(color: Colors.grey),
  //                       borderRadius: BorderRadius.circular(12)),
  //                 ),
  //                 onChanged: (query) {
  //                   filteredCities.value = cityList
  //                       .where((c) =>
  //                       c.toLowerCase().contains(query.toLowerCase()))
  //                       .toList();
  //                 },
  //               ),
  //               const SizedBox(height: 16),
  //               Expanded(
  //                 child: Obx(() =>
  //                     ListView(
  //                       children: filteredCities.map((city) {
  //                         return ListTile(
  //                           leading: Texts.textNormal(
  //                               city, size: 14, color: Colors.black),
  //                           onTap: () {
  //                             selectedCity.value = city;
  //                             Navigator.pop(context);
  //                           },
  //                         );
  //                       }).toList(),
  //                     )),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }


  void pickCountry(BuildContext context) async {
    final countries = await getAllCountries();
    final searchController = TextEditingController();
    final filteredCountries = RxList<Country>.from(countries);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) {
        final screenHeight = MediaQuery
            .of(context)
            .size
            .height;

        return SizedBox(
          height: screenHeight * 0.5, //
          child: Padding(
            padding: const EdgeInsets.only(
                top: 16, left: 16, right: 16, bottom: 32),
            child: Column(
              children: [

                TextField(
                  style: TextStyle(color: Colors.black,fontFamily: "Montserrat",fontSize: 14),
                  controller: searchController,
                  decoration: InputDecoration(

                    hintText: 'Search country',
                    prefixIcon: Icon(Icons.search),

                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,),borderRadius: BorderRadius.circular(12)),
                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey),borderRadius: BorderRadius.circular(12)),

                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onChanged: (query) {
                    filteredCountries.value = countries
                        .where((c) =>
                        c.name.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Obx(() =>
                      ListView(
                        children: filteredCountries.map((country) {
                          final flagUrl =
                              "https://flagcdn.com/48x36/${country.isoCode
                              .toLowerCase()}.png";
                          return GestureDetector(
                            onTap: () {
                              selectedCountry.value = country.name;
                              selectedCountryIso.value = country.isoCode;
                              selectedCity.value = '';
                              cityList.clear();
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Image.network(
                                  flagUrl,
                                  width: 32,
                                  height: 24,
                                  errorBuilder: (_, __, ___) =>
                                      Texts.textNormal(
                                          country.name.characters.first,
                                          size: 14
                                      ),

                                ),
                                Widgets.widthSpaceW2,
                                Expanded(child: Texts.textNormal(country.name, size: 14,textAlign: TextAlign.start),),



                              ],),
                            ),
                          );
                        }).toList(),
                      )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
