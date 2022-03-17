Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592A4DC586
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:08:10 +0100 (CET)
Received: from localhost ([::1]:38332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUovJ-0001On-3o
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:08:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUoka-0000Kk-6D
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:57:04 -0400
Received: from [2607:f8b0:4864:20::102c] (port=44688
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUokY-0008GO-CC
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 07:57:03 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o6-20020a17090a9f8600b001c6562049d9so5271658pjp.3
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b6wkfuLytakxAKiZkWHBkGLmuRnzz6qKJm8booE2SDY=;
 b=gzA3DDTN2e3nPioyOwrCFY2/yY4By+3R1plKd3au0HAtk/8EGu++IGAKHtH2ZR1lE/
 GEYsqPLxG6YuZZYo4D4TTbESlH6Pxa+XTTcO1ia2IK0kp9YD7TsFJkag2aVt/+cJaDLr
 qNzBRZ6lgInDl8sQGtzmiwrysEsaiMx1aAwBSr8syrwVyS5bR9aduFGZBXIb3YwIClGX
 PZVx1ue4EMpNNnlD145FhNDsr0PfTQ91Z/s4ejR8JWrZyyuyM24WrimhjMweWz6iVJaV
 cD77/r48YVmnalaNRfZWKolFv8RGvGsIMV4QtG4c74DId3S0ekz9p8NLy64rQTjYGodk
 7gtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b6wkfuLytakxAKiZkWHBkGLmuRnzz6qKJm8booE2SDY=;
 b=JDlZw0E/3D8792RCAh4tFvr5hnLZ2dnQJVaY36ZdAkmxYBdQUYN/Y3wrYYpEU22/v1
 tmo0jvlo48ImGlZd/dt9LcfdcHKJ5i/AO1t0LLkwCPOCDPXTopuglTiKOkvTBQEboeF3
 t2VPlbeIujY8F+t8GaAaJkPFKyfdgcPZRZhko3xZyHIOSceUbYTvEy352rV6f4f3mcGY
 fy7iS9Mn8deJ3JG4DspOgEQzmM4IxO2rz7HE3+7VmjYE0zSVaHfcyVBTSAoa/CcrfOOd
 Lg7AkfSFkjKRlRFhaM/Jvf0XLxK588zwvWOjuBpaotM/O+3SAF9OBTg1N0annvGDXI+U
 kfqw==
X-Gm-Message-State: AOAM531AfmRphncYSyuKQ6kFL58dtXBn5jDCWrdZncmztNv37fzrcY2D
 LhMc80NGUvrLe7hP4gnhXMlLMsopR8E=
X-Google-Smtp-Source: ABdhPJzzAlNC8gBb2mPKKMQy1hZ0R8BX35Sc89MzIkFgM66D8hunmLkA4OQ5ZA0JtZ7z1f9FauBtiQ==
X-Received: by 2002:a17:902:8605:b0:151:b6a2:8a1 with SMTP id
 f5-20020a170902860500b00151b6a208a1mr4504949plo.64.1647518220854; 
 Thu, 17 Mar 2022 04:57:00 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 pj13-20020a17090b4f4d00b001bf2ff56430sm10085561pjb.30.2022.03.17.04.56.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 17 Mar 2022 04:57:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH-for-7.0 v3 1/2] ui/cocoa: Code movement
Date: Thu, 17 Mar 2022 12:56:43 +0100
Message-Id: <20220317115644.37276-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
References: <20220317115644.37276-1-philippe.mathieu.daude@gmail.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Pure code movement in preparation for the next commit.

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


