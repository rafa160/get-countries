import 'package:aidhere_app/blocs/country_bloc.dart';
import 'package:aidhere_app/screens/home/home_module.dart';
import 'package:flutter/material.dart';

class CustomRegionCard extends StatelessWidget {

  var countryBLoc = HomeModule.to.getBloc<CountryBloc>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: SizedBox(
          height: 60,
          width:
          MediaQuery.of(context).size.width * 0.4,
          child: PopupMenuButton(
              child: const Padding(
                padding: EdgeInsets.only(top: 20, left: 12),
                child: Text('Filter by Region'),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      'Africa',
                    ),
                    onTap: () async  {
                      countryBLoc.fetch(value: 'Africa', index: 1);
                    },
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      'America',
                    ),
                    onTap: () async  {
                      countryBLoc.fetch(value:'Americas',index: 1);
                    },
                  ),
                  value: 2,
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      'Asia',
                    ),
                    onTap: () async  {
                      countryBLoc.fetch(value: 'Asia',index: 1);
                    },
                  ),
                  value: 3,
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      'Europe',
                    ),
                    onTap: () async  {
                      countryBLoc.fetch(value: 'Europe',index: 1);
                    },
                  ),
                  value: 4,
                ),
                PopupMenuItem(
                  child: ListTile(
                    title: const Text(
                      'Oceania',
                    ),
                    onTap: () async  {
                      countryBLoc.fetch(value: 'Oceania',index: 1);
                    },
                  ),
                  value: 5,
                ),
              ])),
    );
  }
}
