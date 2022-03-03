Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E354CC593
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:02:54 +0100 (CET)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPqiz-00045Q-N9
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:02:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbM-0007cO-6J
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:55:00 -0500
Received: from [2607:f8b0:4864:20::330] (port=41574
 helo=mail-ot1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nPqbK-00027T-M3
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 13:54:59 -0500
Received: by mail-ot1-x330.google.com with SMTP id
 k22-20020a9d4b96000000b005ad5211bd5aso5399950otf.8
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 10:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/HJyg2t4f3FC3j2AtaIbs2iFCNzMPxA4uZU0p+mRihM=;
 b=s/W4FBrAE8GbdU9WutV1NYh8BjCeNwN9phCSBmxeSnd92HJNsj1o8EY5u4y+Bads5A
 CKbHQdbqUoJFf7sHdluFyD0B7ZpWATYNz3voKrAjAUfIYfWXRVxoR7QS9MEjseJTDdQ6
 RxrwJrsTGa82yXz8stf5Wbu3rFsCv6gSgJPXUxceTPWzIWB1mo+IFqQoE0zgKesFfWHu
 dy7Mw5JtDzVKC9W6zhTVhqa9uPsBua2Qtjr9TG0RUcQXQtrDxsZJeWLkOon/OZXqcAD7
 eRXP4jkRwoOumcxfrF4Z42gUKLcKCLxI8k4d8nKN+dl3M4TfcPOAS9nPgqu5V1CR0VWo
 XTow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/HJyg2t4f3FC3j2AtaIbs2iFCNzMPxA4uZU0p+mRihM=;
 b=sbWxzEwvK1aJQkl5dWD/Q63OQW/RUoOItsdeyYhkNqA+/BQf9N7gHYor77mUfb+AcV
 ua22AsYzGTN3L1OHZwz2UAd0u2ynBKJ9qpGJ5QjtXBcTyp8JjBbReX4fZ/+PC8X7ZwQc
 CQxH+cahYVK8z5uAbSf0NmcVPXQgrWIXG5EBBbWH8u8CYG/FsuxVaMrlS9rR2gS5lGkQ
 eDndo4Y8ECMSP2m3tpxeg4RrOOu2ZB3GqyqJJ8K1MLxhBZUjCgOcDGee8Yvp8+UBjwvB
 IIJZ48HKLMkIqNeOaLxqckrI/OBRAv+nKxJMdZgMwr8Acc/6P1cgKCrmQBPKcF26JMDO
 4UXQ==
X-Gm-Message-State: AOAM532iJIIr3XjrZ/z3q1s0QzLDPu9wEUR7YCQiYMeblmLQdWRrS2C2
 LyDxYJFM125OTMEhli98NfjOpiCngmnulw==
X-Google-Smtp-Source: ABdhPJxtOUmh2ddyvGGTqdd48JHlAJKx8wCs8996e+cDPi5ogtC1w5jeETZh2fDPQ96I5Q6pGNo01g==
X-Received: by 2002:a9d:f26:0:b0:5af:43f9:8a1f with SMTP id
 35-20020a9d0f26000000b005af43f98a1fmr19977606ott.375.1646333697486; 
 Thu, 03 Mar 2022 10:54:57 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 u24-20020a4ae698000000b0031c286f2e0csm1331052oot.29.2022.03.03.10.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:54:57 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 6/6] target/riscv: Enable privileged spec version 1.12
Date: Thu,  3 Mar 2022 10:54:40 -0800
Message-Id: <20220303185440.512391-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303185440.512391-1-atishp@rivosinc.com>
References: <20220303185440.512391-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::330
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x330.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Virt machine uses privileged specification version 1.12 now.
All other machine continue to use the default one defined for that
machine unless changed to 1.12 by the user explicitly.

This commit enforces the privilege version for csrs introduced in
v1.12 or after.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 target/riscv/cpu.c | 8 +++++---
 target/riscv/csr.c | 5 +++++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index ddda4906ffb7..c3fd018ecb6e 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -150,7 +150,7 @@ static void riscv_any_cpu_init(Object *obj)
 #elif defined(TARGET_RISCV64)
     set_misa(env, MXL_RV64, RVI | RVM | RVA | RVF | RVD | RVC | RVU);
 #endif
-    set_priv_version(env, PRIV_VERSION_1_11_0);
+    set_priv_version(env, PRIV_VERSION_1_12_0);
 }
 
 #if defined(TARGET_RISCV64)
@@ -503,7 +503,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version = PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
             priv_version = PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version = PRIV_VERSION_1_10_0;
@@ -518,7 +520,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     if (priv_version) {
         set_priv_version(env, priv_version);
     } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_11_0);
+        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
 
     if (cpu->cfg.mmu) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index c34722caf97f..b1876b3b6466 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2972,6 +2972,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
+    int csr_min_priv = csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
 
@@ -3004,6 +3005,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
+    if (env->priv_ver < csr_min_priv) {
+        return RISCV_EXCP_ILLEGAL_INST;
+    }
+
     return csr_ops[csrno].predicate(env, csrno);
 }
 
-- 
2.30.2


