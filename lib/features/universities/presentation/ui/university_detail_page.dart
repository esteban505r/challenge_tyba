import 'dart:io';

import 'package:challenge_tyba/features/universities/data/model/university_model.dart';
import 'package:challenge_tyba/features/universities/presentation/bloc/university_detail_bloc/university_detail_bloc.dart';
import 'package:challenge_tyba/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UniversityDetailPage extends StatelessWidget {
  final String image;
  final UniversityModel universityModel;
  final ImagePicker _picker = ImagePicker();

  UniversityDetailPage(this.universityModel, this.image, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UniversityDetailBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: double.infinity,
                      child: BlocBuilder<UniversityDetailBloc,
                          UniversityDetailState>(
                        builder: (context, state) {
                          return state.path == null
                              ? Image.asset(
                                  image,
                                  height: 200,
                                )
                              : Image.file(File(state.path!));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Opacity(
                        opacity: 0.3,
                        child: IconButton(
                            onPressed: () async {
                             var camera  = await  showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(AppLocalizations.of(context)!
                                              .changeImageQuestion),
                                          Row(
                                            children: [
                                              OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context,true);
                                                  },
                                                  child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .camera)),
                                              OutlinedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context,false);
                                                  },
                                                  child: Text(
                                                      AppLocalizations.of(
                                                              context)!
                                                          .gallery))
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  });
                             _changeImage(
                                     (p0) => {
                                   BlocProvider.of<
                                       UniversityDetailBloc>(
                                       context)
                                       .add(ChangeUniversityImageEvent(
                                       path: p0))
                                 },
                                 camera);
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              size: 40,
                              color: Colors.black,
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          universityModel.name ?? "",
                          style: GoogleFonts.nunito(
                              fontSize: 25, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${universityModel.country}",
                          style: GoogleFonts.nunito(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            AppLocalizations.of(context)!.webPages,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(
                                  universityModel.webPages?[index] ?? "");
                            },
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: universityModel.webPages?.length ?? 0,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            AppLocalizations.of(context)!.domains,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.nunito(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Text(
                                  universityModel.domains?[index] ?? "");
                            },
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: universityModel.domains?.length ?? 0,
                          ),
                        ),
                        TextField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            hintText: "# ${AppLocalizations.of(context)?.students}"
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
      }),
    );
  }

  Future<void> _changeImage(Function(String?) onSelect, bool camera) async {
    try {
      if (camera) {
        final XFile? image =
            await _picker.pickImage(source: ImageSource.camera);
        onSelect(image?.path);
      } else {
        final XFile? image =
            await _picker.pickImage(source: ImageSource.gallery);
        onSelect(image?.path);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
