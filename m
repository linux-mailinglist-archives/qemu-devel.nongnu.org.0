Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D269C5B0065
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 11:27:28 +0200 (CEST)
Received: from localhost ([::1]:55536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVrLD-0000No-MK
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 05:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq5M-0004yv-QP
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:07:07 -0400
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:2013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=242877ce7=alistair.francis@wdc.com>)
 id 1oVq5K-0004pz-La
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 04:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1662538017; x=1694074017;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=07wvMxi+Bhh8SzH6Zuz2FF1SUXcJ4NMAfGNpYXCm2YM=;
 b=jrGq4UM9n54E/9XyL0s9yAyRgfducEUAw0M+LBdWYnnrfTQ6lYzeHxoV
 BErLEmi6yuvHbbbsp5M64ylFBPEnmbJZhBImE32QUhTpvfjjxMWZIqRhE
 NrfKX5aEVX26DnDr+1nCu2MqqlyzTjxbcrJg8VcBXVZ4yD/fkrCcLxNUP
 kMFSJlY0GcSf5OcukZQZ8M79O9ZIsDYlTrMOeQjbXSgWBah061cZOSO4g
 MqsXLXipBRie0CY+aq/vavTZUW7u5uIFhSAVuD9FGW0NNaDO7bJw1TbA9
 BfAYhyO7U3CsuoLjK5eBnfW2gGRrVTcSDfKxDGI4M6aaFMHy5qCc371se g==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654531200"; d="scan'208";a="210715138"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Sep 2022 16:05:33 +0800
IronPort-SDR: 7Q/zgOyyW45L6wHcl+sy1tS9B+sMWKQ6FPWsVji8f9yJ//aZDO8bsoK8XMpCO46xFZK8Hzni8R
 l7IPI2zPs/Oj0KdWUyEuCO3THn4tlpQl2WUuGw9MIbY31jC0TVIhOOvqLPMUkqZk4An82//d80
 1KueaKbOZsVc2a7BfLU6vXfIzQWk4hHriZu3s4NowAtsVOozAWrU+2tvpAdufyUiP14FGownbj
 iw2Sl/mxe3m39moIfwgNCbKZHihwHre1hjo6LdOmqTpHyv7P62jaAHtu55II5pTGQDU7NTN452
 L5nte2NX1ShKMShvOk/hm1OG
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Sep 2022 00:20:31 -0700
IronPort-SDR: XsCVtEV93qwutHyKnFKASu0659zfYZ/k5T0r+yF8n++OhFAHcPOVS5yoaOoaBGddJ87DsysUr0
 AsjZnnYAnJ4hvsQvFJluwKpMlnjLsJYN1dRUhew98AEJm5/XJU1FIu3RXHv5d8xlg0q0TjLMvw
 mqE2Y8GI9r0XyhEgofmi+nKHaNvrSgy6EGQvrlJly/6s6pSJHilEYo80agHGrhWfQ5AUWU21IO
 8Dd/klY1reXhjJ6SdbSKLZ3BWZ790naL52RLZNYUI2fa2a1++hpdlAXjb+0+wdO7j4ntKO9fN0
 ltk=
WDCIronportException: Internal
Received: from unknown (HELO toolbox.wdc.com) ([10.225.167.94])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Sep 2022 01:05:33 -0700
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alistair23@gmail.com, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>
Subject: [PULL 42/44] target/riscv: Add few cache related PMU events
Date: Wed,  7 Sep 2022 10:03:51 +0200
Message-Id: <20220907080353.111926-43-alistair.francis@wdc.com>
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

From: Atish Patra <atish.patra@wdc.com>

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
Message-Id: <20220824221701.41932-4-atishp@rivosinc.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 719c5d5d02..67e4c0efd2 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,11 +21,13 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "instmap.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1189,6 +1191,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
+
+static void pmu_tlb_fill_incr_ctr(RISCVCPU *cpu, MMUAccessType access_type)
+{
+    enum riscv_pmu_event_idx pmu_event_type;
+
+    switch (access_type) {
+    case MMU_INST_FETCH:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_ITLB_PREFETCH_MISS;
+        break;
+    case MMU_DATA_LOAD:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_READ_MISS;
+        break;
+    case MMU_DATA_STORE:
+        pmu_event_type = RISCV_PMU_EVENT_CACHE_DTLB_WRITE_MISS;
+        break;
+    default:
+        return;
+    }
+
+    riscv_pmu_incr_ctr(cpu, pmu_event_type);
+}
+
 bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr)
@@ -1287,6 +1311,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.37.2


