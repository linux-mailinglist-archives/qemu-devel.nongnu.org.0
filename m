Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FE76F143B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 11:33:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psKT2-0007Ry-B6; Fri, 28 Apr 2023 05:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterlin@andestech.com>)
 id 1psKSy-0007Rk-Hj
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:32:37 -0400
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70]
 helo=Atcsqr.andestech.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterlin@andestech.com>)
 id 1psKSv-0005qg-Kf
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 05:32:36 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by Atcsqr.andestech.com with ESMTP id 33S9WMex064050
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 17:32:22 +0800 (+08)
 (envelope-from peterlin@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.158) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0;
 Fri, 28 Apr 2023 17:32:20 +0800
From: Yu Chien Peter Lin <peterlin@andestech.com>
To: <qemu-devel@nongnu.org>
CC: Yu Chien Peter Lin <peterlin@andestech.com>
Subject: [PATCH 1/2] target: riscv: fix typos
Date: Fri, 28 Apr 2023 17:32:14 +0800
Message-ID: <20230428093214.10289-1-peterlin@andestech.com>
X-Mailer: git-send-email 2.38.0.68.ge85701b4af.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.15.158]
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 33S9WMex064050
Received-SPF: pass client-ip=60.248.80.70; envelope-from=peterlin@andestech.com;
 helo=Atcsqr.andestech.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, RDNS_DYNAMIC=0.982,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix a few minor typos for PMU events.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
---
 target/riscv/cpu.h        | 2 +-
 target/riscv/cpu_helper.c | 2 +-
 target/riscv/pmu.c        | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 638e47c75a..eab518542c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -812,7 +812,7 @@ enum riscv_pmu_event_idx {
     RISCV_PMU_EVENT_HW_INSTRUCTIONS = 0x02,
     RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS = 0x10019,
     RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS = 0x1001B,
-    RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS = 0x10021,
+    RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS = 0x10021,
 };
 
 /* CSR function table */
diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index f88c503cf4..5d3e032ec9 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1210,7 +1210,7 @@ static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
 
     switch (access_type) {
     case MMU_INST_FETCH:
-        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS;
         break;
     case MMU_DATA_LOAD:
         pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
diff --git a/target/riscv/pmu.c b/target/riscv/pmu.c
index fa1e1484c2..0be0e8027b 100644
--- a/target/riscv/pmu.c
+++ b/target/riscv/pmu.c
@@ -62,17 +62,17 @@ void riscv_pmu_generate_fdt_node(void *fdt, int num_ctrs, char *pmu_name)
    fdt_event_ctr_map[4] = cpu_to_be32(0x00000002);
    fdt_event_ctr_map[5] = cpu_to_be32(cmask | 1 << 2);
 
-   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x00 type(0x01) */
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 READ : 0x00 MISS : 0x01 type(0x01) */
    fdt_event_ctr_map[6] = cpu_to_be32(0x00010019);
    fdt_event_ctr_map[7] = cpu_to_be32(0x00010019);
    fdt_event_ctr_map[8] = cpu_to_be32(cmask);
 
-   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x00 type(0x01) */
+   /* SBI_PMU_HW_CACHE_DTLB : 0x03 WRITE : 0x01 MISS : 0x01 type(0x01) */
    fdt_event_ctr_map[9] = cpu_to_be32(0x0001001B);
    fdt_event_ctr_map[10] = cpu_to_be32(0x0001001B);
    fdt_event_ctr_map[11] = cpu_to_be32(cmask);
 
-   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x00 type(0x01) */
+   /* SBI_PMU_HW_CACHE_ITLB : 0x04 READ : 0x00 MISS : 0x01 type(0x01) */
    fdt_event_ctr_map[12] = cpu_to_be32(0x00010021);
    fdt_event_ctr_map[13] = cpu_to_be32(0x00010021);
    fdt_event_ctr_map[14] = cpu_to_be32(cmask);
@@ -317,7 +317,7 @@ int riscv_pmu_update_event_map(CPURISCVState *env, uint64_t value,
     case RISCV_PMU_EVENT_HW_INSTRUCTIONS:
     case RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS:
     case RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS:
-    case RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS:
+    case RISCV_PMU_EVENT_CACHE_ITLB_READ_MISS:
         break;
     default:
         /* We don't support any raw events right now */
-- 
2.34.1


