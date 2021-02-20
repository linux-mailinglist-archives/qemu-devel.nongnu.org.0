Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D75232027E
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 02:33:44 +0100 (CET)
Received: from localhost ([::1]:50246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDH9S-00079P-QU
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 20:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDH7q-0006Ks-2u
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 20:32:02 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:37960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lDH7n-0007Vi-HC
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 20:32:01 -0500
Received: by mail-pg1-x532.google.com with SMTP id m2so6390613pgq.5
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 17:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s8uQrK7bptFQh/WCg5K/qLxuoWQq9CQI9b7nlXjt/Go=;
 b=LBRw+p3ZII39YcAmxGgOBdZcFbCVxAgxOLbCKar4QizJYFkoRX3Av913K/xDb6jvhA
 zG5I0ZMTfEgK58tsanXKEHvmzBPfR4Z82D9osy8dONGGk7HT5tmexh6+e9IszQMxoTPu
 Niw5DKspAThIoFCMAaQJt7+7B+Vqlm53DjxJhqP44pkOlGieaUi70LPuFMjjw1ApxH+2
 71EVqsKEVFAn4o6LmetscDf+CEFXdACWhUvkAOVhbD0YO5udcbDnpA5I/Bgjysvp0Vq7
 oUX1TViNifP447AAF8umqoaFH/1M2iM6dpL3hBeptkP1iZnKXL95LPNm35sBP4ozJdOi
 5mlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s8uQrK7bptFQh/WCg5K/qLxuoWQq9CQI9b7nlXjt/Go=;
 b=YdOwF/mEvrxFHOM5Ii5f76gZ3FGS7lWWC6p51CSeNfIxilQB6cm2wS3EvJ2mEYroZe
 IsAorhv6R+Kqt3HbSTWB6w76NKyZCSYPIVWInbjyiOWFwI5CAdGhOhMf+au2UL0QQh3B
 muyD5UVQHmwa77ZgcVt7gldrkHAAI2uH2BnaEKjuo2lZxjslGb8win1N9URY/YHtUQOm
 FvPrtP22SNpP7aiJKUnaTEL+eHse6BlDEJuuwL+l8zxo21t+3ufc8yan7PxTW2IjVvDK
 DKEAW/maj63R3oMbMAx4ljyyH81lZnMvMD56BDOgALv72t0rANZj1aW6F3WPfKwYn9UE
 d58A==
X-Gm-Message-State: AOAM530j3x3llpaXtmKkyFvf+40sbFIWateIROmssKZgymiV5ljjTVy1
 lIy83sUEvJ+nth/l7y//aDdm9hyguAOsDA==
X-Google-Smtp-Source: ABdhPJzfE7Z6fYd4xHaj6U8/PJXJU0HJG7bnPte2O68eDNOlxg6mQnMackkf0zt+26WEPjJJq9ts0A==
X-Received: by 2002:a63:e305:: with SMTP id f5mr9774499pgh.411.1613784717802; 
 Fri, 19 Feb 2021 17:31:57 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:d8f0:71c1:3d6a:4f53])
 by smtp.gmail.com with ESMTPSA id w196sm11118783pfd.23.2021.02.19.17.31.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Feb 2021 17:31:57 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Remove the uses of full screen APIs
Date: Sat, 20 Feb 2021 10:31:38 +0900
Message-Id: <20210220013138.51437-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20210219135534.clmpknifhvgn7vde@sirius.home.kraxel.org>
References: <20210219135534.clmpknifhvgn7vde@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x532.google.com
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

The detections of [NSView -enterFullScreen:] and
[NSView -exitFullScreen:] were wrong. A detection is coded as:
[NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]
but it should be:
[NSView instancesRespondToSelector:@selector(exitFullScreenModeWithOptions:)]

Because of those APIs were not detected, ui/cocoa always falled
back to a borderless window whose frame matches the screen to
implement fullscreen behavior.

The code using [NSView -enterFullScreen:] and
[NSView -exitFullScreen:] will be used if you fix the detections,
but its behavior is undesirable; the full screen view stretches
the video, changing the aspect ratio, even if zooming is disabled.

This change removes the code as it does nothing good.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 13fba8103e1..36e45cd98b4 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -564,37 +564,26 @@ - (void) toggleFullScreen:(id)sender
         isFullscreen = FALSE;
         [self ungrabMouse];
         [self setContentDimensions];
-        if ([NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]) { // test if "exitFullScreenModeWithOptions" is supported on host at runtime
-            [self exitFullScreenModeWithOptions:nil];
-        } else {
-            [fullScreenWindow close];
-            [normalWindow setContentView: self];
-            [normalWindow makeKeyAndOrderFront: self];
-            [NSMenu setMenuBarVisible:YES];
-        }
+        [fullScreenWindow close];
+        [normalWindow setContentView: self];
+        [normalWindow makeKeyAndOrderFront: self];
+        [NSMenu setMenuBarVisible:YES];
     } else { // switch from desktop to fullscreen
         isFullscreen = TRUE;
         [normalWindow orderOut: nil]; /* Hide the window */
         [self grabMouse];
         [self setContentDimensions];
-        if ([NSView respondsToSelector:@selector(enterFullScreenMode:withOptions:)]) { // test if "enterFullScreenMode:withOptions" is supported on host at runtime
-            [self enterFullScreenMode:[NSScreen mainScreen] withOptions:[NSDictionary dictionaryWithObjectsAndKeys:
-                [NSNumber numberWithBool:NO], NSFullScreenModeAllScreens,
-                [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:NO], kCGDisplayModeIsStretched, nil], NSFullScreenModeSetting,
-                 nil]];
-        } else {
-            [NSMenu setMenuBarVisible:NO];
-            fullScreenWindow = [[NSWindow alloc] initWithContentRect:[[NSScreen mainScreen] frame]
-                styleMask:NSWindowStyleMaskBorderless
-                backing:NSBackingStoreBuffered
-                defer:NO];
-            [fullScreenWindow setAcceptsMouseMovedEvents: YES];
-            [fullScreenWindow setHasShadow:NO];
-            [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
-            [self setFrame:NSMakeRect(cx, cy, cw, ch)];
-            [[fullScreenWindow contentView] addSubview: self];
-            [fullScreenWindow makeKeyAndOrderFront:self];
-        }
+        [NSMenu setMenuBarVisible:NO];
+        fullScreenWindow = [[NSWindow alloc] initWithContentRect:[[NSScreen mainScreen] frame]
+            styleMask:NSWindowStyleMaskBorderless
+            backing:NSBackingStoreBuffered
+            defer:NO];
+        [fullScreenWindow setAcceptsMouseMovedEvents: YES];
+        [fullScreenWindow setHasShadow:NO];
+        [fullScreenWindow setBackgroundColor: [NSColor blackColor]];
+        [self setFrame:NSMakeRect(cx, cy, cw, ch)];
+        [[fullScreenWindow contentView] addSubview: self];
+        [fullScreenWindow makeKeyAndOrderFront:self];
     }
 }
 
-- 
2.24.3 (Apple Git-128)


