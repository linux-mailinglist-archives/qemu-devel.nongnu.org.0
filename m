Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408F4C55FB
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 13:58:58 +0100 (CET)
Received: from localhost ([::1]:44000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNwf3-0002Az-BZ
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 07:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwcv-0008V7-0c
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:56:45 -0500
Received: from [2607:f8b0:4864:20::52a] (port=33646
 helo=mail-pg1-x52a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nNwcr-0001l4-QY
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 07:56:44 -0500
Received: by mail-pg1-x52a.google.com with SMTP id 12so7261121pgd.0
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 04:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kKWwkgxIyEYB2qpQDr7sxRO5wcvNtX45lh0bWqGVTO4=;
 b=d3b4bzuKuTYO3Dy60Nz10FQgsdmnhSGbwrUPB6cBX91iLbtSmulo6olEZyTBE+n7vo
 uT+0Z0VwDytxESqffQBaAsym4Gg+RA6BsT/TemFlUrA39IU2P10x/zHY3l/AcdhcCy2d
 GPo6md8aOZfaes2JOd5kvBGm4983hgE2o5fs42DwZA+9Wljmccy1JJByVa5QHRm2wKrs
 3AcMg9I7wHYR/MvzG8Y8dDZwMF9AwoKdHW3LSJ8AoQ0hCI6pkO1Gq0F24mUs+r0/CD9M
 IvgIAqRlTG92HKVwcaP2LTveBZsvIg7696R+2Ah8C2Xdmx2aFHZtPja/WUDTRpkGJiqE
 uRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kKWwkgxIyEYB2qpQDr7sxRO5wcvNtX45lh0bWqGVTO4=;
 b=f++FaJDysxdFvqk+1P1z+bARTZ+ocyoHuXpxxnIvc8GJW5f96CDz14qvY5iGiESzq8
 tNtvCLBuY/q0rlAACdjIp95kZsJCD/tCHnGFRVw5jR6S1CUdBeuFk5Pag1oqoNTUQ8bH
 XkL1IymbKODfdzvHggXtpyNOnoTgG/qUoVOuLefigKs6lWv2Wh8QVXw7iUeXq6478PyT
 UxzbHSC3gAk28YNJLZvZ4dZLoGFFSZcLSolUdNxyxrBeh6Gh2cgs5W6HJoVOEyS17vUj
 7sQ3uBv0ZdPckJasyIS/0hmHNwo2Y5+2kuqwhPoPOCd1bU7Vcos3f2h2pY53U7/7V4je
 ES5A==
X-Gm-Message-State: AOAM531sT+fx3GV9IHl/VRC8HrZAYeo4JGeEmZnO1jqHI4HA+WrnLiE7
 jZ+GNbQ0y2yD3UE9MhgXY9+lsnwNy5Y=
X-Google-Smtp-Source: ABdhPJzDpo5/xhRcci8K8GKP8TP91McytgUBcIS/Ljgys7ZmRGhSV+f2hzJ8ObSUHyWfKLExaBWeIw==
X-Received: by 2002:a63:534d:0:b0:374:da8c:ad53 with SMTP id
 t13-20020a63534d000000b00374da8cad53mr10070878pgl.100.1645880200123; 
 Sat, 26 Feb 2022 04:56:40 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:4c8a:825a:fb9a:12f3])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a056a00151400b004f3cd061d33sm7190706pfu.204.2022.02.26.04.56.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 26 Feb 2022 04:56:39 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Use the standard about panel
Date: Sat, 26 Feb 2022 21:56:30 +0900
Message-Id: <20220226125630.92909-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This provides standard look and feel for the about panel and reduces
code.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 112 +++++++++++------------------------------------------
 1 file changed, 23 insertions(+), 89 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index a8f1cdaf926..9c27b9f5aa7 100644
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
2.32.0 (Apple Git-132)


