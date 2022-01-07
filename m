Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634C348703F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 03:17:41 +0100 (CET)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5ep2-0005Ig-66
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 21:17:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRl-0001aR-5o
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:49:34 -0500
Received: from [2607:f8b0:4864:20::232] (port=42545
 helo=mail-oi1-x232.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1n5dRj-0003Xd-Bq
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 19:49:32 -0500
Received: by mail-oi1-x232.google.com with SMTP id w80so6116908oie.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 16:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=37u6j7pc0R3Ygux+uuwwnDcDeg6VENiH2FLX5eNaeJ0=;
 b=aOpphZnUZQvIRBdNbmO9otrKfE1Ld0zAQ6ESPynRxxbYc34+AD400hYaYLFwnVjWXV
 5Wvi2DeDxfU5umSfIUuUj7y9m6SN1hfKbDrswVVx/utZ1kdXpWkHVYUxBBiZCwWDOWsl
 33yLgkWc0cLQDa1fUYJF18v7VG3mBTeMedU+c6phLt2jjnroBnc9kc7hstfrTqCrUike
 vjX/4UqRs0l6tc3f5YF5XnHRXAMDdCj7i1/++4ue/OMj+rM5rIp4ns634As6CiBBjxYx
 graVWH9jkp0F+4GUhgyTiJ6VmtTfryTxx+N2KjHhCSTvOnGp0cNWLxtauxsq8rq+X90j
 Mbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=37u6j7pc0R3Ygux+uuwwnDcDeg6VENiH2FLX5eNaeJ0=;
 b=OJeGMkpiSuaJwzCJdqDRrB7dM5req2HT2nO3L8V6b6ctRuHDWrDJYGdbZHJ/+sQ4TB
 JYq2lzrdia1EmCQbruf8n0U5G3qyRpSy7nUMC3S9Yy63XWWeYOM92t8L5QWLQ845lUDK
 Aznlbf2gdEe+FBaa9+ZiJAwYx1n/0Jc5yu7QpELKwgi0qlrBLI9BAqX3b8G57+wVg6eX
 wdsAcrKfr68zA57jAqnOcS5NiSnr5g0tnx3AP8kzXmEb6PI6FsGeLJGU0wEkhY8LReFa
 89M06ZP63zhXmcFzq/IlvpBpN/UnhzmTx2P4UzbMxmvs/Nou82EsKtZ83ctFkfbG4k3m
 0GGw==
X-Gm-Message-State: AOAM533FEO7IdpTwonAJcyhNCyqISx/LOVd2ZXSi7Sa7MdeXjaTpOYh2
 sxwY6hEiXU3f1968lZvoD6pU2Nzn1RoBRjq2
X-Google-Smtp-Source: ABdhPJz7bnSiQYBr4DgwoXkdJq+4p2z6B6vRzqDHr1GceRJDFNtm0vj/myUM1s9JhHb4ddEcdhNHww==
X-Received: by 2002:aca:d704:: with SMTP id o4mr8393070oig.99.1641516570209;
 Thu, 06 Jan 2022 16:49:30 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id e4sm678441oiy.12.2022.01.06.16.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 16:49:29 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/11] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Thu,  6 Jan 2022 16:48:38 -0800
Message-Id: <20220107004846.378859-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220107004846.378859-1-atishp@rivosinc.com>
References: <20220107004846.378859-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::232
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 06 Jan 2022 21:14:01 -0500
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
Cc: qemu-riscv@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Atish Patra <atish.patra@wdc.com>

The PMU counters are supported via cpu config "Counters" which doesn't
indicate the correct purpose of those counters.

Rename the config property to pmu to indicate that these counters
are performance monitoring counters. This aligns with cpu options for
ARM architecture as well.

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 2 +-
 target/riscv/cpu.h | 2 +-
 target/riscv/csr.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6ef3314bced8..df87489f6d87 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -627,7 +627,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index dc10f27093b0..16d0b4f139ee 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -312,7 +312,7 @@ struct RISCVCPU {
         bool ext_zbb;
         bool ext_zbc;
         bool ext_zbs;
-        bool ext_counters;
+        bool ext_pmu;
         bool ext_ifencei;
         bool ext_icsr;
         bool ext_zfh;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 823cc306d74b..a6e856b896a9 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -65,8 +65,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu) {
+        /* The PMU extension is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.30.2


