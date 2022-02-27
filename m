Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB14C5942
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 05:25:13 +0100 (CET)
Received: from localhost ([::1]:41066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOB7Q-0007y9-26
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 23:25:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOB58-0006EY-5x
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 23:22:50 -0500
Received: from [2607:f8b0:4864:20::102f] (port=40853
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nOB56-00077E-Cj
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 23:22:49 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 em10-20020a17090b014a00b001bc3071f921so11865385pjb.5
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 20:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IM6VwbNeSlgOErfo82BYeQWh1KPCm7vngBaTl/7ROWk=;
 b=gJFaXzG64qnZDFmuGTiVXCDa+yn2KQg0FfbTNcFw+SCKYLLhhhSfm5AzoXKRcWIrww
 G0NHNQ7m0JUDEfsr/r4gTSXabmZfIP60/KIGBRxxwlcr2MPcPn+723p15sk8IZIyBC+Z
 LmKPXmT8Qtvhk/krReKoOP3qfINOqRMlpZ4c3lm268Axj4vtsSF9ZtZQb13fWVNwylvn
 ICAHbnlUOCyzdyfh6sqZp+0tDsYMl/7Zd3/6BYLSFDWd5dL8uAVpd1KqtT/ZYbuqb7r3
 DP/ZuUZ+JQQYFjYb8nm5fkZGJOk4F8hvpsyzFOXcZHvE1RnqeFTPa8X85ClgSZAYingu
 KwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IM6VwbNeSlgOErfo82BYeQWh1KPCm7vngBaTl/7ROWk=;
 b=b1pOcpjG4Krw1nnaGnvuSQxTikVJPpExgU0WLlBopJKcoHIJ2LHkdKIavfP/SF/LPN
 0awAyvWSA1t/AdjmuhuUhj90aqsMKpN47Ynxy4feGMyEMEV4B+OpmxkNaLLPPoEGiXCM
 pkYM82HxsXtGmBhZk04B7q87Z5uX/EW9sQPp9+UgceLIDs2eN4MUZHc7kWEaMjJ10VDh
 nonfF3NeSdk68RhEV62+tqWQwg9M4QSgr9lQiH3p3k1aYXxTn+WIv9mD39aZz3xW6cCo
 3amyBE3vshUOCnvdzJtcNMiYJv01bgXCZD1aHWhoetkYvX9Cpa0KqrPjSFEFSqRAWRDy
 0x4Q==
X-Gm-Message-State: AOAM533ng+nC89HNF4LRG6Zw8w08GDXc7NPIlPY88YR5vDBszdKuwsne
 UhiA5TT0APuZ0Z9b8hSWJhMQZblka3A=
X-Google-Smtp-Source: ABdhPJw1gwTPvufH2r9y16XDH0wjn+cMUL5R2hnHR1fdKWpI6ghqSbh4/TQlXZBqX+vv1mxvoNPiKg==
X-Received: by 2002:a17:90a:ca16:b0:1bc:16a7:e840 with SMTP id
 x22-20020a17090aca1600b001bc16a7e840mr10515282pjt.225.1645935766829; 
 Sat, 26 Feb 2022 20:22:46 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:6839:3c6:46aa:5d85])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a63af0e000000b003732348b995sm6488134pge.12.2022.02.26.20.22.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 20:22:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3] ui/cocoa: Use the standard about panel
Date: Sun, 27 Feb 2022 13:22:41 +0900
Message-Id: <20220227042241.1543-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_FMBLA_NEWDOM=1.498, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This provides standard look and feel for the about panel and reduces
code.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 112 +++++++++++------------------------------------------
 1 file changed, 23 insertions(+), 89 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index a8f1cdaf926..59672fee775 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -83,7 +83,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
-static NSWindow *normalWindow, *about_window;
+static NSWindow *normalWindow;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
@@ -1120,7 +1120,6 @@ - (void)changeDeviceMedia:(id)sender;
 - (BOOL)verifyQuit;
 - (void)openDocumentation:(NSString *)filename;
 - (IBAction) do_about_menu_item: (id) sender;
-- (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
 @end
 
@@ -1166,8 +1165,6 @@ - (id) init
         [pauseLabel setFont: [NSFont fontWithName: @"Helvetica" size: 90]];
         [pauseLabel setTextColor: [NSColor blackColor]];
         [pauseLabel sizeToFit];
-
-        [self make_about_window];
     }
     return self;
 }
@@ -1451,92 +1448,29 @@ - (BOOL)verifyQuit
 /* The action method for the About menu item */
 - (IBAction) do_about_menu_item: (id) sender
 {
-    [about_window makeKeyAndOrderFront: nil];
-}
-
-/* Create and display the about dialog */
-- (void)make_about_window
-{
-    /* Make the window */
-    int x = 0, y = 0, about_width = 400, about_height = 200;
-    NSRect window_rect = NSMakeRect(x, y, about_width, about_height);
-    about_window = [[NSWindow alloc] initWithContentRect:window_rect
-                    styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |
-                    NSWindowStyleMaskMiniaturizable
-                    backing:NSBackingStoreBuffered
-                    defer:NO];
-    [about_window setTitle: @"About"];
-    [about_window setReleasedWhenClosed: NO];
-    [about_window center];
-    NSView *superView = [about_window contentView];
-
-    /* Create the dimensions of the picture */
-    int picture_width = 80, picture_height = 80;
-    x = (about_width - picture_width)/2;
-    y = about_height - picture_height - 10;
-    NSRect picture_rect = NSMakeRect(x, y, picture_width, picture_height);
-
-    /* Make the picture of QEMU */
-    NSImageView *picture_view = [[NSImageView alloc] initWithFrame:
-                                                     picture_rect];
-    char *qemu_image_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
-    NSString *qemu_image_path = [NSString stringWithUTF8String:qemu_image_path_c];
-    g_free(qemu_image_path_c);
-    NSImage *qemu_image = [[NSImage alloc] initWithContentsOfFile:qemu_image_path];
-    [picture_view setImage: qemu_image];
-    [picture_view setImageScaling: NSImageScaleProportionallyUpOrDown];
-    [superView addSubview: picture_view];
-
-    /* Make the name label */
-    NSBundle *bundle = [NSBundle mainBundle];
-    if (bundle) {
-        x = 0;
-        y = y - 25;
-        int name_width = about_width, name_height = 20;
-        NSRect name_rect = NSMakeRect(x, y, name_width, name_height);
-        NSTextField *name_label = [[NSTextField alloc] initWithFrame: name_rect];
-        [name_label setEditable: NO];
-        [name_label setBezeled: NO];
-        [name_label setDrawsBackground: NO];
-        [name_label setAlignment: NSTextAlignmentCenter];
-        NSString *qemu_name = [[bundle executablePath] lastPathComponent];
-        [name_label setStringValue: qemu_name];
-        [superView addSubview: name_label];
+    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
+    char *icon_path_c = get_relocated_path(CONFIG_QEMU_ICONDIR "/hicolor/512x512/apps/qemu.png");
+    NSString *icon_path = [NSString stringWithUTF8String:icon_path_c];
+    g_free(icon_path_c);
+    NSImage *icon = [[NSImage alloc] initWithContentsOfFile:icon_path];
+    NSString *version = @"QEMU emulator version " QEMU_FULL_VERSION;
+    NSString *copyright = @QEMU_COPYRIGHT;
+    NSDictionary *options;
+    if (icon) {
+        options = @{
+            NSAboutPanelOptionApplicationIcon : icon,
+            NSAboutPanelOptionApplicationVersion : version,
+            @"Copyright" : copyright,
+        };
+        [icon release];
+    } else {
+        options = @{
+            NSAboutPanelOptionApplicationVersion : version,
+            @"Copyright" : copyright,
+        };
     }
-
-    /* Set the version label's attributes */
-    x = 0;
-    y = 50;
-    int version_width = about_width, version_height = 20;
-    NSRect version_rect = NSMakeRect(x, y, version_width, version_height);
-    NSTextField *version_label = [[NSTextField alloc] initWithFrame:
-                                                      version_rect];
-    [version_label setEditable: NO];
-    [version_label setBezeled: NO];
-    [version_label setAlignment: NSTextAlignmentCenter];
-    [version_label setDrawsBackground: NO];
-
-    /* Create the version string*/
-    NSString *version_string;
-    version_string = [[NSString alloc] initWithFormat:
-    @"QEMU emulator version %s", QEMU_FULL_VERSION];
-    [version_label setStringValue: version_string];
-    [superView addSubview: version_label];
-
-    /* Make copyright label */
-    x = 0;
-    y = 35;
-    int copyright_width = about_width, copyright_height = 20;
-    NSRect copyright_rect = NSMakeRect(x, y, copyright_width, copyright_height);
-    NSTextField *copyright_label = [[NSTextField alloc] initWithFrame:
-                                                        copyright_rect];
-    [copyright_label setEditable: NO];
-    [copyright_label setBezeled: NO];
-    [copyright_label setDrawsBackground: NO];
-    [copyright_label setAlignment: NSTextAlignmentCenter];
-    [copyright_label setStringValue: [NSString stringWithFormat: @"%s",
-                                     QEMU_COPYRIGHT]];
-    [superView addSubview: copyright_label];
+    [NSApp orderFrontStandardAboutPanelWithOptions:options];
+    [pool release];
 }
 
 /* Used by the Speed menu items */
-- 
2.32.0 (Apple Git-132)


