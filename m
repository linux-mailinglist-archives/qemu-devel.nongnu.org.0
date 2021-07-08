Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E173C18DC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 20:04:28 +0200 (CEST)
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1YNv-0000TQ-OT
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 14:04:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Xme-0007nm-Gj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:25:56 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:45788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1Xmc-0005aM-Ir
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:25:56 -0400
Received: by mail-pl1-x630.google.com with SMTP id p17so2878736plf.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tSM/Cp2WLt9oPifX9I5a3abc81SiA3RuI+QQhdWcm/I=;
 b=utD2GbPKLz7uoCA1roh0U0mrB5qJnkavYvZaKSVwT99IgW55qIEnycRZ48wUAB+K/L
 0XWkqD+j0XwUeHT8XpkoBndokOicafWZYpAAPiCpR7tswMF8wHq31FMZqsf50SrTIclO
 L0cWzWub8Gi6Wkd+uEQwf830WA5D5o7UIX0RE9ZwH8pMK158s17n3iqM7ogaqVSoqHWn
 K8+9T52bV4vnkSpfvVbSDRjq6980YPJNxzqioRS+G+EFNDjNQUs+oYiQwSiF6jZHDxRS
 Va48sJayL8Z7lru3QDECuPuaWP2J5v5IMfooqllOCNUWSBiH77W4EZtjcFamg67GwOS0
 iE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tSM/Cp2WLt9oPifX9I5a3abc81SiA3RuI+QQhdWcm/I=;
 b=OivZnrSIhrVIJz13zWr/z1j8i3TJ5Pt+kd6z89060qQqEhZRvxo8WP5Z3qpNcVSWeB
 fZw9yPMM5lTMj5XNgceAlQZXxMfcZ0ISSjmlkynfy6HPx0wthiopuE+RGgE+Fzn1QFMW
 RLLOxafllTCxnXaaqk2/cQeRhMtJGLo8HZkHqS2DxgGq8KP5Q3QEgZOIBUD4j73ylt9L
 1p5cS2tCsV1I96cam/Jvq1dFtmmGMRNObC19UfN4DBnkq3lgXsx8uijjfFzeYaBzj7XQ
 l5AHUKJoAkXLTAhEpnK5+NxJJ4jibwAm5mGI49LFsIfV7SrLzFkF38SAE5najc5KhZsh
 DhrQ==
X-Gm-Message-State: AOAM532HlR8xKhsJlLopuvrkMbeURr3pCplL7u3EjgmvXRmOcgC598nU
 S168hBYGGKfZ+bxInVitq25wfUJFB92ivA==
X-Google-Smtp-Source: ABdhPJyV+de/2qZm0BLsZrGu4sv6BKaO3FDov1tOfSgN72EagPS6a7yFIpfkstcJJLksfeSSoBEglg==
X-Received: by 2002:a17:902:e88a:b029:129:7624:1fa5 with SMTP id
 w10-20020a170902e88ab029012976241fa5mr23167265plg.2.1625765153046; 
 Thu, 08 Jul 2021 10:25:53 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:7947:37f7:fd02:9c0c])
 by smtp.gmail.com with ESMTPSA id c20sm3579429pfd.64.2021.07.08.10.25.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:25:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 3/4] ui/icons: Use bundle mechanism
Date: Fri,  9 Jul 2021 02:25:40 +0900
Message-Id: <20210708172541.29530-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210708172541.29530-1-akihiko.odaki@gmail.com>
References: <20210708172541.29530-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Programmingkid <programmingkidx@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 configure   | 10 ++++++++++
 meson.build |  3 +--
 ui/cocoa.m  | 20 +++++++++++---------
 ui/gtk.c    |  8 +++++---
 ui/sdl2.c   | 18 +++++++++++-------
 5 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/configure b/configure
index cff5a8ac280..a9f746849ec 100755
--- a/configure
+++ b/configure
@@ -5058,6 +5058,16 @@ for f in $UNLINK ; do
     fi
 done
 
+for icon_extension in bmp png ; do
+  for icon_file in $source_path/ui/icons/qemu_*.$icon_extension ; do
+    icon_basename=${icon_file%.$icon_extension}
+    icon_name=${icon_basename#$source_path/ui/icons/qemu_}
+    icon_dir=qemu-bundle/share/icons/hicolor/$icon_name/apps
+    symlink $icon_file $icon_dir/qemu.$icon_extension
+  done
+done
+
+symlink $source_path/ui/icons/qemu.svg qemu-bundle/share/icons/hicolor/scalable/apps/qemu.svg
 symlink ../../pc-bios qemu-bundle/share/qemu
 
 (for i in $cross_cc_vars; do
diff --git a/meson.build b/meson.build
index 44adc660e23..6d90fe92bf1 100644
--- a/meson.build
+++ b/meson.build
@@ -1200,8 +1200,7 @@ config_host_data.set_quoted('CONFIG_QEMU_CONFDIR', get_option('prefix') / qemu_c
 config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_DATADIR', qemu_datadir)
 config_host_data.set_quoted('CONFIG_QEMU_DESKTOPDIR', get_option('prefix') / qemu_desktopdir)
 config_host_data.set_quoted('CONFIG_QEMU_FIRMWAREPATH', get_option('qemu_firmwarepath'))
-config_host_data.set_quoted('CONFIG_QEMU_HELPERDIR', get_option('prefix') / get_option('libexecdir'))
-config_host_data.set_quoted('CONFIG_QEMU_ICONDIR', get_option('prefix') / qemu_icondir)
+config_host_data.set_quoted('CONFIG_QEMU_BUNDLE_ICONDIR', qemu_icondir)
 config_host_data.set_quoted('CONFIG_QEMU_LOCALEDIR', get_option('prefix') / get_option('localedir'))
 config_host_data.set_quoted('CONFIG_QEMU_LOCALSTATEDIR', get_option('prefix') / get_option('localstatedir'))
 config_host_data.set_quoted('CONFIG_QEMU_MODDIR', get_option('prefix') / qemu_moddir)
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b079..d459dfaf595 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1477,15 +1477,17 @@ - (void)make_about_window
     NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
 
     /* Make the picture of QEMU */
-    NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
-                                                     picture_rect];
-    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
-    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
-    g_free(qemu_image_path_c);
-    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
-    [picture_view setImage: qemu_image];
-    [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
-    [superView addSubview: picture_view];
+    char *qemu_image_path_c = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    if (qemu_image_path_c) {
+        NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
+        g_free(qemu_image_path_c);
+        NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
+                                                         picture_rect];
+        NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
+        [picture_view setImage: qemu_image];
+        [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
+        [superView addSubview: picture_view];
+    }
 
     /* Make the name label */
     NSBundle *bundle = [NSBundle mainBundle];
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b9..e250f9e18a0 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2198,9 +2198,11 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     s->opts = opts;
 
     theme = gtk_icon_theme_get_default();
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR);
-    gtk_icon_theme_prepend_search_path(theme, dir);
-    g_free(dir);
+    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR);
+    if (dir) {
+        gtk_icon_theme_prepend_search_path(theme, dir);
+        g_free(dir);
+    }
     g_set_prgname("qemu");
 
     s->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
diff --git a/ui/sdl2.c b/ui/sdl2.c
index a203cb0239e..7b7ed9f9065 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -877,15 +877,19 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     }
 
 #ifdef CONFIG_SDL_IMAGE
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/128x128/apps/qemu.png");
-    icon = IMG_Load(dir);
+    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/128x128/apps/qemu.png");
+    if (dir) {
+        icon = IMG_Load(dir);
+    }
 #else
     /* Load a 32x32x4 image. White pixels are transparent. */
-    dir = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
-    icon = SDL_LoadBMP(dir);
-    if (icon) {
-        uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
-        SDL_SetColorKey(icon, SDL_TRUE, colorkey);
+    dir = find_bundle(CONFIG_QEMU_BUNDLE_ICONDIR "/hicolor/32x32/apps/qemu.bmp");
+    if (dir) {
+        icon = SDL_LoadBMP(dir);
+        if (icon) {
+            uint32_t colorkey = SDL_MapRGB(icon->format, 255, 255, 255);
+            SDL_SetColorKey(icon, SDL_TRUE, colorkey);
+        }
     }
 #endif
     g_free(dir);
-- 
2.30.1 (Apple Git-130)


