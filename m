Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A81F51BCD9
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 12:10:07 +0200 (CEST)
Received: from localhost ([::1]:59612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmYQv-0001zz-Mb
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 06:10:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWi-00050i-Hk
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:41972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nmXWg-0003Dr-Cn
 for qemu-devel@nongnu.org; Thu, 05 May 2022 05:12:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id c11so5216069wrn.8
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IuSpAmHPbsd9vxR/x219V7l1HJzViUnpVRA6Wdv5c30=;
 b=x9RfJ1N04NsAL4wsi4I/4KGunGNUvsHEMSB71zbjdTc0cRp3gVyPZ0pFaHFl0ImGJV
 u07f5JHAzP3gQb0P6BaBMQ+RZ9BWkqd/N70aheZuxdO6jrxMYzBrMMnhMf0ple8Efl88
 Xr4Xb817BsHF+v6amEFxa6xB3oMZnMmGw1sytlHL9wZm0/mofKAtYS7uqH8hjz++l3rC
 tytgEeNIdRI2Iyck72/bJnUoNCqWGnt0dd2DavGAY4p259CbZo3ye7PO7Kh7GtTV/DpU
 v9tfqvhS2fo57QAexUoPzYawEYB/o9ZC1zb6vS7TY7mHam3kp7CEOtDw6iYkfCGZoP60
 kjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IuSpAmHPbsd9vxR/x219V7l1HJzViUnpVRA6Wdv5c30=;
 b=p9HsF+BD7LeVO7rTpbApdUfrOcRvM6KsUykQZHGntqEnYIKOloK2H1qszeFD6vd8qJ
 VEmSp25Mdu34YiJaFnukklH/mSrerc31lwr+D5Zo8FG4x84wAqbNmJcWyvyQB9sFqbx+
 irY3lkLu5mBTgVUxqLEeIbC9VwLBm5G22qDL65jKwCNx0EdAbIKJIqUZ+RHHP2yUJudb
 3vIi+oBGcDPZnsGFSqwMZ8GqUrs+sxeDQPzW2ziNbaDwOso3yUUzoL/T+Rcgn+uqmsEN
 cn4C9FqQjI0IRcXJNP4q8/QLnwXg+7CyhVoDqG1SoF5VBaE6trgwnw0Tk/CBUt6kgBRG
 zbIw==
X-Gm-Message-State: AOAM533ScHA5NAxygEYv3anN+U/tyLcXkmk0EelsFioTw6gTvcsRzYXn
 tA6ElGBo8Yc9e3mUQ8c4pz0O7LsQEg9LNA==
X-Google-Smtp-Source: ABdhPJxZ98d06VGcRNv+9MrcCeWhnObK55YbyRD8dC4SUmEljn8lkzUWkvzCCs+CuK80asQsqhVx5g==
X-Received: by 2002:a05:6000:15c5:b0:20c:565e:fd64 with SMTP id
 y5-20020a05600015c500b0020c565efd64mr18931533wry.499.1651741916715; 
 Thu, 05 May 2022 02:11:56 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfe50e000000b0020c6a524fd5sm841612wrm.99.2022.05.05.02.11.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 02:11:56 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/23] target/arm: Reorg ARMCPRegInfo type field bits
Date: Thu,  5 May 2022 10:11:30 +0100
Message-Id: <20220505091147.2657652-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505091147.2657652-1-peter.maydell@linaro.org>
References: <20220505091147.2657652-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Instead of defining ARM_CP_FLAG_MASK to remove flags,
define ARM_CP_SPECIAL_MASK to isolate special cases.
Sort the specials to the low bits. Use an enum.

Split the large comment block so as to document each
value separately.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220501055028.646596-6-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpregs.h        | 130 +++++++++++++++++++++++--------------
 target/arm/cpu.c           |   4 +-
 target/arm/helper.c        |   4 +-
 target/arm/translate-a64.c |   6 +-
 target/arm/translate.c     |   6 +-
 5 files changed, 92 insertions(+), 58 deletions(-)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index a5231504d58..ff3817decbd 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -22,57 +22,87 @@
 #define TARGET_ARM_CPREGS_H
 
 /*
- * ARMCPRegInfo type field bits. If the SPECIAL bit is set this is a
- * special-behaviour cp reg and bits [11..8] indicate what behaviour
- * it has. Otherwise it is a simple cp reg, where CONST indicates that
- * TCG can assume the value to be constant (ie load at translate time)
- * and 64BIT indicates a 64 bit wide coprocessor register. SUPPRESS_TB_END
- * indicates that the TB should not be ended after a write to this register
- * (the default is that the TB ends after cp writes). OVERRIDE permits
- * a register definition to override a previous definition for the
- * same (cp, is64, crn, crm, opc1, opc2) tuple: either the new or the
- * old must have the OVERRIDE bit set.
- * ALIAS indicates that this register is an alias view of some underlying
- * state which is also visible via another register, and that the other
- * register is handling migration and reset; registers marked ALIAS will not be
- * migrated but may have their state set by syncing of register state from KVM.
- * NO_RAW indicates that this register has no underlying state and does not
- * support raw access for state saving/loading; it will not be used for either
- * migration or KVM state synchronization. (Typically this is for "registers"
- * which are actually used as instructions for cache maintenance and so on.)
- * IO indicates that this register does I/O and therefore its accesses
- * need to be marked with gen_io_start() and also end the TB. In particular,
- * registers which implement clocks or timers require this.
- * RAISES_EXC is for when the read or write hook might raise an exception;
- * the generated code will synchronize the CPU state before calling the hook
- * so that it is safe for the hook to call raise_exception().
- * NEWEL is for writes to registers that might change the exception
- * level - typically on older ARM chips. For those cases we need to
- * re-read the new el when recomputing the translation flags.
+ * ARMCPRegInfo type field bits:
  */
-#define ARM_CP_SPECIAL           0x0001
-#define ARM_CP_CONST             0x0002
-#define ARM_CP_64BIT             0x0004
-#define ARM_CP_SUPPRESS_TB_END   0x0008
-#define ARM_CP_OVERRIDE          0x0010
-#define ARM_CP_ALIAS             0x0020
-#define ARM_CP_IO                0x0040
-#define ARM_CP_NO_RAW            0x0080
-#define ARM_CP_NOP               (ARM_CP_SPECIAL | 0x0100)
-#define ARM_CP_WFI               (ARM_CP_SPECIAL | 0x0200)
-#define ARM_CP_NZCV              (ARM_CP_SPECIAL | 0x0300)
-#define ARM_CP_CURRENTEL         (ARM_CP_SPECIAL | 0x0400)
-#define ARM_CP_DC_ZVA            (ARM_CP_SPECIAL | 0x0500)
-#define ARM_CP_DC_GVA            (ARM_CP_SPECIAL | 0x0600)
-#define ARM_CP_DC_GZVA           (ARM_CP_SPECIAL | 0x0700)
-#define ARM_LAST_SPECIAL         ARM_CP_DC_GZVA
-#define ARM_CP_FPU               0x1000
-#define ARM_CP_SVE               0x2000
-#define ARM_CP_NO_GDB            0x4000
-#define ARM_CP_RAISES_EXC        0x8000
-#define ARM_CP_NEWEL             0x10000
-/* Mask of only the flag bits in a type field */
-#define ARM_CP_FLAG_MASK         0x1f0ff
+enum {
+    /*
+     * Register must be handled specially during translation.
+     * The method is one of the values below:
+     */
+    ARM_CP_SPECIAL_MASK          = 0x000f,
+    /* Special: no change to PE state: writes ignored, reads ignored. */
+    ARM_CP_NOP                   = 0x0001,
+    /* Special: sysreg is WFI, for v5 and v6. */
+    ARM_CP_WFI                   = 0x0002,
+    /* Special: sysreg is NZCV. */
+    ARM_CP_NZCV                  = 0x0003,
+    /* Special: sysreg is CURRENTEL. */
+    ARM_CP_CURRENTEL             = 0x0004,
+    /* Special: sysreg is DC ZVA or similar. */
+    ARM_CP_DC_ZVA                = 0x0005,
+    ARM_CP_DC_GVA                = 0x0006,
+    ARM_CP_DC_GZVA               = 0x0007,
+
+    /* Flag: reads produce resetvalue; writes ignored. */
+    ARM_CP_CONST                 = 1 << 4,
+    /* Flag: For ARM_CP_STATE_AA32, sysreg is 64-bit. */
+    ARM_CP_64BIT                 = 1 << 5,
+    /*
+     * Flag: TB should not be ended after a write to this register
+     * (the default is that the TB ends after cp writes).
+     */
+    ARM_CP_SUPPRESS_TB_END       = 1 << 6,
+    /*
+     * Flag: Permit a register definition to override a previous definition
+     * for the same (cp, is64, crn, crm, opc1, opc2) tuple: either the new
+     * or the old must have the ARM_CP_OVERRIDE bit set.
+     */
+    ARM_CP_OVERRIDE              = 1 << 7,
+    /*
+     * Flag: Register is an alias view of some underlying state which is also
+     * visible via another register, and that the other register is handling
+     * migration and reset; registers marked ARM_CP_ALIAS will not be migrated
+     * but may have their state set by syncing of register state from KVM.
+     */
+    ARM_CP_ALIAS                 = 1 << 8,
+    /*
+     * Flag: Register does I/O and therefore its accesses need to be marked
+     * with gen_io_start() and also end the TB. In particular, registers which
+     * implement clocks or timers require this.
+     */
+    ARM_CP_IO                    = 1 << 9,
+    /*
+     * Flag: Register has no underlying state and does not support raw access
+     * for state saving/loading; it will not be used for either migration or
+     * KVM state synchronization. Typically this is for "registers" which are
+     * actually used as instructions for cache maintenance and so on.
+     */
+    ARM_CP_NO_RAW                = 1 << 10,
+    /*
+     * Flag: The read or write hook might raise an exception; the generated
+     * code will synchronize the CPU state before calling the hook so that it
+     * is safe for the hook to call raise_exception().
+     */
+    ARM_CP_RAISES_EXC            = 1 << 11,
+    /*
+     * Flag: Writes to the sysreg might change the exception level - typically
+     * on older ARM chips. For those cases we need to re-read the new el when
+     * recomputing the translation flags.
+     */
+    ARM_CP_NEWEL                 = 1 << 12,
+    /*
+     * Flag: Access check for this sysreg is identical to accessing FPU state
+     * from an instruction: use translation fp_access_check().
+     */
+    ARM_CP_FPU                   = 1 << 13,
+    /*
+     * Flag: Access check for this sysreg is identical to accessing SVE state
+     * from an instruction: use translation sve_access_check().
+     */
+    ARM_CP_SVE                   = 1 << 14,
+    /* Flag: Do not expose in gdb sysreg xml. */
+    ARM_CP_NO_GDB                = 1 << 15,
+};
 
 /*
  * Valid values for ARMCPRegInfo state field, indicating which of
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 18212eb6eef..a7cd692010c 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -117,7 +117,7 @@ static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
     ARMCPRegInfo *ri = value;
     ARMCPU *cpu = opaque;
 
-    if (ri->type & (ARM_CP_SPECIAL | ARM_CP_ALIAS)) {
+    if (ri->type & (ARM_CP_SPECIAL_MASK | ARM_CP_ALIAS)) {
         return;
     }
 
@@ -153,7 +153,7 @@ static void cp_reg_check_reset(gpointer key, gpointer value,  gpointer opaque)
     ARMCPU *cpu = opaque;
     uint64_t oldvalue, newvalue;
 
-    if (ri->type & (ARM_CP_SPECIAL | ARM_CP_ALIAS | ARM_CP_NO_RAW)) {
+    if (ri->type & (ARM_CP_SPECIAL_MASK | ARM_CP_ALIAS | ARM_CP_NO_RAW)) {
         return;
     }
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ca6ba9bd820..f84377babe1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8600,7 +8600,7 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
      * multiple times. Special registers (ie NOP/WFI) are
      * never migratable and not even raw-accessible.
      */
-    if ((r->type & ARM_CP_SPECIAL)) {
+    if (r->type & ARM_CP_SPECIAL_MASK) {
         r2->type |= ARM_CP_NO_RAW;
     }
     if (((r->crm == CP_ANY) && crm != 0) ||
@@ -8750,7 +8750,7 @@ void define_one_arm_cp_reg_with_opaque(ARMCPU *cpu,
     /* Check that the register definition has enough info to handle
      * reads and writes if they are permitted.
      */
-    if (!(r->type & (ARM_CP_SPECIAL|ARM_CP_CONST))) {
+    if (!(r->type & (ARM_CP_SPECIAL_MASK | ARM_CP_CONST))) {
         if (r->access & PL3_R) {
             assert((r->fieldoffset ||
                    (r->bank_fieldoffsets[0] && r->bank_fieldoffsets[1])) ||
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 348a638c5cb..a82f5d5984b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1833,7 +1833,9 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
     }
 
     /* Handle special cases first */
-    switch (ri->type & ~(ARM_CP_FLAG_MASK & ~ARM_CP_SPECIAL)) {
+    switch (ri->type & ARM_CP_SPECIAL_MASK) {
+    case 0:
+        break;
     case ARM_CP_NOP:
         return;
     case ARM_CP_NZCV:
@@ -1908,7 +1910,7 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
         }
         return;
     default:
-        break;
+        g_assert_not_reached();
     }
     if ((ri->type & ARM_CP_FPU) && !fp_access_check(s)) {
         return;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index fc7917cdf44..050c237b076 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4744,7 +4744,9 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         }
 
         /* Handle special cases first */
-        switch (ri->type & ~(ARM_CP_FLAG_MASK & ~ARM_CP_SPECIAL)) {
+        switch (ri->type & ARM_CP_SPECIAL_MASK) {
+        case 0:
+            break;
         case ARM_CP_NOP:
             return;
         case ARM_CP_WFI:
@@ -4756,7 +4758,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             s->base.is_jmp = DISAS_WFI;
             return;
         default:
-            break;
+            g_assert_not_reached();
         }
 
         if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
-- 
2.25.1


