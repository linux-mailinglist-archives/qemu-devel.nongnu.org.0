Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C635193
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 23:03:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYGaR-0008K3-MP
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 17:03:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYG8q-0001W6-9G
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:34:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hYG8o-0004hB-23
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:34:43 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35317)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hYG8n-0004fl-SO
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 16:34:42 -0400
Received: by mail-ot1-x342.google.com with SMTP id n14so20873989otk.2
	for <qemu-devel@nongnu.org>; Tue, 04 Jun 2019 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8TtqTmBnQgsNdelS4/2zOiTH2Ne6fCH7LBgKkWFYMCA=;
	b=q1zjSdonzryn6WEg7j5mevPE6PHAIHR44lKoyJ+Oh4VTMhHtomHR6VGVP0JsLM2pCu
	wM0k8DZmqHRT+XsFQr143sV1Yjtj8REYkKPQtOBZSehDXhPVo6om/Wz4Q0n7kV/gPit+
	/nWDsoerQ2iAzpC2zIMSB1t85prmWnOLxi90BuP2521nAV3GzhbIGA/ze+mAq3qLoFRp
	8Q5AhNQDAr1Ml7Igz7amLMpqb9WwdXyNRXyr9rMccgh3rNYgN/TURJVHzy8sh9HxZ6JE
	r6u4EWEQodnwEEpcbzNsG7EM9AZj2KKf4fr2xwksVZ1bKN4r4EG00RpnvifmtOTL+9Zh
	PGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8TtqTmBnQgsNdelS4/2zOiTH2Ne6fCH7LBgKkWFYMCA=;
	b=osfcGsFXGE/GvuFJ7+MZnylh4dxxsDMfyzhFz51KaUx0CuS6uFDKACW2hbJkHvT20A
	qY2MNecOgn80vqx8AIBdLPifvCleYrrqKYmr2QNjqzvK2ooju93rzxqtphcEw2b+m5DA
	pU9vSddg3WPBBRq3SJ7skQxUk2+OkqW+SAto1yXjCPyxdZfxWhMoYdlLJ1pGU0zTBY+C
	YTBCCpNSNQjKYXomdyI0qUSIOqqO0cbHNfmF4nlZK/RIyf4SALHLBVJcD20p9xvBAKgi
	SsY2GTyNx8pKFNU3gClyLiZ4Az3s6XlMy66IHoL9MtxBUDmGKRpewDQLa/ULjcVVCihI
	cB0Q==
X-Gm-Message-State: APjAAAVTD6aPLuyEFo5mZ1jyZKf1nTFexAmfuuQq+u/jI9mMogJia/XT
	WjSD9ME7/J1iu+WVa3GBKvkAc6y2B1Qh9A==
X-Google-Smtp-Source: APXvYqyFf6QYeUPzI4AFwkTcjeRgYUZHiaVtJL6fjO+srT0FWbXxSLRsEdcn/JUKT1Y9UPXD2ieXBA==
X-Received: by 2002:a9d:72da:: with SMTP id d26mr7104441otk.327.1559680480806; 
	Tue, 04 Jun 2019 13:34:40 -0700 (PDT)
Received: from localhost.localdomain (200-56-192-86-cable.cybercable.net.mx.
	[200.56.192.86])
	by smtp.gmail.com with ESMTPSA id h1sm5979901otj.78.2019.06.04.13.34.39
	for <qemu-devel@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 13:34:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 15:33:41 -0500
Message-Id: <20190604203351.27778-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604203351.27778-1-richard.henderson@linaro.org>
References: <20190604203351.27778-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: [Qemu-devel] [PATCH v4 29/39] target/unicore32: Use env_cpu,
 env_archcpu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cleanup in the boilerplate that each target must define.
Replace uc32_env_get_cpu with env_archcpu.  The combination
CPU(uc32_env_get_cpu) should have used ENV_GET_CPU to begin;
use env_cpu now.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/unicore32/cpu.h          |  5 -----
 hw/unicore32/puv3.c             |  2 +-
 target/unicore32/helper.c       |  4 +---
 target/unicore32/op_helper.c    |  2 +-
 target/unicore32/softmmu.c      | 11 ++++-------
 target/unicore32/translate.c    | 26 ++------------------------
 target/unicore32/ucf64_helper.c |  2 +-
 7 files changed, 10 insertions(+), 42 deletions(-)

diff --git a/target/unicore32/cpu.h b/target/unicore32/cpu.h
index e91cec4d2e..595dc43c99 100644
--- a/target/unicore32/cpu.h
+++ b/target/unicore32/cpu.h
@@ -76,11 +76,6 @@ struct UniCore32CPU {
     CPUUniCore32State env;
 };
 
-static inline UniCore32CPU *uc32_env_get_cpu(CPUUniCore32State *env)
-{
-    return container_of(env, UniCore32CPU, env);
-}
-
 #define ENV_OFFSET offsetof(UniCore32CPU, env)
 
 void uc32_cpu_do_interrupt(CPUState *cpu);
diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index b42e600f74..132e6086ee 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -56,7 +56,7 @@ static void puv3_soc_init(CPUUniCore32State *env)
 
     /* Initialize interrupt controller */
     cpu_intc = qemu_allocate_irq(puv3_intc_cpu_handler,
-                                 uc32_env_get_cpu(env), 0);
+                                 env_archcpu(env), 0);
     dev = sysbus_create_simple("puv3_intc", PUV3_INTC_BASE, cpu_intc);
     for (i = 0; i < PUV3_IRQS_NR; i++) {
         irqs[i] = qdev_get_gpio_in(dev, i);
diff --git a/target/unicore32/helper.c b/target/unicore32/helper.c
index 0d4914b48d..7d538e2144 100644
--- a/target/unicore32/helper.c
+++ b/target/unicore32/helper.c
@@ -31,8 +31,6 @@
 void helper_cp0_set(CPUUniCore32State *env, uint32_t val, uint32_t creg,
         uint32_t cop)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-
     /*
      * movc pp.nn, rn, #imm9
      *      rn: UCOP_REG_D
@@ -101,7 +99,7 @@ void helper_cp0_set(CPUUniCore32State *env, uint32_t val, uint32_t creg,
     case 6:
         if ((cop <= 6) && (cop >= 2)) {
             /* invalid all tlb */
-            tlb_flush(CPU(cpu));
+            tlb_flush(env_cpu(env));
             return;
         }
         break;
diff --git a/target/unicore32/op_helper.c b/target/unicore32/op_helper.c
index 797ba60dc9..eeaa78601a 100644
--- a/target/unicore32/op_helper.c
+++ b/target/unicore32/op_helper.c
@@ -19,7 +19,7 @@
 
 void HELPER(exception)(CPUUniCore32State *env, uint32_t excp)
 {
-    CPUState *cs = CPU(uc32_env_get_cpu(env));
+    CPUState *cs = env_cpu(env);
 
     cs->exception_index = excp;
     cpu_loop_exit(cs);
diff --git a/target/unicore32/softmmu.c b/target/unicore32/softmmu.c
index 27f218abf0..cbdaa500b7 100644
--- a/target/unicore32/softmmu.c
+++ b/target/unicore32/softmmu.c
@@ -36,8 +36,6 @@
 /* Map CPU modes onto saved register banks.  */
 static inline int bank_number(CPUUniCore32State *env, int mode)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-
     switch (mode) {
     case ASR_MODE_USER:
     case ASR_MODE_SUSR:
@@ -51,7 +49,7 @@ static inline int bank_number(CPUUniCore32State *env, int mode)
     case ASR_MODE_INTR:
         return 4;
     }
-    cpu_abort(CPU(cpu), "Bad mode %x\n", mode);
+    cpu_abort(env_cpu(env), "Bad mode %x\n", mode);
     return -1;
 }
 
@@ -126,8 +124,7 @@ static int get_phys_addr_ucv2(CPUUniCore32State *env, uint32_t address,
         int access_type, int is_user, uint32_t *phys_ptr, int *prot,
         target_ulong *page_size)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-    CPUState *cs = CPU(cpu);
+    CPUState *cs = env_cpu(env);
     int code;
     uint32_t table;
     uint32_t desc;
@@ -174,11 +171,11 @@ static int get_phys_addr_ucv2(CPUUniCore32State *env, uint32_t address,
             *page_size = TARGET_PAGE_SIZE;
             break;
         default:
-            cpu_abort(CPU(cpu), "wrong page type!");
+            cpu_abort(cs, "wrong page type!");
         }
         break;
     default:
-        cpu_abort(CPU(cpu), "wrong page type!");
+        cpu_abort(cs, "wrong page type!");
     }
 
     *phys_ptr = phys_addr;
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 89b02d1c3c..d27451eed3 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -180,7 +180,7 @@ static void store_reg(DisasContext *s, int reg, TCGv var)
 #define UCOP_SET_L              UCOP_SET(24)
 #define UCOP_SET_S              UCOP_SET(24)
 
-#define ILLEGAL         cpu_abort(CPU(cpu),                             \
+#define ILLEGAL         cpu_abort(env_cpu(env),                         \
                         "Illegal UniCore32 instruction %x at line %d!", \
                         insn, __LINE__)
 
@@ -188,7 +188,6 @@ static void store_reg(DisasContext *s, int reg, TCGv var)
 static void disas_cp0_insn(CPUUniCore32State *env, DisasContext *s,
         uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     TCGv tmp, tmp2, tmp3;
     if ((insn & 0xfe000000) == 0xe0000000) {
         tmp2 = new_tmp();
@@ -214,7 +213,6 @@ static void disas_cp0_insn(CPUUniCore32State *env, DisasContext *s,
 static void disas_ocd_insn(CPUUniCore32State *env, DisasContext *s,
         uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     TCGv tmp;
 
     if ((insn & 0xff003fff) == 0xe1000400) {
@@ -682,7 +680,6 @@ static inline long ucf64_reg_offset(int reg)
 /* UniCore-F64 single load/store I_offset */
 static void do_ucf64_ldst_i(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     int offset;
     TCGv tmp;
     TCGv addr;
@@ -729,7 +726,6 @@ static void do_ucf64_ldst_i(CPUUniCore32State *env, DisasContext *s, uint32_t in
 /* UniCore-F64 load/store multiple words */
 static void do_ucf64_ldst_m(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     unsigned int i;
     int j, n, freg;
     TCGv tmp;
@@ -815,7 +811,6 @@ static void do_ucf64_ldst_m(CPUUniCore32State *env, DisasContext *s, uint32_t in
 /* UniCore-F64 mrc/mcr */
 static void do_ucf64_trans(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     TCGv tmp;
 
     if ((insn & 0xfe0003ff) == 0xe2000000) {
@@ -880,8 +875,6 @@ static void do_ucf64_trans(CPUUniCore32State *env, DisasContext *s, uint32_t ins
 /* UniCore-F64 convert instructions */
 static void do_ucf64_fcvt(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-
     if (UCOP_UCF64_FMT == 3) {
         ILLEGAL;
     }
@@ -948,8 +941,6 @@ static void do_ucf64_fcvt(CPUUniCore32State *env, DisasContext *s, uint32_t insn
 /* UniCore-F64 compare instructions */
 static void do_ucf64_fcmp(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-
     if (UCOP_SET(25)) {
         ILLEGAL;
     }
@@ -1028,8 +1019,6 @@ static void do_ucf64_fcmp(CPUUniCore32State *env, DisasContext *s, uint32_t insn
 /* UniCore-F64 data processing */
 static void do_ucf64_datap(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-
     if (UCOP_UCF64_FMT == 3) {
         ILLEGAL;
     }
@@ -1063,8 +1052,6 @@ static void do_ucf64_datap(CPUUniCore32State *env, DisasContext *s, uint32_t ins
 /* Disassemble an F64 instruction */
 static void disas_ucf64_insn(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-
     if (!UCOP_SET(29)) {
         if (UCOP_SET(26)) {
             do_ucf64_ldst_m(env, s, insn);
@@ -1162,8 +1149,6 @@ static void gen_exception_return(DisasContext *s, TCGv pc)
 static void disas_coproc_insn(CPUUniCore32State *env, DisasContext *s,
         uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
-
     switch (UCOP_CPNUM) {
 #ifndef CONFIG_USER_ONLY
     case 0:
@@ -1178,14 +1163,13 @@ static void disas_coproc_insn(CPUUniCore32State *env, DisasContext *s,
         break;
     default:
         /* Unknown coprocessor. */
-        cpu_abort(CPU(cpu), "Unknown coprocessor!");
+        cpu_abort(env_cpu(env), "Unknown coprocessor!");
     }
 }
 
 /* data processing instructions */
 static void do_datap(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     TCGv tmp;
     TCGv tmp2;
     int logic_cc;
@@ -1419,7 +1403,6 @@ static void do_mult(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 /* miscellaneous instructions */
 static void do_misc(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     unsigned int val;
     TCGv tmp;
 
@@ -1545,7 +1528,6 @@ static void do_ldst_ir(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 /* SWP instruction */
 static void do_swap(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     TCGv addr;
     TCGv tmp;
     TCGv tmp2;
@@ -1573,7 +1555,6 @@ static void do_swap(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 /* load/store hw/sb */
 static void do_ldst_hwsb(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     TCGv addr;
     TCGv tmp;
 
@@ -1626,7 +1607,6 @@ static void do_ldst_hwsb(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 /* load/store multiple words */
 static void do_ldst_m(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     unsigned int val, i, mmu_idx;
     int j, n, reg, user, loaded_base;
     TCGv tmp;
@@ -1768,7 +1748,6 @@ static void do_ldst_m(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 /* branch (and link) */
 static void do_branch(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     unsigned int val;
     int32_t offset;
     TCGv tmp;
@@ -1798,7 +1777,6 @@ static void do_branch(CPUUniCore32State *env, DisasContext *s, uint32_t insn)
 
 static void disas_uc32_insn(CPUUniCore32State *env, DisasContext *s)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
     unsigned int insn;
 
     insn = cpu_ldl_code(env, s->pc);
diff --git a/target/unicore32/ucf64_helper.c b/target/unicore32/ucf64_helper.c
index fad3fa6618..e078e84437 100644
--- a/target/unicore32/ucf64_helper.c
+++ b/target/unicore32/ucf64_helper.c
@@ -78,7 +78,7 @@ static inline int ucf64_exceptbits_to_host(int target_bits)
 
 void HELPER(ucf64_set_fpscr)(CPUUniCore32State *env, uint32_t val)
 {
-    UniCore32CPU *cpu = uc32_env_get_cpu(env);
+    UniCore32CPU *cpu = env_archcpu(env);
     int i;
     uint32_t changed;
 
-- 
2.17.1


