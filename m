Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640295AFEF5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 10:28:21 +0200 (CEST)
Received: from localhost ([::1]:45382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVqPs-0006KU-Fi
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 04:28:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3h-0004AW-2K
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:17 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:1896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq3f-0004Ol-EF
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662537913; x=1694073913;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2iSlpZqM9K5o2Cua4qswJGNPQ3pXbRMInX5i+w0Lktw=;
 b=MLfaoVjE0JzxXqG2wYAY0LZgx12TKqz9F5XMOTe3CnZVimHBC5wpwUNu
 r2LjFiWxHiO6DsTlBzr8sqjEWq2fCHZKt+BuvabGyJhO//n/cZ6FuvPwM
 p6HJisaUniaeT5uWKhuGWv0mQamg7vaNrvoGkGooOwFx+1wh8nqPA/jqO
 TWTiwwmQGU2lPoTet83OFyJB9puh9zNdBv8GvcD2+IoREd5BhN+6tW83T
 ZTZ6EkbT4Ky9I/ZiVZ5mPKMpEOwvKmW0YYOQyYpyeummMLYO/pW63gaiw
 32N8obKquaO0XPRgtY1YQJMOFnMfijvL1LdluLR4pertoR7EvITSLuLFx Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715008"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:04:44 +0800
IronPort-SDR: wLpCwAPxT2nmCCmgZ9uueIV6Pke+Y/HmcRocnZWh/KB8iVlEwx1aHYbPulJJ+VjB0/4DQyFGIm
 PcMmMJyaN6j7SCyWiQTlxeZo9DWfosGq9Xq+vG0ghr6LgSbuwO/shXd12Ner4YoRhibDNziYJ9
 ZBBlb4AE5bwmp1DC/sxHwdNhsDrOGud2+JVtNePb1I00Sg2lWXb3pM9wJLDXg5CmESEnMzn+Aa
 pJ1AgnzceuyG3ExXyHlJWF+xWi9PjJ+t7SgcqhEpAl7GaAOz42El2zxVnXPEG8oIYsVvzRJzb1
 cj/nN2UTeAH3SsmX79/9uWAr
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:19:42 -0700
IronPort-SDR: KAgNd4igv94P4Zotu/vZuwQSMeY9VJskDLwQuMDffE1Qq9QAvWu4Pnv3JbzotlTPCqkURalM1V
 XNl0MXPuDG2LHg+ig3k0IgDmW98MavKxOVFnRxAU0cZavnbBjNCoK4m/OVYzmM701RBiyNhJdr
 ahw1Ff46SYzD+iADVLbEaU35GjDN1EQolEn+3DFn/umYoBHgGQuBYxuVoNuHtvMh2npDPWelZd
 nIm0eHIrqrcgtWrg9U/jT9H0jjM4y8HwPVv3T6OuJGevtGckRBbWbyMRbr+KQRfJptfFYcaK2c
 d0Q=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:04:43 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, "Yueh-Ting (eop) Chen" <eop.chen@sifive.com>,
 Frank Chang <frank.chang@sifive.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 17/44] target/riscv: rvv: Add mask agnostic for vx instructions
Date: Wed,  7 Sep 2022 10:03:26 +0200
Message-Id: <20220907080353.111926-18-alistair.francis@wdc.com>
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
Message-Id: <165570784143.17634.35095816584573691-3@git.sr.ht>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/vector_helper.c            | 3 +++
 target/riscv/insn_trans/trans_rvv.c.inc | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index e3810d2bc3..6be3c4e739 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -899,10 +899,13 @@ static void do_vext_vx(void *vd, void *v0, target_long s1, void *vs2,
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
         fn(vd, s1, vs2, i);
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 0627eda0c0..07d86551a9 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1301,6 +1301,7 @@ static bool opivx_trans(uint32_t vd, uint32_t rs1, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
     data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
 
@@ -1468,6 +1469,7 @@ static bool opivi_trans(uint32_t vd, uint32_t imm, uint32_t vs2, uint32_t vm,
     data = FIELD_DP32(data, VDATA, LMUL, s->lmul);
     data = FIELD_DP32(data, VDATA, VTA, s->vta);
     data = FIELD_DP32(data, VDATA, VTA_ALL_1S, s->cfg_vta_all_1s);
+    data = FIELD_DP32(data, VDATA, VMA, s->vma);
     desc = tcg_constant_i32(simd_desc(s->cfg_ptr->vlen / 8,
                                       s->cfg_ptr->vlen / 8, data));
 
-- 
2.37.2


