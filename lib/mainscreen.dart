import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/chatbot.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hey ashish here.',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF11141A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF222733),
          brightness: Brightness.dark,
          background: const Color(0xFF11141A),
          surface: const Color(0xFF1A1F29),
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Colors.white70,
          onSecondary: Colors.white70,
        ),
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        useMaterial3: true,
      ),
      home: const _Home(),
    );
  }
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> with SingleTickerProviderStateMixin {
  Offset _cursor = Offset.zero;
  bool _isChatCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) => setState(() => _cursor = e.position),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SizedBox(),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topCenter,
                  radius: 1.2,
                  colors: [
                    Color.fromARGB(255, 14, 36, 60),
                    Color(0xFF11141A),
                    Color(0xFF11141A),
                  ],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _HeroSection(),
                      SizedBox(height: 40),
                      _ExperienceSection(),
                      _ProjectsSection(),
                      SizedBox(height: 80),
                      _Endpage(),
                      SizedBox(height: 25),
                      _LoveSection(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: _cursor.dx - 47,
              top: _cursor.dy - 50,
              child: IgnorePointer(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.1),
                        blurRadius: 35,
                        spreadRadius: 7,
                      ),
                    ],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent, width: 2),
                  ),
                ),
              ),
            ),
            ChatBotWindow(isCollapsed: _isChatCollapsed),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _LoveSection() {
  return Center(
    child: Text(
      'Build with Flutter 💖 and Node.js 🚀',
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(2, 3),
            blurRadius: 8,
          ),
        ],
      ),
    ),
  );
}

// ignore: non_constant_identifier_names
Widget _Endpage() {
  return Row(
    children: [
      Text('@ 2025 ashishportfolio.live'),
      Expanded(child: SizedBox()),

      InkWell(
        onTap: () {
          _launch("https://github.com/ashishexee");
        },
        child: Container(
          height: 23,
          width: 23,
          child: SvgPicture.asset(
            'assets/icons/github.svg',
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(width: 12),
      InkWell(
        onTap: () {
          _launch("https://www.linkedin.com/in/ashish-singh-111212319/");
        },
        child: Container(
          height: 23,
          width: 23,
          child: SvgPicture.asset(
            'assets/icons/linkedin.svg',
            color: Colors.white,
          ),
        ),
      ),
      SizedBox(width: 12),

      InkWell(
        onTap: () {
          _launch("https://x.com/ashishexeee");
        },
        child: Container(
          height: 23,
          width: 23,
          child: SvgPicture.asset('assets/icons/x.svg', color: Colors.white),
        ),
      ),
    ],
  );
}

class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final txt = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Wrap(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'hey ashish here 👋',
                      style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white,
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: Offset(2, 3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Developer  •  IIT Roorkee',
                        style: txt.bodyLarge!.copyWith(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Icon(Icons.code, color: Colors.blue[200], size: 22),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Building full-stack apps with Flutter, Node.js, Express.js & MongoDB.',
                            style: txt.bodyLarge!.copyWith(
                              color: Colors.white.withOpacity(0.92),
                              fontSize: 17,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      children: [
                        FilledButton.icon(
                          onPressed:
                              () => _launch(
                                'https://drive.google.com/file/d/1ol2FZR4hISP7wVO9drXcCqtWyx7obWVh/view?usp=sharing ',
                              ),
                          icon: Icon(Icons.description, color: Colors.white),
                          label: const Text(
                            'Resume',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: FilledButton.styleFrom(
                            backgroundColor: Color(0xFF222733),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            elevation: 2,
                          ),
                        ),
                        const SizedBox(width: 18),
                        _SocialIcon(
                          icon: SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              'assets/icons/github.svg',
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                          ),
                          url: 'https://github.com/ashishexee',
                          tooltip: 'Github',
                        ),
                        const SizedBox(width: 10),
                        _SocialIcon(
                          icon: SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              'assets/icons/linkedin.svg',
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                          ),
                          url:
                              'https://www.linkedin.com/in/ashish-singh-111212319/',
                          tooltip: 'Linkedin',
                        ),
                        const SizedBox(width: 10),
                        _SocialIcon(
                          icon: SizedBox(
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset(
                              'assets/icons/x.svg',
                              fit: BoxFit.fill,
                              color: Colors.white,
                            ),
                          ),
                          url: 'https://x.com/ashishexeee',
                          tooltip: 'X',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 40),
              Wrap(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 18),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.18),
                          blurRadius: 18,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28),
                      child: Image.asset(
                        'assets/dash.png',
                        fit: BoxFit.cover,
                        height: 220,
                        width: 220,
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox(width: 140)),
                  Column(
                    children: [
                      SizedBox(height: 40),
                      Container(
                        height: 170,
                        width: 190,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.04),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Phone',
                                style: txt.bodySmall!.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '+91 7678250729',
                                style: txt.bodySmall!.copyWith(
                                  color: Colors.white54,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Email',
                                style: txt.bodySmall!.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'ashish@me.iitr.ac.in',
                                style: txt.bodySmall!.copyWith(
                                  color: Colors.white54,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'GitHub',
                                style: txt.bodySmall!.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              GestureDetector(
                                onTap:
                                    () => _launch(
                                      'https://github.com/ashishexee',
                                    ),
                                child: Text(
                                  'github.com/ashishexee',
                                  style: txt.bodySmall!.copyWith(
                                    color: Colors.blue[200],
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ExperienceSection extends StatefulWidget {
  const _ExperienceSection();

  @override
  State<_ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<_ExperienceSection>
    with SingleTickerProviderStateMixin {
  late final TabController _tabs = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          decoration: BoxDecoration(
            color: const Color(0xFF222733),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: TabBar(
              controller: _tabs,
              indicator: BoxDecoration(
                color: const Color(0xFF6C7A89).withOpacity(0.35),
                borderRadius: BorderRadius.circular(16),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white54,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
              tabs: const [
                SizedBox(width: 180, child: Center(child: Text('Work'))),
                SizedBox(width: 180, child: Center(child: Text('Education'))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: TabBarView(
            controller: _tabs,
            children: [
              _Timeline(items: _workItems),
              _TimeEduline(items: _eduItems),
            ],
          ),
        ),
      ],
    );
  }
}

class _Timeline extends StatelessWidget {
  final List<_ExpItem> items;
  const _Timeline({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 28),
      itemBuilder: (_, i) {
        final it = items[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(it.logo),
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    it.period,
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    it.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    it.subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.white60),
                  ),
                  const SizedBox(height: 6),
                  for (final p in it.points)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '• ',
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          Expanded(
                            child: Text(
                              p,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TimeEduline extends StatelessWidget {
  final List<_EduItem> items;
  const _TimeEduline({required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 28),
      itemBuilder: (_, i) {
        final it = items[i];
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(it.logo),
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    it.period,
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    it.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    it.subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.white60),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'featured projects',
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.6),
                offset: Offset(2, 3),
                blurRadius: 8,
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        _ProjectCard(
          p: _Project(
            preview: 'assets/projects/joblook.png',
            name: 'JobLook',
            desc: 'JobLook is a comprehensive mobile job search application.',
            tags: [
              "Flutter",
              "Node.js/Express.js",
              "MongoDb",
              "Firebase for Auth",
            ],
            link: "https://github.com/ashishexee/JobLook",
          ),
        ),
        SizedBox(height: 20),
        _ProjectCard(
          p: _Project(
            preview: 'assets/projects/blurconnect.png',
            name: 'BlurConnect',
            desc: 'BlurConnect is a cross-platform social networking app',
            tags: [
              "Flutter",
              "Node.js/Express.js",
              "MongoDb",
              "Supabase",
              "Google ML Kit",
            ],
            link: "https://github.com/ashishexee/BlurConnnect",
          ),
        ),
        SizedBox(height: 20),
        _ProjectCard(
          p: _Project(
            preview: 'assets/projects/teledrive.png',
            name: 'TeleDrive',
            desc:
                'Application that transforms Telegram into your personal cloud storage system.',
            tags: ["Flutter", "Node.js/Express.js", "Telegram Bot API"],
            link: "https://github.com/ashishexee/TeleDrive",
          ),
        ),

        SizedBox(height: 20),
        Text(
          'more projects',
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.6),
                offset: Offset(2, 3),
                blurRadius: 8,
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _projectsrow(
                p: _Project(
                  preview: 'assets/projects/portfolio.png',
                  name: 'Portfolio',
                  desc:
                      'LeetCode Helper is a Visual Studio Code extension designed to streamline solving LeetCode problems.',
                  tags: ["Flutter", "Node.js/Express.js", "Telegram Bot API"],
                  link: "https://github.com/ashishexee/Portfolio_website",
                ),
              ),
              SizedBox(width: 20),
              _projectsrow(
                p: _Project(
                  preview: 'assets/projects/woman.png',
                  name: 'SafeHer',
                  desc:
                      'LeetCode Helper is a Visual Studio Code extension designed to streamline solving LeetCode problems.',
                  tags: ["Flutter", "Node.js/Express.js", "Telegram Bot API"],
                  link:
                      "https://github.com/ashishexee/women-safety-application",
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final _Project p;
  const _ProjectCard({required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF181C24),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white12, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 7,
                  child: Image.asset(
                    p.preview,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => _launch(p.link),
                    child: Row(
                      children: const [
                        Icon(Icons.open_in_new, size: 16),
                        SizedBox(width: 6),
                        Text('Github'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(22, 20, 22, 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    p.desc,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      for (final tag in p.tags)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.withOpacity(0.13),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _projectsrow extends StatelessWidget {
  final _Project p;
  const _projectsrow({required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1F29),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white10),
      ),
      child: SizedBox(
        width: 340,
        height: 270,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                border: Border(
                  top: BorderSide(color: Colors.white24, width: 4),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: SizedBox(
                  height: 200,
                  child: Image.asset(p.preview, fit: BoxFit.contain),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    p.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  FilledButton.tonal(
                    onPressed: () => _launch(p.link),
                    child: const Text('Github'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExpItem {
  const _ExpItem({
    required this.logo,
    required this.period,
    required this.title,
    required this.subtitle,
    required this.points,
  });
  final String logo, period, title, subtitle;
  final List<String> points;
}

class _EduItem {
  const _EduItem({
    required this.logo,
    required this.period,
    required this.title,
    required this.subtitle,
  });
  final String logo, period, title, subtitle;
}

const _workItems = [
  _ExpItem(
    logo: 'assets/experience/intern.png',
    period: 'May 2025 – Jun 2025',
    title: 'Flutter Developer Intern',
    subtitle: 'Portfolix.tech',
    points: [
      'Built a cross-platform e-commerce app using Flutter.',
      'Integrated Node/Express backend with MongoDB.',
      'Implemented auth, session management and order flows.',
      'Created an admin panel for products & orders.',
    ],
  ),
];

const _eduItems = [
  _EduItem(
    logo: 'assets/experience/iitroorkee.png',
    period: '2023 - 2027',
    title: 'Indian Institute of Technology Roorkee',
    subtitle: 'B.Tech, Production and Industrial Engineering',
  ),
  _EduItem(
    logo: 'assets/experience/modernschool.png',
    period: '2008-2023',
    title: 'Modern School',
    subtitle:
        'Completed schooling at Modern School, building a strong academic foundation.',
  ),
];

class _Project {
  const _Project({
    required this.preview,
    required this.name,
    required this.desc,
    required this.tags,
    required this.link,
  });
  final String preview, name, desc, link;
  final List<String> tags;
}

Future<void> _launch(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

class _SocialIcon extends StatelessWidget {
  final Widget icon;
  final String url;
  final String tooltip;

  const _SocialIcon({
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: () => _launch(url),
        borderRadius: BorderRadius.circular(30),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white10,
            shape: BoxShape.circle,
          ),
          child: icon,
        ),
      ),
    );
  }
}
