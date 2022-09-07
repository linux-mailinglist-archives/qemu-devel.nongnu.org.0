Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181F5AFF8B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:48:57 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqjv-0003jm-VW
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3f-00047j-AI
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:15 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3S-0004Ud-4b
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537900; x=1694073900;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KYj/hi+WRyuxgJ2zxo2QIyt4L0bnfMnJ1DUZ98yrAgo=;
 b=h/heslMozUUsFa379oR1QcgNKtZh3nSoedtpYpYskf0ntS/OC6lWsmMR
 JM2MNpCMIMf0UYz7iblopC/0hVJb6NFXsH4uy6RZOhQCGbLbe603lvnnH
 FdVoxffy2Rk+106S8/tTM2/zgv9+KG2y18XRtBtrv8/yDSjIJQlOpHXKm
 sZnd809Cml7urnIjahc9BHugZjiaUJJ/wVNGJOGTAlsojJvuV+kt/Fvs2
 nLB6BS73PeNdgXrq0/ULZ6BLbuO4fz7qlEpIE++FtkzBolRKerpxx6Zzu
 rW2Ftgiuq8pCYZu4nkQ684LQIyqW3Y0qD8wv/+1wWkciSSDV8k/WlDWn+ Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210714997"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:42 +0800
IronPort-SDR: 229Dd3Wm3hcX2GOfuzs6ARFvjzYrLIm2JlbJbfEK8zBXQKVXyiXSXNHXh0Z6ehPms217eMi2gn
 zVWNa5w1VWNu19sor3IXGQUHSaCfUCFrZ60+977mVlHouMHIOcwPlK0oQQWQ1KI1AuAyFhPdNL
 EAS3gtti/RjvPh1YM+Cc2uEmg6HLWsulMLRs9sODgTJXPB5BgA7KjHlq61Js24RG+YLKSMhUji
 jCNDS2y9cAAct1qIjRG9u+0j6kubBvKD1fli7hh0529X+O3M0op1iODkU0/WagAYbko0awM8UA
 hPIczDK7SQavkaM4ClzgeupV
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:40 -0700
IronPort-SDR: KSsD1WXqQXhhQo1UyjQ4gW9dFLtKB71EWWaW7JRnRTVDLALJfjQm/45LzKRFlNbF+Or2hhqLXl
 EneGQIDBUQZj1kjun06JJRkdC7h7ZOHTsdLp+1k3HcC+VJYakKczfxROkOg9FTBRaeNGnaI7KH
 glIw3/6kdZq6DsDLm7f2wZj7uH/kqIXDr2Obhd1nnSyokAzrIVudll8DLskmmKa3f3iegYzETq
 giJuB2/Co6HIj7k11bTwoRVx3gNBFM2t8D+NAJfVtWUC8iF8jRRiNJGxAVrkxP2ykbmn7d3jAx
 Gio=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:41 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 16/44] target/riscv: rvv: Add mask agnostic for vector load /
 store instructions
Date: Wed,  7 Sep 2022 10:03:25 +0200
Message-Id: <20220907080353.111926-17-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220907080353.111926-1-alistair.francis@wdc.com>
References: <20220907080353.111926-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=242877ce7=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165570784143.17634.35095816584573691-2@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 35 +++++++++++++++++--------
 target/riscv/insn_trans/trans_rvv.c.inc |  5 ++++
 2 files changed, 29 insertions(+), 11 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index de895050e0..e3810d2bc3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -283,14 +283,18 @@ vext_ldst_stride(void *vd, void *v0, target_ulong base,
     uint32_t esz = 1 << log2_esz;
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);
     uint32_t vta = vext_vta(desc);
+    uint32_t vma = vext_vma(desc);
 
     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-
         k = 0;
         while (k < nf) {
+            if (!vm && !vext_elem_mask(v0, i)) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
+                                  (i + k * max_elems + 1) * esz);
+                k++;
+                continue;
+            }
             target_ulong addr = base + stride * i + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
@@ -482,15 +486,19 @@ vext_ldst_index(void *vd, void *v0, target_ulong base,
     uint32_t esz = 1 << log2_esz;
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);
     uint32_t vta = vext_vta(desc);
+    uint32_t vma = vext_vma(desc);
 
     /* load bytes from guest memory */
     for (i = env->vstart; i < env->vl; i++, env->vstart++) {
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
-
         k = 0;
         while (k < nf) {
+            if (!vm && !vext_elem_mask(v0, i)) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
+                                  (i + k * max_elems + 1) * esz);
+                k++;
+                continue;
+            }
             abi_ptr addr = get_index_addr(base, i, vs2) + (k << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
@@ -579,6 +587,7 @@ vext_ldff(void *vd, void *v0, target_ulong base,
     uint32_t esz = 1 << log2_esz;
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);
     uint32_t vta = vext_vta(desc);
+    uint32_t vma = vext_vma(desc);
     target_ulong addr, offset, remain;
 
     /* probe every access*/
@@ -624,10 +633,14 @@ ProbeSuccess:
     }
     for (i = env->vstart; i < env->vl; i++) {
         k = 0;
-        if (!vm && !vext_elem_mask(v0, i)) {
-            continue;
-        }
         while (k < nf) {
+            if (!vm && !vext_elem_mask(v0, i)) {
+                /* set masked-off elements to 1s */
+                vext_set_elems_1s(vd, vma, (i + k * max_elems) * esz,
+                                  (i + k * max_elems + 1) * esz);
+                k++;
+                continue;
+            }
             target_ulong addr = base + ((i * nf + k) << log2_esz);
             ldst_elem(env, adjust_addr(env, addr), i + k * max_elems, vd, ra);
             k++;
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 5ec113f6fd..0627eda0c0 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -712,6 +712,7 @@ static bool ld_us_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
     data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
 
@@ -777,6 +778,7 @@ static bool ld_us_mask_op(DisasContext *s, arg_vlm_v *a, uint8_t eew)
     data = FIELD_DP32(data, VDATA, NF, 1);
     /* Mask destination register are always tail-agnostic */
     data = FIELD_DP32(data, VDATA, VTA, s->cfg_vta_all_1s);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_us_trans(a->rd, a->rs1, data, fn, s, false);
 }
 
@@ -866,6 +868,7 @@ static bool ld_stride_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
     data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_stride_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
@@ -996,6 +999,7 @@ static bool ld_index_op(DisasContext *s, arg_rnfvm *a, uint8_t eew)
     data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldst_index_trans(a->rd, a->rs1, a->rs2, data, fn, s, false);
 }
 
@@ -1114,6 +1118,7 @@ static bool ldff_op(DisasContext *s, arg_r2nfvm *a, uint8_t eew)
     data = FIELD_DP32(data, VDATA, LMUL, emul);
     data = FIELD_DP32(data, VDATA, NF, a->nf);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
     return ldff_trans(a->rd, a->rs1, data, fn, s);
 }
 
-- 
2.37.2


