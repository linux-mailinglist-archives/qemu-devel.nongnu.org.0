Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1B319829
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 03:02:03 +0100 (CET)
Received: from localhost ([::1]:42058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lANmU-0007Rl-OI
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 21:02:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALy2-0006n4-1l
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:05:50 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lALy0-0000lK-D2
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 19:05:49 -0500
Received: by mail-pj1-x102b.google.com with SMTP id gb24so4391330pjb.4
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTpVNzxJpy0BzozFR9OJUQChbhgt0E/+G1EJdQwtNjw=;
 b=dOsk8j9BMEg8wLvaQBp3fGA3dhFN+cAuZ9/avm0n6IhtFRYe/U1iMFyOwmkCr0LoF+
 CTpcXZepczRJkuQBx3Nx9EysicbWzux0a+6LKW0xSXc2Nf7AubZkZyqIJPvujfWRSN9k
 8unocIOmHohKTVQKJ2V9EDtD3jYYyxT9tWNZ2l+zAQIgykn7XIWZiY/BjocSnMl3C7H8
 G5TKNHKeuK7XDqwh30viq2YR5ri08XeEvVuBpS0fan+Q7A3xmRPG3Q9vlHWJF4DQsT1/
 0Tk7XDM7xn3V6eyfk+BLV9+arwvztn3FNGV1Z/vyxPqeuhcEaQhktMTnPPBtfLMdi1//
 HFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MTpVNzxJpy0BzozFR9OJUQChbhgt0E/+G1EJdQwtNjw=;
 b=re+pRaoDM6p1tN+QiM1T0e5iX+PLzGz8hGZD5z/NEbK0qonYxQlUXrs0DBMEp7CXpw
 hqDHpmgmT5LfhaX5rZ4gedRnAuxugKOjQWhAfxMqi2n8lIjIiAB20KxIduTBVwYK8LCP
 c17py6o2Zg3/XfKfEjWq7Xnz7OiZoON5u7Gv8PbYfZHpkvgnLbRO0Q7+rcYTD7u6OSva
 05OHsPtQYYDrS2/59SRZVSnDdXQlxCAj3a0Rf6XIyqSbFT6zMksh5SV9fOhboqfQ0ks2
 eg/Nryp1WMVTj4hoj7mqCGIYt+Ne3WN0xkqaEV4TLKtB5MYQDncNHlkLSJNHIRzO5FkH
 VPsA==
X-Gm-Message-State: AOAM531xjpELKMV4qdXEb8+TdHu8cgwKPV3VOSdACZA6XXpz+F1PAgZD
 NJSUy8Z/zxdwLme8c+zTLt0=
X-Google-Smtp-Source: ABdhPJwpUkxle/uhyPYgJXB/BrWlUiU7pJlr9YuMN+2uVgeQLsqSC0wNKZ+ESLpo4tIRqiZ6aZqV3g==
X-Received: by 2002:a17:90b:1b4a:: with SMTP id
 nv10mr189998pjb.169.1613088346977; 
 Thu, 11 Feb 2021 16:05:46 -0800 (PST)
Received: from localhost.localdomain ([210.227.19.68])
 by smtp.gmail.com with ESMTPSA id 123sm6797889pfd.91.2021.02.11.16.05.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 16:05:46 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Remove the uses of full screen APIs
Date: Fri, 12 Feb 2021 09:05:40 +0900
Message-Id: <20210212000540.28486-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 11 Feb 2021 20:57:23 -0500
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The detections of full screen APIs were wrong. A detection is coded as:
[NSView respondsToSelector:@selector(exitFullScreenModeWithOptions:)]
but it should be:
[NSView instancesRespondToSelector:@selector(exitFullScreenModeWithOptions:)]

The uses of full screen APIs were also incorrect, and if you fix the
detections, the full screen view stretches the video, changing the
aspect ratio, even if zooming is disabled.

Remove the code as it does nothing good.

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


