Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A2D32D39E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 13:53:32 +0100 (CET)
Received: from localhost ([::1]:50140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHnTv-0008Rv-EL
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 07:53:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSs-0007SN-JF
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lHnSq-000556-Qj
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 07:52:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614862343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R9j6663zu7mblabCDLOy1oUqTA4nv77yYjoyi/DXzqI=;
 b=BKMQvHCcn9DTUJUT5vEEFjtsCVjhSN/raRxRMyqHWZbUx9SZusvjtdigH86/zmk8nOHQec
 eq371UfOqRlaBcdofFUWVkoScTUDRpHnBbTaA3vhDZPVdavj0WIQbe8W7la5Yg9WiOSU3W
 CYVO90lu1iWnBRkQz8H7V+CdK3Yrzzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-DlkXbMxgPG62mnQqGLWXzg-1; Thu, 04 Mar 2021 07:52:20 -0500
X-MC-Unique: DlkXbMxgPG62mnQqGLWXzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B437D19067E1;
 Thu,  4 Mar 2021 12:52:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-129.ams2.redhat.com
 [10.36.115.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 778945D762;
 Thu,  4 Mar 2021 12:52:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2F85E18000AA; Thu,  4 Mar 2021 09:37:05 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/8] ui/cocoa: Remove the uses of full screen APIs
Date: Thu,  4 Mar 2021 09:36:58 +0100
Message-Id: <20210304083705.1046645-2-kraxel@redhat.com>
In-Reply-To: <20210304083705.1046645-1-kraxel@redhat.com>
References: <20210304083705.1046645-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

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
Message-Id: <20210220013138.51437-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 41 +++++++++++++++--------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0ef5fdf3b7a3..5ad44b84aaaf 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -585,37 +585,26 @@ QemuCocoaView *cocoaView;
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
2.29.2


