'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"manifest.json": "0984da74a9cb42dc6ed8c1eb0ce9e69e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.js": "b820eb746682877d4abca484852c2520",
"index.html": "e5b118a957e5f43fc095868103c4ccaf",
"/": "e5b118a957e5f43fc095868103c4ccaf",
"version.json": "cc857f01538965156c66e711cdd5fd7a",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"flutter_bootstrap.js": "3920b4d868ec66213187514580884aa3",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "5aa3261f1bcaa27e0f68e75ff21331e5",
"assets/AssetManifest.bin.json": "66d57a8e35dfa87e521ac3c755bc6ea4",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/NOTICES": "210ce9b88832c85145820a20ceab12c5",
"assets/assets/images/sauce_arachide.jpg": "080e23cd7cdf219633ada7cdd6109816",
"assets/assets/images/haricots_sauce.jpg": "966826ae0efb5c9cfae96948a07ac015",
"assets/assets/images/salade_avocat_gombo.jpg": "54491d3c090ed059ad39f40ea0a8543e",
"assets/assets/images/alloco.jpg": "0e9805f65ccbfc0287d6f39d458cf1d3",
"assets/assets/images/sauce_feuilles_baobab.jpg": "ad9cc1882fa9e1c97448f7c7a2faf3d0",
"assets/assets/images/sauce_gombo.jpg": "d4f4a4aab942fca7633d3bf25c5dda74",
"assets/assets/images/babenda.jpg": "a4260dbff0aaa35b0d723f9a824f559f",
"assets/assets/images/jus_gingembre.jpg": "da549ded1790b0e902487d4089fc244f",
"assets/assets/images/jus_tamarin.jpg": "5940768560a2985182b25cfcb099eb2b",
"assets/assets/images/bissap.jpg": "07618a34682837e6026c9be2984ab540",
"assets/assets/images/logo.jpg": "3ab67c646ede08c1ce35cccd1c155359",
"assets/assets/images/benga.jpg": "7fb164934290fe9c85078227f8010d12",
"assets/assets/images/koko.jpg": "f5cd2446d3de2cb62e711a0f6616ceb7",
"assets/assets/images/dolo.jpg": "fc73c3121cf690542dd152cd800934d3",
"assets/assets/images/soupe_moringa.jpg": "ae2957bd2e43a026cac8bc9766f8f497",
"assets/assets/images/to_mil_gombo.jpg": "c6946707cc0cdf84ddf3bd5653267bc5",
"assets/assets/images/poulet_braise.jpg": "c3564c8c75144b8112cc9300587d02a3",
"assets/assets/images/galettes_mil.jpg": "aeb467c946bc2e4bee0c885a50b58ba2",
"assets/assets/images/koose.jpg": "7b8e42ca16f84583d25eaadbdb323139",
"assets/assets/images/koura_koura.jpg": "c2a97cd35e5869dc8245d2ea936cefa1",
"assets/assets/images/gateau_niebe.jpg": "0ace0647a5b08eb11385f63d51635940",
"assets/assets/images/riz_gras.jpg": "60e21b21c4de14917a036c883e77288f",
"assets/fonts/MaterialIcons-Regular.otf": "08dca26475c8a2ac7a41ee428584eb53"};
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
