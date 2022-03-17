Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6F24DC54B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 12:59:24 +0100 (CET)
Received: from localhost ([::1]:56398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUomp-0002aa-Ai
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 07:59:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUokk-0000Yw-UW
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:57:15 -0400
Received: from [2607:f8b0:4864:20::52c] (port=35666
 helo=mail-pg1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUoki-0008Gq-T5
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:57:14 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e6so2484196pgn.2
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rg9k96F61F05Stv1xlcjPMwYRILE3f3ju1YTJ0HgsAE=;
 b=lajnsRA/vs801iGf82H9b5J3MUZjHaW99FhFQwxc6iH6XvFZLRCiH5plhjcD0qDPeQ
 Du5T5MwMSmhARSuttNrrdaH8Aw2wDJeEzHt0uoL5go8xDCK/j5s+wTB5LiuWAgl6zYwB
 XLMTwSJ0JAEql4/rv2vkZYjFKUxqn4UKV/kuyvX2PSP+4NJKModmcLtwAt+Y3fHWIbZ7
 41OVFAnpJ8xfJpbbWgCEqy0MUf6oVnito8/hNM+ppHKnqoLG4LbnTj+AF+8P0JQGm022
 KTld2EEWsO1rFCf25h9I2eBi0eGoDx17pwfT65eL3EvR1+aMS7Ne2MmjnCF9QfTW8km4
 NtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rg9k96F61F05Stv1xlcjPMwYRILE3f3ju1YTJ0HgsAE=;
 b=mCKCEQWrCYtuphGkeGNnIZEfwHZzq7C+GiV2ncr72YeG/pYHv5QyajnsOKm0PnTUsT
 AtO/9SApY1C4Co+cKjf86T2+NBoRFRgmhCOcaHPpwD17X9g7Ze4osf4f4WDy4c5/OLRr
 dcQChiRws1imRZPV4BLMf+CJqZCJBeSZdE1mrtU7llGWsht38PWUqvdVpr8ZpSXmq53Y
 9mR4NhlAPmo5StSkRmLOobzUrd49Mv+VZqWwx/hYtONtd3Z+EpAkbpz0ZMFWSZFR0NQ0
 1iOAuVmVn/KFT4F+ZFyczuv714eRkGo/JQVswgGR6ifEsizTgOA3+ep3fwpkA2mGvSJm
 sh7g==
X-Gm-Message-State: AOAM532lGXglLk/dplS20+z7OY/zkOFf9kVJbfOiB+7q5MgV3YSuH4Gm
 KvjNEjJXfsw9aTlxoaLgA84xTR5I67k=
X-Google-Smtp-Source: ABdhPJwqz5AKXq6ryHL538fia3ZwQBDidUISV3Utxepfe3h5xqrveDE0+bT5ckeUR5Z7dSrC/DYGgw==
X-Received: by 2002:a05:6a00:887:b0:4f2:6d3f:5b53 with SMTP id
 q7-20020a056a00088700b004f26d3f5b53mr4134934pfj.21.1647518229560; 
 Thu, 17 Mar 2022 04:57:09 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a056a00162a00b004f6fc39c081sm5915396pfc.211.2022.03.17.04.57.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 04:57:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0 v3 2/2] ui/cocoa: run qemu_init in the main thread
Date: Thu, 17 Mar 2022 12:56:44 +0100
Message-Id: <20220317115644.37276-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
References: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52c.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 softmmu/main.c |  12 +++---
 ui/cocoa.m     | 114 ++++++++++++++++++++-----------------------------
 2 files changed, 54 insertions(+), 72 deletions(-)

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
index 027c3053f7..2e5130d805 100644
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
@@ -115,6 +114,7 @@ static QemuClipboardInfo *cbinfo;
 static QemuClipboardPeer cbpeer;
 static QemuCocoaPasteboardTypeOwner *cbowner;
 static QemuEvent cbevent;
+static QemuThread main_thread;
 
 // Utility functions to run specified code block with iothread lock held
 typedef void (^CodeBlock)(void);
@@ -150,39 +150,28 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
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
@@ -823,9 +812,7 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
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
@@ -1323,8 +1310,22 @@ static CGEventRef handleTapEvent(CGEventTapProxy proxy, CGEventType type, CGEven
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationDidFinishLaunching\n");
     allow_events = true;
-    /* Tell cocoa_display_init to proceed */
-    qemu_sem_post(&app_started_sem);
+
+    // register vga output callbacks
+    register_displaychangelistener(&dcl);
+
+    qemu_clipboard_peer_register(&cbpeer);
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
@@ -1941,22 +1942,18 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
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
+    qemu_event_init(&cbevent, false);
 
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
 
@@ -1978,6 +1975,7 @@ int main (int argc, char **argv) {
      */
     add_console_menu_entries();
     addRemovableDevicesMenuItems();
+    cbowner = [[QemuCocoaPasteboardTypeOwner alloc] init];
 
     // Create an Application controller
     QemuCocoaAppController *appController = [[QemuCocoaAppController alloc] init];
@@ -2071,24 +2069,13 @@ static void cocoa_refresh(DisplayChangeListener *dcl)
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
@@ -2101,13 +2088,6 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
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


