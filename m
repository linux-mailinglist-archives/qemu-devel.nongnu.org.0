Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 144C864BCE1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 20:11:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5Adl-0007sk-JP; Tue, 13 Dec 2022 14:08:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adi-0007sE-Od; Tue, 13 Dec 2022 14:08:30 -0500
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1p5Adg-0006Cz-TD; Tue, 13 Dec 2022 14:08:30 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7713E22AF0;
 Tue, 13 Dec 2022 19:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1670958507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFf1zIDHqWBtG1h4KlzJnhLXK9qn8VZ2/j7hbKgy7gA=;
 b=eyuVGpUdhoqw7FADDNl1XKi3OiKwDlskm605GheQ7BLTbgfJCS/hnzC+p3aYC/jD3wf3Ct
 v9uMdhUiuJjtQUCV012pmLqqNIo3tH/1nj8iy/r8j3r05dBR5obVLxgjie5LAkhSPJYYaa
 DIGNWLk5m+CtCx/rWC+2JaeaW3e4vzI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1670958507;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LFf1zIDHqWBtG1h4KlzJnhLXK9qn8VZ2/j7hbKgy7gA=;
 b=o5XtHXrilmOp3gJ7BmKGA+zC6VWl6C9R0WPYf8p+GcA85Ar1Znd+nSVX5XQZ7yMX3Riyus
 VDx5Mpg7kKXgcuDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A703F138F9;
 Tue, 13 Dec 2022 19:08:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WE4RG6jNmGOcBwAAMHmgww
 (envelope-from <farosas@suse.de>); Tue, 13 Dec 2022 19:08:24 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 2/6] target/arm: Fix checkpatch space errors in helper.c
Date: Tue, 13 Dec 2022 16:05:33 -0300
Message-Id: <20221213190537.511-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221213190537.511-1-farosas@suse.de>
References: <20221213190537.511-1-farosas@suse.de>
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

Fix the following:

ERROR: spaces required around that '|' (ctx:VxV)
ERROR: space required before the open parenthesis '('
ERROR: spaces required around that '+' (ctx:VxB)
ERROR: space prohibited between function name and open parenthesis '('

(the last two still have some occurrences in macros which I left
behind because it might impact readability)

Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 77da24b0e8..b240dcf12f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -205,7 +205,7 @@ static void add_cpreg_to_list(gpointer key, gpointer opaque)
     uint32_t regidx = (uintptr_t)key;
     const ARMCPRegInfo *ri = get_arm_cp_reginfo(cpu->cp_regs, regidx);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_indexes[cpu->cpreg_array_len] = cpreg_to_kvm_id(regidx);
         /* The value array need not be initialized at this point */
         cpu->cpreg_array_len++;
@@ -219,7 +219,7 @@ static void count_cpreg(gpointer key, gpointer opaque)
 
     ri = g_hash_table_lookup(cpu->cp_regs, key);
 
-    if (!(ri->type & (ARM_CP_NO_RAW|ARM_CP_ALIAS))) {
+    if (!(ri->type & (ARM_CP_NO_RAW | ARM_CP_ALIAS))) {
         cpu->cpreg_array_len++;
     }
 }
@@ -2325,11 +2325,11 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
       .resetfn = arm_cp_reset_ignore },
     { .name = "TPIDRRO_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .opc2 = 3, .crn = 13, .crm = 0,
-      .access = PL0_R|PL1_W,
+      .access = PL0_R | PL1_W,
       .fieldoffset = offsetof(CPUARMState, cp15.tpidrro_el[0]),
       .resetvalue = 0},
     { .name = "TPIDRURO", .cp = 15, .crn = 13, .crm = 0, .opc1 = 0, .opc2 = 3,
-      .access = PL0_R|PL1_W,
+      .access = PL0_R | PL1_W,
       .bank_fieldoffsets = { offsetoflow32(CPUARMState, cp15.tpidruro_s),
                              offsetoflow32(CPUARMState, cp15.tpidruro_ns) },
       .resetfn = arm_cp_reset_ignore },
@@ -4074,17 +4074,17 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
       .resetvalue = 0 },
     /* The cache ops themselves: these all NOP for QEMU */
     { .name = "IICR", .cp = 15, .crm = 5, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "IDCR", .cp = 15, .crm = 6, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "CDCR", .cp = 15, .crm = 12, .opc1 = 0,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "PIR", .cp = 15, .crm = 12, .opc1 = 1,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "PDR", .cp = 15, .crm = 12, .opc1 = 2,
-      .access = PL0_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL0_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
     { .name = "CIDCR", .cp = 15, .crm = 14, .opc1 = 0,
-      .access = PL1_W, .type = ARM_CP_NOP|ARM_CP_64BIT },
+      .access = PL1_W, .type = ARM_CP_NOP | ARM_CP_64BIT },
 };
 
 static const ARMCPRegInfo cache_test_clean_cp_reginfo[] = {
@@ -8351,7 +8351,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo cbar = {
                 .name = "CBAR",
                 .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
-                .access = PL1_R|PL3_W, .resetvalue = cpu->reset_cbar,
+                .access = PL1_R | PL3_W, .resetvalue = cpu->reset_cbar,
                 .fieldoffset = offsetof(CPUARMState,
                                         cp15.c15_config_base_address)
             };
@@ -9318,11 +9318,11 @@ static void switch_mode(CPUARMState *env, int mode)
         return;
 
     if (old_mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
+        memcpy(env->fiq_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->usr_regs, 5 * sizeof(uint32_t));
     } else if (mode == ARM_CPU_MODE_FIQ) {
-        memcpy (env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
-        memcpy (env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
+        memcpy(env->usr_regs, env->regs + 8, 5 * sizeof(uint32_t));
+        memcpy(env->regs + 8, env->fiq_regs, 5 * sizeof(uint32_t));
     }
 
     i = bank_number(old_mode);
@@ -10826,7 +10826,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if (sum >= 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SARITH8(a, b, n, op) do { \
     int32_t sum; \
@@ -10834,7 +10834,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if (sum >= 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 
 #define ADD16(a, b, n) SARITH16(a, b, n, +)
@@ -10853,7 +10853,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 1) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define ADD8(a, b, n) do { \
     uint32_t sum; \
@@ -10861,7 +10861,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 1) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define SUB16(a, b, n) do { \
     uint32_t sum; \
@@ -10869,7 +10869,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SUB8(a, b, n) do { \
     uint32_t sum; \
@@ -10877,7 +10877,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define PFX u
 #define ARITH_GE
-- 
2.35.3


