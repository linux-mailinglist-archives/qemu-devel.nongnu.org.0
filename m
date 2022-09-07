Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713435AFF96
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:51:14 +0200 (CEST)
Received: from localhost ([::1]:52852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqm4-0005Hv-5i
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4M-0004hp-0x
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:58 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq4A-0004pz-EM
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537945; x=1694073945;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7i/Fom/Rt4NO0isFvHvnTtwn77ljQhGo5wO8orUet5g=;
 b=lu4jGEGPReGDYXI07OpcjYrT43G9bAUhzt8YGFNgwF6hTHs9ZILL4M2Z
 8C1X/jbo8zW41v+xezcrDDU8QrIGrXGF96KPnEfzwhsvbiNUm9dMcRGEI
 +BlwJ9GqcRmlS3yvk7ehGPGrvRYoaZFCSmbv1W1zEj1wk/CTbpQoBROqn
 njKaMzE8V/yN06GTmADO+zhc+045eUr0b98/ReNP4AQdWSv8Xzuked6no
 uFpoKzH0QfCtbeyqKL9euusx1GGUvL0etkYkN0iejQVnba47V2+IJ8iJi
 08nItU06kjD/jf5lzz7i1hC7r+e47ZAPI+CXC0cTYhVxq16Yp+e2tCST7 A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715040"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:56 +0800
IronPort-SDR: n9cWxAfvklBPUOMkf75jLx5vemYTvVSCNSs6MEveiNhW060BW3xFpk426/uwC1TOWrLoANy0zv
 ZywjoI3zvOfiFjj3FWKkqfCSbsIcGW+Clt1/rtEA4i7TeDmGih4VSKbgHFJylyKA+1tGEDkg+u
 lB7r674+6/T99W9cv3jExxc8/ZEZID23m8iqrg1I4HydFLYbuSkPDCaEN+j5lGoMZyI4pbx3/Q
 TWIFh1HI9FtAB7BBaRCm8jIioNdnVAYR7PMlKkjgMKbzAB0vg8XSIKiI1yV26wDSTfFRppKr+C
 2QjTcjs0bK8IsUPSaAwJ5uBU
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:54 -0700
IronPort-SDR: +UBNVcWuxgvYkOOQZrXBB0G5922p6wKU62VQxZfFhpdrsCeII8MJnv5tjbI4AutE4/GTk+MCtU
 92MkJXRe5xOlwgE1r1MjfhhGJnEwUP45rKRMFB5ogBtpMAK/AmDmf8TnCAXR+ACJfHvBFogy+8
 nynAgayBEpVc05WJd/xERNAXZdCxk59DQMp9p1H1yMUecgyPXaHsRkhHfHc46wt6FAJQauroE3
 0aAZTZedPFMiIuqCeci6DWlHhVs5p6K6Hi5mOHKYD/4B4GkMjhaPec1cBsTnqOkuTXvqyJymHX
 9OE=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:56 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/44] target/riscv: rvv: Add mask agnostic for vector
 permutation instructions
Date: Wed,  7 Sep 2022 10:03:32 +0200
Message-Id: <20220907080353.111926-24-alistair.francis@wdc.com>
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

Signed-off-by: eop Chen <eop.chen@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <165570784143.17634.35095816584573691-9@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++--
 target/riscv/insn_trans/trans_rvv.c.inc |  1 +
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 52518648bb..d224861c2c 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -5018,11 +5018,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t esz = sizeof(ETYPE);                                         \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
+    uint32_t vma = vext_vma(desc);                                        \
     target_ulong offset = s1, i_min, i;                                   \
                                                                           \
     i_min = MAX(env->vstart, offset);                                     \
     for (i = i_min; i < vl; i++) {                                        \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i - offset));          \
@@ -5047,13 +5050,17 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t esz = sizeof(ETYPE);                                         \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
+    uint32_t vma = vext_vma(desc);                                        \
     target_ulong i_max, i;                                                \
                                                                           \
     i_max = MAX(MIN(s1 < vlmax ? vlmax - s1 : 0, vl), env->vstart);       \
     for (i = env->vstart; i < i_max; ++i) {                               \
-        if (vm || vext_elem_mask(v0, i)) {                                \
-            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
+            continue;                                                     \
         }                                                                 \
+        *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));              \
     }                                                                     \
                                                                           \
     for (i = i_max; i < vl; ++i) {                                        \
@@ -5083,10 +5090,13 @@ static void vslide1up_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
     uint32_t esz = sizeof(ETYPE);                                           \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);            \
     uint32_t vta = vext_vta(desc);                                          \
+    uint32_t vma = vext_vma(desc);                                          \
     uint32_t i;                                                             \
                                                                             \
     for (i = env->vstart; i < vl; i++) {                                    \
         if (!vm && !vext_elem_mask(v0, i)) {                                \
+            /* set masked-off elements to 1s */                             \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);             \
             continue;                                                       \
         }                                                                   \
         if (i == 0) {                                                       \
@@ -5128,10 +5138,13 @@ static void vslide1down_##BITWIDTH(void *vd, void *v0, target_ulong s1,       \
     uint32_t esz = sizeof(ETYPE);                                             \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);              \
     uint32_t vta = vext_vta(desc);                                            \
+    uint32_t vma = vext_vma(desc);                                            \
     uint32_t i;                                                               \
                                                                               \
     for (i = env->vstart; i < vl; i++) {                                      \
         if (!vm && !vext_elem_mask(v0, i)) {                                  \
+            /* set masked-off elements to 1s */                               \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);               \
             continue;                                                         \
         }                                                                     \
         if (i == vl - 1) {                                                    \
@@ -5199,11 +5212,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,               \
     uint32_t esz = sizeof(TS2);                                           \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
+    uint32_t vma = vext_vma(desc);                                        \
     uint64_t index;                                                       \
     uint32_t i;                                                           \
                                                                           \
     for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         index = *((TS1 *)vs1 + HS1(i));                                   \
@@ -5239,11 +5255,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
     uint32_t esz = sizeof(ETYPE);                                         \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
+    uint32_t vma = vext_vma(desc);                                        \
     uint64_t index = s1;                                                  \
     uint32_t i;                                                           \
                                                                           \
     for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         if (index >= vlmax) {                                             \
@@ -5318,10 +5337,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,                 \
     uint32_t esz = sizeof(ETYPE);                                \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz); \
     uint32_t vta = vext_vta(desc);                               \
+    uint32_t vma = vext_vma(desc);                               \
     uint32_t i;                                                  \
                                                                  \
     for (i = env->vstart; i < vl; i++) {                         \
         if (!vm && !vext_elem_mask(v0, i)) {                     \
+            /* set masked-off elements to 1s */                  \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);  \
             continue;                                            \
         }                                                        \
         *((ETYPE *)vd + HD(i)) = *((DTYPE *)vs2 + HS1(i));       \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index c1bd29329e..e58208f363 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -3891,6 +3891,7 @@ static bool int_ext_op(DisasContext *s, arg_rmr *a, uint8_t seq)
     data = FIELD_DP32(data, VDATA, VM, a->vm);
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
 
     tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                        vreg_ofs(s, a->rs2), cpu_env,
-- 
2.37.2


