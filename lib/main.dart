import 'package:flutter/material.dart';
import 'interactive_reasons_flutter.dart';
import 'confetti_overlay.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // full reasons list (100) - all rewritten to be longer, emotional, and loving
  static const List<String> reasons = [
    "Micah — you have this magical way of turning even the simplest moments into memories I’ll treasure forever. A quiet morning with coffee, a walk under the sun, or just sitting together in silence feels like a celebration when I’m with you. You make life feel brighter, fuller, and infinitely more beautiful just by being yourself.",
    "I love the way Macchi laughs with her whole being, the kind of laugh that makes her eyes sparkle and cheeks rise, and somehow it pulls all the happiness in the world into that one moment. Every time I hear it, I forget my worries and feel that everything is okay just because she exists.",
    "Hunny, you listen like you actually care, not just hear. You notice the things I’m too shy or too proud to say out loud, and you make them matter. You make me feel seen, understood, and loved in a way I never knew was possible, and I carry that warmth with me every day.",
    "I love your kindness to strangers, Baby; it teaches me how to be better, how to slow down and be human. Watching you offer a smile, a small gesture, or a word of comfort reminds me how deeply love can ripple through the world in subtle but powerful ways.",
    "Micah, your smile is my favorite hello, the kind of smile that stops my heart and reminds me how lucky I am to share a life with someone so incredible. Even on my worst days, seeing it makes me feel like everything is going to be okay.",
    "I love how Macchi remembers the tiniest details I say, even the ones I don’t think anyone notices. Those moments remind me that our connection isn’t just surface-level—it’s in the quiet attention, the little gestures, and the love that’s embedded in everything we do.",
    "Hunny, your hugs aren’t just hugs — they’re tiny safe havens where all my fears, doubts, and worries melt away. The world can be heavy and unforgiving, but in your arms, it all feels lighter, and I am reminded that I am never truly alone.",
    "Baby, you’re my calm in every storm. No matter how chaotic the world gets, being with you makes me feel grounded, peaceful, and loved in ways I didn’t know I could feel.",
    "Micah — the way you support my most ridiculous ideas makes me brave enough to dream bigger and try harder. Even when I doubt myself, you’re always there, showing me that my dreams aren’t silly as long as you believe in them with me.",
    "I love how Macchi finds beauty in the smallest things — a leaf on the ground, a song in the wind, or a smile from a stranger. You remind me that magic exists everywhere if we only choose to see it.",
    "Hunny, you make my music feel alive when you sing along, turning ordinary notes into something ethereal, something I want to remember forever. Your voice is a gift that makes my world brighter.",
    "Baby — your hand fits perfectly in mine, as if it was always meant to. When we hold hands, I feel your heartbeat, your warmth, and a connection that makes every worry disappear.",
    "Micah, I love the way you make me laugh at myself. Your humor, your timing, and the sparkle in your eyes remind me that life is meant to be joyful, even when it’s messy.",
    "I love how Macchi falls asleep on my shoulder, as if it’s the safest place in the world. Those quiet moments, so tender and intimate, feel like a lifetime of love compressed into a single heartbeat.",
    "Hunny, you give the best advice even when I don’t ask for it. It’s not just wisdom; it’s your love and care wrapped in words that guide me without ever making me feel small.",
    "Baby, your voice is my favorite soundtrack. Every word, every whisper, every laugh you share with me becomes a melody that I replay in my mind over and over.",
    "Micah, you taught me patience, not just through words, but through your example, your calm, and the way you let love grow gently instead of forcing it. I am better because of you.",
    "I love Macchi’s courage when she tries new things, even when they scare her. It inspires me to face my own fears and reminds me that love grows stronger when we step into the unknown together.",
    "Hunny — your curiosity makes life exciting. You find wonder in everything, and it reminds me that the world is a beautiful place when I’m exploring it with you by my side.",
    "Baby, you always notice when I’m off, and you know just what to do to make me feel whole again. Your empathy and care are like a light that guides me back to happiness.",
    "Micah, your honesty is a gift. Even when the truth is hard, you say it with love, patience, and grace. It keeps our bond strong and reminds me that real love is honest, raw, and real.",
    "I love how Macchi gets excited over tiny wins as if they were huge victories. Your joy is infectious, and it reminds me to celebrate even the smallest moments in life.",
    "Hunny, your taste in movies introduced me to new worlds, new feelings, and new ways to see life. Sharing stories with you makes me feel closer to you in ways I can’t describe.",
    "Baby, the way you decorate a room makes it feel warmer, like a place of comfort and love. You leave traces of yourself everywhere, and it always makes me smile.",
    "Micah, your morning texts are the best part of waking up. Knowing that you’re thinking of me first thing makes me feel loved before the day even begins.",
    "I love how Macchi’s eyes light up when she talks about her dreams. That sparkle, that passion, makes me believe in possibility and hope all over again.",
    "Hunny, you stay when things get messy instead of leaving. Your loyalty and love make me feel safe, cherished, and endlessly grateful.",
    "Baby, your stubbornness turned into determination when it mattered. Watching you fight for what’s right inspires me to be better every single day.",
    "Micah, I miss you even when you’re just in the next room. Your presence is magnetic, and I feel incomplete without you, no matter how close we are.",
    "I love that Macchi can be goofy and serious in the same breath. You teach me that love isn’t about perfection, but about embracing every side of someone fully.",
    "Hunny — your small acts of care stack into something monumental. Every note, every hug, every thoughtful gesture builds a love that I can’t imagine living without.",
    "Baby, you challenge me kindly to be a better man. You see my flaws, but you love me anyway, and it inspires me to grow into someone worthy of you.",
    "Micah, I love the scent of your hair after the rain. It’s a memory I keep forever, a smell that brings back moments of comfort, warmth, and home.",
    "I love when Macchi makes me a playlist and it’s secretly perfect, like she understands me better than I understand myself. It’s the little gestures that mean the most.",
    "Hunny, you make me want to celebrate life’s tiniest things. With you, even the ordinary becomes magical, and I fall in love with life all over again.",
    "Baby, the way you forgive is quietly beautiful. Your heart is strong yet gentle, and it teaches me the meaning of unconditional love.",
    "Micah — you make me want to keep promises, to be loyal and true. Being with you reminds me that love is about commitment, patience, and endless care.",
    "I love Macchi’s favorite stories; she brings them to life with her imagination and passion, and it makes me feel like I’m living in a world made for us.",
    "Hunny, you’re brave enough to say how you truly feel. Your honesty inspires me to open my heart fully and trust love even when it’s scary.",
    "Baby, I love that you trust me with your softest parts. Your vulnerability is a gift I treasure, and I promise to protect it always.",
    "Micah, the way you look at sunsets makes them sacred. In your eyes, every ending is beautiful, every moment meaningful, and every memory unforgettable.",
    "I love how Macchi cheers on my weird hobbies. Your support makes me feel seen, valued, and loved for exactly who I am, quirks and all.",
    "Hunny, you are my best kind of unexpected. Every smile, every touch, every word surprises me with joy and makes me fall for you all over again.",
    "Baby, your silly faces are forever saved in my memory. They’re reminders that life with you is fun, joyful, and endlessly precious.",
    "Micah, you make quiet nights together feel full. Just being near you fills my heart with a warmth and contentment I didn’t know I could feel.",
    "I love how Macchi becomes a kid again with cotton candy, balloons, or little surprises. Your wonder reminds me to never stop enjoying life.",
    "Hunny, you celebrate my small wins louder than I do. You notice my growth and victories, and your encouragement fuels me to keep going.",
    "Baby, your resilience inspires me daily. Watching you overcome challenges with grace teaches me what true strength looks like.",
    "Micah, I love your courage to say sorry first. It shows me that humility and love are stronger than pride, and it makes me respect and adore you even more.",
    "I love when Macchi sleeps in late and laughs about it. Those lazy mornings remind me that life with you is soft, joyful, and filled with love.",
    "Hunny — the way you care for people shows your big heart. Your kindness ripples into the world, and I am constantly in awe of you.",
    "Baby, you always know my favorite thing to eat on bad days. It’s not just food; it’s love in its simplest form, and it reminds me that I am always cared for.",
    "Micah, you are my favorite partner-in-crime. Every adventure, every mischief, every quiet plan feels more thrilling because you’re with me.",
    "I love how Macchi brings warmth into cold spaces, turning ordinary rooms into havens of comfort, laughter, and love.",
    "Hunny, your texts are the best little love letters. Each message is a reminder that I’m cherished, thought of, and adored in every moment.",
    "Baby, your focus makes me want to see things through. Your dedication and passion inspire me to push harder and reach higher.",
    "Micah, the way you dance like nobody’s watching — I adore that. It reminds me to let go, be free, and embrace the joy of life with you.",
    "I love Macchi’s stubborn optimism when plans go wrong. Your resilience and hope make challenges feel conquerable.",
    "Hunny, you give the best compliments I never knew I needed. Your words heal, encourage, and make me feel seen in the deepest ways.",
    "Baby, I love that you remember my childhood stories. You make my past feel honored, cherished, and woven into our love.",
    "Micah, your quiet presence says 'I'm here' in the best way. Just knowing you’re near brings peace to my heart.",
    "I love Macchi’s habit of drawing tiny hearts on notes. It’s a small gesture that fills my day with joy and makes me feel endlessly loved.",
    "Hunny, your patience with my bad jokes is divine. You laugh anyway, making me feel accepted and cherished exactly as I am.",
    "Baby — your hands build things with love and care. Whether literal or metaphorical, everything you touch becomes stronger, warmer, and more beautiful.",
    "Micah, when you whisper jokes, I laugh louder. Those shared moments remind me that happiness is found in small, intimate places.",
    "I love how Macchi makes rainy days feel cozy, not sad. Your presence turns gloom into comfort and every drizzle into a memory of warmth.",
    "Hunny, you teach me empathy just by being you. Your heart is generous, compassionate, and it inspires me to be a better human every day.",
    "Baby, your tears make me want to protect you forever. Every emotion you show is a reminder of how deeply we feel and how precious our love is.",
    "Micah, I admire the way you face hard days bravely. Your courage in struggle motivates me to be stronger and to never give up on us.",
    "I love Macchi’s voice when she reads aloud. It’s soothing, enchanting, and somehow makes ordinary words sound like poetry.",
    "Hunny, your silly rituals are my favorite memories. The quirks that make you uniquely you become treasured stories in my heart.",
    "Baby, your strengths balance my weaknesses perfectly. Together, we are a team, a safe haven, and a source of endless love.",
    "Micah — your belief in me feels like home. It’s comforting, unshakable, and it gives me courage I didn’t know I had.",
    "I love that Macchi sees the best in people, always. Your optimism and trust remind me that the world is brighter when love leads the way.",
    "Hunny, your freckles (or dimples) are my favorite constellation. Each one is a tiny reminder that beauty is found in the details of you.",
    "Baby, I love that you make time for us even when busy. Your dedication makes me feel cherished and valued in ways words can’t describe.",
    "Micah, you make the future look exciting and safe. With you, I’m unafraid to dream, to hope, and to love with all of me.",
    "I love how Macchi hums to herself while cooking. It’s a simple act that fills the home with warmth, music, and life.",
    "Hunny, your forgiveness changed me for the better. Through you, I’ve learned humility, patience, and the true depth of love.",
    "Baby, when you cry, it makes me want to hold you forever. Your vulnerability reminds me of the sacred trust between us.",
    "Micah, your kindness sparked my better habits. Loving you makes me want to improve, not out of obligation, but out of love and respect.",
    "I love Macchi’s habit of leaving little notes for me to find. Each one is a whisper of your love that lingers long after you’re gone.",
    "Hunny, you’re the best part of every ordinary day. You turn mundane routines into adventures, smiles, and cherished memories.",
    "Baby, your enthusiasm turns plans into adventures. Your energy is contagious and makes life with you feel endlessly exciting.",
    "Micah, I love the way you dream big and quietly work for it. Your ambition is inspiring, and I want to be by your side to cheer and support you.",
    "I love that Macchi’s hugs are a perfect pause button for life. When I’m overwhelmed, your embrace resets my world and fills me with love.",
    "Hunny, when you laugh at me, I melt. Your joy is infectious, your presence intoxicating, and I fall in love with you all over again every time.",
    "Baby, your courage to be yourself makes me proud. You inspire me to embrace my own authenticity and love fearlessly.",
    "Micah, your love feels like coming home after a long road. Safe, warm, and perfectly right — the place I always want to return to.",
    "I love that Macchi trusts me with her silence as much as her words. You teach me that love doesn’t always need noise to be profound.",
    "Hunny, you are the best 'good morning' and the sweetest 'goodnight.' Every day begins and ends with the comfort of you.",
    "Baby, I will still choose you in a different life, a different time. No matter the universe, my heart always finds you.",
    "Micah, your faith in our future makes me fearless. With you, I believe that anything is possible, as long as we face it together.",
    "I love how Macchi makes new friends like she’s known them forever. Your warmth and openness inspire me to connect and trust more deeply.",
    "Hunny, your little sacrifices never go unnoticed by my heart. Every effort, every compromise, every moment you give is treasured endlessly.",
    "Baby, you are my favorite person to share ice cream with. Simple moments like these feel monumental because they are spent with you.",
    "Micah, I miss your voice when we’re apart — it’s a soft ache that lingers in my chest and reminds me how deeply I love you.",
    "I love that Macchi’s hand always finds mine in crowds. Even amidst chaos, you anchor me, remind me we’re together, and make me feel safe.",
    "Hunny, every 'I love you' from you is a new treasure. Each one is a testament to the depth, warmth, and beauty of our love.",
    "Baby, I love you in ways I don’t know how to fully say yet — and I’ll spend my life showing you. Each day is an opportunity to love you better, deeper, and truer than the day before.",
  ];

  static const String letterContent = """
My Dearest Micah,
Happy 10th monthsary, my love. Ten months. Ten whole months of laughter, love, little moments, and countless memories that I wouldn’t trade for the world. Sometimes, when I think about us, I’m overwhelmed with gratitude—grateful for you, for every smile you’ve given me, every little act of love that I sometimes fail to fully express. You’ve become so much more than my girlfriend—you’re my home, my safe place, my heart walking around outside of me.
I remember the first time I realized I loved you—not just liked you, not just admired you, but truly, deeply loved you. It was in the way your laugh would light up a room, the way your eyes carried warmth even when you were tired, and the way you somehow understood me even when I couldn’t put my thoughts into words. You’ve seen me at my best, and you’ve seen me at my worst, yet you stayed. You stayed, Micah, and that alone has taught me what love really is—unconditional, unwavering, and beautiful.
These past ten months, I’ve watched you grow, shine, and embrace life with this incredible strength and kindness. I’ve seen how you care for the people around you, how you fight for the things you love, how you make everything brighter just by existing. And I can’t help but be in awe of you every single day. Sometimes I sit quietly and just think about you—the way your smile can chase away my darkest days, the way your voice lingers in my mind even when we’re apart, and the way your hand fits perfectly into mine like it was made to stay there forever.
I know I’m not perfect. I know I stumble, I get stubborn, I say things I shouldn’t, and sometimes I fail to show just how much I love you. But Micah, with every beat of my heart, I hope you know that you are the most precious part of my life. You are my first thought in the morning, my last thought at night, and every little moment in between. Every time you laugh, every time you hold my hand, every time you look at me with those eyes that see right through my soul—I fall in love all over again.
I want you to know that no matter what happens, I am yours. I am yours in the quiet moments, in the loud moments, in the moments we don’t know what to say. I am yours when life is beautiful and when life is hard. I am yours when you are near, and even when miles separate us, my heart is with you, always.
Micah, thank you. Thank you for loving me, for being patient with me, for believing in us. Thank you for being my greatest adventure, my peace, my joy, my home. I promise to keep cherishing you, to keep making you laugh, to keep holding your hand through everything, and to never take a single moment with you for granted. Ten months may seem like a number to some, but to me, it’s a testament—a testament to a love so deep and real that words can barely contain it.
So today, on our 10th monthsary, I want to celebrate you. I want to celebrate us. I want to celebrate every memory we’ve created, every tear we’ve wiped from each other’s eyes, and every dream we’ve dared to dream together. I want to remind you that you are loved—deeply, endlessly, without hesitation. You are my everything, Micah. And I will spend every day proving to you that my heart chose you once, and it will never choose anyone else again.
I love you more than I can ever put into words. And even as I write this, I know these words are only a fraction of what my heart feels. But I hope they touch you, even just a little, the way you touch me every day. Happy 10 months, my love. Here’s to countless more months, countless more memories, and a love that will never fade.
Forever and always,
Adriel
""";

  // List of all photo file names provided by the user (UPDATED to include all 26)
  static const List<String> photoFileNames = [
    'ABLJ4816.JPG',
    'AHQP5047.JPG',
    'CYTT0064.JPG',
    'CZBI7929.JPG',
    'DQEA6637.JPG',
    'EJAM1157.JPG',
    'GFPZ2050.JPG',
    'GRYI6903.JPG',
    'IGRP2368.JPG',
    'KCIP1533.JPG',
    'KYKD7558.JPG',
    'LLJI1630.JPG',
    'MPJE2669.JPG',
    'MUYY4673.JPG',
    'PYQD3066.JPG',
    'QCSC7467.JPG',
    'QZOQ4411.JPG',
    'RBPK8756.JPG',
    'RGJT8091.JPG',
    'RLYS6643.JPG',
    'RMDN8827.JPG',
    'VOCZ6302.JPG',
    'VYDX5843.JPG',
    'WIPG3332.JPG',
  ];

  // palette
  static const Color c1 = Color(0xFF7F8D6A);
  static const Color c2 = Color(0xFF9CAD8D);
  static const Color c3 = Color(0xFFB8C4AC);
  static const Color c4 = Color(0xFFCDD6C5);
  static const Color bg = Color(0xFFFDEDF0);
  static const Color p1 = Color(0xFFF492A1);
  static const Color p2 = Color(0xFFF393A1);
  static const Color p3 = Color(0xFFF7B1BC);
  static const Color p4 = Color(0xFFF2C9CD);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reasons I Love You',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bg,
        primaryColor: p1,
        colorScheme: ColorScheme.fromSeed(seedColor: p1),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF774936)),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: ConfettiOverlay(
        child: InteractiveReasonsPage(
          reasons: reasons,
          palette: [c1, c2, c3, c4, p1, p2, p3, p4],
          letterContent: letterContent, // Pass the letter
          photoFileNames: photoFileNames, // Pass the photo list (now 26 files)
        ),
      ),
    );
  }
}
