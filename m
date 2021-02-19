Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9232012A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 23:06:29 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDDuu-0002nP-2q
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 17:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpX-0003bC-MN
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lDDpU-0005f7-82
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 17:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613772051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FY/v2o2noH2hc8pJasCo9MJtYfBIC0/wztgrsg5w2N0=;
 b=ZpnQtBrSvvAGR6mrYb0sH+3BggTw0uoXMg/elf1R/0jMev5OCozpAGvARdJRSVtfpyQHMT
 uFN16MlNecgvrPxzNWGBD+UGwshWmFomGF/z7mJ9rZc9K2ck3quvyCN+sx1EcnjFu2UvOz
 AsVML+xxN9/bLLZwcHxSPe9tWBb6lnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-UzQPP2VrMsaoanoSNg3hLA-1; Fri, 19 Feb 2021 17:00:47 -0500
X-MC-Unique: UzQPP2VrMsaoanoSNg3hLA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5841020C20;
 Fri, 19 Feb 2021 22:00:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 607DD1A875;
 Fri, 19 Feb 2021 22:00:43 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 229631800865; Fri, 19 Feb 2021 23:00:37 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/8] ui/cocoa: Interpret left button down as is when command is
 pressed
Date: Fri, 19 Feb 2021 23:00:34 +0100
Message-Id: <20210219220036.100654-7-kraxel@redhat.com>
In-Reply-To: <20210219220036.100654-1-kraxel@redhat.com>
References: <20210219220036.100654-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Old Macs were not equipped with mice with an ability to perform
"right clicks" and ui/cocoa interpreted left button down with
left command key pressed as right button down as a workaround.

The workaround has an obvious downside: you cannot tell the guest
that the left button is down while the left command key is
pressed.

Today, Macs has trackpads, Apple Mice, or Magic Mice. They are
capable to emulate right clicks with gestures, which also allows
to perform right clicks on "BootCamp" OSes like Windows.

By removing the workaround, we overcome its downside, and provide
a behavior consistent with BootCamp.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210212000706.28616-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index eab4bfe7c8ae..13f19bece14d 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -835,11 +835,7 @@ QemuCocoaView *cocoaView;
             mouse_event = true;
             break;
         case NSEventTypeLeftMouseDown:
-            if ([event modifierFlags] & NSEventModifierFlagCommand) {
-                buttons |= MOUSE_EVENT_RBUTTON;
-            } else {
-                buttons |= MOUSE_EVENT_LBUTTON;
-            }
+            buttons |= MOUSE_EVENT_LBUTTON;
             mouse_event = true;
             break;
         case NSEventTypeRightMouseDown:
@@ -851,11 +847,7 @@ QemuCocoaView *cocoaView;
             mouse_event = true;
             break;
         case NSEventTypeLeftMouseDragged:
-            if ([event modifierFlags] & NSEventModifierFlagCommand) {
-                buttons |= MOUSE_EVENT_RBUTTON;
-            } else {
-                buttons |= MOUSE_EVENT_LBUTTON;
-            }
+            buttons |= MOUSE_EVENT_LBUTTON;
             mouse_event = true;
             break;
         case NSEventTypeRightMouseDragged:
-- 
2.29.2


