Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C235B552837
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 01:24:14 +0200 (CEST)
Received: from localhost ([::1]:43770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Qkf-0001cK-Sn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 19:24:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3QdE-00019L-7w
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 19:16:32 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:43911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1o3Qd8-0006V6-Ce
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 19:16:30 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 68so6065711pgb.10
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 16:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZuVSkTV60zvZsucT7Fx/e5abIWdp+ZaBnxnCxugKw/c=;
 b=YBSwWX5VKLrjNVIxJ88iHakbF8doXkqO5au4tBTJmPMvsRFXOnc7y+rWroee4Oj6p8
 D1b5P8tErhA0PIIBgKnDmE/Wt2hBMiw6F1HkzsDP+TMRTT4iyr11Cts9HMNgzjO97hk7
 l3lAl5GfEiC49aAvKrGMwUIIo0BYsLTkfZeVcIFSVmL5hTTCGu5Iyl9o7dhQhSkHaWVU
 MRkcOktH0+s92nQO43Uwp1KaWLgETlbVDHEyOin2cp17C+RPWOsgGXS1wA7b7TtYadWz
 hIam/D50BG7e+YVlA/RNskBISkRMQyEb5/5m9LqGZ6DLfIrBdiRILptYWI5w6Euk5hlu
 6xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZuVSkTV60zvZsucT7Fx/e5abIWdp+ZaBnxnCxugKw/c=;
 b=iIDQxbsKasTVxES+vMQ7SbP1033VUBaM0io2dPxe9CClz52fAcePS8i+ZlH1Idyq9d
 GCtuxZwhcErW6rhMkhKgOMNZpHYu9inrfRD2JdpA5Ddmba3DB85lHkuTISiDRJBZozQ3
 7Hy0peyJg41EldOyZOTKmjOeipWgmTn9eaZQ/Y540dA61iMMprIQZBqe44ZxmozRT3WI
 Ybyd6G0UvKR6+SfrkUVhUT5rL8ZbaVySSjsXEeogl3ag4y3LOocfj5q61sz6uwYkTalx
 tAh/XrZagPTEGwBWRR6BbL6QgYCrBS+1iwf4CApihFRhbiKHsIKcpVUvY59qa+9Mc6S7
 lz/Q==
X-Gm-Message-State: AJIora8zCGFsPPxiSzy2ks1sYoXeBzLYsdBLydxSwaFVIz+0Dxs6ymK3
 bozvXrk1mjeV3XfeV7hwY66oqqMQBC/Bcw==
X-Google-Smtp-Source: AGRyM1sk60zq3TDSYH0ubEK+dIB9/+NNbWsAQFqPLi6r28QokqU0r3cWsYv+8RjzhG1TxXkTKDEfTQ==
X-Received: by 2002:a63:84c8:0:b0:40c:7d4a:ac66 with SMTP id
 k191-20020a6384c8000000b0040c7d4aac66mr12347937pgd.424.1655766984430; 
 Mon, 20 Jun 2022 16:16:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a170902a40200b0015e8d4eb285sm9191008plq.207.2022.06.20.16.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 16:16:23 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org,
 frank.chang@sifive.com
Subject: [PATCH v10 10/12] target/riscv: Add few cache related PMU events
Date: Mon, 20 Jun 2022 16:16:00 -0700
Message-Id: <20220620231603.2547260-11-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620231603.2547260-1-atishp@rivosinc.com>
References: <20220620231603.2547260-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 4a6700c89086..99e944a8c115 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -21,10 +21,12 @@
 #include "qemu/log.h"
 #include "qemu/main-loop.h"
 #include "cpu.h"
+#include "pmu.h"
 #include "exec/exec-all.h"
 #include "tcg/tcg-op.h"
 #include "trace.h"
 #include "semihosting/common-semi.h"
+#include "cpu_bits.h"
 
 int riscv_cpu_mmu_index(CPURISCVState *env, bool ifetch)
 {
@@ -1180,6 +1182,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1276,6 +1300,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1


