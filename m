Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE3A374BED
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 01:31:17 +0200 (CEST)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leQz6-0001ib-IN
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 19:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsL-0007y3-Uu
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:17 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:33229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=752564754=alistair.francis@wdc.com>)
 id 1leQsJ-0000cg-VK
 for qemu-devel@nongnu.org; Wed, 05 May 2021 19:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1620257056; x=1651793056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yFRLTCdAcyqhfcygvlqGQ7lXNGX9GsANpwxchwLWEg0=;
 b=lhslraTzXwWggDo5YJTmJ5yLrV+f6OJutKDhG7J/WEpdxqEwFmBJSYlM
 2W3CsDlBza7Hdkqya0q1vnXbPY+jhxjEPrQEl87YkUkPoga23UkA0GuxE
 CW6Iq9iYVClcD0RpNR3tYs8WZRevvkOw1QhnSpluO7bPI+3yRHSs8FJma
 ZfuqPerSv2wsylm96Qq4IDxsyskioJqhqAOOkg4K90pj1SsB7VtOg7pSs
 EMfm0r+4k/66FU2ZYPfuRVPSXo/PY7tgGjelCw1DEi/NpzEC9SQa483Hq
 RHHmIr912dbLRXAfjf/YI6TQ55/5BdG4KlAinSjLkPm9FHOaNYGFxPDNW w==;
IronPort-SDR: dmvo2j3QP0wWKKqh7lw0jAgG4IMmQiMyZDCxgfIj/8AxTPkA3eislLZqoUL3p7attREdupGW2+
 VnBpaEjL496eeoYuKTuClGr2G0/aL6IW1wVdvJ4/hZoIb6gJlbcBbvajbY1wfFQXkNsGcZvSpa
 UeY35peRYr2aa4wWc74WNuPM2Y7uEEWSzHWltDOdTPw2GDyBeCVg6JWIxjyXU9x1d2Ld0QZlmT
 TP/+xjzbHQuaTKEBDWaMavc584n1GrQ3JnXbwZ5KlGGSW1A92WnDbBgNCPlnxeVju39C6v0xaT
 KbA=
X-IronPort-AV: E=Sophos;i="5.82,276,1613404800"; d="scan'208";a="166585928"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 06 May 2021 07:24:14 +0800
IronPort-SDR: cMsEDHfEsd1jI4Em1VCa2dXn+1nr7CYOAqVRtSv1eVWc+Z2rcBwvBi76rOFR5Cg7ocm8ByCzCy
 yQEMVrQK+rgzkJ6jj4GOLe/1oTuNuvLLKgWjo6QmfnSGZFnYw3OXOMeZmx6cyhZxN0iWJvd1v7
 Ri7BdNTMjnegj1zCtRb1BUTqQUELJHpiIMj2x2LcRjdvTfhnpbbfL/7FkBGrq1GnAQ10EWxC6C
 N1DTvyFegTvqpiLr8QnUAJc5Xbiv2HYgwBIGp11WNKFbUg7fgOrW6aBXOK/4XhiqYXCT7TXWWM
 cxmxUBdiKCpnM0wDRUKLDO3K
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 16:02:55 -0700
IronPort-SDR: s5A4UaMdxUFnmnrYXdDI+IEjp7J2730fCDBCqlWCAtBB07yDHkPnxEbCw6pGoBkXoNUWNQRZMP
 ObZWQhKTNSASCATTDGyzywpD/a2srX4Gm181G1jVOWZ4MrK2luQrFuBt6ENOImwD+zVo7zStgi
 MVgxujRdB0qhO2ALc+bSfQxItYKYb3NFy5ejbHp5f96a5jIXiQa3rG1WHQnKbioYULIyOwfHG+
 28ilZaJe6e53HdpJD2fPK7/k++OWQGI+K56OB4eXfe8cMN8Kti0iUf36XezfgkNBgJSV8poa7F
 S3w=
WDCIronportException: Internal
Received: from unknown (HELO alistair-risc6-laptop.wdc.com) ([10.225.165.46])
 by uls-op-cesaip01.wdc.com with ESMTP; 05 May 2021 16:24:12 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL v2 17/42] riscv: don't look at SUM when accessing memory from a
 debugger context
Date: Thu,  6 May 2021 09:22:47 +1000
Message-Id: <20210505232312.4175486-18-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505232312.4175486-1-alistair.francis@wdc.com>
References: <20210505232312.4175486-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=752564754=alistair.francis@wdc.com;
 helo=esa4.hgst.iphmx.com
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


