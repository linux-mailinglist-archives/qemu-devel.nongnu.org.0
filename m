Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6BC50FBB5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 13:08:28 +0200 (CEST)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njJ3T-0007iX-Ez
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 07:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzI-0004Zj-M9
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1njIzF-0004VB-4w
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 07:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650971043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbWyxpAN2CT7eVFuMh6Wd1UtGCO4v/8bV2zyxrPfnYQ=;
 b=ZvZWdGLlWWWFoYdSwyQyIqEUF+FdEOk0GMjaYYaUcOgZw3Z/cuy0e2zjzialwwxi3kBc+j
 RlIJvzAeyIMfGTS6WUIlmErlbVfTh1nUO/0aVzjpqhIgoHfpIu8L550JeC1PEc/r2H4srg
 iPZIOLGahBWjK3oKAaaH0tR/lkrkVdc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-keBu_1eNO7Oh8oU1vFFQ6g-1; Tue, 26 Apr 2022 07:04:02 -0400
X-MC-Unique: keBu_1eNO7Oh8oU1vFFQ6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2B7B802C16;
 Tue, 26 Apr 2022 11:04:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 60AA243E786;
 Tue, 26 Apr 2022 11:04:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 76BC91800639; Tue, 26 Apr 2022 13:03:58 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] Replacing CONFIG_VNC_PNG with CONFIG_PNG
Date: Tue, 26 Apr 2022 13:03:50 +0200
Message-Id: <20220426110358.1570723-3-kraxel@redhat.com>
In-Reply-To: <20220426110358.1570723-1-kraxel@redhat.com>
References: <20220426110358.1570723-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kshitij Suri <kshitij.suri@nutanix.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kshitij Suri <kshitij.suri@nutanix.com>

Libpng is only detected if VNC is enabled currently. This patch adds a
generalised png option in the meson build which is aimed to replace use of
CONFIG_VNC_PNG with CONFIG_PNG.

Signed-off-by: Kshitij Suri <kshitij.suri@nutanix.com>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220408071336.99839-2-kshitij.suri@nutanix.com>

[ kraxel: add meson-buildoptions.sh updates ]
[ kraxel: fix centos8 testcase ]

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson_options.txt                              |  4 ++--
 ui/vnc.h                                       |  2 +-
 ui/vnc-enc-tight.c                             | 18 +++++++++---------
 ui/vnc.c                                       |  4 ++--
 meson.build                                    | 12 +++++++-----
 .../ci/org.centos/stream/8/x86_64/configure    |  2 +-
 scripts/meson-buildoptions.sh                  |  6 +++---
 7 files changed, 25 insertions(+), 23 deletions(-)

diff --git a/meson_options.txt b/meson_options.txt
index 52b11cead44a..d85734f8e6bf 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -177,12 +177,12 @@ option('vde', type : 'feature', value : 'auto',
        description: 'vde network backend support')
 option('virglrenderer', type : 'feature', value : 'auto',
        description: 'virgl rendering support')
+option('png', type : 'feature', value : 'auto',
+       description: 'PNG support with libpng')
 option('vnc', type : 'feature', value : 'auto',
        description: 'VNC server')
 option('vnc_jpeg', type : 'feature', value : 'auto',
        description: 'JPEG lossy compression for VNC server')
-option('vnc_png', type : 'feature', value : 'auto',
-       description: 'PNG compression for VNC server')
 option('vnc_sasl', type : 'feature', value : 'auto',
        description: 'SASL authentication for VNC server')
 option('vte', type : 'feature', value : 'auto',
diff --git a/ui/vnc.h b/ui/vnc.h
index a7149831f906..a60fb13115c9 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -201,7 +201,7 @@ typedef struct VncTight {
 #ifdef CONFIG_VNC_JPEG
     Buffer jpeg;
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     Buffer png;
 #endif
     int levels[4];
diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
index 5a4b8a4fc0f6..09200d71b8cf 100644
--- a/ui/vnc-enc-tight.c
+++ b/ui/vnc-enc-tight.c
@@ -32,7 +32,7 @@
    INT32 definitions between jmorecfg.h (included by jpeglib.h) and
    Win32 basetsd.h (included by windows.h). */
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 /* The following define is needed by pngconf.h. Otherwise it won't compile,
    because setjmp.h was already included by osdep.h. */
 #define PNG_SKIP_SETJMP_CHECK
@@ -95,7 +95,7 @@ static const struct {
 };
 #endif
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static const struct {
     int png_zlib_level, png_filters;
 } tight_png_conf[] = {
@@ -919,7 +919,7 @@ static int send_full_color_rect(VncState *vs, int x, int y, int w, int h)
     int stream = 0;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, NULL);
     }
@@ -966,7 +966,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
     int stream = 1;
     int level = tight_conf[vs->tight->compression].mono_zlib_level;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         int ret;
         int bpp = vs->client_pf.bytes_per_pixel * 8;
@@ -1020,7 +1020,7 @@ static int send_mono_rect(VncState *vs, int x, int y,
 struct palette_cb_priv {
     VncState *vs;
     uint8_t *header;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     png_colorp png_palette;
 #endif
 };
@@ -1082,7 +1082,7 @@ static int send_palette_rect(VncState *vs, int x, int y,
     int colors;
     ssize_t bytes;
 
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     if (tight_can_send_png_rect(vs, w, h)) {
         return send_png_rect(vs, x, y, w, h, palette);
     }
@@ -1233,7 +1233,7 @@ static int send_jpeg_rect(VncState *vs, int x, int y, int w, int h, int quality)
 /*
  * PNG compression stuff.
  */
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
 static void write_png_palette(int idx, uint32_t pix, void *opaque)
 {
     struct palette_cb_priv *priv = opaque;
@@ -1379,7 +1379,7 @@ static int send_png_rect(VncState *vs, int x, int y, int w, int h,
     buffer_reset(&vs->tight->png);
     return 1;
 }
-#endif /* CONFIG_VNC_PNG */
+#endif /* CONFIG_PNG */
 
 static void vnc_tight_start(VncState *vs)
 {
@@ -1706,7 +1706,7 @@ void vnc_tight_clear(VncState *vs)
 #ifdef CONFIG_VNC_JPEG
     buffer_free(&vs->tight->jpeg);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_free(&vs->tight->png);
 #endif
 }
diff --git a/ui/vnc.c b/ui/vnc.c
index badf1d7664fe..7d55e1500a42 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -2165,7 +2165,7 @@ static void set_encodings(VncState *vs, int32_t *encodings, size_t n_encodings)
             vs->features |= VNC_FEATURE_TIGHT_MASK;
             vs->vnc_encoding = enc;
             break;
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
         case VNC_ENCODING_TIGHT_PNG:
             vs->features |= VNC_FEATURE_TIGHT_PNG_MASK;
             vs->vnc_encoding = enc;
@@ -3256,7 +3256,7 @@ static void vnc_connect(VncDisplay *vd, QIOChannelSocket *sioc,
 #ifdef CONFIG_VNC_JPEG
     buffer_init(&vs->tight->jpeg,     "vnc-tight-jpeg/%p", sioc);
 #endif
-#ifdef CONFIG_VNC_PNG
+#ifdef CONFIG_PNG
     buffer_init(&vs->tight->png,      "vnc-tight-png/%p", sioc);
 #endif
     buffer_init(&vs->zlib.zlib,      "vnc-zlib/%p", sioc);
diff --git a/meson.build b/meson.build
index d083c6b7bf90..0c38e491f488 100644
--- a/meson.build
+++ b/meson.build
@@ -1115,14 +1115,16 @@ if gtkx11.found()
   x11 = dependency('x11', method: 'pkg-config', required: gtkx11.found(),
                    kwargs: static_kwargs)
 endif
-vnc = not_found
 png = not_found
+if get_option('png').allowed() and have_system
+   png = dependency('libpng', required: get_option('png'),
+                    method: 'pkg-config', kwargs: static_kwargs)
+endif
+vnc = not_found
 jpeg = not_found
 sasl = not_found
 if get_option('vnc').allowed() and have_system
   vnc = declare_dependency() # dummy dependency
-  png = dependency('libpng', required: get_option('vnc_png'),
-                   method: 'pkg-config', kwargs: static_kwargs)
   jpeg = dependency('libjpeg', required: get_option('vnc_jpeg'),
                     method: 'pkg-config', kwargs: static_kwargs)
   sasl = cc.find_library('sasl2', has_headers: ['sasl/sasl.h'],
@@ -1554,9 +1556,9 @@ config_host_data.set('CONFIG_TPM', have_tpm)
 config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
 config_host_data.set('CONFIG_VDE', vde.found())
 config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
+config_host_data.set('CONFIG_PNG', png.found())
 config_host_data.set('CONFIG_VNC', vnc.found())
 config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
-config_host_data.set('CONFIG_VNC_PNG', png.found())
 config_host_data.set('CONFIG_VNC_SASL', sasl.found())
 config_host_data.set('CONFIG_VIRTFS', have_virtfs)
 config_host_data.set('CONFIG_VTE', vte.found())
@@ -3667,11 +3669,11 @@ summary_info += {'curses support':    curses}
 summary_info += {'virgl support':     virgl}
 summary_info += {'curl support':      curl}
 summary_info += {'Multipath support': mpathpersist}
+summary_info += {'PNG support':       png}
 summary_info += {'VNC support':       vnc}
 if vnc.found()
   summary_info += {'VNC SASL support':  sasl}
   summary_info += {'VNC JPEG support':  jpeg}
-  summary_info += {'VNC PNG support':   png}
 endif
 if targetos not in ['darwin', 'haiku', 'windows']
   summary_info += {'OSS support':     oss}
diff --git a/scripts/ci/org.centos/stream/8/x86_64/configure b/scripts/ci/org.centos/stream/8/x86_64/configure
index 9850dd44444a..65d6bc7eee96 100755
--- a/scripts/ci/org.centos/stream/8/x86_64/configure
+++ b/scripts/ci/org.centos/stream/8/x86_64/configure
@@ -142,7 +142,7 @@
 --disable-virtiofsd \
 --disable-vnc \
 --disable-vnc-jpeg \
---disable-vnc-png \
+--disable-png \
 --disable-vnc-sasl \
 --disable-vte \
 --disable-vvfat \
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 1e26f4571ef4..ef0dcd4a7768 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -94,6 +94,7 @@ meson_options_help() {
   printf "%s\n" '  oss             OSS sound support'
   printf "%s\n" '  pa              PulseAudio sound support'
   printf "%s\n" '  parallels       parallels image format support'
+  printf "%s\n" '  png             PNG support with libpng'
   printf "%s\n" '  qcow1           qcow1 image format support'
   printf "%s\n" '  qed             qed image format support'
   printf "%s\n" '  qga-vss         build QGA VSS support (broken with MinGW)'
@@ -123,7 +124,6 @@ meson_options_help() {
   printf "%s\n" '  virtiofsd       build virtiofs daemon (virtiofsd)'
   printf "%s\n" '  vnc             VNC server'
   printf "%s\n" '  vnc-jpeg        JPEG lossy compression for VNC server'
-  printf "%s\n" '  vnc-png         PNG compression for VNC server'
   printf "%s\n" '  vnc-sasl        SASL authentication for VNC server'
   printf "%s\n" '  vte             vte support for the gtk UI'
   printf "%s\n" '  vvfat           vvfat image format support'
@@ -277,6 +277,8 @@ _meson_option_parse() {
     --disable-pa) printf "%s" -Dpa=disabled ;;
     --enable-parallels) printf "%s" -Dparallels=enabled ;;
     --disable-parallels) printf "%s" -Dparallels=disabled ;;
+    --enable-png) printf "%s" -Dpng=enabled ;;
+    --disable-png) printf "%s" -Dpng=disabled ;;
     --enable-profiler) printf "%s" -Dprofiler=true ;;
     --disable-profiler) printf "%s" -Dprofiler=false ;;
     --enable-qcow1) printf "%s" -Dqcow1=enabled ;;
@@ -347,8 +349,6 @@ _meson_option_parse() {
     --disable-vnc) printf "%s" -Dvnc=disabled ;;
     --enable-vnc-jpeg) printf "%s" -Dvnc_jpeg=enabled ;;
     --disable-vnc-jpeg) printf "%s" -Dvnc_jpeg=disabled ;;
-    --enable-vnc-png) printf "%s" -Dvnc_png=enabled ;;
-    --disable-vnc-png) printf "%s" -Dvnc_png=disabled ;;
     --enable-vnc-sasl) printf "%s" -Dvnc_sasl=enabled ;;
     --disable-vnc-sasl) printf "%s" -Dvnc_sasl=disabled ;;
     --enable-vte) printf "%s" -Dvte=enabled ;;
-- 
2.35.1


