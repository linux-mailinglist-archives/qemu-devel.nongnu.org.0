Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D87433783B
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:42:38 +0100 (CET)
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNSP-0008R9-Ln
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:42:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKMyy-0008VJ-IO
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:12:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKMyw-00089A-O2
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:12:12 -0500
Received: by mail-pj1-x1030.google.com with SMTP id w8so3596239pjf.4
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qHquB96qglxskLFxCFbUA6KXYvsGN7SKfhhtdSIQCE=;
 b=Z64g34mVnCLV2ZfUe6q2xOI0juDpRurMq4t9JbCnSPlQHNEqXdA4OSYtybOBkgl24R
 5TPNk4rsk6BWjyfikNH31I+ssOVL0GDShVTRx9NtqWADptwLK0o3qlqKDFHBJ05IqZOE
 q3Va8O91yV7N6IFP7SQvau2Dh7aU2ZvX4fygd1kEC71QkbiRnJ20Wpco+abWBWJfJC8E
 WCLBLLm695cJ9+WXD2t5Ls2RerhKn3azdor32Ff4/DoiQHQijefykoDyrFtzFrTcNtD4
 sKjxViTEbzK1Gu1VMs7AdsHfZEhwQPJbrqpoNEd6TW2pRi6MTE8r9nCjwDe0rtpViWuz
 EQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qHquB96qglxskLFxCFbUA6KXYvsGN7SKfhhtdSIQCE=;
 b=C4Bjb27ZaDEVIsVeXW/HRr+/XoQALeFBJ31/HakrtNYMbcl1wpE0jBwtxyiAHvf13W
 eRVPEXsiue+Lclmnt4r1vOY5M3SNY9ul7kkmr7cuunHIGHxBUGokKUijBKymScCJNOb9
 2Ayka0l1yK4xiZjcvakCUooxSDrK33gw4lq3hz2mxTDiayrVsL+NS1Kp/1nAwNeZdoLZ
 VFw2NXpu7ZEFarMjeJrHfIkufm6i+ADPoZACQLQ3VcWF316+Lq8LC/wONENIiY9fu9BE
 psUHbSC46c4sg8kniBz/hZSG8qaw2bjwYrTxBtHH8iDL46Ee4u173pjP7tnmYTPFq8VE
 dhog==
X-Gm-Message-State: AOAM5339KFdHszglj16Uf0FHHsYQrLmrD3CmI3i+Q7KvmvdArkEbPbg2
 ugFlHF5cqi2nLlS7rPgU+F9ygvmK3tbNzQ==
X-Google-Smtp-Source: ABdhPJwjmEgm9YwICdRCb3VElU3Ial/EP7b7khpPVShm+zslVc75FZpaqyNESX39akosw+GE0dKXiQ==
X-Received: by 2002:a17:902:6541:b029:e6:27a4:80fb with SMTP id
 d1-20020a1709026541b02900e627a480fbmr8483924pln.15.1615475529038; 
 Thu, 11 Mar 2021 07:12:09 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:a00f:6b19:eaae:a18e])
 by smtp.gmail.com with ESMTPSA id f13sm2808080pgu.36.2021.03.11.07.12.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:12:08 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Comment about modifier key input quirks
Date: Fri, 12 Mar 2021 00:12:03 +0900
Message-Id: <20210311151203.21902-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x1030.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Konstantin Nazarov <mail@knazarov.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: <20210310042348.21931-1-akihiko.odaki@gmail.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/cocoa.m | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 035f96aab04..3d292269c11 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -700,13 +700,35 @@ - (bool) handleEventLocked:(NSEvent *)event
     NSPoint p = [self screenLocationOfEvent:event];
     NSUInteger modifiers = [event modifierFlags];
 
-    // emulate caps lock keydown and keyup
+    /*
+     * If -[NSEvent modifierFlags] has NSEventModifierFlagCapsLock,
+     * toggle the current CapsLock state by firing "up" and "down" events in
+     * sequence.
+     */
     if (!!(modifiers & NSEventModifierFlagCapsLock) !=
         qkbd_state_modifier_get(kbd, QKBD_MOD_CAPSLOCK)) {
         qkbd_state_key_event(kbd, Q_KEY_CODE_CAPS_LOCK, true);
         qkbd_state_key_event(kbd, Q_KEY_CODE_CAPS_LOCK, false);
     }
 
+    /*
+     * Check for other flags of -[NSEvent modifierFlags].
+     *
+     * If a flag is not set, fire "up" events for all keys which correspond to
+     * the flag. Note that "down" events are not fired here because the flags
+     * checked here do not tell what exact keys are down.
+     *
+     * These operations are performed for any events because the modifier state
+     * may change while the application is inactive (i.e. no events fire) and
+     * we want to detect it as early as possible.
+     *
+     * Up events corresponding to a modifier flag update the current modifier
+     * state tracked with QKbdState but they are not fired unless all keys which
+     * match to the flag are up. Therefore, it cannot synchornize Cocoa and
+     * QkbdState if one of the keys is down. It is still nice that any
+     * desynchronization can be fixed by completely leaving your hands from the
+     * keyboard.
+     */
     if (!(modifiers & NSEventModifierFlagShift)) {
         qkbd_state_key_event(kbd, Q_KEY_CODE_SHIFT, false);
         qkbd_state_key_event(kbd, Q_KEY_CODE_SHIFT_R, false);
@@ -726,6 +748,14 @@ - (bool) handleEventLocked:(NSEvent *)event
 
     switch ([event type]) {
         case NSEventTypeFlagsChanged:
+            /*
+             * If the state of the key corresponding to -[NSEvent keyCode] is
+             * not updated by checking -[NSEvent modifierFlags], update it here.
+             * It means -[NSEvent keyCode] does not represent CapsLock and
+             * the corresponding modifier flag is set.
+             * [self toggleKey] peeks QkbdState so it correctly works only when
+             * it is synchornized with Cocoa.
+             */
             switch ([event keyCode]) {
                 case kVK_Shift:
                     if (!!(modifiers & NSEventModifierFlagShift)) {
-- 
2.24.3 (Apple Git-128)


