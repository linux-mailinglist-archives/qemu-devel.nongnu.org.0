Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1F23BF54C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 07:48:11 +0200 (CEST)
Received: from localhost ([::1]:48120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1MtO-0006zq-KJ
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 01:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1MsF-0005bd-DM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:46:59 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m1MsD-0003ZR-GM
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 01:46:59 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 b14-20020a17090a7aceb029017261c7d206so5159748pjl.5
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 22:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FjV8V12OVZ6HBcCwMF0yUU1iY5N0fwFsSYEBKvCtAMw=;
 b=VfeGUbDw59/FsXlQNp6n+u8cbxvcALpTMk+V/A+WvbMfL7HqrNV7fyprsLFKNVrX/I
 6qFhmpF3wbd6Tpwj9FUJKKgyGUER4ncALqlB/LP2uhGi1dvsrZdt12rork2mI7GQCD3C
 HbxyNTXpXoyCvor8b5W5qg8BVUWZ76Nfh6fCGIXYbOkwH0pusRqSwAXhsiMk/klVVEGa
 thpaWNWNgStMfqM+jMxxuhVlxgW+BP8SQ6R7yOOpVe2rlECNzgnb+5cxAn61ft4wYD9Y
 V1dInIr/eo+R32RRqST+JMjn+1NO4jHbveBEnB7jMmCQqlzdKWHO57Z1NfLGjBRv0NIR
 Ddtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FjV8V12OVZ6HBcCwMF0yUU1iY5N0fwFsSYEBKvCtAMw=;
 b=Iib7Fbb6krfYaqqvO7TD9ylprYjPmUK2vHtFnz+m5SFOD0X9Ty9yw3/ApRJpjI2Cr8
 vUpSfJld+DrxVuCHDAvZCA0aJJbkFXOud62PdHvDx+j0qJJGxny7Hca11noxOOX6wMu9
 HccSsmhC3c4Jfc3L21MsnG6kdoDJ/i/1pdzUXFoBkgIhf1CtKIUs/xV4rPkeyZiZlqQJ
 L2unajzDtMJiBF0u1muYXYXaARSdgoFRfVEitugH8cOjwCDjKrQywGUetk12ARQu4nG1
 DwEjrpqfrXlrrrigmapF0KjSiQGf7CbPaNBlUQnwBqjlDuGZIu8mQkGQz+tw1Jh9shDr
 u2Dg==
X-Gm-Message-State: AOAM531z6eck4Q/5IepWIJ8WNcnpkomBXkg1gR9wzKERh3CUmexYiA8n
 4n0YdlIaNV4CQ++USenhrrgfvH82vrfJcg==
X-Google-Smtp-Source: ABdhPJz8Vt8LrZ0iGlBKlV/DfwOzXQ3m/Y37+1KRyAhehJQeR4HyMQirovEuYu+dew/sNRA3P6hwpw==
X-Received: by 2002:a17:90a:8585:: with SMTP id
 m5mr29971400pjn.224.1625723216184; 
 Wed, 07 Jul 2021 22:46:56 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:dcfe:ded1:61a1:d785])
 by smtp.gmail.com with ESMTPSA id f17sm8093484pjj.21.2021.07.07.22.46.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Jul 2021 22:46:55 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Use the standard about panel
Date: Thu,  8 Jul 2021 14:46:50 +0900
Message-Id: <20210708054650.9577-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This provides standard look and feel for the about panel and reduces
code.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 111 +++++++++++------------------------------------------
 1 file changed, 23 insertions(+), 88 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9f72844b079..3e1ae24739a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -83,7 +83,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
-static NSWindow *normalWindow, *about_window;
+static NSWindow *normalWindow;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
@@ -1115,7 +1115,6 @@ - (void)changeDeviceMedia:(id)sender;
 - (BOOL)verifyQuit;
 - (void)openDocumentation:(NSString *)filename;
 - (IBAction) do_about_menu_item: (id) sender;
-- (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
 @end
 
@@ -1166,7 +1165,6 @@ - (id) init
         supportedImageFileTypes = [NSArray arrayWithObjects: @"img", @"iso", @"dmg",
                                  @"qcow", @"qcow2", @"cloop", @"vmdk", @"cdr",
                                   @"toast", nil];
-        [self make_about_window];
     }
     return self;
 }
@@ -1451,92 +1449,29 @@ - (BOOL)verifyQuit
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
+    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
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
2.30.1 (Apple Git-130)


