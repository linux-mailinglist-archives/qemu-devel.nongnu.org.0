Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4103722FC
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:30:55 +0200 (CEST)
Received: from localhost ([::1]:56858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldh5a-0003h8-MP
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgq6-0005d7-2v
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:54 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:28402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=750139ea6=alistair.francis@wdc.com>)
 id 1ldgq3-0000ID-3J
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620080090; x=1651616090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFRLTCdAcyqhfcygvlqGQ7lXNGX9GsANpwxchwLWEg0=;
 b=Mclb+qd0uSu6q3sZMFcdF3Y3G81oZrMCkUbDPfOKV68krpkZDC6QujBU
 iS+jYDEEV3YbSx5ta1f/nxe++g5k4GAKlirKLoKrToXFvuiTLe9RSC4W7
 sokIut/V+0b/xqPHp02YyL4mh+lEu5CcmuI/ekGF2LhkK7JFhOJYDULY+
 7czs0RU7eZjcIbGDWo/4eRr9r6iWw7RVEeQdBuTlB7Za5s+QnQYmrSvvf
 mI2PuK2hEmjXOPx5Q6RPHIOiDiXqtEFE/xXZJkxuXBmeIbpIGD//bbnZT
 DO0LZO0oID+U5hQ3Fa38RI3T/ti3azHPDT6MC2r6xnDMeXzpGYZIf/PYO w==;
IronPort-SDR: K3+HbnuYs6iOAAEcmfCcjRjpriSSB8O9kgK6Z/6LkQnF06k8PcbVyi4WYsTslD8iFFviYv/+6R
 qN1aHMjlyuz0j2E3dLJ5vPo4wa65672GYOU0jTnbdMEb5qj5XjCScwVw+efGcFY10yOXJn6P0t
 7u/rSP2L7VTJfKbIFLMypfcs/Hd9rWpIcmwykgoxACqSn8O8FSo3roJG2saSPmYF/X2K7HkAq2
 GNojdeWOQHGeAPZtpJNwTw2Y7CPBpVRmbivM9YjT7AWmxJez1ZlVzYgcSSF1S6j3T8b1bGSW67
 flU=
X-IronPort-AV: E=Sophos;i="5.82,271,1613404800"; d="scan'208";a="278114651"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 May 2021 06:14:36 +0800
IronPort-SDR: UKkESx0pBesdjXCDxLPmCZbCLvFGEIGLPDNSgxrAHa4xQJSyE40xNMItz6mkuU34+lYZPmGW/B
 o517kLiqANpSgJTtipUcuzGZ/YfnZApH5AELUUaP/sZ4QiUrcYthYDMQUgFsGYpCp9ey01B6Zz
 N7mbt4A+0Y6e1Ql0g8CugP7KxMZ7oIoHj+04aWMUGdFsT19yhIPbfnFnJ+9ki01f+xbOGJHA3R
 1l5wE3UUl4YvFXs6YQwo6YUVdN1QBckEl60fZBNKzYBANMqW/TFcY57FblyK5VpTvfWnvmQEPw
 QePMyvNmbpMCQZ3SGPJvn4g2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2021 14:54:47 -0700
IronPort-SDR: 0MHO0whaCFb+2tNJWSgaV//7CpI8Pb4brRaAEwE0dWcerfEcbiZVyW9hTRvWf4rBQhCNYy+7Gm
 r35g9rGx692gjouGx2TPTfnnK1vaTtef+hni4lw/CccY7w/iYJjEIhWl4KzxFUhjN/ionMKk3+
 3z0UPv/Da8Gw4gqt1OSNKGcnZvXDqNirLiZihezXAmWdaEl5Ie170g9Mn5KDlNeBFGsH+TWg68
 LKePJu+dP5hIRbTy79rcWfQmrigKul1RWDgFmFm3CQf2kyTRFr+t8c1x1neuk2uT6DOwHfuoib
 II8=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.45])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 May 2021 15:14:34 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 17/42] riscv: don't look at SUM when accessing memory from a
 debugger context
Date: Tue,  4 May 2021 08:13:02 +1000
Message-Id: <20210503221327.3068768-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503221327.3068768-1-alistair.francis@wdc.com>
References: <20210503221327.3068768-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=750139ea6=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
 qemu-devel@nongnu.org, Jade Fink <qemu@jade.fyi>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jade Fink <qemu@jade.fyi>

Previously the qemu monitor and gdbstub looked at SUM and refused to
perform accesses to user memory if it is off, which was an impediment to
debugging.

Signed-off-by: Jade Fink <qemu@jade.fyi>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210406113109.1031033-1-qemu@jade.fyi
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 99cc388db9..659ca8a173 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -342,12 +342,14 @@ static int get_physical_address_pmp(CPURISCVState *env, int *prot,
  * @first_stage: Are we in first stage translation?
  *               Second stage is used for hypervisor guest translation
  * @two_stage: Are we going to perform two stage translation
+ * @is_debug: Is this access from a debugger or the monitor?
  */
 static int get_physical_address(CPURISCVState *env, hwaddr *physical,
                                 int *prot, target_ulong addr,
                                 target_ulong *fault_pte_addr,
                                 int access_type, int mmu_idx,
-                                bool first_stage, bool two_stage)
+                                bool first_stage, bool two_stage,
+                                bool is_debug)
 {
     /* NOTE: the env->pc value visible here will not be
      * correct, but the value visible to the exception handler
@@ -416,7 +418,7 @@ static int get_physical_address(CPURISCVState *env, hwaddr *physical,
         widened = 2;
     }
     /* status.SUM will be ignored if execute on background */
-    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background;
+    sum = get_field(env->mstatus, MSTATUS_SUM) || use_background || is_debug;
     switch (vm) {
     case VM_1_10_SV32:
       levels = 2; ptidxbits = 10; ptesize = 4; break;
@@ -475,7 +477,8 @@ restart:
             /* Do the second stage translation on the base PTE address. */
             int vbase_ret = get_physical_address(env, &vbase, &vbase_prot,
                                                  base, NULL, MMU_DATA_LOAD,
-                                                 mmu_idx, false, true);
+                                                 mmu_idx, false, true,
+                                                 is_debug);
 
             if (vbase_ret != TRANSLATE_SUCCESS) {
                 if (fault_pte_addr) {
@@ -666,13 +669,13 @@ hwaddr riscv_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
     int mmu_idx = cpu_mmu_index(&cpu->env, false);
 
     if (get_physical_address(env, &phys_addr, &prot, addr, NULL, 0, mmu_idx,
-                             true, riscv_cpu_virt_enabled(env))) {
+                             true, riscv_cpu_virt_enabled(env), true)) {
         return -1;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
         if (get_physical_address(env, &phys_addr, &prot, phys_addr, NULL,
-                                 0, mmu_idx, false, true)) {
+                                 0, mmu_idx, false, true, true)) {
             return -1;
         }
     }
@@ -768,7 +771,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
         /* Two stage lookup */
         ret = get_physical_address(env, &pa, &prot, address,
                                    &env->guest_phys_fault_addr, access_type,
-                                   mmu_idx, true, true);
+                                   mmu_idx, true, true, false);
 
         /*
          * A G-stage exception may be triggered during two state lookup.
@@ -790,7 +793,8 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             im_address = pa;
 
             ret = get_physical_address(env, &pa, &prot2, im_address, NULL,
-                                       access_type, mmu_idx, false, true);
+                                       access_type, mmu_idx, false, true,
+                                       false);
 
             qemu_log_mask(CPU_LOG_MMU,
                     "%s 2nd-stage address=%" VADDR_PRIx " ret %d physical "
@@ -825,7 +829,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
     } else {
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
-                                   access_type, mmu_idx, true, false);
+                                   access_type, mmu_idx, true, false, false);
 
         qemu_log_mask(CPU_LOG_MMU,
                       "%s address=%" VADDR_PRIx " ret %d physical "
-- 
2.31.1


