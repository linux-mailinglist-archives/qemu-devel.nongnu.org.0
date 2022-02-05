Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FB14AA535
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Feb 2022 01:55:50 +0100 (CET)
Received: from localhost ([::1]:38024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG9Mi-0005X1-0T
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 19:55:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94Z-00026g-PR
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:37:03 -0500
Received: from [2607:f8b0:4864:20::335] (port=35636
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nG94X-0001nV-P4
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 19:37:03 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 o9-20020a9d7189000000b0059ee49b4f0fso6320180otj.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 16:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a7th6gIracB4kCH9B3bm0pIvdSCT1y3um6Z4gju1Bg0=;
 b=BxtLmksi0wIGesT6PRqQk+2PbUWfLXuWYxFWgGnPxz8zjI/+VejIUYHwfj6suRccPy
 nOtUeQHYlN4bB6F8RwjjgPtZafSzlnhrRbEaA3lTJ1dBZbn4u1JlGkyILXO1r9lhN+fo
 G4G+Un+YqYgKBdsZnFzFJebqteeGwRoROFPRbYmrMS+9wSs+RqbyjuwiTAlWcH0diuuu
 TKrhV0xig0NJ5RtEO3FZgnhpC/Pye1laPIEOfuvzMzvp6VMVyKQy8es3sI50yXi2vizL
 wvZW0bm9dTHYFbKGA4dyPVk7qgmYFHdLZ7jwQ6o5uqKx435+YN19Lel8ULg6abqwZbt/
 tVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a7th6gIracB4kCH9B3bm0pIvdSCT1y3um6Z4gju1Bg0=;
 b=6FpShpjWTcK6ja/H36jubJAuwMvDcT0CEp9t9D07hdj1eGZCXGF8Jx3HUdeqwYJ8ia
 /U5x3PMvwCXe5H9Axy/KafRYqUDrW+4stj2946FSuQ89bPugprl3PyrmpQdtTD3zZb1S
 8Z8f8U2TdCxuEKdsX8ntSGvl5xTYYi51FLHYepGFDEw9kPXOhrS91lVela+ZL02GEDPW
 eujlE4t8B2Nm24oFcGLVvSM/YKBt5byK5UoB08qFmtxqmO4RegnWSKBHs2MpxvBt1PNg
 xgYL/OvAX4VDfnAGF3qnU487MUkdX670i9CzVGO8MiNaIpmHuQXToxBibM8x3USCPQQ+
 bQ+w==
X-Gm-Message-State: AOAM530wonseW+hIZ7a1OQBfv9qsHwJoeoORNR6TjX7690PE/IuCiM/j
 j1/vHmRchnZtwYURH1Q+UKT4U7juQTWngoFZ
X-Google-Smtp-Source: ABdhPJxgVelwhcGtTSTeU8b3yX47CrXbDDOcugKzUv9qyPsQ6AuZEI+rIwD7Gs0rPkqkzhNYw/qcXQ==
X-Received: by 2002:a05:6830:120b:: with SMTP id
 r11mr568044otp.182.1644021419338; 
 Fri, 04 Feb 2022 16:36:59 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id c22sm1148888oao.43.2022.02.04.16.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 16:36:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 6/6] target/riscv: Enable privileged spec version 1.12
Date: Fri,  4 Feb 2022 16:36:05 -0800
Message-Id: <20220205003605.1150143-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220205003605.1150143-1-atishp@rivosinc.com>
References: <20220205003605.1150143-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=atishp@rivosinc.com; helo=mail-ot1-x335.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
index 88c839a5ffaa..4e381053927d 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -2866,6 +2866,7 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
 {
     /* check privileges and return RISCV_EXCP_ILLEGAL_INST if check fails */
     int read_only = get_field(csrno, 0xC00) == 3;
+    int csr_min_priv = csr_ops[csrno].min_priv_ver;
 #if !defined(CONFIG_USER_ONLY)
     int effective_priv = env->priv;
 
@@ -2898,6 +2899,10 @@ static inline RISCVException riscv_csrrw_check(CPURISCVState *env,
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


