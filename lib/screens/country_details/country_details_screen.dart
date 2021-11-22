import 'package:aidhere_app/components/custom_button.dart';
import 'package:aidhere_app/components/custom_cached_image.dart';
import 'package:aidhere_app/components/mobile_appbar.dart';
import 'package:aidhere_app/models/country_model.dart';
import 'package:aidhere_app/theme/style.dart';
import 'package:aidhere_app/theme/widget_app_theme.dart';
import 'package:aidhere_app/utilits/custom_spacing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CountryDetailsScreen extends StatefulWidget {
  final CountryModel countryModel;

  const CountryDetailsScreen({Key key, this.countryModel}) : super(key: key);

  @override
  _CountryDetailsScreenState createState() => _CountryDetailsScreenState();
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: isDarkTheme != true ? Colors.grey[200] :  const Color(0xff545454),
        appBar: constraints.maxWidth < 800
            ? PreferredSize(
                child: MobileAppbar(
                  onPressed: () {
                    _switchThemeAction(isDarkTheme);
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.moon,
                    size: 14,
                  ),
                  text: isDarkTheme == true ? 'Dark Mode' : 'Light Mode',
                ),
                preferredSize: const Size(double.infinity, 56),
              )
            : AppBar(
                title: Text('Where in the World?', style: appbar),
                leading: Container(),
                titleSpacing: 0,
                actions: [
                  IconButton(
                    onPressed: () {
                      _switchThemeAction(isDarkTheme);
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.moon,
                      size: 14,
                    ),
                  ),
                  isDarkTheme == true
                      ? Center(
                          child: Text(
                          'Dark Mode',
                          style: appbar,
                        ))
                      : Center(
                          child: Text(
                          'Light Mode',
                          style: appbar,
                        )),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30),
                child: Row(
                  children: [
                    DefaultButtonWidget(
                        color: isDarkTheme != true
                            ? Colors.white
                            : const Color(0xff434343),
                        textColor: isDarkTheme != true
                            ? const Color(0xff434343)
                            : Colors.white,
                        iconColor: isDarkTheme != true
                            ? const Color(0xff434343)
                            : Colors.white,
                        icon: FontAwesomeIcons.arrowLeft,
                        text: 'Back',
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: CustomSpacing.spacing56, left: CustomSpacing.spacing12,right: CustomSpacing.spacing12),
                child: Row(
                  children: [
                    constraints.maxWidth > 800
                        ? Flexible(
                      flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: CustomSpacing.spacing20),
                              child: SizedBox(
                                height: 400,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: CustomCachedImage(
                                  image: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/ndrhwvp9pdybnls4cuce',
                                ),
                              ),
                            ),
                          )
                        : Flexible(
                            child: Container(
                              height: 300,
                              width: MediaQuery.of(context).size.width,
                              child: CustomCachedImage(
                                image: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/ndrhwvp9pdybnls4cuce',
                              ),
                            ),
                          ),
                    const SizedBox(
                      width: CustomSpacing.spacing80,
                    ),
                    constraints.maxWidth > 800 ?
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.countryModel.name, style: webCountryName,),
                            const SizedBox(
                              height: CustomSpacing.spacing32,
                            ),
                            Text('Native Name: ${widget.countryModel.getNativeName()}', style: description,),
                            const SizedBox(
                              height: CustomSpacing.spacing12,
                            ),
                            Text('Population: ${widget.countryModel.getPopulation()}', style: description),
                            const SizedBox(
                              height: CustomSpacing.spacing12,
                            ),
                            Text('Region: ${widget.countryModel.region}', style: description),
                            const SizedBox(
                              height: CustomSpacing.spacing12,
                            ),
                            Text('Sub Region: ${widget.countryModel.getSubRegion()}', style: description),
                            const SizedBox(
                              height: CustomSpacing.spacing12,
                            ),
                            Text('Capital: ${widget.countryModel.capital}', style: description),
                          ],
                        ) : Container(),
                  ],
                ),
              ),
              constraints.maxWidth < 800 ?
                  PreferredSize(
                    preferredSize: const Size(double.infinity, 56),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.countryModel.name, style: countryName,),
                          const SizedBox(
                            height: CustomSpacing.spacing32,
                          ),
                          Text('Native Name: ${widget.countryModel.getNativeName()}', style: description,),
                          const SizedBox(
                            height: CustomSpacing.spacing12,
                          ),
                          Text('Population: ${widget.countryModel.getPopulation()}', style: description),
                          const SizedBox(
                            height: CustomSpacing.spacing12,
                          ),
                          Text('Region: ${widget.countryModel.region}', style: description),
                          const SizedBox(
                            height: CustomSpacing.spacing12,
                          ),
                          Text('Sub Region: ${widget.countryModel.getSubRegion()}', style: description),
                          const SizedBox(
                            height: CustomSpacing.spacing12,
                          ),
                          Text('Capital: ${widget.countryModel.capital}', style: description),
                        ],
                      ),
                    )
                  ) : Container(),
            ],
          ),
        ),
      );
    });
  }

  void _switchThemeAction(bool isDarkTheme) {
    AppTheme.of(context)
        .setBrightness(isDarkTheme ? Brightness.light : Brightness.dark);
  }
}
