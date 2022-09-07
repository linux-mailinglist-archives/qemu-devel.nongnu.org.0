Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443B15AFFA1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:52:29 +0200 (CEST)
Received: from localhost ([::1]:34368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqnM-0006CJ-CN
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:52:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3V-000405-9V
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:05 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3R-0004Ol-GC
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537900; x=1694073900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=izZook+crDiRSjVPVQ/SAokZl55/i+V8ya4b0QbA5BA=;
 b=b5oVlUV7F102vnA0kDlukbEHQpPrcgaeIpeMKAR/BQpOrHPiS4c7+JgN
 guahv+QQhPDt3/BdNPhIOiSQv2COK/jDVbBgRgujP0c6j05M5ukqlnten
 OB0UCurl61lKAshemP3IgQC2aEJA69vSlEnRVkgZ/4QJ8v7S1g/pLgYGI
 e/RX09Hv+lNZOnqdOGlCriiRwfiU+sDfNp7S0yNUGnZfWg6/aBBRY9ytw
 vQ0rMjF2+wKdf3XfocOpDOl+pThhROX4CNz6vu1B1D0xrYNGghvPBxUUS
 /wBcJfa5j2GgFNcmajI4/K2Q3mmnpvN1oX+YbqmiVQqr1PiThtlw9A19G w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714995"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:40 +0800
IronPort-SDR: dNRSE9LA/qN9bUAKsmshJEPhxSjGI+rdqk1oQxm4xuN1S6HKWQkr5fTiDC6OTFKK4pyJbck7dE
 TYuMPUTU5atQASKCEUNhze2nTfUCcaKQssuBSlMAshH431UFZsSxBPKaUz5pY9uoPoUFZVpp6U
 XdFnph42mMH691PVFaWiL1Pac1b34hb50lY0aTmFlUYXEwU7qAIRC4v1BTQ1NzBpj0wAEfld/c
 Y/SueCdqf4GZGx8GlYGp/WdOvOGVA0R8mfKQUh7daRvYOIDdfgBCO7pIEGVmKPEYshI/GIKCRt
 cjTqBieeFHDOMEe1IwRRf6vX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:38 -0700
IronPort-SDR: D4TaZbHqCPxkv+ULLIRpa/1F7+WfCNl+j4TiP/Szzo3L2uaox2zHuP8Svb5V5G5UkFR14Gtpy2
 kYPKqxjlqfQJHTmg42e/7fFb0fTQq014yevrSFer7oyo8AATw7RU/vEXp/UmJNxEAXlLFQDAxv
 7viQ00/sPUc0af+FoNVLwYMbhdTZwpKyfwlceDT2n4fGV2eHE9X9nJUFDp6E5QNv0shzvvItXI
 8LsJABsdEPanMcJUvm1Ecg95WCfv6h+FN7lpEDFbhtFnyX1fHdYfSVVVbbCOx3KkyFSAKlwZOt
 9kI=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:39 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 15/44] target/riscv: rvv: Add mask agnostic for vv instructions
Date: Wed,  7 Sep 2022 10:03:24 +0200
Message-Id: <20220907080353.111926-16-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  Alistair Francis <alistair.francis@wdc.com>
From:  Alistair Francis via <qemu-devel@nongnu.org>

From: "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>

According to v-spec, mask agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of mask policies, QEMU should be able to simulate the mask
agnostic behavior as "set mask elements' bits to all 1s".

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between mask policies. Setting agnostic elements to
all 1s allows QEMU to express this.

This is the first commit regarding the optional mask agnostic
behavior. Follow-up commits will add this optional behavior
for all rvv instructions.

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165570784143.17634.35095816584573691-1@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h                      | 2 ++
 target/riscv/internals.h                | 5 +++--
 target/riscv/cpu_helper.c               | 2 ++
 target/riscv/translate.c                | 2 ++
 target/riscv/vector_helper.c            | 8 ++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 3 +++
 6 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ffb1a18873..561d7fa92c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -439,6 +439,7 @@ struct RISCVCPUConfig {
     bool ext_zve64f;
     bool ext_zmmul;
     bool rvv_ta_all_1s;
+    bool rvv_ma_all_1s;
 
     uint32_t mvendorid;
     uint64_t marchid;
@@ -596,6 +597,7 @@ FIELD(TB_FLAGS, XL, 20, 2)
 FIELD(TB_FLAGS, PM_MASK_ENABLED, 22, 1)
 FIELD(TB_FLAGS, PM_BASE_ENABLED, 23, 1)
 FIELD(TB_FLAGS, VTA, 24, 1)
+FIELD(TB_FLAGS, VMA, 25, 1)
 
 #ifdef TARGET_RISCV32
 #define riscv_cpu_mxl(env)  ((void)(env), MXL_RV32)
diff --git a/target/riscv/internals.h b/target/riscv/internals.h
index 193ce57a6d..5620fbffb6 100644
--- a/target/riscv/internals.h
+++ b/target/riscv/internals.h
@@ -26,8 +26,9 @@ FIELD(VDATA, VM, 0, 1)
 FIELD(VDATA, LMUL, 1, 3)
 FIELD(VDATA, VTA, 4, 1)
 FIELD(VDATA, VTA_ALL_1S, 5, 1)
-FIELD(VDATA, NF, 6, 4)
-FIELD(VDATA, WD, 6, 1)
+FIELD(VDATA, VMA, 6, 1)
+FIELD(VDATA, NF, 7, 4)
+FIELD(VDATA, WD, 7, 1)
 
 /* float point classify helpers */
 target_ulong fclass_h(uint64_t frs1);
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 87daf7220f..650574accf 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -68,6 +68,8 @@ void cpu_get_tb_cpu_state(CPURISCVState *env, target_ulong *pc,
         flags = FIELD_DP32(flags, TB_FLAGS, VL_EQ_VLMAX, vl_eq_vlmax);
         flags = FIELD_DP32(flags, TB_FLAGS, VTA,
                     FIELD_EX64(env->vtype, VTYPE, VTA));
+        flags = FIELD_DP32(flags, TB_FLAGS, VMA,
+                    FIELD_EX64(env->vtype, VTYPE, VMA));
     } else {
         flags = FIELD_DP32(flags, TB_FLAGS, VILL, 1);
     }
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 76da8db8a7..8925a44c6e 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -95,6 +95,7 @@ typedef struct DisasContext {
     int8_t lmul;
     uint8_t sew;
     uint8_t vta;
+    uint8_t vma;
     bool cfg_vta_all_1s;
     target_ulong vstart;
     bool vl_eq_vlmax;
@@ -1121,6 +1122,7 @@ static void riscv_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->sew = FIELD_EX32(tb_flags, TB_FLAGS, SEW);
     ctx->lmul = sextract32(FIELD_EX32(tb_flags, TB_FLAGS, LMUL), 0, 3);
     ctx->vta = FIELD_EX32(tb_flags, TB_FLAGS, VTA) && cpu->cfg.rvv_ta_all_1s;
+    ctx->vma = FIELD_EX32(tb_flags, TB_FLAGS, VMA) && cpu->cfg.rvv_ma_all_1s;
     ctx->cfg_vta_all_1s = cpu->cfg.rvv_ta_all_1s;
     ctx->vstart = env->vstart;
     ctx->vl_eq_vlmax = FIELD_EX32(tb_flags, TB_FLAGS, VL_EQ_VLMAX);
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index a96fc49c71..de895050e0 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -127,6 +127,11 @@ static inline uint32_t vext_vta(uint32_t desc)
     return FIELD_EX32(simd_data(desc), VDATA, VTA);
 }
 
+static inline uint32_t vext_vma(uint32_t desc)
+{
+    return FIELD_EX32(simd_data(desc), VDATA, VMA);
+}
+
 static inline uint32_t vext_vta_all_1s(uint32_t desc)
 {
     return FIELD_EX32(simd_data(desc), VDATA, VTA_ALL_1S);
@@ -812,10 +817,13 @@ static void do_vext_vv(void *vd, void *v0, void *vs1, void *vs2,
     uint32_t vl = env->vl;
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);
     uint32_t vta = vext_vta(desc);
+    uint32_t vma = vext_vma(desc);
     uint32_t i;
 
     for (i = env->vstart; i < vl; i++) {
         if (!vm && !vext_elem_mask(v0, i)) {
+            /* set masked-off elements to 1s */
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);
             continue;
         }
         fn(vd, vs1, vs2, i);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 6c091824b6..5ec113f6fd 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1247,6 +1247,7 @@ do_opivv_gvec(DisasContext *s, arg_rmrr *a, GVecGen3Fn *gvec_fn,
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1), vreg_ofs(s, a->rs2),
                            cpu_env, s->cfg_ptr->vlen / 8,
@@ -1545,6 +1546,7 @@ static bool do_opivv_widen(DisasContext *s, arg_rmrr *a,
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
@@ -1627,6 +1629,7 @@ static bool do_opiwv_widen(DisasContext *s, arg_rmrr *a,
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs1),
                            vreg_ofs(s, a->rs2),
-- 
2.37.2


