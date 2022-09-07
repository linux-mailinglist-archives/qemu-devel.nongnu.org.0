Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2677D5AFFE5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:07:40 +0200 (CEST)
Received: from localhost ([::1]:57106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVr1x-0001gO-1B
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq40-0004HA-9O
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:36 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3v-0004UV-MY
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537931; x=1694073931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WOG7zVbUXdFw2YyY1lux6cyVolVOCnLAE6lJrjKhEOI=;
 b=hUB3u5crrcwTAnu+fAyvHFyCwd9vGuxLQLXb0W7r72uigRRhuF9UOjnK
 pH6HAXV4DiEjI1EPKI+v5MoJG6ryFy5BmRxxI4ck6UTis2rXPtScKrQFE
 VwWiPGpjcKIR03MC3+XPsfpJCEVsFN7pYiaIpN6jyYhTswDaQC4RyZlKy
 TgUFw6c1Zp/9IGzcYEEUm/1EkLF0BjzWUhMgI/wsjJyxsh2i1ldwN9cOe
 o0J34jWh+0anS2DpBW5NUyVta50+xI5GB6iqLVAZjaniK15gINJbbXbDr
 FBlnzCvMBVcSH32TgtdaY7qKj0SKWPAInU7zmy6xw0s4Amn7mfnelM1Ms g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715029"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:52 +0800
IronPort-SDR: jVg081feTRCDfz/IiFc2t2VndTqU3G8HOs9f4im2vIgz77d8uU1KWtQN1jGu+2IS10xsmuqGG0
 kGgC0pPrl0w45SxkWyR7lyjHVeXQb5DES/yGpBYv5TUe/jnxL073TOAKtpKjq6LHxZYemyW8Hz
 9+VYZqSVoQDP/N/PQWTFPqjX6Rws/EsBWQ51alUxa46HPGALIHmbw0+ihN6SL5fo/eDVwjwHtB
 djWr11WDLco8qIuKGjDWfdML3TeK/q2hCTX/ZdDGcYMUwFvtPAfztZRDMy7k1QUrYbVAKWD9LK
 mnLEQTFqlrPA/Z8uqU4rtc+g
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:50 -0700
IronPort-SDR: P2XAi07fvww70ECoo2LuDOFjobmkCXWzthtyUVM4ebbm2timEkAwWyBo9E9+qMXlpdzK4Jb+S1
 3m4nUwh/zjsOLtZy/FU6hGmdFmeuDNIvIji2+NIijLKjM/gXe9snbjnq2cTdliSUc4K6nKaYNw
 5xkt/JZOn1jHteB1alchiQJxz9aWq48vgkzV/OZWcS9YYQsMJVRAwUAqAlJKKLS9I42NvKX30a
 bkIE3QLPbSKAd+k65LAfGrpe46niXgHLdmaUOhRca8cBj5R0yf1O4z6bVt+b2OqBMqbV3d+L6R
 oAk=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:52 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 21/44] target/riscv: rvv: Add mask agnostic for vector
 floating-point instructions
Date: Wed,  7 Sep 2022 10:03:30 +0200
Message-Id: <20220907080353.111926-22-alistair.francis@wdc.com>
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
Message-Id: <165570784143.17634.35095816584573691-7@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 26 +++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 12 ++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 597fa9c752..315742c6b8 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -3051,10 +3051,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
     uint32_t total_elems =                                \
         vext_get_total_elems(env, desc, ESZ);             \
     uint32_t vta = vext_vta(desc);                        \
+    uint32_t vma = vext_vma(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i = env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
+            /* set masked-off elements to 1s */           \
+            vext_set_elems_1s(vd, vma, i * ESZ,           \
+                              (i + 1) * ESZ);             \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, vs1, vs2, i, env);                  \
@@ -3090,10 +3094,14 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1,        \
     uint32_t total_elems =                                \
         vext_get_total_elems(env, desc, ESZ);              \
     uint32_t vta = vext_vta(desc);                        \
+    uint32_t vma = vext_vma(desc);                        \
     uint32_t i;                                           \
                                                           \
     for (i = env->vstart; i < vl; i++) {                  \
         if (!vm && !vext_elem_mask(v0, i)) {              \
+            /* set masked-off elements to 1s */           \
+            vext_set_elems_1s(vd, vma, i * ESZ,           \
+                              (i + 1) * ESZ);             \
             continue;                                     \
         }                                                 \
         do_##NAME(vd, s1, vs2, i, env);                   \
@@ -3665,6 +3673,7 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     uint32_t total_elems =                             \
         vext_get_total_elems(env, desc, ESZ);          \
     uint32_t vta = vext_vta(desc);                     \
+    uint32_t vma = vext_vma(desc);                     \
     uint32_t i;                                        \
                                                        \
     if (vl == 0) {                                     \
@@ -3672,6 +3681,9 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     }                                                  \
     for (i = env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i, env);                    \
@@ -4182,12 +4194,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
     uint32_t vl = env->vl;                                    \
     uint32_t total_elems = env_archcpu(env)->cfg.vlen;        \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);              \
+    uint32_t vma = vext_vma(desc);                            \
     uint32_t i;                                               \
                                                               \
     for (i = env->vstart; i < vl; i++) {                      \
         ETYPE s1 = *((ETYPE *)vs1 + H(i));                    \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                    \
         if (!vm && !vext_elem_mask(v0, i)) {                  \
+            /* set masked-off elements to 1s */               \
+            if (vma) {                                        \
+                vext_set_elem_mask(vd, i, 1);                 \
+            }                                                 \
             continue;                                         \
         }                                                     \
         vext_set_elem_mask(vd, i,                             \
@@ -4215,11 +4232,16 @@ void HELPER(NAME)(void *vd, void *v0, uint64_t s1, void *vs2,       \
     uint32_t vl = env->vl;                                          \
     uint32_t total_elems = env_archcpu(env)->cfg.vlen;              \
     uint32_t vta_all_1s = vext_vta_all_1s(desc);                    \
+    uint32_t vma = vext_vma(desc);                                  \
     uint32_t i;                                                     \
                                                                     \
     for (i = env->vstart; i < vl; i++) {                            \
         ETYPE s2 = *((ETYPE *)vs2 + H(i));                          \
         if (!vm && !vext_elem_mask(v0, i)) {                        \
+            /* set masked-off elements to 1s */                     \
+            if (vma) {                                              \
+                vext_set_elem_mask(vd, i, 1);                       \
+            }                                                       \
             continue;                                               \
         }                                                           \
         vext_set_elem_mask(vd, i,                                   \
@@ -4342,10 +4364,14 @@ void HELPER(NAME)(void *vd, void *v0, void *vs2,       \
     uint32_t total_elems =                             \
         vext_get_total_elems(env, desc, ESZ);          \
     uint32_t vta = vext_vta(desc);                     \
+    uint32_t vma = vext_vma(desc);                     \
     uint32_t i;                                        \
                                                        \
     for (i = env->vstart; i < vl; i++) {               \
         if (!vm && !vext_elem_mask(v0, i)) {           \
+            /* set masked-off elements to 1s */        \
+            vext_set_elems_1s(vd, vma, i * ESZ,        \
+                              (i + 1) * ESZ);          \
             continue;                                  \
         }                                              \
         do_##NAME(vd, vs2, i);                         \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index e6aa5295a1..8ce3d28603 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2361,6 +2361,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
         data =                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2446,6 +2447,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)            \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);              \
         data = FIELD_DP32(data, VDATA, VTA_ALL_1S,                \
                           s->cfg_vta_all_1s);                     \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);              \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,           \
                            fns[s->sew - 1], s);                   \
     }                                                             \
@@ -2485,6 +2487,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),   \
                            vreg_ofs(s, a->rs1),                  \
                            vreg_ofs(s, a->rs2), cpu_env,         \
@@ -2525,6 +2528,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2562,6 +2566,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
@@ -2602,6 +2607,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)           \
         data = FIELD_DP32(data, VDATA, VM, a->vm);               \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);           \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);             \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);             \
         return opfvf_trans(a->rd, a->rs1, a->rs2, data,          \
                            fns[s->sew - 1], s);                  \
     }                                                            \
@@ -2686,6 +2692,7 @@ static bool do_opfv(DisasContext *s, arg_rmr *a,
         data = FIELD_DP32(data, VDATA, VM, a->vm);
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
         data = FIELD_DP32(data, VDATA, VTA, s->vta);
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),
                            vreg_ofs(s, a->rs2), cpu_env,
                            s->cfg_ptr->vlen / 8,
@@ -2790,6 +2797,7 @@ static bool trans_vfmv_v_f(DisasContext *s, arg_vfmv_v_f *a)
             TCGv_i32 desc;
             uint32_t data = FIELD_DP32(0, VDATA, LMUL, s->lmul);
             data = FIELD_DP32(data, VDATA, VTA, s->vta);
+            data = FIELD_DP32(data, VDATA, VMA, s->vma);
             static gen_helper_vmv_vx * const fns[3] = {
                 gen_helper_vmv_v_x_h,
                 gen_helper_vmv_v_x_w,
@@ -2891,6 +2899,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -2944,6 +2953,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3012,6 +3022,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
@@ -3067,6 +3078,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmr *a)              \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_3_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs2), cpu_env,           \
                            s->cfg_ptr->vlen / 8,                   \
-- 
2.37.2


