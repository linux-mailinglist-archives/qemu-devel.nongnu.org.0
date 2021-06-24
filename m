Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3565A3B2A6F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 10:34:16 +0200 (CEST)
Received: from localhost ([::1]:53780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwKoR-0005jT-91
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 04:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKnC-0003xy-Ct
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lwKn9-00018B-Pe
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 04:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624523575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zu27+xr4LOw15iiN42XOI9h+cVCJZ/4hDZoU0BVd3Tk=;
 b=IHXp/mjnI1qttBZhRPPMgo/Q7NdFvUMAYUIEKe0ySwWvDr+uAq/jrOCid/yd1PSnJOXVYl
 W81NjaPFGp0UZoUsTbnvTCQ7vukZAADeh6TxD6XsFvrFYjzFIQmIftcbmM4JABFIQkD9IX
 unumOtaBiYx0skd9/qPOD/eBu/RaI8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-94-xalPzUXmPg-Z1E29b0GCcA-1; Thu, 24 Jun 2021 04:32:53 -0400
X-MC-Unique: xalPzUXmPg-Z1E29b0GCcA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41E87100A45C;
 Thu, 24 Jun 2021 08:32:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BB6F5D6A1;
 Thu, 24 Jun 2021 08:32:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 04709180079D; Thu, 24 Jun 2021 10:32:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/5] ui/cocoa: Set UI information
Date: Thu, 24 Jun 2021 10:32:42 +0200
Message-Id: <20210624083246.2297440-2-kraxel@redhat.com>
In-Reply-To: <20210624083246.2297440-1-kraxel@redhat.com>
References: <20210624083246.2297440-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210616141910.54188-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 37e1fb52eb4d..530c506489b2 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -518,6 +518,43 @@ QemuCocoaView *cocoaView;
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
@@ -1172,6 +1209,16 @@ QemuCocoaView *cocoaView;
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
@@ -1836,6 +1883,8 @@ static void cocoa_switch(DisplayChangeListener *dcl,
 
     COCOA_DEBUG("qemu_cocoa: cocoa_switch\n");
 
+    [cocoaView updateUIInfo];
+
     // The DisplaySurface will be freed as soon as this callback returns.
     // We take a reference to the underlying pixman image here so it does
     // not disappear from under our feet; the switchSurface method will
-- 
2.31.1


