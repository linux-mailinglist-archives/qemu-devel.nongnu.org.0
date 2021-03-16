Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D2233CD9F
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 06:49:21 +0100 (CET)
Received: from localhost ([::1]:38366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM2a0-0000e3-7T
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 01:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2Pl-0006Fl-6Q
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lM2Pb-0004oS-DA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 01:38:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615873114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oqdpqg9I4PZSbZGu3CZuLugaZxHwMJD0Jpla0CqGCno=;
 b=VNcd6XrLHg9ZiUHb1a+iVnAFe0TbpOoIsscTiLbElNcM5sFro6XgZBzI818vohH/zv99D6
 U4P+ifQTakwwFmMohn3ylYxqRtFyrH8cmZyS6OsGgkVyPhdL91vwC+LkT3DG+6H8AzEMcv
 lxIBQv/H1tgvmvcGYaXsJ+wRpMBC0sM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-LmSRu8UmPI6YVnmuiM1XQg-1; Tue, 16 Mar 2021 01:38:30 -0400
X-MC-Unique: LmSRu8UmPI6YVnmuiM1XQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77B5681744F;
 Tue, 16 Mar 2021 05:38:29 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0D2A60C0F;
 Tue, 16 Mar 2021 05:38:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9C6541800843; Tue, 16 Mar 2021 06:38:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] ui/cocoa: Comment about modifier key input quirks
Date: Tue, 16 Mar 2021 06:38:13 +0100
Message-Id: <20210316053813.1719442-12-kraxel@redhat.com>
In-Reply-To: <20210316053813.1719442-1-kraxel@redhat.com>
References: <20210316053813.1719442-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Based-on: <20210310042348.21931-1-akihiko.odaki@gmail.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-Id: <20210312133212.3131-1-akihiko.odaki@gmail.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/cocoa.m | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 9da0e884b712..37e1fb52eb4d 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -690,7 +690,43 @@ QemuCocoaView *cocoaView;
     NSPoint p = [self screenLocationOfEvent:event];
     NSUInteger modifiers = [event modifierFlags];
 
-    // emulate caps lock keydown and keyup
+    /*
+     * Check -[NSEvent modifierFlags] here.
+     *
+     * There is a NSEventType for an event notifying the change of
+     * -[NSEvent modifierFlags], NSEventTypeFlagsChanged but these operations
+     * are performed for any events because a modifier state may change while
+     * the application is inactive (i.e. no events fire) and we don't want to
+     * wait for another modifier state change to detect such a change.
+     *
+     * NSEventModifierFlagCapsLock requires a special treatment. The other flags
+     * are handled in similar manners.
+     *
+     * NSEventModifierFlagCapsLock
+     * ---------------------------
+     *
+     * If CapsLock state is changed, "up" and "down" events will be fired in
+     * sequence, effectively updates CapsLock state on the guest.
+     *
+     * The other flags
+     * ---------------
+     *
+     * If a flag is not set, fire "up" events for all keys which correspond to
+     * the flag. Note that "down" events are not fired here because the flags
+     * checked here do not tell what exact keys are down.
+     *
+     * If one of the keys corresponding to a flag is down, we rely on
+     * -[NSEvent keyCode] of an event whose -[NSEvent type] is
+     * NSEventTypeFlagsChanged to know the exact key which is down, which has
+     * the following two downsides:
+     * - It does not work when the application is inactive as described above.
+     * - It malfactions *after* the modifier state is changed while the
+     *   application is inactive. It is because -[NSEvent keyCode] does not tell
+     *   if the key is up or down, and requires to infer the current state from
+     *   the previous state. It is still possible to fix such a malfanction by
+     *   completely leaving your hands from the keyboard, which hopefully makes
+     *   this implementation usable enough.
+     */
     if (!!(modifiers & NSEventModifierFlagCapsLock) !=
         qkbd_state_modifier_get(kbd, QKBD_MOD_CAPSLOCK)) {
         qkbd_state_key_event(kbd, Q_KEY_CODE_CAPS_LOCK, true);
-- 
2.29.2


