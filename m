Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B824534553F
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 03:05:03 +0100 (CET)
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOWPm-0007Om-PS
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 22:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKZ-0002Kr-LB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:39 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:2067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=709ee912d=alistair.francis@wdc.com>)
 id 1lOWKX-0006u2-MO
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 21:59:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1616464777; x=1648000777;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LECnBNUuCJ7SLj62iaExeXoe+kDx2JkPWICQ8uG/7jo=;
 b=ngkd0TyfbqDyD7tb4Hj8MoiZRCgIJRGvWTL5Vzp6vrWi7j98Pd8SjUH/
 xtgeRMfZJgkCGTAjMK1AzfTVcE8SRusix9etqVZKSNcvDj4oRtMwzQDH5
 MGh4WQoAGUfR6jsePGzsxo4nWiMvU3T0Q5Ee+zy8f2gLrOvm0VJkzH0Pk
 3kYMQoTUK/0Q2wMJyTaiISbkBVIPDoav4U+PdDCcDip1jSNWE9eOEEIKf
 Idgd9b+vEUHM/qZpqaSbhfSlgKRg2W3PNbAEsOMG7r3xXggBJSgGuTO/p
 EYA2EA3T50Js+NPxP+2vxyjQNzCCRp+wQ3rw3eMuE4jfbKLXQCKHekj7H g==;
IronPort-SDR: FHHeK5cbmXq8lLuilQvYfLficjX5kt110m9ePlWOO+vhOcrtJMV9eGxfmjQBlgktDNiJgDdvlG
 sgbe1kd7KFMfjNuhzLFLRYvAsQlpEX/mQnmVSzrw8MExh41f6qfFGL3G13LHDsoivZ9Ox6pCt4
 eH6KqWBoqE3+2ZYauDbPjmcyVdTRhAVNsc/5Vl/ZvZMLdut6u+S6m9zbj1fMjgh3hl4WNtnXTh
 d9MKxpEdDoe1QqnkhdBvFl23xc0OOWNgMzthUreJN9mPXrsHflrt18inlqXUlkfcTa6ULEZeFQ
 mSM=
X-IronPort-AV: E=Sophos;i="5.81,270,1610380800"; d="scan'208";a="162707635"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Mar 2021 09:59:33 +0800
IronPort-SDR: 00o1Ug7u2bwrirQ+SP+FiLhXvMU7nAblDXX3FkWJM+7yvpd5mBM8Lj68n0wf3/3PlVjdLV1h2F
 0a6+0J2bo9eToJB5JgpEZ3c6DCwKAqT8Qzr0uueZQwBC7y1Sbf0UrvqgYpk/EjbG/P5QASZYYQ
 jNnrDeO5WbeDnwm1dLWCkH3TgUnaxvXDnJety5Tt7rCNT6EMr778ry5BohaQyooXNyb62J4Vsq
 VWfcdjsxXqX19rWGi+uimrsqXtkLucFM0sDumrGHsMSfJD6JxMF99yF94CfX4xFhuqQBEOigxl
 R6w9TmRgODebCKK6RvC9TyDD
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:41:41 -0700
IronPort-SDR: qqb3OOHKC0sbwtsoPvie3KbAm9/YnS3XpxpDRyaKUGU52DOVrwhllFY2NEXD0cMhmhTvf43/Ss
 pOfDryKnKw8c9yh07jXNlhz82WRPrdESVu0YdAH5iGeo3GVcV2DSRJ5Nqz2+c2E+dbbK7RmVSx
 AQjIdTETcA/TpYXUSzoUCtTureaFQuNRu2wzQpoyfqD/8MPlb/p8vUsduonSOusanUNydkRJOW
 beQsOuFjTd+ZJvU525GJsL4YtzQcNlzpHRMUoBO5BhsleQyPUXJH56g+wOMAhZQ82LN5qm9s/b
 BGw=
WDCIronportException: Internal
Received: from cn6ntbqq2.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.49.5])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Mar 2021 18:59:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 06/16] target/riscv: Adjust privilege level for HLV(X)/HSV
 instructions
Date: Mon, 22 Mar 2021 21:57:46 -0400
Message-Id: <20210323015756.3168650-7-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210323015756.3168650-1-alistair.francis@wdc.com>
References: <20210323015756.3168650-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=709ee912d=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Georg Kotheimer <georg.kotheimer@kernkonzept.com>

According to the specification the "field SPVP of hstatus controls the
privilege level of the access" for the hypervisor virtual-machine load
and store instructions HLV, HLVX and HSV.

Signed-off-by: Georg Kotheimer <georg.kotheimer@kernkonzept.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210311103005.1400718-1-georg.kotheimer@kernkonzept.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 0515f9aec8..b15a60d8a2 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -368,7 +368,11 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         use_background = true;
     }
 
-    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
+    /* MPRV does not affect the virtual-machine load/store
+       instructions, HLV, HLVX, and HSV. */
+    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+        mode = get_field(env->hstatus, HSTATUS_SPVP);
+    } else if (mode == PRV_M && access_type != MMU_INST_FETCH) {
         if (get_field(env->mstatus, MSTATUS_MPRV)) {
             mode = get_field(env->mstatus, MSTATUS_MPP);
         }
@@ -741,19 +745,18 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     qemu_log_mask(CPU_LOG_MMU, "%s ad %" VADDR_PRIx " rw %d mmu_idx %d\n",
                   __func__, address, access_type, mmu_idx);
 
-    if (mode == PRV_M && access_type != MMU_INST_FETCH) {
-        if (get_field(env->mstatus, MSTATUS_MPRV)) {
-            mode = get_field(env->mstatus, MSTATUS_MPP);
+    /* MPRV does not affect the virtual-machine load/store
+       instructions, HLV, HLVX, and HSV. */
+    if (riscv_cpu_two_stage_lookup(mmu_idx)) {
+        mode = get_field(env->hstatus, HSTATUS_SPVP);
+    } else if (mode == PRV_M && access_type != MMU_INST_FETCH &&
+               get_field(env->mstatus, MSTATUS_MPRV)) {
+        mode = get_field(env->mstatus, MSTATUS_MPP);
+        if (riscv_has_ext(env, RVH) && get_field(env->mstatus, MSTATUS_MPV)) {
+            two_stage_lookup = true;
         }
     }
 
-    if (riscv_has_ext(env, RVH) && env->priv == PRV_M &&
-        access_type != MMU_INST_FETCH &&
-        get_field(env->mstatus, MSTATUS_MPRV) &&
-        get_field(env->mstatus, MSTATUS_MPV)) {
-        two_stage_lookup = true;
-    }
-
     if (riscv_cpu_virt_enabled(env) ||
         ((riscv_cpu_two_stage_lookup(mmu_idx) || two_stage_lookup) &&
          access_type != MMU_INST_FETCH)) {
-- 
2.30.1


