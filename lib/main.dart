
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:url_launcher/url_launcher.dart';



void main() {
  runApp(const MisthaaApp());
}

const Color background = Color(0xFF070910);
const Color heroBackground = Color(0xFF101A35);
const Color primaryBlue = Color(0xFF5278FF);
const Color textPrimary = Color(0xFFE5E3ED);
const Color textSecondary = Color(0xFFA7ADBE);

class MisthaaApp extends StatelessWidget {
  const MisthaaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Misthaa | Live Music Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.dark(
          primary: primaryBlue,
          surface: background,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class VideoItem {
  final String title;
  final String video;
  final String cover;

  const VideoItem({
    required this.title,
    required this.video,
    required this.cover,
  });
}

class PerformanceCategory {
  final String title;
  final String subtitle;
  final List<VideoItem> videos;

  const PerformanceCategory({
    required this.title,
    required this.subtitle,
    required this.videos,
  });
}

final List<PerformanceCategory> performanceCategories = [
  PerformanceCategory(
    title: 'Private Events',
    subtitle: 'Celebrations, special occasions and live music.',
    videos: [
      VideoItem(title: 'Private 01',
          video: 'assets/videos/Private_01.mp4',
          cover: 'assets/images/Privateimg_01.jpeg'),
      VideoItem(title: 'Private 02',
          video: 'assets/videos/Private_02.mp4',
          cover: 'assets/images/Privateimg_02.PNG'),
      VideoItem(title: 'Private 03',
          video: 'assets/videos/Private_03.mp4',
          cover: 'assets/images/Privateimg_03.PNG'),
      VideoItem(title: 'Private 04',
          video: 'assets/videos/Private_04.mp4',
          cover: 'assets/images/Privateimg_04.PNG'),
      VideoItem(title: 'Private 05',
          video: 'assets/videos/Private_05.mp4',
          cover: 'assets/images/Private_05.PNG'),
    ],
  ),

  PerformanceCategory(
    title: 'Cafes & Crowd Work',
    subtitle: 'Cafe performances, crowd walks and candid moments connecting music with the audience.',
    videos: [
      VideoItem(title: 'Cafe 01',
          video: 'assets/videos/Cafe_01.mp4',
          cover: 'assets/images/Cafeimg_01.PNG'),
      VideoItem(title: 'Cafe 02',
          video: 'assets/videos/Cafe_02.mp4',
          cover: 'assets/images/Cafeimg_02.PNG'),
      VideoItem(title: 'Cafe 03',
          video: 'assets/videos/Cafe_03.mp4',
          cover: 'assets/images/Cafeimg_03.PNG'),
      VideoItem(title: 'Cafe 04',
          video: 'assets/videos/Cafe_04.mp4',
          cover: 'assets/images/Cafeimg_04.PNG'),
      VideoItem(title: 'Cafe 05',
          video: 'assets/videos/Cafe_05.mp4',
          cover: 'assets/images/Cafeimg_05.PNG'),
      VideoItem(title: 'Cafe 06',
          video: 'assets/videos/Cafe_06.mp4',
          cover: 'assets/images/Cafeimg_06.jpeg'),
      VideoItem(title: 'Cafe 07',
          video: 'assets/videos/Cafe_07.mp4',
          cover: 'assets/images/Cafeimg_07.PNG'),
    ],
  ),

  PerformanceCategory(
    title: 'Bhajan Jamming',
    subtitle: 'Devotional music, soulful melodies and moments of togetherness.',
    videos: [
      VideoItem(title: 'Bhajan Jamming 01',
          video: 'assets/videos/Bhajan_01.mp4',
          cover: 'assets/images/Bhajanimg_01.PNG'),
      VideoItem(title: 'Bhajan Jamming 02',
          video: 'assets/videos/Bhajan_02.mp4',
          cover: 'assets/images/Bhajanimg_02.PNG'),
      VideoItem(title: 'Bhajan Jamming 03',
          video: 'assets/videos/Bhajan_03.mp4',
          cover: 'assets/images/Bhajanimg_03.PNG'),
      VideoItem(title: 'Bhajan Jamming 04',
          video: 'assets/videos/Bhajan_04.mp4',
          cover: 'assets/images/Bhajanimg_04.PNG'),
      VideoItem(title: 'Bhajan Jamming 05',
          video: 'assets/videos/Bhajan_05.mp4',
          cover: 'assets/images/Bhajanimg_05.PNG'),
      VideoItem(title: 'Bhajan Jamming 06',
          video: 'assets/videos/Bhajan_06.mp4',
          cover: 'assets/images/Bhajanimg_06.PNG'),
    ],
  ),

  PerformanceCategory(
    title: 'College Events',
    subtitle: 'College celebrations and live audiences.',
    videos: [
      VideoItem(title: 'College Event 01',
          video: 'assets/videos/College_01.mp4',
          cover: 'assets/images/Collegeimg_01.PNG'),
      VideoItem(title: 'College Event 02',
          video: 'assets/videos/College_02.mp4',
          cover: 'assets/images/Collegeimh_02.PNG'),
      VideoItem(title: 'College Event 03',
          video: 'assets/videos/College_03.mp4',
          cover: 'assets/images/Collegeimg_03.PNG'),
      VideoItem(title: 'College Event 04',
          video: 'assets/videos/College_04.mp4',
          cover: 'assets/images/Collegeimg_04.PNG'),
    ],
  ),

  
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _performancesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final targetContext = key.currentContext;
    if (targetContext == null) return;

    Scrollable.ensureVisible(
      targetContext,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      alignment: 0,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _topBar(),
            _hero(isMobile, width),

            Container(
              key: _performancesKey,
              child: Column(
                children: [
                  for (int i = 0; i < performanceCategories.length; i++)
                    _performanceSection(
                      performanceCategories[i],
                      isMobile,
                      i,
                    ),
                ],
              ),
            ),

            _gallery(isMobile, width),

            Container(
              key: _contactKey,
              child: _contact(isMobile),
            ),

            _footer(),
          ],
        ),
      ),
    );
  }

  Widget _topBar() {
    return Container(
      height: 76,
      width: double.infinity,
      alignment: Alignment.center,
      color: const Color(0xFF070910),
      child: const Text(
        'Misthaa',
        style: TextStyle(
          color: textPrimary,
          fontSize: 21,
          fontWeight: FontWeight.w700,
          letterSpacing: 4,
        ),
      ),
    );
  }

  Widget _hero(bool isMobile, double width) {
    final contentWidth = width > 1250 ? 1120.0 : width * 0.88;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 26 : 40,
        vertical: isMobile ? 38 : 65,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF111C38),
            Color(0xFF090D19),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: contentWidth,
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _logoImage(isMobile),
                    const SizedBox(height: 45),
                    _heroText(isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 270,
                      height: 350,
                      child: _logoImage(false),
                    ),
                    const SizedBox(width: 55),
                    Expanded(child: _heroText(false)),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _logoImage(bool isMobile) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Image.asset(
          'assets/logo.png',
          width: isMobile ? 190 : 270,
          height: isMobile ? 190 : 350,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: isMobile ? 190 : 270,
              height: isMobile ? 190 : 350,
              color: const Color(0xFF20283A),
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_outlined,
                size: 50,
                color: textSecondary,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _heroText(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Misthaa',
          style: TextStyle(
            fontSize: isMobile ? 26 : 31,
            color: textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Singer & Live Performer',
          style: TextStyle(
            fontSize: isMobile ? 30 : 43,
            height: 1.15,
            fontWeight: FontWeight.bold,
            color: textPrimary,
          ),
        ),
        const SizedBox(height: 17),
        const Text(
          'Surat-based artist · Available for shows across India',
          style: TextStyle(
            color: textSecondary,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => _scrollTo(_performancesKey),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Explore Performances'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 17,
                ),
              ),
            ),
            
          ],
        ),
        const SizedBox(height: 27),
        const Text(
          'I bring people together through music, from soulful melodies to lively live performances.',
          style: TextStyle(
            color: textSecondary,
            fontSize: 16,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 35),
        const Center(
          child: Column(
            children: [
              Text(
                'SCROLL DOWN TO EXPLORE MORE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textSecondary,
                  letterSpacing: 2,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 12),
              Icon(
                Icons.keyboard_arrow_down,
                color: primaryBlue,
                size: 30,
              ),
              SizedBox(height: 8),
              Text(
                'Discover more performances and music genres',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _performanceSection(
    PerformanceCategory category,
    bool isMobile,
    int index,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        left: isMobile ? 22 : 38,
        right: 0,
        top: isMobile ? 65 : 85,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            index == 0 ? 'LIVE. CLOSE. PERSONAL.' : 'MUSIC. MOMENTS. MEMORIES.',
            style: const TextStyle(
              color: primaryBlue,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 17),
          Text(
            category.title,
            style: TextStyle(
              fontSize: isMobile ? 25 : 31,
              fontWeight: FontWeight.bold,
              color: textPrimary,
            ),
          ),
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: Text(
                category.subtitle,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.8,
                  color: textSecondary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: isMobile ? 280 : 360,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: category.videos.length,
              padding: const EdgeInsets.only(right: 30),
              separatorBuilder: (_, __) => const SizedBox(width: 18),
              itemBuilder: (context, i) {
                return _videoCard(
                  category.videos[i],
                  isMobile,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _videoCard(VideoItem video, bool isMobile) {
    return GestureDetector(
      onTap: () => _openVideo(video),
      child: SizedBox(
        width: isMobile ? 190 : 270,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                video.cover,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: const Color(0xFF20283A),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      color: textSecondary,
                      size: 40,
                    ),
                  );
                },
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.15),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.55),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openVideo(VideoItem video) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.88),
      builder: (_) => VideoPlayerDialog(video: video),
    );
  }

  Widget _gallery(bool isMobile, double width) {
    final images = List.generate(
      10,
      (i) => 'assets/gallery/Gallery_${(i + 1).toString().padLeft(2, '0')}.PNG',
    );

    final columns = width < 600 ? 2 : (width < 1000 ? 3 : 5);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 22 : 38,
        vertical: 85,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BEHIND THE MUSIC',
            style: TextStyle(
              color: primaryBlue,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 17),
          const Text(
            'Gallery',
            style: TextStyle(
              color: textPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 31,
            ),
          ),
          const SizedBox(height: 30),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 14,
              mainAxisSpacing: 14,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      backgroundColor: background,
                      child: InteractiveViewer(
                        child: Image.asset(images[index]),
                      ),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) {
                      return Container(
                        color: const Color(0xFF20283A),
                        child: const Icon(
                          Icons.image_outlined,
                          color: textSecondary,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _contact(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 70,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF152344),
            Color(0xFF080B14),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          const Icon(
            Icons.graphic_eq,
            size: 42,
            color: Color(0xFF5278FF),
          ),
          const SizedBox(height: 22),
          const Text(
            'LET THE MUSIC BRING US TOGETHER.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF9BB7FF),
              fontSize: 10,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 18),
          Text(
            "Let's Make Your\nEvent Memorable.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textPrimary,
              fontSize: isMobile ? 29 : 35,
              height: 1.15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Live music for celebrations, cafes, devotional events, '
            'and special occasions.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFA7ADBE),
              height: 1.7,
            ),
          ),
          const SizedBox(height: 45),
          const Divider(color: Colors.white12),
          const SizedBox(height: 20),
          const Text(
            'Misthaa',
            style: TextStyle(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: () async {
              final Uri instagramUrl = Uri.parse(
                'https://www.instagram.com/misthaa.live/',
              );
              await launchUrl(
                instagramUrl,
                mode: LaunchMode.externalApplication,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomPaint(
                  size: const Size(22, 22),
                  painter: InstagramIconPainter(),
                ),
                const SizedBox(width: 8),
                const Text(
                  '@misthaa.live',
                  style: TextStyle(
                    color: Color(0xFFA7ADBE),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      alignment: Alignment.center,
      child: const Text(
        '© Misthaa · Singer & Live Performer',
        style: TextStyle(
          color: textSecondary,
          fontSize: 12,
        ),
      ),
    );
  }
}

class VideoPlayerDialog extends StatefulWidget {
  final VideoItem video;

  const VideoPlayerDialog({
    super.key,
    required this.video,
  });

  @override
  State<VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late VideoPlayerController _controller;

  bool _initialized = false;
  bool _hasError = false;
  bool _isPlaying = false;
  bool _muted = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    _controller = VideoPlayerController.asset(widget.video.video);

    try {
      await _controller.initialize();
      await _controller.setLooping(false);
      await _controller.setVolume(1);

      if (!mounted) return;

      setState(() {
        _initialized = true;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _hasError = true;
      });
    }
  }

  Future<void> _togglePlay() async {
    if (!_initialized) return;

    if (_controller.value.isPlaying) {
      await _controller.pause();
      setState(() => _isPlaying = false);
    } else {
      await _controller.play();
      setState(() => _isPlaying = true);
    }
  }

  Future<void> _toggleVolume() async {
    if (!_initialized) return;

    _muted = !_muted;
    await _controller.setVolume(_muted ? 0 : 1);

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    if (_initialized || _hasError) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: const Color(0xFF090B12),
      insetPadding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 850,
          maxHeight: screen.height * 0.9,
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.video.title,
                      style: const TextStyle(
                        color: textPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Flexible(
                child: AspectRatio(
                  aspectRatio: 9 / 16,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 430,
                    ),
                    color: Colors.black,
                    child: _videoContent(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_initialized)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _togglePlay,
                      iconSize: 35,
                      color: Colors.white,
                      icon: Icon(
                        _isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_fill,
                      ),
                    ),
                    const SizedBox(width: 15),
                    IconButton(
                      onPressed: _toggleVolume,
                      color: Colors.white,
                      icon: Icon(
                        _muted ? Icons.volume_off : Icons.volume_up,
                      ),
                    ),
                  ],
                ),
              if (_initialized)
                ValueListenableBuilder<VideoPlayerValue>(
                  valueListenable: _controller,
                  builder: (context, value, child) {
                    return VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                        playedColor: primaryBlue,
                        bufferedColor: Colors.white38,
                        backgroundColor: Colors.white12,
                      ),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _videoContent() {
    if (_hasError) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Unable to load this video.\nPlease check the video format.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    if (!_initialized) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: primaryBlue),
            SizedBox(height: 20),
            Text(
              'Please wait while the video loads...',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        if (!_isPlaying)
          IconButton(
            onPressed: _togglePlay,
            iconSize: 65,
            color: Colors.white,
            icon: const Icon(Icons.play_circle_fill),
          ),
      ],
    );
  }
}



class InstagramIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Outer rounded square
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(1, 1, 20, 20),
        const Radius.circular(6),
      ),
      paint,
    );

    // Inner camera lens
    canvas.drawCircle(
      const Offset(11, 11),
      4.5,
      paint,
    );

    // Small top-right dot
    canvas.drawCircle(
      const Offset(17, 5),
      1,
      Paint()..color = Colors.white,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

