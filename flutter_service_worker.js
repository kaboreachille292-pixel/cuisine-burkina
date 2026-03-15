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
"index.html": "1bad58497acc17e3383e7330abc4d563",
"/": "1bad58497acc17e3383e7330abc4d563",
"version.json": "cc857f01538965156c66e711cdd5fd7a",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"flutter_bootstrap.js": "63bffa5c5a744e2f539227815ee9c04c",
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
"assets/fonts/MaterialIcons-Regular.otf": "08dca26475c8a2ac7a41ee428584eb53",
".git/config": "ba45fcb312765fb6c801d4970d500f1f",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/index": "f7da01ed0ad4ed5504fd9ef14466e90c",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/refs/remotes/origin/gh-pages": "231bff72ffca1444f266422a46e57f12",
".git/refs/heads/gh-pages": "231bff72ffca1444f266422a46e57f12",
".git/packed-refs": "a891e6bb26eb0d480aef486a7e8ea166",
".git/objects/4b/e022c59fdb4d7824bb34486f2c96a01a09b704": "acf8206e8f23fa7deec4bcf903cd2c03",
".git/objects/61/45d6e52cb9ed7a0b7a4aacc3ba48773a2abb02": "3a0c5362303dd3d60455803a62f4449f",
".git/objects/58/1429178240347e3602a080ec74b8d3def21d41": "491d3db7662e2f408aafef4d3952bda3",
".git/objects/0c/65989d2db008e29a5c6b4f8bef5bd008a6d14a": "9d39a5039c943c4a17a8ded6687a6691",
".git/objects/c8/3af99da428c63c1f82efdcd11c8d5297bddb04": "144ef6d9a8ff9a753d6e3b9573d5242f",
".git/objects/68/43fddc6aef172d5576ecce56160b1c73bc0f85": "2a91c358adf65703ab820ee54e7aff37",
".git/objects/df/b0947ce0d9044b7e80888eec39f58fd20fecc7": "8528965fc35b767aedda19e357e125e3",
".git/objects/b0/93aae7251a4bdb13deab91fea4b9384d335f21": "da8b973657d91734f3c1ddffc3e82142",
".git/objects/43/55c19123cbb1013ade6f358ec8b9fcaf5afe3f": "75677854855d5b6533f9317331a35c46",
".git/objects/ca/da20a1c771ff98cec4c910899894696f7899c7": "0868168b2efc345525dd72feb3c1153a",
".git/objects/d9/5b1d3499b3b3d3989fa2a461151ba2abd92a07": "a072a09ac2efe43c8d49b7356317e52e",
".git/objects/2e/0804bddb4e2bfb999e8c5e68e7f94a7bd4611b": "9d39d212959378a4a1d0da5a911a6957",
".git/objects/c9/91aa39a2c7368205668f7cf88c519ad300c807": "1562a0e8d86365a9dadcc14f382b83fd",
".git/objects/ea/7a03b3fe1dff56b89d6720a621ac1d7880e7f6": "bd4250561f3228f3b1c1419fd6e2e701",
".git/objects/0b/362a0a4094b7ca503beceb6c4e29090f685947": "e296b2e3d40dda3cf0b98ba87a5b987c",
".git/objects/1f/b820addc505fd2e9d27c3cbba5144f8c4e7298": "9e5edcdd6155332858b2788d41045a12",
".git/objects/51/03e757c71f2abfd2269054a790f775ec61ffa4": "d437b77e41df8fcc0c0e99f143adc093",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/8e/21753cdb204192a414b235db41da6a8446c8b4": "1e467e19cabb5d3d38b8fe200c37479e",
".git/objects/fd/05cfbc927a4fedcbe4d6d4b62e2c1ed8918f26": "5675c69555d005a1a244cc8ba90a402c",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/7c/3463b788d022128d17b29072564326f1fd8819": "37fee507a59e935fc85169a822943ba2",
".git/objects/93/b363f37b4951e6c5b9e1932ed169c9928b1e90": "c8d74fb3083c0dc39be8cff78a1d4dd5",
".git/objects/a0/bfa83bcc9c0e3eff933ff40ad0977cefdb3430": "c81d0c039eead450b11683eac87de08a",
".git/objects/f3/3e0726c3581f96c51f862cf61120af36599a32": "afcaefd94c5f13d3da610e0defa27e50",
".git/objects/3b/7a7c0e756fac29d6bc87e278aa2b90aaa5f97a": "10f48bad2f630b589c45b166e82fb4a5",
".git/objects/4e/ca3ee6560246699858b12d57b1ad4bbaa0fba1": "e1d8a3553d4e70808e32dc608441bfb5",
".git/objects/f6/e6c75d6f1151eeb165a90f04b4d99effa41e83": "95ea83d65d44e4c524c6d51286406ac8",
".git/objects/b6/c13311b324923e96191e00a67c7b569f7b241f": "8da832a3376bdaed8de4a4acd12ed526",
".git/objects/08/27c17254fd3959af211aaf91a82d3b9a804c2f": "360dc8df65dabbf4e7f858711c46cc09",
".git/objects/6d/7f22865755cd72d3751b83098122587cbbcf7b": "c691b3d74e73cf9f42680d60ee9e3205",
".git/objects/dc/421f140a9b8001ec1cf8c91613e9ccdad200c6": "eef5e4cef2c97829cf85e36b7b73ce10",
".git/objects/5e/d49553af0f45f078a8f31cd599a694ec64df0c": "6720efae232d68dd00040f25de3cb32b",
".git/objects/a7/3f4b23dde68ce5a05ce4c658ccd690c7f707ec": "ee275830276a88bac752feff80ed6470",
".git/objects/99/7c15aa6b9ec4597046b28fec6a324eb2490247": "a54eb39b28cdb041cd0c6aadc1005602",
".git/objects/b9/3e39bd49dfaf9e225bb598cd9644f833badd9a": "666b0d595ebbcc37f0c7b61220c18864",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/3a/8cda5335b4b2a108123194b84df133bac91b23": "1636ee51263ed072c69e4e3b8d14f339",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/41/057ffd479ef4678d71dfa4496fba58ee1e802b": "78f948b187e2f727219f65ca88a557b8",
".git/objects/2b/de8c41d0ec21e477cfaacfbe6dae9c18bd5184": "7f77fd45f0ad170666919d098fb48526",
".git/objects/85/63aed2175379d2e75ec05ec0373a302730b6ad": "997f96db42b2dde7c208b10d023a5a8e",
".git/objects/2d/24605462675b5159a374df0dfa113be7cd50aa": "b33d2f909c9a3a86cdde22570a513f72",
".git/objects/1b/19eb26682dcf544d09e56b5380803dc76688f9": "4bb1ed58a954d40d4fa7e10897610736",
".git/objects/b2/86fee935ece43f0f65139db13c37fb91700ba9": "410d215dcb6c678b6c811de0ff72077f",
".git/objects/b2/5b504bbdb9c75c1602d9ed8bc730eff1b11020": "c7688f68045c671739ec15836623c487",
".git/objects/b2/2f75cfdb5215a206587bf38d8d5f6a77085f80": "f65764dc57a973c52f25f4aad6369c2d",
".git/objects/72/1a41920ee769e9c2f783f00574b22a69298d1b": "afd942c41a9fdbe477d094fb2c1f508c",
".git/objects/4a/611f08ec7c8c819ddf23c3512167e059973d50": "50b2aff0ec41213f1dcea7f03cfe8472",
".git/objects/4a/d4e986e2b0e7838c6fa2a8ddcb8e6fcd0d8ba9": "085c84be7556477c1491301a7082c7e4",
".git/objects/60/d4b0912898c3084d9aa7422091a25bbe77c071": "e7bb3a3903cdf102125ed37bef24aa8d",
".git/objects/6f/7661bc79baa113f478e9a717e0c4959a3f3d27": "985be3a6935e9d31febd5205a9e04c4e",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/90/dff1f532d9d5265431bebbd2533ac5dead94df": "706a54f14b0bd542e65fdc258ab922ff",
".git/objects/ad/ced61befd6b9d30829511317b07b72e66918a1": "37e7fcca73f0b6930673b256fac467ae",
".git/objects/10/2a469837158f9e635baf1dd101a1ab5e9ece22": "76c1aa73c0b9b3a15cee2e5404c77a5a",
".git/objects/91/d31579c62f0d18f2987b88598f2ab42439166e": "aff06da0516f730244713fa30fa48fe1",
".git/objects/bb/3570bc41f7752e9481d35d3c634117553acce7": "cb09dcc2abaa6d0b4427db6f8ae7ca94",
".git/objects/16/2203fc22a93b751a1828e1ed494c86d7bf622b": "2d6bed9c944c4983c5065fb55a5bd0e6",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/20/d4e8017af5e3f30f5229722894a930f113edc7": "6494458afaf7d15fab5c1ea4bda40857",
".git/objects/9a/7f8e3a83867d87a217b2bdb307528cde1e3e84": "3977e69703aadd559b4756b67f8ba101",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/COMMIT_EDITMSG": "fcfb3044275c5437541359e2228c9471",
".git/logs/refs/remotes/origin/gh-pages": "a138747efd0a5a35e82a1edab7596438",
".git/logs/refs/heads/gh-pages": "0056bdb11c0b5fdff5445ad9f368300f",
".git/logs/HEAD": "690544ea7ebae60981d37ccbe5c0994e"};
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
