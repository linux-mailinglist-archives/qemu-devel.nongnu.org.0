Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A23531F89
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 02:02:05 +0200 (CEST)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntHzw-0007hY-9h
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 20:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpt-0004X0-US
 for qemu-devel@nongnu.org; Mon, 23 May 2022 19:51:41 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1ntHpr-0000Px-HX
 for qemu-devel@nongnu.org; Mon, 23 May 2022 19:51:41 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 nr2-20020a17090b240200b001df2b1bfc40so587525pjb.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 16:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QrWe5759iqT5XJ9qcHhhRz37JDXHYzjny//8lkVNxNY=;
 b=NwG6rmS9mXewedNF3JdT0ovZJIg3GZydhIjdJjKPnddDhiHp9+ziPMHdB8O3mpfZ3b
 SXJpf6ygX9OrQxCfxCug4FTuhx2dQkcdGt4Ji9M2ecgYnaQJ8LJN39hS12XRlQohxU6b
 pjIFssGpmR1oSR6dj3ylHSMUHMc+QlTqqYrwfaEW2LwtOsWbLg3tVlJNSJPZhYQeiN+j
 622zL59wIn29XN8avVfv5jSWnGNKdq3MvewVPMHT3WfqH5U/83PDcrPdZAUDAdmuUynC
 ORTP2L7VpG1RrH9EWVR0KJF1lsOU2vDYw6fXDtkJH+EForuDJJEKiRHsvaDsebU5dfdH
 5CYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QrWe5759iqT5XJ9qcHhhRz37JDXHYzjny//8lkVNxNY=;
 b=awDBKIp+wn7EwGt68dPhKjc4+7MKyOJsXsvemCk1lue98M1V2G3S4BJAQExzCDHmS8
 AneeyTbwzy7qvOmYpcdrYHWXPhHv6OlSDPojBVv+UQjBhCOHyI0roHddM6OgIpU/Q56w
 vThih0AH+LWKPZmFz+cikZiGzZhI6qPdV6PufVDJ8IHHeaBRGtDNrbPJRX25wr71ZWsY
 MaiVc3DztrsR0y3Jk/o3OmJu5us1kc3D+NK5AQ201vPtKGobjk5x6wdLzH9EI38MpvCm
 xo0dj7Ril0TNa083xLw8zK+d/Gf6Kg9ciFm1h/GPB/t+4VuGill244rcvkE5KYR0CK9t
 sFHw==
X-Gm-Message-State: AOAM530Z0MaXm27nauwfU2DyBP/C9xnkNozegFrhQOO39v7Vv7G6QKZf
 O715f75ZowCbvhzJ/1ezKvfaHA==
X-Google-Smtp-Source: ABdhPJxq09Jw6ETTxaWCSnFNNIjYqLB3731cctpYfHYAdtSMd7QIGGthQ61qCsA4uf9mrfm6QCsbLA==
X-Received: by 2002:a17:90b:3ecd:b0:1dc:94f2:1bc0 with SMTP id
 rm13-20020a17090b3ecd00b001dc94f21bc0mr1566040pjb.32.1653349898147; 
 Mon, 23 May 2022 16:51:38 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 pl15-20020a17090b268f00b001df4b919937sm257084pjb.16.2022.05.23.16.51.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 16:51:37 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v9 09/12] target/riscv: Simplify counter predicate function
Date: Mon, 23 May 2022 16:50:54 -0700
Message-Id: <20220523235057.123882-10-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220523235057.123882-1-atishp@rivosinc.com>
References: <20220523235057.123882-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=atishp@rivosinc.com; helo=mail-pj1-x102e.google.com
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

All the hpmcounters and the fixed counters (CY, IR, TM) can be represented
as a unified counter. Thus, the predicate function doesn't need handle each
case separately.

Simplify the predicate function so that we just handle things differently
between RV32/RV64 and S/HS mode.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/csr.c | 111 ++++-----------------------------------------
 1 file changed, 10 insertions(+), 101 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 723b52d836d3..e229f53c674d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -74,6 +74,7 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     CPUState *cs = env_cpu(env);
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
+    target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
     bool rv32 = riscv_cpu_mxl(env) == MXL_RV32 ? true : false;
 
@@ -82,122 +83,30 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
         base_csrno += 0x80;
     }
     ctr_index = csrno - base_csrno;
+    ctr_mask = BIT(ctr_index);
 
     if ((csrno >= CSR_CYCLE && csrno <= CSR_INSTRET) ||
         (csrno >= CSR_CYCLEH && csrno <= CSR_INSTRETH)) {
         goto skip_ext_pmu_check;
     }
 
-    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & BIT(ctr_index)))) {
+    if ((!cpu->cfg.pmu_num || !(cpu->pmu_avail_ctrs & ctr_mask))) {
         /* No counter is enabled in PMU or the counter is out of range */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
 skip_ext_pmu_check:
 
-    if (env->priv == PRV_S) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env->mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env->mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env->mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->mcounteren, 1 << ctr_index)) {
-                return RISCV_EXCP_ILLEGAL_INST;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env->mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env->mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env->mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->mcounteren, 1 << ctr_index)) {
-                    return RISCV_EXCP_ILLEGAL_INST;
-                }
-                break;
-            }
-        }
+    if ((env->priv == PRV_S) && (!get_field(env->mcounteren, ctr_mask))) {
+        return RISCV_EXCP_ILLEGAL_INST;
     }
 
     if (riscv_cpu_virt_enabled(env)) {
-        switch (csrno) {
-        case CSR_CYCLE:
-            if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                get_field(env->mcounteren, COUNTEREN_CY)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_TIME:
-            if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                get_field(env->mcounteren, COUNTEREN_TM)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_INSTRET:
-            if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                get_field(env->mcounteren, COUNTEREN_IR)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        case CSR_HPMCOUNTER3...CSR_HPMCOUNTER31:
-            if (!get_field(env->hcounteren, 1 << ctr_index) &&
-                 get_field(env->mcounteren, 1 << ctr_index)) {
-                return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-            }
-            break;
-        }
-        if (rv32) {
-            switch (csrno) {
-            case CSR_CYCLEH:
-                if (!get_field(env->hcounteren, COUNTEREN_CY) &&
-                    get_field(env->mcounteren, COUNTEREN_CY)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_TIMEH:
-                if (!get_field(env->hcounteren, COUNTEREN_TM) &&
-                    get_field(env->mcounteren, COUNTEREN_TM)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_INSTRETH:
-                if (!get_field(env->hcounteren, COUNTEREN_IR) &&
-                    get_field(env->mcounteren, COUNTEREN_IR)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            case CSR_HPMCOUNTER3H...CSR_HPMCOUNTER31H:
-                if (!get_field(env->hcounteren, 1 << ctr_index) &&
-                     get_field(env->mcounteren, 1 << ctr_index)) {
-                    return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
-                }
-                break;
-            }
+        if (!get_field(env->mcounteren, ctr_mask)) {
+            /* The bit must be set in mcountern for HS mode access */
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
+        } else if (!get_field(env->hcounteren, ctr_mask)) {
+            return RISCV_EXCP_VIRT_INSTRUCTION_FAULT;
         }
     }
 #endif
-- 
2.25.1


