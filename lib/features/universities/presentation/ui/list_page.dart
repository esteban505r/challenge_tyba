import 'package:challenge_tyba/core/utils/utils.dart';
import 'package:challenge_tyba/features/universities/data/model/university_model.dart';
import 'package:challenge_tyba/features/universities/presentation/bloc/list_type/list_type_bloc.dart';
import 'package:challenge_tyba/features/universities/presentation/bloc/universities/universities_bloc.dart';
import 'package:challenge_tyba/features/universities/presentation/ui/university_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appName),
          actions: [
            IconButton(
                onPressed: () {
                  var listType = 0;
                  var bloc = BlocProvider.of<ListTypeBloc>(context);
                  if (bloc.state.listType == 0) {
                    bloc.add(ChangeListTypeEvent(type: 1));
                  } else {
                    bloc.add(ChangeListTypeEvent(type: 0));
                  }
                },
                icon: const Icon(Icons.switch_access_shortcut_add_outlined))
          ],
        ),
        body: BlocBuilder<ListTypeBloc, ListTypeState>(
          builder: (context, bloc) => _getList(context, bloc.listType),
        ));
  }

  Widget _getList(BuildContext context, int listType) {
    return BlocBuilder<UniversityBloc, UniversitiesState>(
        bloc: BlocProvider.of(context)..add(GetUniversitiesEvent()),
        builder: (context, state) {
          if (state is UniversitiesSuccessfulState) {
            if (listType == 0) {
              return _createListView(state.universities ?? []);
            } else {
              return _createGridView(state.universities ?? []);
            }
          }
          if (state is UniversitiesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        });
  }

  Widget _createGridView(List<UniversityModel> universities) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        itemBuilder: (context, index) {
          var item = universities[index];
          var ramdomImage = "assets/images/${Utils.randomUniversityImage()}";
          return Container(
            height: 180,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            UniversityDetailPage(item, ramdomImage)));
              },
              child: Card(
                  child: Column(
                children: [
                  Image.asset(
                    "assets/images/${Utils.randomUniversityImage()}",
                    height: 120,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Flexible(
                        child: Text(
                      item.name ?? "",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w600, fontSize: 13),
                    )),
                  )
                ],
              )),
            ),
          );
        },
        itemCount: universities.length,
      ),
    );
  }

  Widget _createListView(List<UniversityModel> universities) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = universities[index];
        var ramdomImage = "assets/images/${Utils.randomUniversityImage()}";
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 200,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            UniversityDetailPage(item, ramdomImage)));
              },
              child: Card(
                child: Column(
                  children: [
                    Image.asset(
                      ramdomImage,
                      height: 150,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: Text(
                            item.name ?? "",
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          )),
                          Text(
                            item.country ?? "",
                            style: GoogleFonts.nunito(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount: universities.length,
    );
  }
}
