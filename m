Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE33A9D70
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:20:50 +0200 (CEST)
Received: from localhost ([::1]:59320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWPR-0007ZT-Pj
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWNz-00068m-9O
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:19:19 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:52188)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWNx-0005N2-G1
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:19:18 -0400
Received: by mail-pj1-x1035.google.com with SMTP id k5so1818234pjj.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YOmtdOOk0UtmPB31IPlcnuaHgpZeBkFh3/IQ9OvMjY=;
 b=h8vjiip75HTLZG2L22cSAA1GRIRV9LogZ90ADfM+LKhx+agTBLVkOHXW5U4znOE6b+
 ev3LSdg/Yogad9X2+MBWFgklMFU09QGMk+JX4gjIzQP/M+8qVzBeVcByscAjMDHAd3Sx
 wekVYgFtaXAPBKdes8BH9JWRao0syXF+n/huwiuZ3Tag5zGG4TYDNZPiaHTjsJBqk9ug
 1UTdfaTDxDwQIwRLEBLP3QK3hSyAWP22vkZPO3ybEj070KDrJrHtXFa96NKHW0tgiOiT
 r5ykb5YHPasQ57q6CisujczQl2Gj8r4Lh05hAaRExU6dgOB4vSSjnmsgRWat6xXfojqj
 fMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4YOmtdOOk0UtmPB31IPlcnuaHgpZeBkFh3/IQ9OvMjY=;
 b=Hu04xMPXwwfyEqWCoxbQukfJAEDSF5omDG+POcq95KTWFRGn88UnARb54DFXhQGe4h
 YiXSJgOuv0K8myRi2fR9wiPcVtVM5xGs9XoBiIW5g5HUezXvKXrEBUj7/xTWWbIH6EMd
 S7nesnXVNrNE9fBr/t0SLrPOFx0ijBwyl0ZzXKdJoA2K0HgS52UlActRh/W9fhfLPw9p
 G+ec19qpNbcYpxLDBaOhm9uXjparwVDzeu7COF8hJT1mral1tyvqjbEFwD4DnXk6Ah/P
 KMw5vBQUxFdRiDGMC0HyNV9aAfhF00YLqFoi/YoS1dLNVXEJsnRK1WK82hBsonCDl1gS
 Iqdg==
X-Gm-Message-State: AOAM531/sZfMeRTpVXBp1QFc9GNZS7qgxKS6aedbaOVYNsbQBksmeuYc
 L/tFyW9bIP9d3awZmdAw88alKyyVPj8d0Q==
X-Google-Smtp-Source: ABdhPJwidHCg5pU2du3WrlVqkztdWm/Wh6wMY/8uHAg+7yqg/GoH/yoOigdmdIioSkOjrjFsL2ynwA==
X-Received: by 2002:a17:902:ced1:b029:115:3e22:1eb4 with SMTP id
 d17-20020a170902ced1b02901153e221eb4mr9050765plg.19.1623853155807; 
 Wed, 16 Jun 2021 07:19:15 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id v14sm2667899pgo.89.2021.06.16.07.19.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:19:15 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Set UI information
Date: Wed, 16 Jun 2021 23:19:10 +0900
Message-Id: <20210616141910.54188-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1035.google.com
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

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 995301502be..8b83f91723a 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -540,6 +540,43 @@ - (void) setContentDimensions
     }
 }
 
+- (void) updateUIInfo
+{
+    NSSize frameSize;
+    QemuUIInfo info;
+
+    if (!qemu_console_is_graphic(dcl.con)) {
+        return;
+    }
+
+    if ([self window]) {
+        NSDictionary *description = [[[self window] screen] deviceDescription];
+        CGDirectDisplayID display = [[description objectForKey:@"NSScreenNumber"] unsignedIntValue];
+        NSSize screenSize = [[[self window] screen] frame].size;
+        CGSize screenPhysicalSize = CGDisplayScreenSize(display);
+
+        frameSize = isFullscreen ? screenSize : [self frame].size;
+        info.width_mm = frameSize.width / screenSize.width * screenPhysicalSize.width;
+        info.height_mm = frameSize.height / screenSize.height * screenPhysicalSize.height;
+    } else {
+        frameSize = [self frame].size;
+        info.width_mm = 0;
+        info.height_mm = 0;
+    }
+
+    info.xoff = 0;
+    info.yoff = 0;
+    info.width = frameSize.width;
+    info.height = frameSize.height;
+
+    dpy_set_ui_info(dcl.con, &info);
+}
+
+- (void)viewDidMoveToWindow
+{
+    [self updateUIInfo];
+}
+
 - (void) switchSurface:(pixman_image_t *)image
 {
     COCOA_DEBUG("QemuCocoaView: switchSurface\n");
@@ -1258,6 +1295,16 @@ - (NSApplicationTerminateReply)applicationShouldTerminate:
     return [self verifyQuit];
 }
 
+- (void)windowDidChangeScreen:(NSNotification *)notification
+{
+    [cocoaView updateUIInfo];
+}
+
+- (void)windowDidResize:(NSNotification *)notification
+{
+    [cocoaView updateUIInfo];
+}
+
 /* Called when the user clicks on a window's close button */
 - (BOOL)windowShouldClose:(id)sender
 {
@@ -1936,6 +1983,8 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
     COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
 
+    [cocoaView updateUIInfo];
+
     // The DisplaySurface will be freed as soon as this callback returns.
     // We take a reference to the underlying pixman image here so it does
     // not disappear from under our feet; the switchSurface method will
-- 
2.30.1 (Apple Git-130)


