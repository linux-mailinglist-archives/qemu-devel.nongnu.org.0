Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5B4C0477
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:20:03 +0100 (CET)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdVq-0001yO-Jh
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJd-0005qm-MK
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:07:25 -0500
Received: from [2607:f8b0:4864:20::235] (port=46827
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nMdJV-0005Ms-VN
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:07:25 -0500
Received: by mail-oi1-x235.google.com with SMTP id l25so10517900oic.13
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zrh/zOGfDvjkPoIh5E0qDpCSBF/xnvBM2Qhkj8/bshE=;
 b=BjNsNrQYeJp4fa1fK3ExweQ5Fxo+6PGpaIbTQ6tQePFbWvs1pEzldsLcRe+s36lbRm
 QUVYDWOiEbeGZQ7Wfqbt0U2O4DtkPjgbVwtSDjzDjKtjp3NDbPsC9dabdKzJQuhfPcvI
 JreHReeOSyXHSlw0eWR4pVHdYL2OJRSPk2HweomGVnnR6ukrukvGyyNM6fya/pLpfIen
 xo2b00DmKKVEtKm6Qk5A+8tSrEia1XG8Y5JzxkcAmufuaQNEupEReoz+Yr2SFT/N+afj
 u12wdHi84muOprrdjg9leQXaAGMKn56nOHxqCCCI3Zz/043CGJ56Tecj9DdwDeO2ViwV
 guYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zrh/zOGfDvjkPoIh5E0qDpCSBF/xnvBM2Qhkj8/bshE=;
 b=w62lfOVREUHbJYqBtM0hkkcMXs1jisx5AEXOTbTbb5n0YgZfBND/Thzyp865+xd0Ue
 9UlX2+H2qM2LfY0wwW5vJ2Azy1V8xYJgG/cHBu5O7KLPi2i2FhypcjY+/OyJfiOUx99z
 nb2RP2Qfgfn66aPqVMopTP/kZX6Uit6Ik4WFZQ5o2ZNhT1ZdPBvgr8VCLYK6YUTDntme
 ciqU3J6jPhgq5JEIUUiW/RNiv/9RugcCrDz2mKIMnu7DQHFOFoZ43lGy6WK+0yTlLipS
 FQCl1SOveX1BcirFD1UMn0NxH+ro3D4n02pcpDi+0SLm86aP0Av32DHF1mrqemQiKDkD
 Ml3w==
X-Gm-Message-State: AOAM532F3T1+nF0+fRf5txpVb8hWKqNrbYf3VGRaU21bKKt8M++keKVu
 6+9XZg6Zzx+1MswyuILVy7gAHMfgpAEIog==
X-Google-Smtp-Source: ABdhPJykCCN2htyMG4y/D8OTx4X84k/UdwjribfNf9Czch6Ug7UFn46lJxEH6uri/crt13HFHzmtCQ==
X-Received: by 2002:a05:6808:208d:b0:2d4:cf26:cb6e with SMTP id
 s13-20020a056808208d00b002d4cf26cb6emr2996658oiw.272.1645567636719; 
 Tue, 22 Feb 2022 14:07:16 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id n25sm4901913otq.78.2022.02.22.14.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 14:07:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 6/6] target/riscv: Enable privileged spec version 1.12
Date: Tue, 22 Feb 2022 14:07:04 -0800
Message-Id: <20220222220704.2294924-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222220704.2294924-1-atishp@rivosinc.com>
References: <20220222220704.2294924-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=atishp@rivosinc.com; helo=mail-oi1-x235.google.com
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
index 2668f9c358b2..1c72dfffdc61 100644
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
@@ -474,7 +474,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     }
 
     if (cpu->cfg.priv_spec) {
-        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
+        if (!g_strcmp0(cpu->cfg.priv_spec, "v1.12.0")) {
+            priv_version = PRIV_VERSION_1_12_0;
+        } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.11.0")) {
             priv_version = PRIV_VERSION_1_11_0;
         } else if (!g_strcmp0(cpu->cfg.priv_spec, "v1.10.0")) {
             priv_version = PRIV_VERSION_1_10_0;
@@ -489,7 +491,7 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
     if (priv_version) {
         set_priv_version(env, priv_version);
     } else if (!env->priv_ver) {
-        set_priv_version(env, PRIV_VERSION_1_11_0);
+        set_priv_version(env, PRIV_VERSION_1_12_0);
     }
 
     if (cpu->cfg.mmu) {
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index ff7e36596447..1c70c19cf9bd 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2886,6 +2886,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
+    int csr_min_priv = csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
 
@@ -2918,6 +2919,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
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


