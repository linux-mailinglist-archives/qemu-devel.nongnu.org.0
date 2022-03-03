Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E224CCA98
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 01:11:31 +0100 (CET)
Received: from localhost ([::1]:53918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPvXe-0004HY-1z
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 19:11:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHk-0003qz-Jt
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:55:04 -0500
Received: from [2607:f8b0:4864:20::734] (port=37494
 helo=mail-qk1-x734.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPvHi-0003d5-Vn
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 18:55:04 -0500
Received: by mail-qk1-x734.google.com with SMTP id v5so5274650qkj.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 15:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bpzbdEbflLz87fODEao4q3bZvbQAhTB7hffle9QzzR0=;
 b=rvYTiP2MtioVCRu+m2fzqzNa2ZyFTzjVcCEbqDfsax/cmSO9IskTIUCii38mcC3np9
 jUKk5i2UNYkLR1pSdz8cbKPMeSAbvlRiYL6vfgRMu+Ox0aGWutWjzvBqmv83Kv2FsrdL
 g3cuALOPiq1Ev2JUlkWmzwGqUXPakDELXJtGwIajdPpc7/SxANdVWwrKJ4tVFqV9f91G
 19hdF/qodZ/vl9+4SjTAI7UKkk5+yPxa9lw2XsfEUYsV+q52wT6ew0b/lFqxxiABKJhl
 DJCOU9bhFGPx34/Du1wSCNk9xQeNYx+xMQwZ9SJ07ggdn3IjeyJICQuMF01gDTXQchxw
 edgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bpzbdEbflLz87fODEao4q3bZvbQAhTB7hffle9QzzR0=;
 b=NYbYotris3PARdlELeiYjEHJ4RyW4KBuSK8pU4pgm+PlWwBUNw3UkuNAP3xVXagX7K
 4nVz0HAFCkE0Ej3Ea7VXsI2+f8S0e6UWA3/J2YtE1xoVSEO8nFtOmiRrRhhmVDX1+B4m
 Z+gMbddUKTgeEBKKGToLpXxUjvLfEWx7U74VLlpUs3ikR7A6zpbQMR4daanYmuQxTeGL
 h2BYNprCnjXDQAwP6PtqMMz5HQPPfD1Wyqa5/+r+qo6aAF9bKcoAjwqZoKNwRX53kALy
 0R1E4Gv2Lhql8iWzTIepzz/xY4elBcKREXOVfp09eR1plRE5nEJ2/q2Y2VJAWXTCTtUu
 7gBQ==
X-Gm-Message-State: AOAM532p+iWMt+xU35SUwGDevpWzdLKArkXDNeB1EywS6oXxz7KiLuBs
 Cl/9e5m6jLrvj28VDpmZ/GeQkuy84bgbaA==
X-Google-Smtp-Source: ABdhPJzhLVhOAIlCE/pCOUBSyZBFDdKA9ZM4jc3kK+tCsNZV/DPvt8KPznqgsbRjiDh8FJNFAywIsA==
X-Received: by 2002:a05:620a:1673:b0:62c:da57:aa32 with SMTP id
 d19-20020a05620a167300b0062cda57aa32mr1085659qko.203.1646351701802; 
 Thu, 03 Mar 2022 15:55:01 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 h188-20020a376cc5000000b00648d7e2a36bsm1768390qkc.117.2022.03.03.15.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 15:55:01 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 10/12] target/riscv: Add few cache related PMU events
Date: Thu,  3 Mar 2022 15:54:38 -0800
Message-Id: <20220303235440.638790-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303235440.638790-1-atishp@rivosinc.com>
References: <20220303235440.638790-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::734
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=atishp@rivosinc.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

Qemu can monitor the following cache related PMU events through
tlb_fill functions.

1. DTLB load/store miss
3. ITLB prefetch miss

Increment the PMU counter in tlb_fill function.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 1c60fb2e8057..72ae1a612ae8 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,10 +21,13 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1178,6 +1181,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     riscv_raise_exception(env, cs->exception_index, retaddr);
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
@@ -1274,6 +1299,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.30.2


