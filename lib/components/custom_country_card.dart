import 'package:aidhere_app/components/custom_cached_image.dart';
import 'package:aidhere_app/models/country_model.dart';
import 'package:aidhere_app/theme/style.dart';
import 'package:aidhere_app/utilits/custom_spacing.dart';
import 'package:flutter/material.dart';

class CustomCountryCard extends StatelessWidget {

  final CountryModel countryModel;
  final VoidCallback onTap;

  const CustomCountryCard({Key key, this.countryModel, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: CustomSpacing.spacing32, right: CustomSpacing.spacing32),
      child: InkWell(
        onTap: onTap,
        child: Card(
            elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: SizedBox(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  child: CustomCachedImage(
                    image: 'https://res.cloudinary.com/crunchbase-production/image/upload/c_lpad,f_auto,q_auto:eco,dpr_1/ndrhwvp9pdybnls4cuce',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: CustomSpacing.spacing20, left: CustomSpacing.spacing12, right: CustomSpacing.spacing12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      countryModel.name,
                      style: webCountryName,
                    ),
                    const SizedBox(
                      height: CustomSpacing.spacing20,
                    ),
                    Text('Population: ${countryModel.getPopulation()}', style: description,),
                    const SizedBox(
                      height: CustomSpacing.spacing12,
                    ),
                    Text('Region: ${countryModel.region}', style: description,),
                    const SizedBox(
                      height: CustomSpacing.spacing12,
                    ),
                    Text('Capital: ${countryModel.capital}', style: description,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
