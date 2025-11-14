'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "635a7c1bb9623923425e36ca2cb736ca",
"assets/AssetManifest.bin.json": "48ad19a04661ed5db1c192b50d7ee55b",
"assets/AssetManifest.json": "7190c7060601b47ae1c9548a41df47a7",
"assets/assets/photos/ABLJ4816.JPG": "fb21b4d5cb6ab827b396ecde80d0acc3",
"assets/assets/photos/AHQP5047.JPG": "75de088d15c83b5e5674cfbd2d9f3be7",
"assets/assets/photos/CYTT0064.JPG": "398fcfa9140501977414cf08ce561a27",
"assets/assets/photos/CZBI7929.JPG": "7d68c809939eba09ef1b53331a4d43bf",
"assets/assets/photos/desktop.ini": "b9416675a3a9b59fcaf8153d84283aa3",
"assets/assets/photos/DQEA6637.JPG": "ea6c81d446d544eceb58175390bed7c6",
"assets/assets/photos/EJAM1157.JPG": "8154856301b01995ba7c64dca44a1268",
"assets/assets/photos/GFPZ2050.JPG": "a87700eda677c17b0b146a3718244a07",
"assets/assets/photos/GRYI6903.JPG": "8626d1bbacfe436c1ae1dad2186d8a01",
"assets/assets/photos/IGRP2368.JPG": "856ca9b0ca6daf35fd4cd55fa407087f",
"assets/assets/photos/KCIP1533.JPG": "93958414d53464b78bdde176cdc86c0e",
"assets/assets/photos/KYKD7558.JPG": "5998657daea3834edda46938d6465123",
"assets/assets/photos/LLJI1630.JPG": "4ea0b4255fa74dd4a437a7f53237e3a2",
"assets/assets/photos/MPJE2669.JPG": "16eb1c3dbd65457be89bd46c67ae7988",
"assets/assets/photos/MUYY4673.JPG": "496ac59346ecf1dafda6508f43491a0a",
"assets/assets/photos/PYQD3066.JPG": "52e1e101241db00c2d3b0eb781e91774",
"assets/assets/photos/QCSC7467.JPG": "4972a356b05892758b7c989ce40b1236",
"assets/assets/photos/QZOQ4411.JPG": "257f56cacd0884eb58953f4e96e37ec9",
"assets/assets/photos/RBPK8756.JPG": "ad5bef9bc9332583c663dba03049567d",
"assets/assets/photos/RGJT8091.JPG": "f8a8e457a3e8092a528ab90b6ead0198",
"assets/assets/photos/RLYS6643.JPG": "245b0547e00a1649af01e30cf3376ed6",
"assets/assets/photos/RMDN8827.JPG": "7342b4e47d1c3ecf8af3cef22d046053",
"assets/assets/photos/VOCZ6302.JPG": "2d78839ffba366106b66c917e8ca90a6",
"assets/assets/photos/VYDX5843.JPG": "c073574efb0d8d1632b4c74d49e8458d",
"assets/assets/photos/WIPG3332.JPG": "12e14323d76ad2a9adbd51aceb0b4151",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "5bb7b3a9c2b527012b76d63cca784ec4",
"assets/NOTICES": "0a785637f60d3eae7ca5c21da4a5ad6d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "c43c6bf905390baf3297f295733ba5ae",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "8076d08c5ff18a27be03cb6f233f7139",
"/": "8076d08c5ff18a27be03cb6f233f7139",
"main.dart.js": "ddf163a0119b1a8ab4bf5eb40dcda030",
"manifest.json": "aeffb554cb860f1b8756974128572199",
"version.json": "b8eec5f24e95ff376d6be8f9a5afe48d"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
