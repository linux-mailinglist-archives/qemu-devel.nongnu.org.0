Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F1B65DF88
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:02:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBpF-0005fB-W3; Wed, 04 Jan 2023 17:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBod-0005OA-1Q; Wed, 04 Jan 2023 17:00:56 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBob-0002n1-Av; Wed, 04 Jan 2023 17:00:54 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4386240308;
 Wed,  4 Jan 2023 22:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672869651; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaguIzdmOv8g/9+LmJhW8PFOJmmxe+L0J3jYpCEO7AU=;
 b=gUu6yauX5v9xdNLRmhrThPJIe0RW3y5AdzHWohSDuHbRsFopgw0d5cQFuJOIJVRoMoPEPK
 2eq1XI+HePV+xWfngy4lFt4CGVx2KoReo+67lJipLxjahzN5seYMiX7n18191NIz2nFuk8
 txejlZ5Vi5pTJBSg67o8zVzJKJTO+cY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672869651;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CaguIzdmOv8g/9+LmJhW8PFOJmmxe+L0J3jYpCEO7AU=;
 b=6D+AicIqpQUqsP9qnJ/9NOdolGmudlgZ8JOIQTJgt4kIMRH+lWLk3cBDoTc1YTZY/AzVPO
 5Z5sgh6cqaueB+Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 57B3D1342C;
 Wed,  4 Jan 2023 22:00:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mH0tCBD3tWPwJAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:48 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH 03/27] target/arm: Fix checkpatch brace errors in helper.c
Date: Wed,  4 Jan 2023 18:58:11 -0300
Message-Id: <20230104215835.24692-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1c; envelope-from=farosas@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix this:
ERROR: braces {} are necessary for all arms of this statement

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 67 ++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 18e4680912..ed3da5ada3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9147,10 +9147,12 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
         env->CF = (val >> 29) & 1;
         env->VF = (val << 3) & 0x80000000;
     }
-    if (mask & CPSR_Q)
+    if (mask & CPSR_Q) {
         env->QF = ((val & CPSR_Q) != 0);
-    if (mask & CPSR_T)
+    }
+    if (mask & CPSR_T) {
         env->thumb = ((val & CPSR_T) != 0);
+    }
     if (mask & CPSR_IT_0_1) {
         env->condexec_bits &= ~3;
         env->condexec_bits |= (val >> 25) & 3;
@@ -9355,8 +9357,9 @@ static void switch_mode(CPUARMState *env, int mode)
     int i;
 
     old_mode = env->uncached_cpsr & CPSR_M;
-    if (mode == old_mode)
+    if (mode == old_mode) {
         return;
+    }
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
         memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
@@ -9962,10 +9965,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
         new_mode = ARM_CPU_MODE_UND;
         addr = 0x04;
         mask = CPSR_I;
-        if (env->thumb)
+        if (env->thumb) {
             offset = 2;
-        else
+        } else {
             offset = 4;
+        }
         break;
     case EXCP_SWI:
         new_mode = ARM_CPU_MODE_SVC;
@@ -10756,10 +10760,11 @@ static inline uint16_t add16_sat(uint16_t a, uint16_t b)
 
     res = a + b;
     if (((res ^ a) & 0x8000) && !((a ^ b) & 0x8000)) {
-        if (a & 0x8000)
+        if (a & 0x8000) {
             res = 0x8000;
-        else
+        } else {
             res = 0x7fff;
+        }
     }
     return res;
 }
@@ -10771,10 +10776,11 @@ static inline uint8_t add8_sat(uint8_t a, uint8_t b)
 
     res = a + b;
     if (((res ^ a) & 0x80) && !((a ^ b) & 0x80)) {
-        if (a & 0x80)
+        if (a & 0x80) {
             res = 0x80;
-        else
+        } else {
             res = 0x7f;
+        }
     }
     return res;
 }
@@ -10786,10 +10792,11 @@ static inline uint16_t sub16_sat(uint16_t a, uint16_t b)
 
     res = a - b;
     if (((res ^ a) & 0x8000) && ((a ^ b) & 0x8000)) {
-        if (a & 0x8000)
+        if (a & 0x8000) {
             res = 0x8000;
-        else
+        } else {
             res = 0x7fff;
+        }
     }
     return res;
 }
@@ -10801,10 +10808,11 @@ static inline uint8_t sub8_sat(uint8_t a, uint8_t b)
 
     res = a - b;
     if (((res ^ a) & 0x80) && ((a ^ b) & 0x80)) {
-        if (a & 0x80)
+        if (a & 0x80) {
             res = 0x80;
-        else
+        } else {
             res = 0x7f;
+        }
     }
     return res;
 }
@@ -10822,34 +10830,38 @@ static inline uint16_t add16_usat(uint16_t a, uint16_t b)
 {
     uint16_t res;
     res = a + b;
-    if (res < a)
+    if (res < a) {
         res = 0xffff;
+    }
     return res;
 }
 
 static inline uint16_t sub16_usat(uint16_t a, uint16_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return 0;
+    }
 }
 
 static inline uint8_t add8_usat(uint8_t a, uint8_t b)
 {
     uint8_t res;
     res = a + b;
-    if (res < a)
+    if (res < a) {
         res = 0xff;
+    }
     return res;
 }
 
 static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return 0;
+    }
 }
 
 #define ADD16(a, b, n) RESULT(add16_usat(a, b), n, 16);
@@ -10953,10 +10965,11 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 
 static inline uint8_t do_usad(uint8_t a, uint8_t b)
 {
-    if (a > b)
+    if (a > b) {
         return a - b;
-    else
+    } else {
         return b - a;
+    }
 }
 
 /* Unsigned sum of absolute byte differences.  */
@@ -10976,14 +10989,18 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
     uint32_t mask;
 
     mask = 0;
-    if (flags & 1)
+    if (flags & 1) {
         mask |= 0xff;
-    if (flags & 2)
+    }
+    if (flags & 2) {
         mask |= 0xff00;
-    if (flags & 4)
+    }
+    if (flags & 4) {
         mask |= 0xff0000;
-    if (flags & 8)
+    }
+    if (flags & 8) {
         mask |= 0xff000000;
+    }
     return (a & mask) | (b & ~mask);
 }
 
-- 
2.35.3


