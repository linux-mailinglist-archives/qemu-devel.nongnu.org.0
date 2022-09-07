Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 792085AFF0A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:32:45 +0200 (CEST)
Received: from localhost ([::1]:44786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqUG-0003v3-EJ
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:32:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3k-0004BX-Jh
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:31 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3i-0004UV-4d
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537916; x=1694073916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gqLqNTqWmpjhGf8FIw5YBY+jtMiOA3WF1uyBragFHJI=;
 b=bBUJ1sUgw3HlTvs1Ia2dq6MpBi5heZHpPMNNzdWCYkQ2fhtUNLJ5aU96
 EtGhNRbSRx80nOLAAZ5+CP+mCkLOuhyjCEs6FiB4AwBkiPQ99ghUZ2Ral
 yGNWcQWC+UkQmixjl9WHbsmez90kgWN1mslZBbvpi6byuAWCXW8tL+1Wu
 6gV7PPKL/QvBhAeO2srXI6nmR8gNpTvvzEpk0TfAUl9J+fy0OiGIzI4ut
 TfLTiXgrhhUa0njszDwVcw38dsU5u3Plwz0XrCWVV8hdciZzslqkMrLqb
 A/+fu8DA1ge49ny2m2m2pxwUqHKodwosYLn6CCXUY0lPd2jDVWzCfriBV Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715013"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:46 +0800
IronPort-SDR: hl/aYKSi7sIehLDIEj8ue6kBXjA7DXC74Ku3vsVSwM+5+RW4LpVqfXu1WIuQmZrPSHyUffGbH3
 5xTnFdJr7ORPHM5YNxcZ1wq8UmeeZYsreqkY0mIxTeuQNldWs+YFuMMMypG5/Fc+3+s7CA/BFf
 u5UkL8Qr1YJTFMeMyY8cpBLDZNYiXlWGwZtnqdNCttBmiKWqaglnxV4Zws9zZMR94e1NKN6vsu
 r5jFFJgpiFZdR7nxdJJbmTTAw/bZXddPD2SEsA70LhyvYxN2OTh1R6F+K9QeZkLViSEQNhrenJ
 NFnhxlmlarDGPgdWLla9xOtn
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:44 -0700
IronPort-SDR: om7joaCu+8QOQifT+2eyzoYJg+yK5A/TIITARC10YNH3+dAj7xWuWg9kgsa1HCeqSC7+wAhuXq
 BlGmnuocMFc+5b+LtOhCejXESRQqTDae/PnoQy0FByJcBa0ScdSA+7m0d0FMHZc1LItBYwwL3u
 Bfhs92n+hLVIcz19TNt+Lt/DMvILcky+5guMZoxSbImQYoXvgQqFvQ7YvfWGHTbRyEouL00dUS
 IaaS/8pFBpNxXubuTmWVjb0M+FVMjcdyia4cwKMWhKJ7ti9hAZaR04+cviztkcl/LwTJbciIOY
 1sI=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:45 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 18/44] target/riscv: rvv: Add mask agnostic for vector integer
 shift instructions
Date: Wed,  7 Sep 2022 10:03:27 +0200
Message-Id: <20220907080353.111926-19-alistair.francis@wdc.com>
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
Message-Id: <165570784143.17634.35095816584573691-4@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 7 +++++++
 target/riscv/insn_trans/trans_rvv.c.inc | 1 +
 2 files changed, 8 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 6be3c4e739..d1daa764b7 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -1298,10 +1298,13 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,                          \
     uint32_t esz = sizeof(TS1);                                           \
     uint32_t total_elems = vext_get_total_elems(env, desc, esz);          \
     uint32_t vta = vext_vta(desc);                                        \
+    uint32_t vma = vext_vma(desc);                                        \
     uint32_t i;                                                           \
                                                                           \
     for (i = env->vstart; i < vl; i++) {                                  \
         if (!vm && !vext_elem_mask(v0, i)) {                              \
+            /* set masked-off elements to 1s */                           \
+            vext_set_elems_1s(vd, vma, i * esz, (i + 1) * esz);           \
             continue;                                                     \
         }                                                                 \
         TS1 s1 = *((TS1 *)vs1 + HS1(i));                                  \
@@ -1339,10 +1342,14 @@ void HELPER(NAME)(void *vd, void *v0, target_ulong s1,      \
     uint32_t total_elems =                                  \
         vext_get_total_elems(env, desc, esz);               \
     uint32_t vta = vext_vta(desc);                          \
+    uint32_t vma = vext_vma(desc);                          \
     uint32_t i;                                             \
                                                             \
     for (i = env->vstart; i < vl; i++) {                    \
         if (!vm && !vext_elem_mask(v0, i)) {                \
+            /* set masked-off elements to 1s */             \
+            vext_set_elems_1s(vd, vma, i * esz,             \
+                              (i + 1) * esz);               \
             continue;                                       \
         }                                                   \
         TS2 s2 = *((TS2 *)vs2 + HS2(i));                    \
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 07d86551a9..83b85bb851 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1901,6 +1901,7 @@ static bool trans_##NAME(DisasContext *s, arg_rmrr *a)             \
         data = FIELD_DP32(data, VDATA, VM, a->vm);                 \
         data = FIELD_DP32(data, VDATA, LMUL, s->lmul);             \
         data = FIELD_DP32(data, VDATA, VTA, s->vta);               \
+        data = FIELD_DP32(data, VDATA, VMA, s->vma);               \
         tcg_gen_gvec_4_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, 0),     \
                            vreg_ofs(s, a->rs1),                    \
                            vreg_ofs(s, a->rs2), cpu_env,           \
-- 
2.37.2


