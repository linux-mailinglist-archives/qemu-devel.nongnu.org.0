Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9F65FA00
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 04:15:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDdBe-0001BN-Od; Thu, 05 Jan 2023 22:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBb-0001Au-ED
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:27 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=363443eaf=alistair.francis@opensource.wdc.com>)
 id 1pDdBZ-00088g-45
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 22:14:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1672974864; x=1704510864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uGCHLtGYFCETZ+2VwrOizYoxAakNogwwKewGwQ+ksAI=;
 b=JQVHHzuxLLqA9OT/1AW7qzdyUw7u24SHjdXuemw1WA1mvKdCGkNW7Fx+
 iqAbsbqaeI62ANCl9iQezvoW6T6eh080n+obEMrfzBwnhnQOtGwGCQsgT
 g7rIOfPamZmgWpJ3fnU9orANiPQzBamN2avzMAABSQIZbvahcM+iagYif
 yoeKhBTdL/b/3fsXSAD0aBQouZcaBnnp0z4jAAAmFev4kIpHQKJIaHtku
 gRTDeAl6kFIYxKJhl5MNiks/MdKmIiqwe6w+Wt0mhdCkTsX7J13RlPMBU
 yk9IfFjKGaTf+38ukgP7DjBR/nmDJfqJ7xPihLxKvm4bchEfS2CHKwlZh A==;
X-IronPort-AV: E=Sophos;i="5.96,304,1665417600"; d="scan'208";a="220254761"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 Jan 2023 11:14:23 +0800
IronPort-SDR: bGJOfs3/a62kgDePKpZYZON5P5kMyrSqnNxlcKmWXl74+0tCcEzMpOjTGujNSKGoxMfdiz37PS
 ktEnarFkSki1HuiYEccYRowjtIEbu6fINEdq5simJXXIfQqYvqPWs9Vy0+XprcHO+sJ7ugrIwy
 WLHJQJ907JV/8tvuIA1pOVzykTmEjyVp5QAie2jsexsTiGqq4oKQO9iMLKNFYQKj2j0ngKr6KQ
 SacOt8XnwK6KF1IBoaRxbqqLydA+wq50jtSbTF+xUPd/V/jWfvePsdo++L7sH7kquGg0OlvQiv
 /KU=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 18:26:34 -0800
IronPort-SDR: iD8z2aQQj4/w82aUZRCStIFRRGRJlCZ1ci+dCc+aW8moag3I4ReJQ4yg9FeOd8+aMdhL5td66b
 W3p7kkB+E/EnZfPwTU54+DgYOxwfASsqjcI3KZ/j622F2vPCrOwwCaeuiNjW8V6HCthMSFPVxs
 6LeXyhBdm3T8uousNOARbevQRH5pRC6VQfIKzGZ9jSMAvINgaksuQTXclH0u+xzACwo/DsDn3E
 9YmzG1AyvAih/q1mXIJB2Ij3mMebZo3btdvmJg9N6OBVprW48NmzIAnFfxusYO9rkFMMiY7/aJ
 CXs=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 19:14:25 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Np7jW2fpjz1RwqL
 for <qemu-devel@nongnu.org>; Thu,  5 Jan 2023 19:14:23 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1672974862; x=1675566863; bh=uGCHLtGYFCETZ+2Vwr
 OizYoxAakNogwwKewGwQ+ksAI=; b=gfIK+TNQQ90ryNhcMvifUDwmCEOkaNFami
 TBO+WoU7FbKUV+sViQwAZG2BrqlUFMaX3+t05cwF6piqbLZnuhlHua/S81rauAjH
 jwVA/d1cxXzoJO/jq9sfJ8+DTII8zrssfCEgYG9dq/T3lLRCYCsECCW0Tv6KoAeA
 rwd3259UdC+r48UOIMPB0pOryqSK3DKmleEYjERn+ihAH79ayXXpU4JNDTm2fSUO
 Od8WT1GBsBcDTC/+LH+nCymJEFg8q9zTNCGD8zkxaQcJTtm2E7YG7b4+uLG+Jweg
 AHw4Eh59KRrLnkITnwXk+ygMxe7eX3jPJAjBldGWll7z2tU/RnZw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 0kYayyN9i-z9 for <qemu-devel@nongnu.org>;
 Thu,  5 Jan 2023 19:14:22 -0800 (PST)
Received: from toolbox.wdc.com (unknown [10.225.167.28])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Np7jT1RtNz1RvLy;
 Thu,  5 Jan 2023 19:14:21 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL v3 10/43] target/riscv: Add itrigger support when icount is not
 enabled
Date: Fri,  6 Jan 2023 13:13:24 +1000
Message-Id: <20230106031357.777790-11-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
References: <20230106031357.777790-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=363443eaf=alistair.francis@opensource.wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>

When icount is not enabled, there is no API in QEMU that can get the
guest instruction number.

Translate the guest code in a way that each TB only has one instruction.
After executing the instruction, decrease the count by 1 until it reaches=
 0
where the itrigger fires.

Note that only when priviledge matches the itrigger configuration,
the count will decrease.

Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20221013062946.7530-2-zhiwei_liu@linux.alibaba.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                            |  2 +
 target/riscv/debug.h                          | 12 ++++
 target/riscv/helper.h                         |  2 +
 target/riscv/cpu_helper.c                     |  6 ++
 target/riscv/debug.c                          | 71 +++++++++++++++++++
 target/riscv/translate.c                      | 33 ++++++++-
 .../riscv/insn_trans/trans_privileged.c.inc   |  4 +-
 target/riscv/insn_trans/trans_rvi.c.inc       |  8 +--
 target/riscv/insn_trans/trans_rvv.c.inc       |  4 +-
 9 files changed, 131 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 5cac0c5eec..c32e484c0b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -625,6 +625,8 @@ FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VTA, 24, 1)
 FIELD(TB_FLAGS, VMA, 25, 1)
+/* Native debug itrigger */
+FIELD(TB_FLAGS, ITRIGGER, 26, 1)
=20
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index a1226b4d29..cc3358e69b 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -118,6 +118,17 @@ enum {
     SIZE_NUM =3D 16
 };
=20
+/* itrigger filed masks */
+#define ITRIGGER_ACTION       0x3f
+#define ITRIGGER_U            BIT(6)
+#define ITRIGGER_S            BIT(7)
+#define ITRIGGER_PENDING      BIT(8)
+#define ITRIGGER_M            BIT(9)
+#define ITRIGGER_COUNT        (0x3fff << 10)
+#define ITRIGGER_HIT          BIT(24)
+#define ITRIGGER_VU           BIT(25)
+#define ITRIGGER_VS           BIT(26)
+
 bool tdata_available(CPURISCVState *env, int tdata_index);
=20
 target_ulong tselect_csr_read(CPURISCVState *env);
@@ -134,4 +145,5 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, C=
PUWatchpoint *wp);
=20
 void riscv_trigger_init(CPURISCVState *env);
=20
+bool riscv_itrigger_enabled(CPURISCVState *env);
 #endif /* RISCV_DEBUG_H */
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a03014fe67..227c7122ef 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -109,6 +109,8 @@ DEF_HELPER_1(sret, tl, env)
 DEF_HELPER_1(mret, tl, env)
 DEF_HELPER_1(wfi, void, env)
 DEF_HELPER_1(tlb_flush, void, env)
+/* Native Debug */
+DEF_HELPER_1(itrigger_match, void, env)
 #endif
=20
 /* Hypervisor functions */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 5d66246c2c..9d1d1bf9f1 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -27,7 +27,9 @@
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "sysemu/cpu-timers.h"
 #include "cpu_bits.h"
+#include "debug.h"
=20
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -103,6 +105,10 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target=
_ulong *pc,
         flags =3D FIELD_DP32(flags, TB_FLAGS, MSTATUS_HS_VS,
                            get_field(env->mstatus_hs, MSTATUS_VS));
     }
+    if (riscv_feature(env, RISCV_FEATURE_DEBUG) && !icount_enabled()) {
+        flags =3D FIELD_DP32(flags, TB_FLAGS, ITRIGGER,
+                           riscv_itrigger_enabled(env));
+    }
 #endif
=20
     flags =3D FIELD_DP32(flags, TB_FLAGS, XL, env->xl);
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index e44848d0d7..036161649f 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -29,6 +29,7 @@
 #include "cpu.h"
 #include "trace.h"
 #include "exec/exec-all.h"
+#include "exec/helper-proto.h"
=20
 /*
  * The following M-mode trigger CSRs are implemented:
@@ -496,6 +497,76 @@ static void type6_reg_write(CPURISCVState *env, targ=
et_ulong index,
     return;
 }
=20
+/* icount trigger type */
+static inline int
+itrigger_get_count(CPURISCVState *env, int index)
+{
+    return get_field(env->tdata1[index], ITRIGGER_COUNT);
+}
+
+static inline void
+itrigger_set_count(CPURISCVState *env, int index, int value)
+{
+    env->tdata1[index] =3D set_field(env->tdata1[index],
+                                   ITRIGGER_COUNT, value);
+}
+
+static bool check_itrigger_priv(CPURISCVState *env, int index)
+{
+    target_ulong tdata1 =3D env->tdata1[index];
+    if (riscv_cpu_virt_enabled(env)) {
+        /* check VU/VS bit against current privilege level */
+        return (get_field(tdata1, ITRIGGER_VS) =3D=3D env->priv) ||
+               (get_field(tdata1, ITRIGGER_VU) =3D=3D env->priv);
+    } else {
+        /* check U/S/M bit against current privilege level */
+        return (get_field(tdata1, ITRIGGER_M) =3D=3D env->priv) ||
+               (get_field(tdata1, ITRIGGER_S) =3D=3D env->priv) ||
+               (get_field(tdata1, ITRIGGER_U) =3D=3D env->priv);
+    }
+}
+
+bool riscv_itrigger_enabled(CPURISCVState *env)
+{
+    int count;
+    for (int i =3D 0; i < RV_MAX_TRIGGERS; i++) {
+        if (get_trigger_type(env, i) !=3D TRIGGER_TYPE_INST_CNT) {
+            continue;
+        }
+        if (check_itrigger_priv(env, i)) {
+            continue;
+        }
+        count =3D itrigger_get_count(env, i);
+        if (!count) {
+            continue;
+        }
+        return true;
+    }
+
+    return false;
+}
+
+void helper_itrigger_match(CPURISCVState *env)
+{
+    int count;
+    for (int i =3D 0; i < RV_MAX_TRIGGERS; i++) {
+        if (get_trigger_type(env, i) !=3D TRIGGER_TYPE_INST_CNT) {
+            continue;
+        }
+        if (check_itrigger_priv(env, i)) {
+            continue;
+        }
+        count =3D itrigger_get_count(env, i);
+        if (!count) {
+            continue;
+        }
+        itrigger_set_count(env, i, count--);
+        if (!count) {
+            do_trigger_action(env, i);
+        }
+    }
+}
+
 target_ulong tdata_csr_read(CPURISCVState *env, int tdata_index)
 {
     switch (tdata_index) {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 8b0bd38bb2..cd5eb25ee8 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -112,6 +112,8 @@ typedef struct DisasContext {
     /* PointerMasking extension */
     bool pm_mask_enabled;
     bool pm_base_enabled;
+    /* Use icount trigger for native debug */
+    bool itrigger;
     /* TCG of the current insn_start */
     TCGOp *insn_start;
 } DisasContext;
@@ -257,15 +259,39 @@ static void gen_exception_inst_addr_mis(DisasContex=
t *ctx)
     generate_exception(ctx, RISCV_EXCP_INST_ADDR_MIS);
 }
=20
+static void lookup_and_goto_ptr(DisasContext *ctx)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->itrigger) {
+        gen_helper_itrigger_match(cpu_env);
+    }
+#endif
+    tcg_gen_lookup_and_goto_ptr();
+}
+
+static void exit_tb(DisasContext *ctx)
+{
+#ifndef CONFIG_USER_ONLY
+    if (ctx->itrigger) {
+        gen_helper_itrigger_match(cpu_env);
+    }
+#endif
+    tcg_gen_exit_tb(NULL, 0);
+}
+
 static void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
 {
-    if (translator_use_goto_tb(&ctx->base, dest)) {
+     /*
+      * Under itrigger, instruction executes one by one like singlestep,
+      * direct block chain benefits will be small.
+      */
+    if (translator_use_goto_tb(&ctx->base, dest) && !ctx->itrigger) {
         tcg_gen_goto_tb(n);
         gen_set_pc_imm(ctx, dest);
         tcg_gen_exit_tb(ctx->base.tb, n);
     } else {
         gen_set_pc_imm(ctx, dest);
-        tcg_gen_lookup_and_goto_ptr();
+        lookup_and_goto_ptr(ctx);
     }
 }
=20
@@ -1142,6 +1168,7 @@ static void riscv_tr_init_disas_context(DisasContex=
tBase *dcbase, CPUState *cs)
     memset(ctx->ftemp, 0, sizeof(ctx->ftemp));
     ctx->pm_mask_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_MASK_ENAB=
LED);
     ctx->pm_base_enabled =3D FIELD_EX32(tb_flags, TB_FLAGS, PM_BASE_ENAB=
LED);
+    ctx->itrigger =3D FIELD_EX32(tb_flags, TB_FLAGS, ITRIGGER);
     ctx->zero =3D tcg_constant_tl(0);
 }
=20
@@ -1181,7 +1208,7 @@ static void riscv_tr_translate_insn(DisasContextBas=
e *dcbase, CPUState *cpu)
=20
     /* Only the first insn within a TB is allowed to cross a page bounda=
ry. */
     if (ctx->base.is_jmp =3D=3D DISAS_NEXT) {
-        if (!is_same_page(&ctx->base, ctx->base.pc_next)) {
+        if (ctx->itrigger || !is_same_page(&ctx->base, ctx->base.pc_next=
)) {
             ctx->base.is_jmp =3D DISAS_TOO_MANY;
         } else {
             unsigned page_ofs =3D ctx->base.pc_next & ~TARGET_PAGE_MASK;
diff --git a/target/riscv/insn_trans/trans_privileged.c.inc b/target/risc=
v/insn_trans/trans_privileged.c.inc
index 3281408a87..59501b2780 100644
--- a/target/riscv/insn_trans/trans_privileged.c.inc
+++ b/target/riscv/insn_trans/trans_privileged.c.inc
@@ -78,7 +78,7 @@ static bool trans_sret(DisasContext *ctx, arg_sret *a)
     if (has_ext(ctx, RVS)) {
         decode_save_opc(ctx);
         gen_helper_sret(cpu_pc, cpu_env);
-        tcg_gen_exit_tb(NULL, 0); /* no chaining */
+        exit_tb(ctx); /* no chaining */
         ctx->base.is_jmp =3D DISAS_NORETURN;
     } else {
         return false;
@@ -94,7 +94,7 @@ static bool trans_mret(DisasContext *ctx, arg_mret *a)
 #ifndef CONFIG_USER_ONLY
     decode_save_opc(ctx);
     gen_helper_mret(cpu_pc, cpu_env);
-    tcg_gen_exit_tb(NULL, 0); /* no chaining */
+    exit_tb(ctx); /* no chaining */
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
 #else
diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_=
trans/trans_rvi.c.inc
index c49dbec0eb..5c69b88d1e 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -66,7 +66,7 @@ static bool trans_jalr(DisasContext *ctx, arg_jalr *a)
     }
=20
     gen_set_gpri(ctx, a->rd, ctx->pc_succ_insn);
-    tcg_gen_lookup_and_goto_ptr();
+    lookup_and_goto_ptr(ctx);
=20
     if (misaligned) {
         gen_set_label(misaligned);
@@ -803,7 +803,7 @@ static bool trans_pause(DisasContext *ctx, arg_pause =
*a)
      * end the TB and return to main loop
      */
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
-    tcg_gen_exit_tb(NULL, 0);
+    exit_tb(ctx);
     ctx->base.is_jmp =3D DISAS_NORETURN;
=20
     return true;
@@ -827,7 +827,7 @@ static bool trans_fence_i(DisasContext *ctx, arg_fenc=
e_i *a)
      * however we need to end the translation block
      */
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
-    tcg_gen_exit_tb(NULL, 0);
+    exit_tb(ctx);
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
 }
@@ -838,7 +838,7 @@ static bool do_csr_post(DisasContext *ctx)
     decode_save_opc(ctx);
     /* We may have changed important cpu state -- exit to main loop. */
     gen_set_pc_imm(ctx, ctx->pc_succ_insn);
-    tcg_gen_exit_tb(NULL, 0);
+    exit_tb(ctx);
     ctx->base.is_jmp =3D DISAS_NORETURN;
     return true;
 }
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_=
trans/trans_rvv.c.inc
index 4dea4413ae..d455acedbf 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -196,7 +196,7 @@ static bool do_vsetvl(DisasContext *s, int rd, int rs=
1, TCGv s2)
     mark_vs_dirty(s);
=20
     gen_set_pc_imm(s, s->pc_succ_insn);
-    tcg_gen_lookup_and_goto_ptr();
+    lookup_and_goto_ptr(s);
     s->base.is_jmp =3D DISAS_NORETURN;
=20
     if (rd =3D=3D 0 && rs1 =3D=3D 0) {
@@ -222,7 +222,7 @@ static bool do_vsetivli(DisasContext *s, int rd, TCGv=
 s1, TCGv s2)
     gen_set_gpr(s, rd, dst);
     mark_vs_dirty(s);
     gen_set_pc_imm(s, s->pc_succ_insn);
-    tcg_gen_lookup_and_goto_ptr();
+    lookup_and_goto_ptr(s);
     s->base.is_jmp =3D DISAS_NORETURN;
=20
     return true;
--=20
2.39.0


