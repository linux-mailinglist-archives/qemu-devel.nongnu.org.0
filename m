Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 299B54D04D2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:02:08 +0100 (CET)
Received: from localhost ([::1]:45328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRGkI-0003Mr-3g
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW8-000208-Pk
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:28 -0500
Received: from [2a00:1450:4864:20::430] (port=45966
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRGW6-0007mO-Rq
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 11:47:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id p9so24271579wra.12
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 08:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=U2DXG281yG+T8TcjY7hKoPvKUj4soEUbCsJuYEFv69Y=;
 b=DXRtA6IKLXX0B5QfLDpI41/XiSIvhTtaCneWcPBiJTHzBZNP2xKUUzQ6Hkic3NFKj6
 fHTiC7VUfIJJ+yVntqxA+7+2ybrRDbiB0rcjX0kjMcAmSm5j1DsVdX0GjCdC9WJVjXIQ
 bT+DOjsduf4U0njNYtIYmeVO5jIMpAHdwA+Eb7mskW0Py5hH5yMuyuo1inNVNbGDtgGc
 vG+NvG/QeOQVrtTztD/0ho7wIL295xGzzt0kXDrqR8E482CXocZUKMYLi5eZNexm3RAV
 UWbjXGEm826IgZYvrMo5kijPCOC2lCGYvw+kka5osGA1xg6gR6n+mvcWSumGtYkZ8GKc
 oP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U2DXG281yG+T8TcjY7hKoPvKUj4soEUbCsJuYEFv69Y=;
 b=mWE0/kjIbe532qspzzGwRygccEqvRiDelBrzmPkzW9DGMpMzx1qf5cu+t1qvr6tT09
 ik2/b+dieIyVg+TY96uYJREhrbzLFoyDEv5r66FaptIAEjoMkVyc+Rmpt/fLq67JdRlF
 x7IVP9SW9qVSprVCSUTpfvwh2axClGGJrSPQMuLmAQu+CXzreUUZoyrWwQ3WGVBqBG4Y
 /E2zgtkWAKsCyuR4yl1ZBb/UZMEA5LNVvQpvUBJW9tUuKythYhMdvvuxTPtescJ8G8Rr
 BiBTpGfb8ye8rpzFG7Am+B4PZMxiF7wWIA2JoIq7LuQupzBC4KubBS7ddtmGuKB4soqZ
 m5BQ==
X-Gm-Message-State: AOAM532qetXPw60EnNCRhFb7UxlCjhil+WN5jmKx/dayhjyCHxkjFPL7
 dslKCWKRI1PbTeAD9oAot18/b++oR1Ejew==
X-Google-Smtp-Source: ABdhPJx46UBkJ2FLl9gtCKNEjsE5aQo38HTGtUhiZkJDDhyQKOXNGqH7JyvTKmiAa3qcZaeL6chyMw==
X-Received: by 2002:a5d:534a:0:b0:1f0:5c4b:cec8 with SMTP id
 t10-20020a5d534a000000b001f05c4bcec8mr9360646wrv.115.1646671645509; 
 Mon, 07 Mar 2022 08:47:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm13806652wme.24.2022.03.07.08.47.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 08:47:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] ui/cocoa: Use the standard about panel
Date: Mon,  7 Mar 2022 16:47:07 +0000
Message-Id: <20220307164709.2503250-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307164709.2503250-1-peter.maydell@linaro.org>
References: <20220307164709.2503250-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

This provides standard look and feel for the about panel and reduces
code.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-id: 20220227042241.1543-1-akihiko.odaki@gmail.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 112 +++++++++++------------------------------------------
 1 file changed, 23 insertions(+), 89 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 8ab9ab5e84d..c88149852b0 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -83,7 +83,7 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
 static void cocoa_refresh(DisplayChangeListener *dcl);
 
-static NSWindow *normalWindow, *about_window;
+static NSWindow *normalWindow;
 static const DisplayChangeListenerOps dcl_ops = {
     .dpy_name          = "cocoa",
     .dpy_gfx_update = cocoa_update,
@@ -1140,7 +1140,6 @@ QemuCocoaView *cocoaView;
 - (BOOL)verifyQuit;
 - (void)openDocumentation:(NSString *)filename;
 - (IBAction) do_about_menu_item: (id) sender;
-- (void)make_about_window;
 - (void)adjustSpeed:(id)sender;
 @end
 
@@ -1186,8 +1185,6 @@ QemuCocoaView *cocoaView;
         [pauseLabel setFont: [NSFont fontWithName: @"Helvetica" size: 90]];
         [pauseLabel setTextColor: [NSColor blackColor]];
         [pauseLabel sizeToFit];
-
-        [self make_about_window];
     }
     return self;
 }
@@ -1471,92 +1468,29 @@ QemuCocoaView *cocoaView;
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
2.25.1


