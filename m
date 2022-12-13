Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B1764BCC4
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:10:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Adp-0007yJ-GC; Tue, 13 Dec 2022 14:08:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adm-0007we-6e; Tue, 13 Dec 2022 14:08:34 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adk-0006Ih-CC; Tue, 13 Dec 2022 14:08:33 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B428F1FDB4;
 Tue, 13 Dec 2022 19:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670958510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSpPtc/c7Vsy4IWrj+qQkkzdykLwLGhQBK/wGs1h5Wk=;
 b=LeWLNVhuhmcQTmzQSYl9LCZZ6OWfD4JfdxNXnf/TJmJxV5puWzgMTfYdOmOJ19HccqnYDn
 6djXH71t/5wn0NuSVjOXQN52GHHFnBLZgT6wxJbcUdcJsgNUHn0X4HAbY6A8ipKYpvztVE
 TWDR2Rr2yS5+5UnwVAQtc4Hpr6JRbWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670958510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QSpPtc/c7Vsy4IWrj+qQkkzdykLwLGhQBK/wGs1h5Wk=;
 b=RWlOW3351rZ7HkQEbeXKCp8FClm3nTxvpSIbAOzlKnQQcBD5rHe4trWLum6ULmqbXBPBSW
 GEuRDBrASdVHJxDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E3B3F138F9;
 Tue, 13 Dec 2022 19:08:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YCO3KavNmGOcBwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:27 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 3/6] target/arm: Fix checkpatch brace errors in helper.c
Date: Tue, 13 Dec 2022 16:05:34 -0300
Message-Id: <20221213190537.511-4-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
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

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 67 ++++++++++++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b240dcf12f..3cf978bb93 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9106,10 +9106,12 @@ void cpsr_write(CPUARMState *env, uint32_t val, uint32_t mask,
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
@@ -9314,8 +9316,9 @@ static void switch_mode(CPUARMState *env, int mode)
     int i;
 
     old_mode = env->uncached_cpsr & CPSR_M;
-    if (mode == old_mode)
+    if (mode == old_mode) {
         return;
+    }
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
         memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
@@ -9921,10 +9924,11 @@ static void arm_cpu_do_interrupt_aarch32(CPUState *cs)
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
@@ -10715,10 +10719,11 @@ static inline uint16_t add16_sat(uint16_t a, uint16_t b)
 
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
@@ -10730,10 +10735,11 @@ static inline uint8_t add8_sat(uint8_t a, uint8_t b)
 
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
@@ -10745,10 +10751,11 @@ static inline uint16_t sub16_sat(uint16_t a, uint16_t b)
 
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
@@ -10760,10 +10767,11 @@ static inline uint8_t sub8_sat(uint8_t a, uint8_t b)
 
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
@@ -10781,34 +10789,38 @@ static inline uint16_t add16_usat(uint16_t a, uint16_t b)
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
@@ -10912,10 +10924,11 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
 
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
@@ -10935,14 +10948,18 @@ uint32_t HELPER(sel_flags)(uint32_t flags, uint32_t a, uint32_t b)
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


