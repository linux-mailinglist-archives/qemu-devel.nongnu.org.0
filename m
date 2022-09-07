Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A25AFECA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:16:41 +0200 (CEST)
Received: from localhost ([::1]:47388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqEh-0003rq-8j
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:16:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3w-0004DI-3l
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:32 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3p-0004Ud-L3
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537923; x=1694073923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T0bUY2VfY75lHSxDuVSpv9CQx8+7wQSl9Ck7YiWTKmo=;
 b=lk8hcM9PNy8ZqFB49zRrqt3giwOER/0IZzSo4zAVP+ABK1HAjOzx5dG1
 u5yuHoc3SVboHRFPeiKORmx95tnX3aiBwkprwrfvqz2CH3Wljzft25qSb
 Q5G6lP0ZUzuprrIlMX5WC++OuCjVtyz3QiSqXJ76zIno5yjOoCH0A9/TD
 LFWPcXOEU2hi9Y3vA0Yi+x5vVNrtZJxF3afdCwvEO1aZEL9IlIz9eJxNy
 3GyD9MxBm9nxe1c3lJmo/gkKVwBoZpVwMIYX5L4C0wSoE2bUEF9c0hUsX
 px4mPWJ8M5kDm3ER8jjn+s2xUSRLeSPw2OrxfS/MlJ5NhJnx+kkePTwWD A==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715017"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:48 +0800
IronPort-SDR: NmYTd3FBhDKImtUVndLBydKsQ7oCnhoBoAIGmg2JxqlmsD5zqoSVLQJQnWNrdkuUuaYh6bpAt7
 AvVwQDyQtg8kNOMnPTJIsk7p37S4Vv8I/TQVK18NNl260EriBv4EazU2dkGONEL0qlxTyulemr
 xiuDChsVFEsKI9fNKYMdN5tjW/qonerwFhknbcPxKBnZpebF8dxtgVjXe+udJZ4l5dQxBrSkLI
 EuOGvlMmFvzstuG/WaM5FlMq19ocvXFJayR/8uQ1mKBf3/rbLvIhYttaGZkOgXLfGxtTDJEwX2
 ghwoTJvhPL+8pgS2HxRP9QOP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:46 -0700
IronPort-SDR: krmLTOtZpB8411S1gR1R7GygXt448vo3JlQP4FxK8wghsnqT0QaGXnvEckLLLAiuHrkXwYHI0G
 AgQkEHMQG4+bLsoaWF9kvrukE1dV91jewyOGKF6lPHBTMJo8M+Yx//3T7E13zgjIkTwOV5LCQG
 xe/TvtPqdSiXTLQd/bhduQ4lq+xAsy56aAK1gEzJD2qldrjOFLdPS9aoexeHKYKZWwGM31Ms/a
 KmI3T28x7KAeC1TjCXDpFm3+CjZqINlSXkrvpJgabv1kkvst9Vl3XybGYd0RHRaoAMAvUNQeHw
 2ac=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:47 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/44] target/riscv: rvv: Add mask agnostic for vector integer
 comparison instructions
Date: Wed,  7 Sep 2022 10:03:28 +0200
Message-Id: <20220907080353.111926-20-alistair.francis@wdc.com>
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
Message-Id: <165570784143.17634.35095816584573691-5@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 10 ++++++++++
 target/riscv/insn_trans/trans_rvv.c.inc |  1 +
 2 files changed, 11 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index d1daa764b7..07ce671879 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1404,12 +1404,17 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1, void *vs2,   \
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
         vext_set_elem_mask(vd, i, DO_OP(s2, s1));             \
@@ -1462,11 +1467,16 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,   \
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
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 83b85bb851..e6aa5295a1 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1718,6 +1718,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
         data =                                                     \
             FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);\
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-- 
2.37.2


