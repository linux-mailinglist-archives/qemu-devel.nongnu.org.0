Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3565DF8C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 23:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDBp8-0005PL-4r; Wed, 04 Jan 2023 17:01:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBoZ-0005Ne-LB; Wed, 04 Jan 2023 17:00:51 -0500
Received: from smtp-out1.suse.de ([195.135.220.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>)
 id 1pDBoX-0002mP-Qw; Wed, 04 Jan 2023 17:00:51 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3FB8402D8;
 Wed,  4 Jan 2023 22:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672869647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTpssxDOxW5K8r0mIqNGjY0Vwm9oB8W5sgiY+HSmlSk=;
 b=o8zw3XB7Ufae+qQqimWdT0CjDCoRRb6J5clzFPtfZPjf+yGEJrHilN+tWVl3xzSSnJW9Yp
 rEP6bXMHMV51c3DQL5JG1+QTKB835GrweqQqiYcEMDfssvw7j0Y6DFINuAJ1pFtYpeFL0N
 bQoWXqHsMLH0pqKtyB2FfrwspUr99+I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672869647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vTpssxDOxW5K8r0mIqNGjY0Vwm9oB8W5sgiY+HSmlSk=;
 b=9YCH57Yxz20q/DxC/LonMcajCD7d5MaxOxqCDKT/CrCiFI+igBCb8ukp77OAsvMKV0DJVe
 +mp7qiKHVLZuinAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01D061342C;
 Wed,  4 Jan 2023 22:00:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0N7RLgz3tWPwJAAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 04 Jan 2023 22:00:44 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH 02/27] target/arm: Fix checkpatch space errors in helper.c
Date: Wed,  4 Jan 2023 18:58:10 -0300
Message-Id: <20230104215835.24692-3-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230104215835.24692-1-farosas@suse.de>
References: <20230104215835.24692-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=farosas@suse.de;
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

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Fabiano Rosas <farosas@suse.de>
---
 target/arm/helper.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6703936a28..18e4680912 100644
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
@@ -2350,11 +2350,11 @@ static const ARMCPRegInfo v6k_cp_reginfo[] = {
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
@@ -4099,17 +4099,17 @@ static const ARMCPRegInfo cache_block_ops_cp_reginfo[] = {
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
@@ -8392,7 +8392,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             ARMCPRegInfo cbar = {
                 .name = "CBAR",
                 .cp = 15, .crn = 15, .crm = 0, .opc1 = 4, .opc2 = 0,
-                .access = PL1_R|PL3_W, .resetvalue = cpu->reset_cbar,
+                .access = PL1_R | PL3_W, .resetvalue = cpu->reset_cbar,
                 .fieldoffset = offsetof(CPUARMState,
                                         cp15.c15_config_base_address)
             };
@@ -9359,11 +9359,11 @@ static void switch_mode(CPUARMState *env, int mode)
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
@@ -10867,7 +10867,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if (sum >= 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SARITH8(a, b, n, op) do { \
     int32_t sum; \
@@ -10875,7 +10875,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if (sum >= 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 
 #define ADD16(a, b, n) SARITH16(a, b, n, +)
@@ -10894,7 +10894,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 1) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define ADD8(a, b, n) do { \
     uint32_t sum; \
@@ -10902,7 +10902,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 1) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define SUB16(a, b, n) do { \
     uint32_t sum; \
@@ -10910,7 +10910,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 16); \
     if ((sum >> 16) == 0) \
         ge |= 3 << (n * 2); \
-    } while(0)
+    } while (0)
 
 #define SUB8(a, b, n) do { \
     uint32_t sum; \
@@ -10918,7 +10918,7 @@ static inline uint8_t sub8_usat(uint8_t a, uint8_t b)
     RESULT(sum, n, 8); \
     if ((sum >> 8) == 0) \
         ge |= 1 << n; \
-    } while(0)
+    } while (0)
 
 #define PFX u
 #define ARITH_GE
-- 
2.35.3


