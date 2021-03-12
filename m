Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A76D338EDF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 14:34:04 +0100 (CET)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKhvX-0004wn-1c
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 08:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKhtx-0003ST-3d
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:32:26 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lKhtr-000757-U5
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:32:24 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 kr3-20020a17090b4903b02900c096fc01deso11069787pjb.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=to9U6DTzlDrcCaosa+UhVDIYjdeL4hs45H4f9hiPDYE=;
 b=BfXODhvU4VL5ngiZGALIbhkYMK5YN97XSVlwtRF3pDjsvQkWgfmWaiu/9UJrx/5/Ay
 a4wddWt11+zhHVlDK77nvshDeKQkLzU4XeRs23Ws/oxrkbwap4yhzCHXMQDjJptgKhgn
 fl19kjDUQ0+Rlihbqj6E4T94R2SEsy5dVeSr4n//qjNo4of1xN9AMNBnhG7cyRdKx7uf
 9IdsZXowpNaED3TqrqXP3UtzhPxfkp6gNzFQgNQ1uyOitHeW5FAHblI4RUWNeEuk38oh
 +2xlTGpOuTb6UxswOr41LTiXKNeVDZ/27bylmkECxk/RPxYGlnaoCO/QqX2vujoWowF8
 aREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=to9U6DTzlDrcCaosa+UhVDIYjdeL4hs45H4f9hiPDYE=;
 b=sRFU+rK3oU8ob8uulD9WCtoYMtkwy2IJzXTSfAo8aRYcXKSVs99rz3wKaHuDqqnf27
 5zYpCtY639G+lMauqrFPZeGys9ZaacQfc6y30Xr9FYLf1LvcsWRludbwZ04pVTFi1yaW
 WHitFosiIAn54NX+vL10qiO5Zu8+H9GBPs7M+ZddmHxE+Il/2NHqxuUra6OXsW2LJPQS
 X4d4hVSKwkNPtI5wLvucjnPFJUzaRjj4g2AQrdLfI0cDHlQA6rA7UUwaHbO/Q3c6ho2b
 vgUM5Q0F9Z0GmnkTxMUHPfWzlGM/Lts3gXMC/U3SCDWzgi+3Kds/y90g8jFTtXyPJlsI
 8Pbw==
X-Gm-Message-State: AOAM530FAsatS5tBLDOFweQJrkXujX87aPjRVFnoG8v/czegQquc6Gya
 6urUcsHE/hu3EN+pKM0X33mnzs+3dUs8qg==
X-Google-Smtp-Source: ABdhPJz56gsCJ9dOv/QajOBaXqauorFAySvmRznp5jpe9YPOz5Wp1JTa4X7s4DXaJgn/YZYAMh2+ww==
X-Received: by 2002:a17:90b:33c7:: with SMTP id
 lk7mr14312637pjb.95.1615555937990; 
 Fri, 12 Mar 2021 05:32:17 -0800 (PST)
Received: from localhost.localdomain ([2400:4050:c360:8200:40b:8732:6f60:1734])
 by smtp.gmail.com with ESMTPSA id ms21sm2389516pjb.5.2021.03.12.05.32.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Mar 2021 05:32:17 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2] ui/cocoa: Comment about modifier key input quirks
Date: Fri, 12 Mar 2021 22:32:12 +0900
Message-Id: <20210312133212.3131-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102c.google.com
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
 ui/cocoa.m | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 035f96aab04..35fdc92a51f 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -700,7 +700,43 @@ - (bool) handleEventLocked:(NSEvent *)event
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
2.24.3 (Apple Git-128)


