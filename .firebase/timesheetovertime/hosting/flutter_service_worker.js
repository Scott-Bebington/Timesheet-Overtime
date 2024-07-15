'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".dart_tool/dartpad/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/extension_discovery/vs_code.json": "4278042a60020404627229c76e69de4f",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/app.dill": "3f8e6a9008288a7e28d9ebbdf829c7ff",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/app.dill.deps": "bc51392b56ecf610d61ef871729ee636",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/dart2js.d": "1b0019d778808a5fd0c665f5a255e7a7",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/dart2js.stamp": "24cd772826344a80b1e31534f75da330",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/flutter_assets.d": "f5ee719feab9011f6b69c0b765794871",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/gen_localizations.stamp": "436d2f2faeb7041740ee3f49a985d62a",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/main.dart": "c46c010bcfa19286732cdc200c03a3a8",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/main.dart.js": "2d4a37fbb167c51749d8ecd0b8507a5f",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/main.dart.js.deps": "d8af5b6eef7ff7ce90d05a16b4815bd2",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/outputs.json": "bbb1afd606ed2dac48cd3d47a9ae5ec5",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/service_worker.d": "325bd8d5c842da56de4666578e9a97af",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/web_entrypoint.stamp": "7752a0e27bc21ddbcd18b071cb8ed810",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/web_plugin_registrant.dart": "7ed35bc85b7658d113371ffc24d07117",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/web_release_bundle.stamp": "5451fbfd1b255def5ade60ae5f17ce1d",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/web_resources.d": "c72dc84fcae98a4b1462df088be163cb",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/web_service_worker.stamp": "6e9ec9516af9f67a8fbeaad5cbe62adc",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/web_static_assets.stamp": "f9e8f27a089b1224de811f1d3e4c1948",
".dart_tool/flutter_build/d5a909b4f63db0e8e62de54f20122aef/web_templated_files.stamp": "c319684b2cf9faca550b81d4b40cc001",
".dart_tool/package_config.json": "95cf713ff853a6f42eed9e522f82d073",
".dart_tool/package_config_subset": "95aef771c953c6e4a7049098c3d34a4f",
".dart_tool/version": "b36c5c3b36a6c414707a0613dfdc9ad6",
".idea/libraries/Dart_SDK.xml": "3a7572a66e709145932a6b89d0efb7a0",
".idea/libraries/KotlinJavaRuntime.xml": "de38cfadca3106f8aff5ab15dd81692f",
".idea/modules.xml": "3dc2b1be4618fe386b0a4fd6bb2ccfad",
".idea/runConfigurations/main_dart.xml": "0ecf958af289efc3fc1927aa27a8442f",
".idea/workspace.xml": "25155dfb2368a7e35e1ebbecd505a418",
"analysis_options.yaml": "9e65f4b9beebb674c0dc252f70a5c177",
"assets/AssetManifest.bin": "601d9fb1718263fb88b923f4ccbd78a0",
"assets/AssetManifest.bin.json": "958371a08a328a1f561b539390bc3f66",
"assets/AssetManifest.json": "528688ba0de0a06bb4e2917fc07bf9fe",
"assets/assets/images/clock.png": "2cf63df8996ba437003af3d312259892",
"assets/assets/images/distance.png": "1d190a689a1a0a155f8e03ae27c6728c",
"assets/assets/images/overtime.png": "374ec0ee3938c8f1c676223f0b70e9ba",
"assets/assets/images/timesheet.png": "d84b07cc011fd086332d63b799247917",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "0308116262111e268410aa536b5082d0",
"assets/NOTICES": "4a0a7b4e7d63b6c2f0ed61a80d291cf9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "302dbd9f3334ff132921b54ab4f2a69b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"build/web/assets/AssetManifest.bin": "693635b5258fe5f1cda720cf224f158c",
"build/web/assets/AssetManifest.bin.json": "69a99f98c8b1fb8111c5fb961769fcd8",
"build/web/assets/AssetManifest.json": "2efbb41d7877d10aac9d091f58ccd7b9",
"build/web/assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"build/web/assets/fonts/MaterialIcons-Regular.otf": "8ea08ea2444cc58ec5807fd7669e488f",
"build/web/assets/NOTICES": "27d5bc3ec8b77b7edaf14b20057188bb",
"build/web/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"build/web/assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"build/web/canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"build/web/canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"build/web/canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"build/web/canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"build/web/canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"build/web/canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"build/web/canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"build/web/canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"build/web/canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"build/web/canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"build/web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"build/web/flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"build/web/flutter_bootstrap.js": "12056e2798b604f6dab2f26c27fb498f",
"build/web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"build/web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"build/web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"build/web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"build/web/index.html": "7bc6965fa7840677da033936e3d26b78",
"build/web/main.dart.js": "2d4a37fbb167c51749d8ecd0b8507a5f",
"build/web/manifest.json": "2dc80429ba3cfa6f4dffea813e79cf17",
"build/web/version.json": "e5256a8832f657fa1c2090bdf004b1d4",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "20cdaf6d00f95a7cfc81be3918f4a9f8",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "aabeceda6602d814ba4d731f23f1b06d",
"/": "aabeceda6602d814ba4d731f23f1b06d",
"lib/main.dart": "d8621d84413b0f1b1eeb5df51af935a1",
"main.dart.js": "44e11fb72ff6f0e041e807510860a5c5",
"manifest.json": "4d6a2720a2dac71f6eab3b8b38c7a9e4",
"pubspec.lock": "d931b83f789f3a84bd6694d7f0438be8",
"pubspec.yaml": "372cf66538f15fbd7a5d63b7d2019e28",
"README.md": "76cff975e1eb322680927a20cb1e1be8",
"test/widget_test.dart": "1805e8d6a7789c47cf155fb68aa63380",
"timesheetovertime.iml": "f9bf5c490675c84d098e6772a6f2a796",
"version.json": "36c41b46ae96a1ab4d9c1312cac5cfa0",
"web/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"web/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"web/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"web/icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"web/icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"web/index.html": "b9886dd9566412dc3e7c775f92e1856c",
"web/manifest.json": "2dc80429ba3cfa6f4dffea813e79cf17"};
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
