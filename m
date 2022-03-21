Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7EB4E1F73
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 05:13:27 +0100 (CET)
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW9Q6-0006bg-QC
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 00:13:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nW9Nr-0005DF-1Z
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 00:11:07 -0400
Received: from [2607:f8b0:4864:20::22c] (port=38668
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nW9No-000832-LW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 00:11:06 -0400
Received: by mail-oi1-x22c.google.com with SMTP id n7so15091245oif.5
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 21:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eSI+wSi3BpD+VnSrKrzwou1a93NEkK6HT4ZMBKtsoY=;
 b=i87LfVH3P1OVmNhnXrgg742G0x41x1qe7BdAFtqCiKnDlUXvOXscl+qzTStT6Wdo9I
 wUlzRelL1FiowZlz3LbD91k/Ixe0024AT3ed6J6ap/+MCpk5gs63y65xCD7QS/TXdm5w
 d7SsYbblBGPaQx7zIxDa3Htp3Kagbye5Nf6wQNZHIKwIp0tealwN7FyVz3saZMamySkH
 QTdHwXsirYoaZONrUzXMmVkV/1l9RBaD9msj4RsUv4UdyTskUGepjE2/o/oGyUGiu36/
 oCTm2ryyaMBBsysYzXk4rJjNn232ccKF4MW3JrKpfV/DRQsyT3xkzrvkBRsRMnlNUk20
 aDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eSI+wSi3BpD+VnSrKrzwou1a93NEkK6HT4ZMBKtsoY=;
 b=dSQbRJ7zTiSIyGnVCVuvkL2TjZKFzSt80hIkSsNLTdqo/Oq2t2swDb8SfIPS1A8N+0
 fC8zZlEGkWnPKwMvnB8moFA1+ir9NTViDkTt/jCvq0f9nmBH5LXNOslIobTlqJ4HqMMl
 cZWuWlpzIJYznxtE7cAZ/WXJD1pp/FYoIPQdgQFgZaDNZTWZB9g0dXJ0D7mAqO3g99+g
 3gy2aEQpXWFnCdUmvvU+i8fkMR1rtH5EePf2Xx1Pvb0RyKttw7wURC7r3prkNtUzbobj
 rMxqKB1XxyjjfU+D29N+m6dJYvHR95oQ4ahXRIuLAHlbh0e1AgWfS0BxUPgyLVpQp8N7
 YL7w==
X-Gm-Message-State: AOAM5330Cwx1h3eyHF4U1NreQ3bGJY+xtxO3JbPcu267Fl4pwNfQZcWU
 oYlpHXBZNjTIebyuS6Pb6b7W6gi7dhA=
X-Google-Smtp-Source: ABdhPJwpOh0MOAdgkIG5cJTeg5BaCa+gMNUsZHSTK11nnKm1K+rWMJZEH2Ms7Eo9+7aZF78PS8gSPA==
X-Received: by 2002:a05:6808:1485:b0:2dc:7839:fc35 with SMTP id
 e5-20020a056808148500b002dc7839fc35mr12825655oiw.63.1647835862464; 
 Sun, 20 Mar 2022 21:11:02 -0700 (PDT)
Received: from localhost.localdomain ([2400:4050:c360:8200:e0e3:734:1053:5eaa])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a9d4d03000000b005b236de8911sm6936593otf.24.2022.03.20.21.11.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 20 Mar 2022 21:11:01 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v3 2/2] ui/cocoa: Create menus in iothread
Date: Mon, 21 Mar 2022 13:10:43 +0900
Message-Id: <20220321041043.24112-3-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220321041043.24112-1-akihiko.odaki@gmail.com>
References: <20220321041043.24112-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-oi1-x22c.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 0439c5a4623d674efa0c72abd62ca6e98bb7cf87 introduced an
assertion that blk_all_next is called in the main thread. The function
is called in the following chain:
- blk_all_next
- qmp_query_block
- addRemovableDevicesMenuItems
- main

This change moves the menu creation to the iothread. This also changes
the menu creation procedure to construct the entire menu tree before
setting to NSApp, which is necessary because a menu set once cannot be
modified if NSApp is already running.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 59 +++++++++++++++++++++---------------------------------
 1 file changed, 23 insertions(+), 36 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 2f25358f540..1042248d2fd 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1633,14 +1633,11 @@ - (void)sendEvent:(NSEvent *)event
 }
 
 /* Add an entry to the View menu for each console */
-static void add_console_menu_entries(void)
+static void add_console_menu_entries(NSMenu *menu)
 {
-    NSMenu *menu;
     NSMenuItem *menuItem;
     int index = 0;
 
-    menu = [[[NSApp mainMenu] itemWithTitle:@"View"] submenu];
-
     [menu addItem:[NSMenuItem separatorItem]];
 
     while (qemu_console_lookup_by_index(index) != NULL) {
@@ -1655,9 +1652,8 @@ static void add_console_menu_entries(void)
 /* Make menu items for all removable devices.
  * Each device is given an 'Eject' and 'Change' menu item.
  */
-static void addRemovableDevicesMenuItems(void)
+static void addRemovableDevicesMenuItems(NSMenu *menu)
 {
-    NSMenu *menu;
     NSMenuItem *menuItem;
     BlockInfoList *currentDevice, *pointerToFree;
     NSString *deviceName;
@@ -1665,8 +1661,6 @@ static void addRemovableDevicesMenuItems(void)
     currentDevice = qmp_query_block(NULL);
     pointerToFree = currentDevice;
 
-    menu = [[[NSApp mainMenu] itemWithTitle:@"Machine"] submenu];
-
     // Add a separator between related groups of menu items
     [menu addItem:[NSMenuItem separatorItem]];
 
@@ -1713,17 +1707,19 @@ static void addRemovableDevicesMenuItems(void)
     qapi_free_BlockInfoList(pointerToFree);
 }
 
-static void create_initial_menus(void)
+static void create_menus(void)
 {
     // Add menus
+    NSString    *title = [[[NSBundle mainBundle] executablePath] lastPathComponent];
+    NSMenu      *mainMenu;
     NSMenu      *menu;
     NSMenuItem  *menuItem;
 
-    [NSApp setMainMenu:[[NSMenu alloc] init]];
+    mainMenu = [[NSMenu alloc] initWithTitle:@"Main Menu"];
     [NSApp setServicesMenu:[[NSMenu alloc] initWithTitle:@"Services"]];
 
     // Application menu
-    menu = [[NSMenu alloc] initWithTitle:@""];
+    menu = [[NSMenu alloc] initWithTitle:title];
     [menu addItemWithTitle:@"About QEMU" action:@selector(do_about_menu_item:) keyEquivalent:@""]; // About QEMU
     [menu addItem:[NSMenuItem separatorItem]]; //Separator
     menuItem = [menu addItemWithTitle:@"Services" action:nil keyEquivalent:@""];
@@ -1735,10 +1731,8 @@ static void create_initial_menus(void)
     [menu addItemWithTitle:@"Show All" action:@selector(unhideAllApplications:) keyEquivalent:@""]; // Show All
     [menu addItem:[NSMenuItem separatorItem]]; //Separator
     [menu addItemWithTitle:@"Quit QEMU" action:@selector(terminate:) keyEquivalent:@"q"];
-    menuItem = [[NSMenuItem alloc] initWithTitle:@"Apple" action:nil keyEquivalent:@""];
+    menuItem = [mainMenu addItemWithTitle:title action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
-    [NSApp performSelector:@selector(setAppleMenu:) withObject:menu]; // Workaround (this method is private since 10.4+)
 
     // Machine menu
     menu = [[NSMenu alloc] initWithTitle: @"Machine"];
@@ -1750,17 +1744,17 @@ static void create_initial_menus(void)
     [menu addItem: [NSMenuItem separatorItem]];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Reset" action: @selector(restartQEMU:) keyEquivalent: @""] autorelease]];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle: @"Power Down" action: @selector(powerDownQEMU:) keyEquivalent: @""] autorelease]];
-    menuItem = [[[NSMenuItem alloc] initWithTitle: @"Machine" action:nil keyEquivalent:@""] autorelease];
+    addRemovableDevicesMenuItems(menu);
+    menuItem = [mainMenu addItemWithTitle: @"Machine" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
 
     // View menu
     menu = [[NSMenu alloc] initWithTitle:@"View"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Enter Fullscreen" action:@selector(doToggleFullScreen:) keyEquivalent:@"f"] autorelease]]; // Fullscreen
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Zoom To Fit" action:@selector(zoomToFit:) keyEquivalent:@""] autorelease]];
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"View" action:nil keyEquivalent:@""] autorelease];
+    add_console_menu_entries(menu);
+    menuItem = [mainMenu addItemWithTitle:@"View" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
 
     // Speed menu
     menu = [[NSMenu alloc] initWithTitle:@"Speed"];
@@ -1784,24 +1778,23 @@ static void create_initial_menus(void)
         [menuItem setTag: throttle_pct];
         [menu addItem: menuItem];
     }
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Speed" action:nil keyEquivalent:@""] autorelease];
+    menuItem = [mainMenu addItemWithTitle:@"Speed" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
 
     // Window menu
     menu = [[NSMenu alloc] initWithTitle:@"Window"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"Minimize" action:@selector(performMiniaturize:) keyEquivalent:@"m"] autorelease]]; // Miniaturize
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Window" action:nil keyEquivalent:@""] autorelease];
+    menuItem = [mainMenu addItemWithTitle:@"Window" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
     [NSApp setWindowsMenu:menu];
 
     // Help menu
     menu = [[NSMenu alloc] initWithTitle:@"Help"];
     [menu addItem: [[[NSMenuItem alloc] initWithTitle:@"QEMU Documentation" action:@selector(showQEMUDoc:) keyEquivalent:@"?"] autorelease]]; // QEMU Help
-    menuItem = [[[NSMenuItem alloc] initWithTitle:@"Window" action:nil keyEquivalent:@""] autorelease];
+    menuItem = [mainMenu addItemWithTitle:@"Window" action:nil keyEquivalent:@""];
     [menuItem setSubmenu:menu];
-    [[NSApp mainMenu] addItem:menuItem];
+
+    [NSApp setMainMenu:mainMenu];
 }
 
 @interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
@@ -1967,18 +1960,6 @@ int main (int argc, char **argv) {
 
     [QemuApplication sharedApplication];
 
-    create_initial_menus();
-
-    /*
-     * Create the menu entries which depend on QEMU state (for consoles
-     * and removeable devices). These make calls back into QEMU functions,
-     * which is OK because at this point we know that the second thread
-     * holds the iothread lock and is synchronously waiting for us to
-     * finish.
-     */
-    add_console_menu_entries();
-    addRemovableDevicesMenuItems();
-
     // Create an Application controller
     QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
     [NSApp setDelegate:appController];
@@ -2070,6 +2051,8 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
 
 static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 {
+    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
+
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
 
     /* Tell main thread to go ahead and create the app and enter the run loop */
@@ -2077,6 +2060,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_sem_wait(&app_started_sem);
     COCOA_DEBUG("cocoa_display_init: app start completed\n");
 
+    create_menus();
+
     QemuCocoaAppController *controller = (QemuCocoaAppController *)[[NSApplication sharedApplication] delegate];
     /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
@@ -2108,6 +2093,8 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     qemu_event_init(&cbevent, false);
     cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
     qemu_clipboard_peer_register(&cbpeer);
+
+    [pool release];
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.32.0 (Apple Git-132)


