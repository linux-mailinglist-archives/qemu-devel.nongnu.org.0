Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6720BC52
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Jun 2020 00:18:43 +0200 (CEST)
Received: from localhost ([::1]:39490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jowgD-0001Nn-VI
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 18:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowIk-0003nu-Aq
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:54:26 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:39471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439617756=alistair.francis@wdc.com>)
 id 1jowId-00033f-Hc
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 17:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593208474; x=1624744474;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6LKaJeZg2X5yM/aeomOGvF/BKSGu4ub+ieCf3aPiedE=;
 b=XUGPS4lVXASjJ8ybGejl9orkq7/QDKnxWWmLzQweI7DizFEd69VzB1Lg
 mW7JQqh6V6yb5x1B6zww6wfsUm2Yv0Y2mVagQzTLCRkdYnzr8jWonyYdd
 LKJen4XVGFHavRohqXrPe6bXiGaUltAS5RHFXcx/0qw+JY+B9q50YvGsb
 Qy1HkBCVYFX4ntq0pT0FaTZmqzIm3QmAuD9VnVxZ20yf3yI8fSrmB3o0v
 LKN7ngHv+DSWvlmo1/gyVtNGgYWPeCJcspcccdPa45heG9Z5w/b3Dzccg
 knujLDQiG8axvmXM595yLcBAwzBN9DORa6/OUCRxabYZ29BMOoK8HqHdb A==;
IronPort-SDR: Df/kke5+/+SUOL1WwYXCehoiNx6f9mkN7Ca/pIl0A+hWqX0bNaNAJo1aIKuuRQc+2Wu25MJwFR
 YsB0bszz7dZooaRNFCU57y4KPI2nGSOwkTJPslXNeab8mX/prNKD9dnBK1tgz5JBY+uiWF4jII
 dPXD0G92yfINPIPcUdf5k3eKiGMgI/XWt3hm6MzYYHn9VZtEA8EX84+mg22eGacQz8IpHLoaHY
 faCNyprhLVxn8vCi/yZI2M2xCQxL9jNivLYYV5sPMHZpKu5bqyPSwHEolIPo5egqV0guyve/8k
 5OY=
X-IronPort-AV: E=Sophos;i="5.75,285,1589212800"; d="scan'208";a="244048404"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 27 Jun 2020 05:53:50 +0800
IronPort-SDR: CV5tGRldSfODvcTJGycoczfBe4SFxvsiklq5Uuc2h4v1ZTE126r7kcyD7ONucyIoC/Y4ANQFNr
 KkR+AVib/dm5jBy6KMy0D1iyqjUHRbi94=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2020 14:42:46 -0700
IronPort-SDR: 4pERn42bVrhAJCYUjtEJvHhw7R1Lq9j1zWDI3FwEgSuXqSaQGfKQ4rvNsnJFqXl/wGhFFA+JSN
 TcbUHMTJaIYw==
WDCIronportException: Internal
Received: from 2hc7cg2.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.58.206])
 by uls-op-cesaip01.wdc.com with ESMTP; 26 Jun 2020 14:53:48 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 47/63] target/riscv: vector single-width integer reduction
 instructions
Date: Fri, 26 Jun 2020 14:43:54 -0700
Message-Id: <20200626214410.3613258-48-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200626214410.3613258-1-alistair.francis@wdc.com>
References: <20200626214410.3613258-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=439617756=alistair.francis@wdc.com;
 helo=esa2.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 17:53:44
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: LIU Zhiwei <zhiwei_liu@c-sky.com>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20200623215920.2594-46-zhiwei_liu@c-sky.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 33 +++++++++++
 target/riscv/insn32.decode              |  8 +++
 target/riscv/insn_trans/trans_rvv.inc.c | 18 ++++++
 target/riscv/vector_helper.c            | 74 +++++++++++++++++++++++++
 4 files changed, 133 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 5870c4041e..a7fe4443e4 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1039,3 +1039,36 @@ DEF_HELPER_5(vfncvt_f_x_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfncvt_f_x_v_w, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfncvt_f_f_v_h, void, ptr, ptr, ptr, env, i32)
 DEF_HELPER_5(vfncvt_f_f_v_w, void, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredsum_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmaxu_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmaxu_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmaxu_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmaxu_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmax_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmax_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmax_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmax_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredminu_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredminu_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredminu_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredminu_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmin_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmin_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmin_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredmin_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredand_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredand_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredand_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredand_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredor_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredor_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredor_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredor_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredxor_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredxor_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredxor_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vredxor_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 55fbe166d8..878eeecb7e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -531,6 +531,14 @@ vfncvt_x_f_v    100010 . ..... 10001 001 ..... 1010111 @r2_vm
 vfncvt_f_xu_v   100010 . ..... 10010 001 ..... 1010111 @r2_vm
 vfncvt_f_x_v    100010 . ..... 10011 001 ..... 1010111 @r2_vm
 vfncvt_f_f_v    100010 . ..... 10100 001 ..... 1010111 @r2_vm
+vredsum_vs      000000 . ..... ..... 010 ..... 1010111 @r_vm
+vredand_vs      000001 . ..... ..... 010 ..... 1010111 @r_vm
+vredor_vs       000010 . ..... ..... 010 ..... 1010111 @r_vm
+vredxor_vs      000011 . ..... ..... 010 ..... 1010111 @r_vm
+vredminu_vs     000100 . ..... ..... 010 ..... 1010111 @r_vm
+vredmin_vs      000101 . ..... ..... 010 ..... 1010111 @r_vm
+vredmaxu_vs     000110 . ..... ..... 010 ..... 1010111 @r_vm
+vredmax_vs      000111 . ..... ..... 010 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index 6c46d893b0..b4e3f904d3 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2324,3 +2324,21 @@ GEN_OPFV_NARROW_TRANS(vfncvt_x_f_v)
 GEN_OPFV_NARROW_TRANS(vfncvt_f_xu_v)
 GEN_OPFV_NARROW_TRANS(vfncvt_f_x_v)
 GEN_OPFV_NARROW_TRANS(vfncvt_f_f_v)
+
+/*
+ *** Vector Reduction Operations
+ */
+/* Vector Single-Width Integer Reduction Instructions */
+static bool reduction_check(DisasContext *s, arg_rmrr *a)
+{
+    return vext_check_isa_ill(s) && vext_check_reg(s, a->rs2, false);
+}
+
+GEN_OPIVV_TRANS(vredsum_vs, reduction_check)
+GEN_OPIVV_TRANS(vredmaxu_vs, reduction_check)
+GEN_OPIVV_TRANS(vredmax_vs, reduction_check)
+GEN_OPIVV_TRANS(vredminu_vs, reduction_check)
+GEN_OPIVV_TRANS(vredmin_vs, reduction_check)
+GEN_OPIVV_TRANS(vredand_vs, reduction_check)
+GEN_OPIVV_TRANS(vredor_vs, reduction_check)
+GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 32cd298f43..1bf3c870d3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4332,3 +4332,77 @@ RVVCALL(OPFVV1, vfncvt_f_f_v_h, NOP_UU_H, H2, H4, vfncvtffv16)
 RVVCALL(OPFVV1, vfncvt_f_f_v_w, NOP_UU_W, H4, H8, float64_to_float32)
 GEN_VEXT_V_ENV(vfncvt_f_f_v_h, 2, 2, clearh)
 GEN_VEXT_V_ENV(vfncvt_f_f_v_w, 4, 4, clearl)
+
+/*
+ *** Vector Reduction Operations
+ */
+/* Vector Single-Width Integer Reduction Instructions */
+#define GEN_VEXT_RED(NAME, TD, TS2, HD, HS2, OP, CLEAR_FN)\
+void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
+        void *vs2, CPURISCVState *env, uint32_t desc)     \
+{                                                         \
+    uint32_t mlen = vext_mlen(desc);                      \
+    uint32_t vm = vext_vm(desc);                          \
+    uint32_t vl = env->vl;                                \
+    uint32_t i;                                           \
+    uint32_t tot = env_archcpu(env)->cfg.vlen / 8;        \
+    TD s1 =  *((TD *)vs1 + HD(0));                        \
+                                                          \
+    for (i = 0; i < vl; i++) {                            \
+        TS2 s2 = *((TS2 *)vs2 + HS2(i));                  \
+        if (!vm && !vext_elem_mask(v0, mlen, i)) {        \
+            continue;                                     \
+        }                                                 \
+        s1 = OP(s1, (TD)s2);                              \
+    }                                                     \
+    *((TD *)vd + HD(0)) = s1;                             \
+    CLEAR_FN(vd, 1, sizeof(TD), tot);                     \
+}
+
+/* vd[0] = sum(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredsum_vs_b, int8_t, int8_t, H1, H1, DO_ADD, clearb)
+GEN_VEXT_RED(vredsum_vs_h, int16_t, int16_t, H2, H2, DO_ADD, clearh)
+GEN_VEXT_RED(vredsum_vs_w, int32_t, int32_t, H4, H4, DO_ADD, clearl)
+GEN_VEXT_RED(vredsum_vs_d, int64_t, int64_t, H8, H8, DO_ADD, clearq)
+
+/* vd[0] = maxu(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredmaxu_vs_b, uint8_t, uint8_t, H1, H1, DO_MAX, clearb)
+GEN_VEXT_RED(vredmaxu_vs_h, uint16_t, uint16_t, H2, H2, DO_MAX, clearh)
+GEN_VEXT_RED(vredmaxu_vs_w, uint32_t, uint32_t, H4, H4, DO_MAX, clearl)
+GEN_VEXT_RED(vredmaxu_vs_d, uint64_t, uint64_t, H8, H8, DO_MAX, clearq)
+
+/* vd[0] = max(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredmax_vs_b, int8_t, int8_t, H1, H1, DO_MAX, clearb)
+GEN_VEXT_RED(vredmax_vs_h, int16_t, int16_t, H2, H2, DO_MAX, clearh)
+GEN_VEXT_RED(vredmax_vs_w, int32_t, int32_t, H4, H4, DO_MAX, clearl)
+GEN_VEXT_RED(vredmax_vs_d, int64_t, int64_t, H8, H8, DO_MAX, clearq)
+
+/* vd[0] = minu(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredminu_vs_b, uint8_t, uint8_t, H1, H1, DO_MIN, clearb)
+GEN_VEXT_RED(vredminu_vs_h, uint16_t, uint16_t, H2, H2, DO_MIN, clearh)
+GEN_VEXT_RED(vredminu_vs_w, uint32_t, uint32_t, H4, H4, DO_MIN, clearl)
+GEN_VEXT_RED(vredminu_vs_d, uint64_t, uint64_t, H8, H8, DO_MIN, clearq)
+
+/* vd[0] = min(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredmin_vs_b, int8_t, int8_t, H1, H1, DO_MIN, clearb)
+GEN_VEXT_RED(vredmin_vs_h, int16_t, int16_t, H2, H2, DO_MIN, clearh)
+GEN_VEXT_RED(vredmin_vs_w, int32_t, int32_t, H4, H4, DO_MIN, clearl)
+GEN_VEXT_RED(vredmin_vs_d, int64_t, int64_t, H8, H8, DO_MIN, clearq)
+
+/* vd[0] = and(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredand_vs_b, int8_t, int8_t, H1, H1, DO_AND, clearb)
+GEN_VEXT_RED(vredand_vs_h, int16_t, int16_t, H2, H2, DO_AND, clearh)
+GEN_VEXT_RED(vredand_vs_w, int32_t, int32_t, H4, H4, DO_AND, clearl)
+GEN_VEXT_RED(vredand_vs_d, int64_t, int64_t, H8, H8, DO_AND, clearq)
+
+/* vd[0] = or(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredor_vs_b, int8_t, int8_t, H1, H1, DO_OR, clearb)
+GEN_VEXT_RED(vredor_vs_h, int16_t, int16_t, H2, H2, DO_OR, clearh)
+GEN_VEXT_RED(vredor_vs_w, int32_t, int32_t, H4, H4, DO_OR, clearl)
+GEN_VEXT_RED(vredor_vs_d, int64_t, int64_t, H8, H8, DO_OR, clearq)
+
+/* vd[0] = xor(vs1[0], vs2[*]) */
+GEN_VEXT_RED(vredxor_vs_b, int8_t, int8_t, H1, H1, DO_XOR, clearb)
+GEN_VEXT_RED(vredxor_vs_h, int16_t, int16_t, H2, H2, DO_XOR, clearh)
+GEN_VEXT_RED(vredxor_vs_w, int32_t, int32_t, H4, H4, DO_XOR, clearl)
+GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR, clearq)
-- 
2.27.0


