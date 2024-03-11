import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_3d/screens/videoportfolio_updated.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMeSceen extends StatelessWidget {
  const AboutMeSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var metricsTextStyle = TextStyle(
      fontFamily: GoogleFonts.robotoCondensed().fontFamily,
      fontSize: 40,
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.4,
                    backgroundColor: Colors.blue,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => VideoPortfolio(),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        radius: screenWidth * 0.4 - 5,
                        backgroundImage:
                            AssetImage('assets/images/profile_pic.jpg'),
                      ),
                    ),
                  ),
                  const Gap(8),
                  Text(
                    'Meynard Velasco',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.rubik().fontFamily,
                      fontSize: 36,
                    ),
                  ),
                  // const Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Actively looking',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const Gap(12),
                      FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  const Gap(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Current Level'),
                          Text(
                            'A+',
                            style: metricsTextStyle,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('No Projects'),
                          Text(
                            '50',
                            style: metricsTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            //profile web page, call button
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
              child: Container(
                color: Colors.orange.shade300,
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        const Text('View my profile'),
                        Spacer(),
                        GestureDetector(
                          onTap: () async {
                            final Uri uri =
                                Uri.parse('https://www.facebook.com/PSUroars');
                            await launchUrl(uri);
                          },
                          child: const FaIcon(
                            FontAwesomeIcons.arrowRightLong,
                          ),
                        ),
                        const Gap(8),
                        GestureDetector(
                          onTap: () async {
                            final uri = Uri.parse('tel:+639901231234');
                            await launchUrl(uri);
                          },
                          child: FaIcon(FontAwesomeIcons.phone),
                        ),
                        const Gap(8),
                        GestureDetector(
                          onTap: () async {
                            final uri = Uri.parse('sms:+639901231234');
                            await launchUrl(uri);
                          },
                          child: FaIcon(FontAwesomeIcons.message),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
