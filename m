Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5120BC08
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 23:59:37 +0200 (CEST)
Received: from localhost ([::1]:47020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jowNk-000366-EY
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 17:59:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowI6-0002s9-Be
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:53:46 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:3622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowI2-0002yu-QT
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593208422; x=1624744422;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Jqfg3Ylb150/Ggk08L7xP1ejN2fdcLkAq2+X2F5rRpE=;
 b=BPJ9xz+V1JqCOvt7cc+j7Xr2oka+8WfHMTBmuWFBr+y3ActIWNPCDn9d
 C0Dlc647uC/Rp+EJuw1D6MHX+8YOTllYN2xeVUPDrNS/s1OolR8oJZqhs
 5VFhG/hIztOYpqhtNCWRVgma9EGnUEoHb6hNC416GhcD1hEcERakvoBCU
 le9+lwDCKjsw+Qjb/Rmo7+8DDb+iUfQUoqAeIvps8PUrFSbuEXTjleKm5
 O+8nZd0ZXxPUI9PqlDOTllGdHaqpBgaXv/ZX4pzcXQBKz8mOsQm9rKCxT
 sOplmhdP6Jn5P5p+IBBmSKJSuBQTVmyeK60Ve93Xndauuh/IiREdgg4kR A==;
IronPort-SDR: 9/NoZYm/gE4EkTZktHCHGFo69HMeooys8eI3CrYcJle2hYbBhQ3+/wsOKXNPZNdYNJ6Jo4bzBo
 5sAAiDTh51u6DHpZvN3sozX5/AczSiJeHAuZWBtoconhcUzKhwtz170dbXqk8HXLgFYfOOAQQt
 M8rUWNhP6+HVwiknOTpUFtzscEOyXrkaeQpx2taorOaQYAxUuW5TZv29Vex1aVaAIvJPi39RlO
 5LlRrsvSo61Vtfm7ne0vzJfmGgZxNe+pnAXADqJvfww81b2KjybMXuzOvmtfTpd4AZGccncyYP
 zZQ=
X-IronPort-AV: E=Sophos;i="5.75,285,1589212800"; d="scan'208";a="250261250"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2020 05:53:38 +0800
IronPort-SDR: 3eCiVn0sO0Ev9KJ7z5sodAo506eBWAO5P+idSS7AFOnthxghV2V5Dl3lQR0HTKGucocAaVobgB
 M2O8kNxUMW1/VmQLEw5i4eiNRhJrgjpYM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 14:42:36 -0700
IronPort-SDR: A/XDFyr03xqcNmrpXdooj00nbHRuu5xsI26K+mHaT6SyVO4OeD4FpQrd+hSeWGLIsqSIMn+VFT
 OVUFj1WR15PA==
WDCIronportException: Internal
Received: from 2hc7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.58.206])
 by uls-op-cesaip01.wdc.com with ESMTP; 26 Jun 2020 14:53:38 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 14/63] target/riscv: vector integer add-with-carry /
 subtract-with-borrow instructions
Date: Fri, 26 Jun 2020 14:43:21 -0700
Message-Id: <20200626214410.3613258-15-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626214410.3613258-1-alistair.francis@wdc.com>
References: <20200626214410.3613258-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=439617756=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 17:53:37
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: alistair23@gmail.com, Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20200623215920.2594-13-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  33 ++++++
 target/riscv/insn32.decode              |  11 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 113 +++++++++++++++++++
 target/riscv/vector_helper.c            | 137 ++++++++++++++++++++++++
 4 files changed, 294 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index da6acc067b..67a2e64c4a 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -349,3 +349,36 @@ DEF_HELPER_6(vwadd_wx_w, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwsub_wx_b, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwsub_wx_h, void, ptr, ptr, tl, ptr, env, i32)
 DEF_HELPER_6(vwsub_wx_w, void, ptr, ptr, tl, ptr, env, i32)
+
+DEF_HELPER_6(vadc_vvm_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadc_vvm_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadc_vvm_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadc_vvm_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsbc_vvm_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsbc_vvm_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsbc_vvm_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vsbc_vvm_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmadc_vvm_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmadc_vvm_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmadc_vvm_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmadc_vvm_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vvm_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vvm_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vvm_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vvm_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vadc_vxm_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vadc_vxm_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vadc_vxm_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vadc_vxm_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsbc_vxm_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsbc_vxm_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsbc_vxm_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vsbc_vxm_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmadc_vxm_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmadc_vxm_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmadc_vxm_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmadc_vxm_d, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vxm_b, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vxm_h, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vxm_w, void, ptr, ptr, tl, ptr, env, i32)
+DEF_HELPER_6(vmsbc_vxm_d, void, ptr, ptr, tl, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 6ec166d0ed..be63e900c6 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -70,6 +70,7 @@
 @r2_nfvm ... ... vm:1 ..... ..... ... ..... ....... &r2nfvm %nf %rs1 %rd
 @r_nfvm  ... ... vm:1 ..... ..... ... ..... ....... &rnfvm %nf %rs2 %rs1 %rd
 @r_vm    ...... vm:1 ..... ..... ... ..... ....... &rmrr %rs2 %rs1 %rd
+@r_vm_1  ...... . ..... ..... ... ..... .......    &rmrr vm=1 %rs2 %rs1 %rd
 @r_wdvm  ..... wd:1 vm:1 ..... ..... ... ..... ....... &rwdvm %rs2 %rs1 %rd
 @r2_zimm . zimm:11  ..... ... ..... ....... %rs1 %rd
 
@@ -302,6 +303,16 @@ vwsubu_wv       110110 . ..... ..... 010 ..... 1010111 @r_vm
 vwsubu_wx       110110 . ..... ..... 110 ..... 1010111 @r_vm
 vwsub_wv        110111 . ..... ..... 010 ..... 1010111 @r_vm
 vwsub_wx        110111 . ..... ..... 110 ..... 1010111 @r_vm
+vadc_vvm        010000 1 ..... ..... 000 ..... 1010111 @r_vm_1
+vadc_vxm        010000 1 ..... ..... 100 ..... 1010111 @r_vm_1
+vadc_vim        010000 1 ..... ..... 011 ..... 1010111 @r_vm_1
+vmadc_vvm       010001 1 ..... ..... 000 ..... 1010111 @r_vm_1
+vmadc_vxm       010001 1 ..... ..... 100 ..... 1010111 @r_vm_1
+vmadc_vim       010001 1 ..... ..... 011 ..... 1010111 @r_vm_1
+vsbc_vvm        010010 1 ..... ..... 000 ..... 1010111 @r_vm_1
+vsbc_vxm        010010 1 ..... ..... 100 ..... 1010111 @r_vm_1
+vmsbc_vvm       010011 1 ..... ..... 000 ..... 1010111 @r_vm_1
+vmsbc_vxm       010011 1 ..... ..... 100 ..... 1010111 @r_vm_1
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 850df9df66..98bd5bcb79 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -1249,3 +1249,116 @@ GEN_OPIWX_WIDEN_TRANS(vwaddu_wx)
 GEN_OPIWX_WIDEN_TRANS(vwadd_wx)
 GEN_OPIWX_WIDEN_TRANS(vwsubu_wx)
 GEN_OPIWX_WIDEN_TRANS(vwsub_wx)
+
+/* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
+/* OPIVV without GVEC IR */
+#define GEN_OPIVV_TRANS(NAME, CHECK)                               \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
+{                                                                  \
+    if (CHECK(s, a)) {                                             \
+        uint32_t data = 0;                                         \
+        static gen_helper_gvec_4_ptr * const fns[4] = {            \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,          \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,          \
+        };                                                         \
+        TCGLabel *over = gen_new_label();                          \
+        tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);          \
+                                                                   \
+        data = FIELD_DP32(data, VDATA, MLEN, s->mlen);             \
+        data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
+        data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
+        tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
+                           vreg_ofs(s, a->rs1),                    \
+                           vreg_ofs(s, a->rs2), cpu_env, 0,        \
+                           s->vlen / 8, data, fns[s->sew]);        \
+        gen_set_label(over);                                       \
+        return true;                                               \
+    }                                                              \
+    return false;                                                  \
+}
+
+/*
+ * For vadc and vsbc, an illegal instruction exception is raised if the
+ * destination vector register is v0 and LMUL > 1. (Section 12.3)
+ */
+static bool opivv_vadc_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            ((a->rd != 0) || (s->lmul == 0)));
+}
+
+GEN_OPIVV_TRANS(vadc_vvm, opivv_vadc_check)
+GEN_OPIVV_TRANS(vsbc_vvm, opivv_vadc_check)
+
+/*
+ * For vmadc and vmsbc, an illegal instruction exception is raised if the
+ * destination vector register overlaps a source vector register group.
+ */
+static bool opivv_vmadc_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_reg(s, a->rs1, false) &&
+            vext_check_overlap_group(a->rd, 1, a->rs1, 1 << s->lmul) &&
+            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+}
+
+GEN_OPIVV_TRANS(vmadc_vvm, opivv_vmadc_check)
+GEN_OPIVV_TRANS(vmsbc_vvm, opivv_vmadc_check)
+
+static bool opivx_vadc_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rd, false) &&
+            vext_check_reg(s, a->rs2, false) &&
+            ((a->rd != 0) || (s->lmul == 0)));
+}
+
+/* OPIVX without GVEC IR */
+#define GEN_OPIVX_TRANS(NAME, CHECK)                                     \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
+{                                                                        \
+    if (CHECK(s, a)) {                                                   \
+        static gen_helper_opivx * const fns[4] = {                       \
+            gen_helper_##NAME##_b, gen_helper_##NAME##_h,                \
+            gen_helper_##NAME##_w, gen_helper_##NAME##_d,                \
+        };                                                               \
+                                                                         \
+        return opivx_trans(a->rd, a->rs1, a->rs2, a->vm, fns[s->sew], s);\
+    }                                                                    \
+    return false;                                                        \
+}
+
+GEN_OPIVX_TRANS(vadc_vxm, opivx_vadc_check)
+GEN_OPIVX_TRANS(vsbc_vxm, opivx_vadc_check)
+
+static bool opivx_vmadc_check(DisasContext *s, arg_rmrr *a)
+{
+    return (vext_check_isa_ill(s) &&
+            vext_check_reg(s, a->rs2, false) &&
+            vext_check_overlap_group(a->rd, 1, a->rs2, 1 << s->lmul));
+}
+
+GEN_OPIVX_TRANS(vmadc_vxm, opivx_vmadc_check)
+GEN_OPIVX_TRANS(vmsbc_vxm, opivx_vmadc_check)
+
+/* OPIVI without GVEC IR */
+#define GEN_OPIVI_TRANS(NAME, ZX, OPIVX, CHECK)                          \
+static bool trans_##NAME(DisasContext *s, arg_rmrr *a)                   \
+{                                                                        \
+    if (CHECK(s, a)) {                                                   \
+        static gen_helper_opivx * const fns[4] = {                       \
+            gen_helper_##OPIVX##_b, gen_helper_##OPIVX##_h,              \
+            gen_helper_##OPIVX##_w, gen_helper_##OPIVX##_d,              \
+        };                                                               \
+        return opivi_trans(a->rd, a->rs1, a->rs2, a->vm,                 \
+                           fns[s->sew], s, ZX);                          \
+    }                                                                    \
+    return false;                                                        \
+}
+
+GEN_OPIVI_TRANS(vadc_vim, 0, vadc_vxm, opivx_vadc_check)
+GEN_OPIVI_TRANS(vmadc_vim, 0, vmadc_vxm, opivx_vmadc_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 2aa1924960..ad746175bd 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -187,6 +187,14 @@ static void clearq(void *vd, uint32_t idx, uint32_t cnt, uint32_t tot)
     vext_clear(cur, cnt, tot);
 }
 
+static inline void vext_set_elem_mask(void *v0, int mlen, int index,
+        uint8_t value)
+{
+    int idx = (index * mlen) / 64;
+    int pos = (index * mlen) % 64;
+    uint64_t old = ((uint64_t *)v0)[idx];
+    ((uint64_t *)v0)[idx] = deposit64(old, pos, mlen, value);
+}
 
 static inline int vext_elem_mask(void *v0, int mlen, int index)
 {
@@ -1128,3 +1136,132 @@ GEN_VEXT_VX(vwadd_wx_w, 4, 8, clearq)
 GEN_VEXT_VX(vwsub_wx_b, 1, 2, clearh)
 GEN_VEXT_VX(vwsub_wx_h, 2, 4, clearl)
 GEN_VEXT_VX(vwsub_wx_w, 4, 8, clearq)
+
+/* Vector Integer Add-with-Carry / Subtract-with-Borrow Instructions */
+#define DO_VADC(N, M, C) (N + M + C)
+#define DO_VSBC(N, M, C) (N - M - C)
+
+#define GEN_VEXT_VADC_VVM(NAME, ETYPE, H, DO_OP, CLEAR_FN)    \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    uint32_t mlen = vext_mlen(desc);                          \
+    uint32_t vl = env->vl;                                    \
+    uint32_t esz = sizeof(ETYPE);                             \
+    uint32_t vlmax = vext_maxsz(desc) / esz;                  \
+    uint32_t i;                                               \
+                                                              \
+    for (i = 0; i < vl; i++) {                                \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
+        uint8_t carry = vext_elem_mask(v0, mlen, i);          \
+                                                              \
+        *((ETYPE *)vd + H(i)) = DO_OP(s2, s1, carry);         \
+    }                                                         \
+    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                  \
+}
+
+GEN_VEXT_VADC_VVM(vadc_vvm_b, uint8_t,  H1, DO_VADC, clearb)
+GEN_VEXT_VADC_VVM(vadc_vvm_h, uint16_t, H2, DO_VADC, clearh)
+GEN_VEXT_VADC_VVM(vadc_vvm_w, uint32_t, H4, DO_VADC, clearl)
+GEN_VEXT_VADC_VVM(vadc_vvm_d, uint64_t, H8, DO_VADC, clearq)
+
+GEN_VEXT_VADC_VVM(vsbc_vvm_b, uint8_t,  H1, DO_VSBC, clearb)
+GEN_VEXT_VADC_VVM(vsbc_vvm_h, uint16_t, H2, DO_VSBC, clearh)
+GEN_VEXT_VADC_VVM(vsbc_vvm_w, uint32_t, H4, DO_VSBC, clearl)
+GEN_VEXT_VADC_VVM(vsbc_vvm_d, uint64_t, H8, DO_VSBC, clearq)
+
+#define GEN_VEXT_VADC_VXM(NAME, ETYPE, H, DO_OP, CLEAR_FN)               \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,        \
+                  CPURISCVState *env, uint32_t desc)                     \
+{                                                                        \
+    uint32_t mlen = vext_mlen(desc);                                     \
+    uint32_t vl = env->vl;                                               \
+    uint32_t esz = sizeof(ETYPE);                                        \
+    uint32_t vlmax = vext_maxsz(desc) / esz;                             \
+    uint32_t i;                                                          \
+                                                                         \
+    for (i = 0; i < vl; i++) {                                           \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                               \
+        uint8_t carry = vext_elem_mask(v0, mlen, i);                     \
+                                                                         \
+        *((ETYPE *)vd + H(i)) = DO_OP(s2, (ETYPE)(target_long)s1, carry);\
+    }                                                                    \
+    CLEAR_FN(vd, vl, vl * esz, vlmax * esz);                             \
+}
+
+GEN_VEXT_VADC_VXM(vadc_vxm_b, uint8_t,  H1, DO_VADC, clearb)
+GEN_VEXT_VADC_VXM(vadc_vxm_h, uint16_t, H2, DO_VADC, clearh)
+GEN_VEXT_VADC_VXM(vadc_vxm_w, uint32_t, H4, DO_VADC, clearl)
+GEN_VEXT_VADC_VXM(vadc_vxm_d, uint64_t, H8, DO_VADC, clearq)
+
+GEN_VEXT_VADC_VXM(vsbc_vxm_b, uint8_t,  H1, DO_VSBC, clearb)
+GEN_VEXT_VADC_VXM(vsbc_vxm_h, uint16_t, H2, DO_VSBC, clearh)
+GEN_VEXT_VADC_VXM(vsbc_vxm_w, uint32_t, H4, DO_VSBC, clearl)
+GEN_VEXT_VADC_VXM(vsbc_vxm_d, uint64_t, H8, DO_VSBC, clearq)
+
+#define DO_MADC(N, M, C) (C ? (__typeof(N))(N + M + 1) <= N :           \
+                          (__typeof(N))(N + M) < N)
+#define DO_MSBC(N, M, C) (C ? N <= M : N < M)
+
+#define GEN_VEXT_VMADC_VVM(NAME, ETYPE, H, DO_OP)             \
+void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
+                  CPURISCVState *env, uint32_t desc)          \
+{                                                             \
+    uint32_t mlen = vext_mlen(desc);                          \
+    uint32_t vl = env->vl;                                    \
+    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);        \
+    uint32_t i;                                               \
+                                                              \
+    for (i = 0; i < vl; i++) {                                \
+        ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
+        uint8_t carry = vext_elem_mask(v0, mlen, i);          \
+                                                              \
+        vext_set_elem_mask(vd, mlen, i, DO_OP(s2, s1, carry));\
+    }                                                         \
+    for (; i < vlmax; i++) {                                  \
+        vext_set_elem_mask(vd, mlen, i, 0);                   \
+    }                                                         \
+}
+
+GEN_VEXT_VMADC_VVM(vmadc_vvm_b, uint8_t,  H1, DO_MADC)
+GEN_VEXT_VMADC_VVM(vmadc_vvm_h, uint16_t, H2, DO_MADC)
+GEN_VEXT_VMADC_VVM(vmadc_vvm_w, uint32_t, H4, DO_MADC)
+GEN_VEXT_VMADC_VVM(vmadc_vvm_d, uint64_t, H8, DO_MADC)
+
+GEN_VEXT_VMADC_VVM(vmsbc_vvm_b, uint8_t,  H1, DO_MSBC)
+GEN_VEXT_VMADC_VVM(vmsbc_vvm_h, uint16_t, H2, DO_MSBC)
+GEN_VEXT_VMADC_VVM(vmsbc_vvm_w, uint32_t, H4, DO_MSBC)
+GEN_VEXT_VMADC_VVM(vmsbc_vvm_d, uint64_t, H8, DO_MSBC)
+
+#define GEN_VEXT_VMADC_VXM(NAME, ETYPE, H, DO_OP)               \
+void HELPER(NAME)(void *vd, void *v0, target_ulong s1,          \
+                  void *vs2, CPURISCVState *env, uint32_t desc) \
+{                                                               \
+    uint32_t mlen = vext_mlen(desc);                            \
+    uint32_t vl = env->vl;                                      \
+    uint32_t vlmax = vext_maxsz(desc) / sizeof(ETYPE);          \
+    uint32_t i;                                                 \
+                                                                \
+    for (i = 0; i < vl; i++) {                                  \
+        ETYPE s2 = *((ETYPE *)vs2 + H(i));                      \
+        uint8_t carry = vext_elem_mask(v0, mlen, i);            \
+                                                                \
+        vext_set_elem_mask(vd, mlen, i,                         \
+                DO_OP(s2, (ETYPE)(target_long)s1, carry));      \
+    }                                                           \
+    for (; i < vlmax; i++) {                                    \
+        vext_set_elem_mask(vd, mlen, i, 0);                     \
+    }                                                           \
+}
+
+GEN_VEXT_VMADC_VXM(vmadc_vxm_b, uint8_t,  H1, DO_MADC)
+GEN_VEXT_VMADC_VXM(vmadc_vxm_h, uint16_t, H2, DO_MADC)
+GEN_VEXT_VMADC_VXM(vmadc_vxm_w, uint32_t, H4, DO_MADC)
+GEN_VEXT_VMADC_VXM(vmadc_vxm_d, uint64_t, H8, DO_MADC)
+
+GEN_VEXT_VMADC_VXM(vmsbc_vxm_b, uint8_t,  H1, DO_MSBC)
+GEN_VEXT_VMADC_VXM(vmsbc_vxm_h, uint16_t, H2, DO_MSBC)
+GEN_VEXT_VMADC_VXM(vmsbc_vxm_w, uint32_t, H4, DO_MSBC)
+GEN_VEXT_VMADC_VXM(vmsbc_vxm_d, uint64_t, H8, DO_MSBC)
-- 
2.27.0


