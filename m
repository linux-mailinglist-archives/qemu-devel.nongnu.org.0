Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C3A3378D8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:11:36 +0100 (CET)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNuR-0004it-UR
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:11:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKMxo-0006nG-Bt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:11:00 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:33376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKMxm-0007Tm-HT
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:11:00 -0500
Received: by mail-pg1-x52f.google.com with SMTP id g4so13853279pgj.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anyCAYqAgG3lqh7aDIWMSEATvybpz6UcJ2ql2ol2c0I=;
 b=KYNfc1J0xKXGlEAxnqoXWWAANRQc/3rRLaE7e1Lssjy8M8mfhC2qWT3R2salRtEHJn
 fcU0u28S1hwo/nXdBuE0afPgfDSBOcGBW/IL9oKjO8Y8l2/GCcu1Lwc8yF1WnIBz/Ff9
 sLvU2PsEEp7nu66brNA5qjKdcQLc5EdiaD6gyhzNmZVFlFIz7I7kWUchHnu1Auu+HM7z
 9yKcn8SVbNBZT920tQbdqocnNwmgUccQX+0DznoD/vXPRrgQHwzzUqlfHYhzZma3vw9j
 qEN9IFpCS0RbfrzK0eOTIv0HhvzwPuGug7ZfhG3s3LbqAnZUNozIkI6jyJglrZGAGym1
 SxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=anyCAYqAgG3lqh7aDIWMSEATvybpz6UcJ2ql2ol2c0I=;
 b=lO0UgpxI/McECok/tpwnfFkuykCJKV4VmWo+U/gON28MK6Aco8ccCH9yhbryz+QehI
 3QDHMsAiZXMdgiZs74+zhL5eTlj5qzUCnbzrw0OAG+LgcRwmnen8LKZCz6OKsilqTY9X
 XUvpT348DVoJ/IkuOI0ib3F+0AAnTE7InwEhdxU90j7anfSt1etQOC4y7kSUwDra6qtb
 SBBxW6uwmXVJM7murXlMYDS6HkhP+q9233+isZZ4DSyIPhjM6cPDpodaBIGrlIEy9fGe
 iOcn7MRJuPPN6C4thXhMSHy+KmjAfS/L6AFF9GmqGH0w7vDTslbP4Wl8fpdHHkLYOekD
 Vb8g==
X-Gm-Message-State: AOAM532Ul5rGbb0FPmfH7tyauQpBZrWow3Bl+kINIEHYXIVNFbKm9SmV
 SqyvgAgnVf2rvGQNmtTa90mETYMlKYTTlg==
X-Google-Smtp-Source: ABdhPJzkzjeGiTFWoKnETBO/iSUc8mX8IAZbxjPyqh7+a7vIXKcY9liTbRiYUS3z9u0njDsURfRGUA==
X-Received: by 2002:a63:4462:: with SMTP id t34mr7486874pgk.389.1615475456281; 
 Thu, 11 Mar 2021 07:10:56 -0800 (PST)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:a00f:6b19:eaae:a18e])
 by smtp.gmail.com with ESMTPSA id d20sm2720398pjv.47.2021.03.11.07.10.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Mar 2021 07:10:55 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/cocoa: Comment about modifier key input quirks
Date: Fri, 12 Mar 2021 00:10:42 +0900
Message-Id: <20210311151042.21743-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52f.google.com
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
index 035f96aab04..b0649c0c50a 100644
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


