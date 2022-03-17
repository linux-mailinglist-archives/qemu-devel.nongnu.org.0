Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B04404DC72C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 14:02:59 +0100 (CET)
Received: from localhost ([::1]:51834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUpmM-00071U-98
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 09:02:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpfe-0001Zx-21
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:56:03 -0400
Received: from [2607:f8b0:4864:20::102c] (port=41760
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpfc-0002JY-53
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:56:01 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l4-20020a17090a49c400b001c6840df4a3so1612270pjm.0
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1kajLTIBVh/LkzUN2J8GI2aKGy7zNFKJ2dw9r8dbWE=;
 b=H4cd6TRwsSw2qsCMsTkaFw8hs0l3ta6OgfcGWtSMgTkiwMw27aK2VShwnKbG3qZEfI
 G7quous/OBaC+PkS+cSwi7DU3ks0wqwPVodUQ6ikQziOJwgIO1hancQSlzwDnsoIdaoV
 J0ePf25R8PneNBnb/5P5jpDPs5j9APUQ4uibwpyfPy1MjTGDS4OYvwlFIvbSB22LX2Zo
 59gjKB78pI5LEtMPFrMCGZPWLZj06h0Lh81lyq1+AHFmX41LLTUm/WZ/Eu4pFYPqgcrz
 PSQ4nqVEPkLsxfgRm2IyaW/J2+ufSGwc9LxLbjDWAe9ZJ/Lj/sMICQEiPAK3KhMz8MNB
 u8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1kajLTIBVh/LkzUN2J8GI2aKGy7zNFKJ2dw9r8dbWE=;
 b=XrKcM9UhgncYaO92I3gm/W9LkduNJwwt8y/27UlgPETYie41V7EjRsVWjh5yAASawf
 ORW9NZufcole+eV63GVt3O3Wn2VDjeUQtD66IpTvQHN/GQ6/uGG32L+sVdy0KJnBt2fV
 cecEbOJOGwnK9j1LHn1cRjTIYP1upnMMBkaMO85xgbdzuzrkprRZgc4MeMtwJYkCF4G2
 WKgI0HMZxE4i/8I9bFuBBnOcYbhAM2dbnsdcGJFmvEQdlo2tx2iGra1Ch5V+mEtbvdIQ
 X2y2RTrUssVfk0v9bEH2ocMdSJ7yZpHoyLRHRv2ZVck5EKZXy0sd27052cG4jtLiHP4C
 fEAQ==
X-Gm-Message-State: AOAM531LXnWlKF7uwePuCV7C1M8VMxRaGuieYMzraVcxoO0VyU4c3Ak2
 37BzYMDS3/r9MOEdnGHsypzm5IQUokw=
X-Google-Smtp-Source: ABdhPJyU1dKVjJ5PwRkYB2zW9lzXHLfPnoIDmgRNaCbO6WzuQhrMhz/zOMApQjMy0fHNtlMK1cLSyQ==
X-Received: by 2002:a17:902:7610:b0:151:6152:549c with SMTP id
 k16-20020a170902761000b001516152549cmr4623081pll.91.1647521758574; 
 Thu, 17 Mar 2022 05:55:58 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a639e12000000b00381bd8604ecsm4956889pgd.40.2022.03.17.05.55.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 05:55:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0 v4 2/2] ui/cocoa: run qemu_init in the main thread
Date: Thu, 17 Mar 2022 13:55:34 +0100
Message-Id: <20220317125534.38706-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
References: <20220317125534.38706-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Simplify the initialization dance by running qemu_init() in the main
thread before the Cocoa event loop starts.  The cocoa_display_init()
code that is post-applicationDidFinishLaunching: moves to the
application delegate itself, and the secondary thread only runs
the rest of qemu_main(), namely qemu_main_loop() and qemu_cleanup().

This fixes a case where addRemovableDevicesMenuItems() calls
qmp_query_block() while expecting the main thread to still hold
the BQL.  The newly-introduced assertions in the block layer
complain about this.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220307151004.578069-1-pbonzini@redhat.com>
[PMD: Fixed trivial build failures & rebased]
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/main.c |  12 +++--
 ui/cocoa.m     | 123 +++++++++++++++++++++----------------------------
 2 files changed, 60 insertions(+), 75 deletions(-)

diff --git a/softmmu/main.c b/softmmu/main.c
index 639c67ff48..0c4384e980 100644
--- a/softmmu/main.c
+++ b/softmmu/main.c
@@ -39,16 +39,18 @@ int main(int argc, char **argv)
 #endif
 #endif /* CONFIG_SDL */
 
-#ifdef CONFIG_COCOA
-#undef main
-#define main qemu_main
-#endif /* CONFIG_COCOA */
-
+#ifndef CONFIG_COCOA
 int main(int argc, char **argv, char **envp)
 {
+    /*
+     * ui/cocoa.m relies on this being the exact content of main(),
+     * because it has to run everything after qemu_init in a secondary
+     * thread.
+     */
     qemu_init(argc, argv, envp);
     qemu_main_loop();
     qemu_cleanup();
 
     return 0;
 }
+#endif /* CONFIG_COCOA */
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 027c3053f7..4483d5e648 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -100,14 +100,13 @@ static int last_buttons;
 static int cursor_hide = 1;
 static int left_command_key_enabled = 1;
 static bool swap_opt_cmd;
+static bool full_screen;
+static bool full_grab;
+static bool have_cocoa_ui;
 
-static int gArgc;
-static char **gArgv;
 static bool stretch_video;
 static NSTextField *pauseLabel;
 
-static QemuSemaphore display_init_sem;
-static QemuSemaphore app_started_sem;
 static bool allow_events;
 
 static NSInteger cbchangecount = -1;
@@ -150,39 +149,28 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
 /*
  * The startup process for the OSX/Cocoa UI is complicated, because
  * OSX insists that the UI runs on the initial main thread, and so we
- * need to start a second thread which runs the vl.c qemu_main():
+ * need to start a second thread which runs qemu_main_loop():
  *
  * Initial thread:                    2nd thread:
  * in main():
- *  create qemu-main thread
- *  wait on display_init semaphore
- *                                    call qemu_main()
- *                                    ...
- *                                    in cocoa_display_init():
- *                                     post the display_init semaphore
- *                                     wait on app_started semaphore
+ *  qemu_init()
  *  create application, menus, etc
  *  enter OSX run loop
  * in applicationDidFinishLaunching:
- *  post app_started semaphore
- *                                     tell main thread to fullscreen if needed
- *                                    [...]
- *                                    run qemu main-loop
- *
- * We do this in two stages so that we don't do the creation of the
- * GUI application menus and so on for command line options like --help
- * where we want to just print text to stdout and exit immediately.
+ *  fullscreen if needed
+ *  create main loop thread
+ *                                    call qemu_main_loop()
  */
 
-static void *call_qemu_main(void *opaque)
+static void *call_qemu_main_loop(void *opaque)
 {
-    int status;
-
-    COCOA_DEBUG("Second thread: calling qemu_main()\n");
-    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
-    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
+    COCOA_DEBUG("Second thread: calling qemu_main_loop()\n");
+    qemu_mutex_lock_iothread();
+    qemu_main_loop();
+    COCOA_DEBUG("Second thread: qemu_main_loop() returned, exiting\n");
+    qemu_cleanup();
     [cbowner release];
-    exit(status);
+    exit(0);
 }
 
 // Mac to QKeyCode conversion
@@ -627,9 +615,9 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
          * Don't try to tell QEMU about UI information in the application
          * startup phase -- we haven't yet registered dcl with the QEMU UI
          * layer, and also trying to take the iothread lock would deadlock.
-         * When cocoa_display_init() does register the dcl, the UI layer
-         * will call cocoa_switch(), which will call updateUIInfo, so
-         * we don't lose any information here.
+         * When applicationDidFinishLaunching() does register the dcl, the
+         * UI layer will call cocoa_switch(), which will call updateUIInfo,
+         * so we don't lose any information here.
          */
         return;
     }
@@ -823,9 +811,7 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
         /*
          * Just let OSX have all events that arrive before
          * applicationDidFinishLaunching.
-         * This avoids a deadlock on the iothread lock, which cocoa_display_init()
-         * will not drop until after the app_started_sem is posted. (In theory
-         * there should not be any such events, but OSX Catalina now emits some.)
+         * This may not be needed anymore?
          */
         return false;
     }
@@ -1321,10 +1307,27 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
 
 - (void)applicationDidFinishLaunching: (NSNotification *) note
 {
+    QemuThread main_thread;
+
     COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
     allow_events = true;
-    /* Tell cocoa_display_init to proceed */
-    qemu_sem_post(&app_started_sem);
+
+    // register vga output callbacks
+    register_displaychangelistener(&dcl);
+
+    qemu_clipboard_peer_register(&cbpeer);
+
+    qemu_mutex_unlock_iothread();
+    qemu_thread_create(&main_thread, "qemu_main_loop", call_qemu_main_loop,
+                       NULL, QEMU_THREAD_DETACHED);
+
+    if (full_screen) {
+        [NSApp activateIgnoringOtherApps: YES];
+        [self toggleFullScreen: nil];
+    }
+    if (full_grab) {
+        [self setFullGrab: nil];
+    }
 }
 
 - (void)applicationWillTerminate:(NSNotification *)aNotification
@@ -1941,22 +1944,17 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     }
 }
 
-int main (int argc, char **argv) {
-    QemuThread thread;
-
+int main(int argc, char **argv, char **envp)
+{
     COCOA_DEBUG("Entered main()\n");
-    gArgc = argc;
-    gArgv = argv;
 
-    qemu_sem_init(&display_init_sem, 0);
-    qemu_sem_init(&app_started_sem, 0);
-
-    qemu_thread_create(&thread, "qemu_main", call_qemu_main,
-                       NULL, QEMU_THREAD_DETACHED);
-
-    COCOA_DEBUG("Main thread: waiting for display_init_sem\n");
-    qemu_sem_wait(&display_init_sem);
-    COCOA_DEBUG("Main thread: initializing app\n");
+    /* Takes iothread lock, released in applicationDidFinishLaunching:.  */
+    qemu_init(argc, argv, envp);
+    if (!have_cocoa_ui) {
+         qemu_main_loop();
+         qemu_cleanup();
+         return 0;
+    }
 
     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
 
@@ -1979,6 +1977,9 @@ int main (int argc, char **argv) {
     add_console_menu_entries();
     addRemovableDevicesMenuItems();
 
+    qemu_event_init(&cbevent, false);
+    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
+
     // Create an Application controller
     QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
     [NSApp setDelegate:appController];
@@ -2071,24 +2072,13 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
 static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
 {
     COCOA_DEBUG("qemu_cocoa: cocoa_display_init\n");
+    have_cocoa_ui = 1;
 
-    /* Tell main thread to go ahead and create the app and enter the run loop */
-    qemu_sem_post(&display_init_sem);
-    qemu_sem_wait(&app_started_sem);
-    COCOA_DEBUG("cocoa_display_init: app start completed\n");
-
-    QemuCocoaAppController *controller = (QemuCocoaAppController *)[[NSApplication sharedApplication] delegate];
-    /* if fullscreen mode is to be used */
     if (opts->has_full_screen && opts->full_screen) {
-        dispatch_async(dispatch_get_main_queue(), ^{
-            [NSApp activateIgnoringOtherApps: YES];
-            [controller toggleFullScreen: nil];
-        });
+        full_screen = 1;
     }
     if (opts->u.cocoa.has_full_grab && opts->u.cocoa.full_grab) {
-        dispatch_async(dispatch_get_main_queue(), ^{
-            [controller setFullGrab: nil];
-        });
+        full_grab = 1;
     }
 
     if (opts->has_show_cursor && opts->show_cursor) {
@@ -2101,13 +2091,6 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
     if (opts->u.cocoa.has_left_command_key && !opts->u.cocoa.left_command_key) {
         left_command_key_enabled = 0;
     }
-
-    // register vga output callbacks
-    register_displaychangelistener(&dcl);
-
-    qemu_event_init(&cbevent, false);
-    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
-    qemu_clipboard_peer_register(&cbpeer);
 }
 
 static QemuDisplay qemu_display_cocoa = {
-- 
2.34.1


