import 'package:aidhere_app/blocs/country_bloc.dart';
import 'package:aidhere_app/components/custom_country_card.dart';
import 'package:aidhere_app/components/custom_region_card.dart';
import 'package:aidhere_app/components/custom_reload_button.dart';
import 'package:aidhere_app/components/mobile_appbar.dart';
import 'package:aidhere_app/components/mobile_search.dart';
import 'package:aidhere_app/components/web_appbar_content.dart';
import 'package:aidhere_app/models/country_model.dart';
import 'package:aidhere_app/screens/country_details/country_details_module.dart';
import 'package:aidhere_app/screens/home/home_module.dart';
import 'package:aidhere_app/theme/style.dart';
import 'package:aidhere_app/theme/widget_app_theme.dart';
import 'package:aidhere_app/utilits/custom_spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var countryBLoc = HomeModule.to.getBloc<CountryBloc>();

  @override
  void initState() {
    countryBLoc.fetchFromJson();
    // countryBLoc.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: isDarkTheme != true ? Colors.grey[200] :  const Color(0xff545454),
          appBar: constraints.maxWidth < 800
              ? PreferredSize(
                  child: MobileAppbar(
                    onPressed: () {
                      _switchThemeAction(isDarkTheme);
                    },
                    icon: const FaIcon(FontAwesomeIcons.moon,size: 14,),
                    text: isDarkTheme == true ? 'Dark Mode' : 'Light Mode',
                  ),
                  preferredSize: const Size(double.infinity, 56),
                )
              : AppBar(
                  title: Text('Where in the World?', style: appbar),
                  actions: [
                    IconButton(
                      onPressed: () {
                        _switchThemeAction(isDarkTheme);
                      },
                      icon: const FaIcon(FontAwesomeIcons.moon,size: 14,),
                    ),
                    isDarkTheme == true
                        ? Center(child: Text('Dark Mode', style: appbar,))
                        : Center(child: Text('Light Mode', style: appbar,)),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                constraints.maxWidth < 800
                    ? PreferredSize(
                        preferredSize: const Size(double.infinity, 56),
                        child: SearchBar(
                          width: MediaQuery.of(context).size.width,
                          widget: Row(
                            children: [
                              Container(
                                width: CustomSpacing.spacing20,
                              ),
                              const Icon(Icons.search),
                              Container(
                                width: CustomSpacing.spacing12,
                              ),
                              const Text('Searh for a country...')
                            ],
                          ),
                        ),
                      )
                    : WebAppBarContent(
                        searchWidget: Row(
                          children: [
                            Container(
                              width: 20,
                            ),
                            const Icon(Icons.search),
                            Container(
                              width: CustomSpacing.spacing12,
                            ),
                            const Text('Searh for a country...')
                          ],
                        ),
                        expandedTile: CustomRegionCard(),
                      ),
                const SizedBox(
                  height: CustomSpacing.spacing20,
                ),
                constraints.maxWidth < 800
                    ? PreferredSize(
                        preferredSize: const Size(double.infinity, 56),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12, right: 12),
                              child: CustomRegionCard(),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                const SizedBox(
                  height: CustomSpacing.spacing20,
                ),
                FutureBuilder(
                    future: countryBLoc.fetchFromJson(),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return const CircularProgressIndicator();
                        default:
                          if (!snapshot.hasData || snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                   Text('Sorry something went wrong', style: appbar),
                                   CustomButton(
                                    text: 'reload',
                                    onPressed: () async {
                                      Get.offAll(
                                        () => HomeModule(),
                                      );
                                    },
                                  ),
                                ],
                              )),
                            );
                          }
                      }
                      return  GridView.builder(
                          gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 500,
                            crossAxisSpacing: 7,
                            mainAxisSpacing: 4,
                          ),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(vertical: 16, horizontal: constraints.maxWidth >= 1200 ? 0 :16),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            CountryModel country = snapshot.data[index];
                            return CustomCountryCard(
                              onTap: () async {
                                Get.to(() => CountryDetailsModule(countryModel: country));
                              },
                              countryModel: country,
                            );
                          });
                    }),
              ],
            ),
          ),
        );
      },
    );
  }

  void _switchThemeAction(bool isDarkTheme) {
    AppTheme.of(context)
        .setBrightness(isDarkTheme ? Brightness.light : Brightness.dark);
  }
}
