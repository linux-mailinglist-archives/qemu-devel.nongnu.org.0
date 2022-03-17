Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3824DC6E4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:57:50 +0100 (CET)
Received: from localhost ([::1]:46374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUphN-0003GB-7H
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:57:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpfU-0001KL-Sa
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:55:52 -0400
Received: from [2607:f8b0:4864:20::102c] (port=38635
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUpfT-0002Hp-6x
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:55:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 mm4-20020a17090b358400b001c68e836fa6so950322pjb.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 05:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EV40ccb5NVkJ7QeeNSqB5ytxqShi3OnkSRljDHtQ9Yc=;
 b=Key3WV4oY0+qeo5pFocDcepkX/CqMAWEOXe8s9UPHWtp2XfYFq0gfBeZ5MOxYIJspM
 Px9NWJhRpmicqm192Nr1agpLD8NDw+N4pt/AJ63pcQkkHqB7YrXTcq5Ro4GpqXzgt2vT
 w+jD6IIv6MWiswDQxJdgmb2pbhGYcBj3iuULEruptB7S4PS2xUjzLIquZ6xJ9TGPzcEd
 56jDp2mdfFgi/LS0wGnaSvbT2eNV8o4saqQqEz/4jRsUs8eURfpmJkeeWN4TTUh84P1V
 minNJKZOqIi23nMBxnE9qLqMp0RvhWLxBqZ3+QQpqG1Ub++j0QCsSdHDuvlKPeXvFvkl
 In4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EV40ccb5NVkJ7QeeNSqB5ytxqShi3OnkSRljDHtQ9Yc=;
 b=NYzaxQ/11Vcq5nMHgkw+kYLahyXkQEKDZcSsEj60MzYe7FzWrh364LyOcCBXfAnvi9
 h9hJsYeUTR+12pqIeAbtA2m/OAWH5TUtbqDJ4ooGfnnwF6qSVtyJolGzQhsopwE/KgEI
 8LRNsXK1in5qts1Jh6Ql+iWLxXPvFzzGfzTwjbWfCY+ThjBD26y00gK2D+NVKxyHqgwj
 +A3Di70wQdoPK+WL4nCXN+UTZzbMmTBp+O0CFuTYqpbb/yJ0WoicDZhD4+lcay/U5v4j
 +XPkUCUsA7Hbw+y+vLeF2in8lj/SWSUgClKrcuLbI0LVsZ0PnhBG3CTL6TmK0/s5/E/b
 /3SA==
X-Gm-Message-State: AOAM533VrxE/Pf2iFzUCdKoDU1OBOjLUAWlIKQm2zT6ivOUJelqC/3J5
 9e+a5sLPK7JcYTv5EtGqun4yb+18e9U=
X-Google-Smtp-Source: ABdhPJzDRhkV4pUekD5o0t//kO+L2EVtU4TYIRfM1pZr0mTryXr2yPlzWcPlz0EGO7g1rlotKELdHw==
X-Received: by 2002:a17:903:120c:b0:14f:3f4a:f832 with SMTP id
 l12-20020a170903120c00b0014f3f4af832mr4743832plh.157.1647521749554; 
 Thu, 17 Mar 2022 05:55:49 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0024cb00b004f725ecf900sm7169670pfv.97.2022.03.17.05.55.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 05:55:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0 v4 1/2] ui/cocoa: Code movement
Date: Thu, 17 Mar 2022 13:55:33 +0100
Message-Id: <20220317125534.38706-2-philippe.mathieu.daude@gmail.com>
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Pure code movement in preparation for the next commit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 86 +++++++++++++++++++++++++++---------------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index cb6e7c41dc..027c3053f7 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -75,6 +75,9 @@ typedef struct {
     int height;
 } QEMUScreen;
 
+@interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
+@end
+
 static void cocoa_update(DisplayChangeListener *dcl,
                          int x, int y, int w, int h);
 
@@ -109,6 +112,8 @@ static bool allow_events;
 
 static NSInteger cbchangecount = -1;
 static QemuClipboardInfo *cbinfo;
+static QemuClipboardPeer cbpeer;
+static QemuCocoaPasteboardTypeOwner *cbowner;
 static QemuEvent cbevent;
 
 // Utility functions to run specified code block with iothread lock held
@@ -142,6 +147,44 @@ static bool bool_with_iothread_lock(BoolCodeBlock block)
     return val;
 }
 
+/*
+ * The startup process for the OSX/Cocoa UI is complicated, because
+ * OSX insists that the UI runs on the initial main thread, and so we
+ * need to start a second thread which runs the vl.c qemu_main():
+ *
+ * Initial thread:                    2nd thread:
+ * in main():
+ *  create qemu-main thread
+ *  wait on display_init semaphore
+ *                                    call qemu_main()
+ *                                    ...
+ *                                    in cocoa_display_init():
+ *                                     post the display_init semaphore
+ *                                     wait on app_started semaphore
+ *  create application, menus, etc
+ *  enter OSX run loop
+ * in applicationDidFinishLaunching:
+ *  post app_started semaphore
+ *                                     tell main thread to fullscreen if needed
+ *                                    [...]
+ *                                    run qemu main-loop
+ *
+ * We do this in two stages so that we don't do the creation of the
+ * GUI application menus and so on for command line options like --help
+ * where we want to just print text to stdout and exit immediately.
+ */
+
+static void *call_qemu_main(void *opaque)
+{
+    int status;
+
+    COCOA_DEBUG("Second thread: calling qemu_main()\n");
+    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
+    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
+    [cbowner release];
+    exit(status);
+}
+
 // Mac to QKeyCode conversion
 static const int mac_to_qkeycode_map[] = {
     [kVK_ANSI_A] = Q_KEY_CODE_A,
@@ -1804,9 +1847,6 @@ static void addRemovableDevicesMenuItems(void)
     qapi_free_BlockInfoList(pointerToFree);
 }
 
-@interface QemuCocoaPasteboardTypeOwner : NSObject<NSPasteboardTypeOwner>
-@end
-
 @implementation QemuCocoaPasteboardTypeOwner
 
 - (void)pasteboard:(NSPasteboard *)sender provideDataForType:(NSPasteboardType)type
@@ -1841,8 +1881,6 @@ static void addRemovableDevicesMenuItems(void)
 
 @end
 
-static QemuCocoaPasteboardTypeOwner *cbowner;
-
 static void cocoa_clipboard_notify(Notifier *notifier, void *data);
 static void cocoa_clipboard_request(QemuClipboardInfo *info,
                                     QemuClipboardType type);
@@ -1903,44 +1941,6 @@ static void cocoa_clipboard_request(QemuClipboardInfo *info,
     }
 }
 
-/*
- * The startup process for the OSX/Cocoa UI is complicated, because
- * OSX insists that the UI runs on the initial main thread, and so we
- * need to start a second thread which runs the vl.c qemu_main():
- *
- * Initial thread:                    2nd thread:
- * in main():
- *  create qemu-main thread
- *  wait on display_init semaphore
- *                                    call qemu_main()
- *                                    ...
- *                                    in cocoa_display_init():
- *                                     post the display_init semaphore
- *                                     wait on app_started semaphore
- *  create application, menus, etc
- *  enter OSX run loop
- * in applicationDidFinishLaunching:
- *  post app_started semaphore
- *                                     tell main thread to fullscreen if needed
- *                                    [...]
- *                                    run qemu main-loop
- *
- * We do this in two stages so that we don't do the creation of the
- * GUI application menus and so on for command line options like --help
- * where we want to just print text to stdout and exit immediately.
- */
-
-static void *call_qemu_main(void *opaque)
-{
-    int status;
-
-    COCOA_DEBUG("Second thread: calling qemu_main()\n");
-    status = qemu_main(gArgc, gArgv, *_NSGetEnviron());
-    COCOA_DEBUG("Second thread: qemu_main() returned, exiting\n");
-    [cbowner release];
-    exit(status);
-}
-
 int main (int argc, char **argv) {
     QemuThread thread;
 
-- 
2.34.1


