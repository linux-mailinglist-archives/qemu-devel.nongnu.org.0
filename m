Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9646A582087
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 08:56:27 +0200 (CEST)
Received: from localhost ([::1]:39564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGay0-0000la-F5
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 02:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarF-0002ow-KV
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:49:25 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:40531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1oGarB-0003DG-SQ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 02:49:24 -0400
Received: by mail-pl1-x630.google.com with SMTP id x7so1453462pll.7
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 23:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D/VjWM0J+rR8xAS7iOwrdTtOwWSXtXsbBRJhDPNIvng=;
 b=gOTuAx2tajc3qycqZeZANfS5QeYtFCI7+KSldqV1FNJ7r0oDD+02q6D/YWY9iijWb+
 Ol8FGm7yn8/UCwdGJSzTPmOu/WSeCURpTak008GQcsXagmFkV56JtfSViIMdWTUxFRtp
 4FhL9R7FJRjKzyAW8QM21tCx7zAYqZBHbMdoejMXao6DkNkqtDERulwquQSvkil3sV0L
 w1JaooLU2j3LdVFWdBIGBusxkL4vLs9ZmwzssNcevwdHUhbCDKyGEmTBTFcVs0fKHX9q
 8Ur3zFqjw2LLnt4l7CtQAMDOB7tT/WU0O0y3kDlEfKxATxpBB2pK2bOo273NmMn/iE7G
 6gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D/VjWM0J+rR8xAS7iOwrdTtOwWSXtXsbBRJhDPNIvng=;
 b=M/461WFoOua9aCSnNjYE5lQgOw8eRBKIn15ABOutN+5bUGi5SdzSunAI2cjhRJUuop
 pK2H6R0GS9tyzWXRbmzUKcejn92N6gAdPWZgUAnS7bzibhf3v+3GX9oNJ1JlLo3/iVVK
 FlCKYDqKo0rDR09mYmcTT20XXIc6rWbKkrjGoPs7DR/C2EWUNFBKrNLs1KJEoPeeE+vZ
 usiXTV+HBJ6FZHcOmzkrCrZkCLgvIEG0LhhGCrf8G9NfysQaBCu6Ceskl+wRt1CPixxp
 Yzl1owm07883UBsPTMD+FZLu1t4cGEyjyr2EfB02SrcFa+ZP7+kzCPjoONIiJcUM+bki
 PcEg==
X-Gm-Message-State: AJIora9wu7LS8L1o3bFBETWWK8mw//Yj2hK7U8i2ZwOCxVY4MBwMHOE+
 OcS2B856ySCWnRm6M9KWQClVf/UIR6AhbQ==
X-Google-Smtp-Source: AGRyM1vlglq5nzuBnJPE3u71PsCQHUhaBno+XcIsMHeNgXyrZBP0LMuye8o5UhWmVZMiyf85onxAVA==
X-Received: by 2002:a17:902:c40c:b0:16d:b4c9:c360 with SMTP id
 k12-20020a170902c40c00b0016db4c9c360mr883722plk.26.1658904560428; 
 Tue, 26 Jul 2022 23:49:20 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a170902ab9000b0016d2d2c7df1sm12764851plr.188.2022.07.26.23.49.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 23:49:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Heiko Stuebner <heiko@sntech.de>, Atish Patra <atishp@rivosinc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 qemu-riscv@nongnu.org
Subject: [PATCH v11 3/6] target/riscv: Add few cache related PMU events
Date: Tue, 26 Jul 2022 23:49:10 -0700
Message-Id: <20220727064913.1041427-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727064913.1041427-1-atishp@rivosinc.com>
References: <20220727064913.1041427-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=atishp@rivosinc.com; helo=mail-pl1-x630.google.com
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
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu_helper.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index 59b3680b1b23..37afb4e0cc72 100644
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
@@ -1176,6 +1178,28 @@ void riscv_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
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
@@ -1272,6 +1296,7 @@ bool riscv_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
             }
         }
     } else {
+        pmu_tlb_fill_incr_ctr(cpu, access_type);
         /* Single stage lookup */
         ret = get_physical_address(env, &pa, &prot, address, NULL,
                                    access_type, mmu_idx, true, false, false);
-- 
2.25.1


