import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_2/Cubits/followers_cubit.dart';
import 'package:flutter_application_2/Cubits/followers_state.dart';
import 'package:flutter_application_2/Model/firebaseStorage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:image_picker/image_picker.dart';

class ProfileNavigationBar extends StatefulWidget {
  const ProfileNavigationBar({super.key});

  @override
  State<ProfileNavigationBar> createState() => _ProfileNavigationBarState();
}

class _ProfileNavigationBarState extends State<ProfileNavigationBar> {
  String? url;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 50),
      GestureDetector(
          onTap: () async {
            ImagePicker picker = ImagePicker();
            XFile? xfile = await picker.pickImage(source: ImageSource.camera);
            if (xfile != null) {
              File file = File(xfile.path);
              FireStorage storage = FireStorage();
              storage.uploadImage(file, "profile picture");
              FireStorage firebaseStorage = FireStorage();
              String image = await firebaseStorage.getImage();
              setState(() {
                url = image;
              });
            }
          },
          child: CircleAvatar(
            child: url == null ? Icon(Icons.camera_alt_outlined) : null,
            backgroundColor: Colors.deepOrange,
            backgroundImage: Image.network(url.toString()).image,
            radius: 70.0,
          )),
      const SizedBox(height: 18),
      const Text(
        'King Tryndamere',
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(50.0, 15, 30, 0),
        child: Text(
          'famous for taking cs in all lanes  , Also my right ',
          style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              letterSpacing: .5,
              color: Colors.white),
        ),
      ),
      const Padding(
        padding: EdgeInsets.fromLTRB(65.0, 0, 30, 50),
        child: Text(
          'arm is a lot stronger than my left arm.',
          style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              letterSpacing: .5,
              color: Colors.white),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppLocalizations.of(context)!.followers,
            style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
                color: Colors.white),
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.following,
                style: const TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
      const SizedBox(height: 8),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocBuilder<FollowersCubit, FollowersStates>(
            builder: (BuildContext context, state) {
              return Text(
                FollowersCubit.get(context).followCounter.toString(),
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white),
              );
            },
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '0',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              )
            ],
          ),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppLocalizations.of(context)!.totalMaps,
            style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
                color: Colors.white),
          ),
          Text(
            AppLocalizations.of(context)!.totalStories,
            style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
                color: Colors.white),
          ),
          Text(
            AppLocalizations.of(context)!.totalLikes,
            style: const TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                letterSpacing: 1,
                color: Colors.white),
          )
        ],
      ),
      const SizedBox(height: 8),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '59K',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white),
          ),
          Text(
            '1',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white),
          ),
          Text(
            '20M',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                color: Colors.white),
          )
        ],
      ),
      const SizedBox(height: 50),
      BlocBuilder<FollowersCubit, FollowersStates>(
        builder: (BuildContext context, state) {
          return ElevatedButton(
              onPressed: FollowersCubit.get(context).increaseFollwers,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              child: Text(
                AppLocalizations.of(context)!.follow,
                style: const TextStyle(color: Colors.white, letterSpacing: 1),
              ));
        },
      )
    ]);
  }
}
