Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3F46A93CE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:22:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0zU-0008JV-0x; Fri, 03 Mar 2023 03:42:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zM-0008A8-JY
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:05 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@rivosinc.com>)
 id 1pY0zK-0007vc-Vd
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:42:04 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so5449996pjb.1
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677832922;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ANT6yA8og6cp2JQNgcvNlobtrKvjn+I9WXjZe6xjdC4=;
 b=tqdWQAQMXsh5yVQc6+BuzL+1Dkw1OUiZx9Y+uOLX+ckQWJiyWPCyAids08zQ7CRCgr
 VT7BaZY42qn+zlzBf7dTKheu6EwDicIxqwIyQ1po3TmXZou5CbxjvtYiSr8q9seljT+z
 mAbspahSMa7tkvijuqeO+vXUHd8hRN2D6/PqJ5Z6bSSrTDlzm0R2ZsXtpNHy8pvJWhlF
 kwxJfrZNLt2OK7p5347B5/eq+O/AHuxi0V2xG3jl2aQXQjdHsjaBLyGQxpbaA4ff1cbO
 2PMQymV0QaKkaIfUO1eOBC9haiszSpCbG/V5bV9P/Yf3HDXKIK/MqvI4nLf0zBUho9Qy
 R4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832922;
 h=to:from:cc:content-transfer-encoding:mime-version:references
 :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ANT6yA8og6cp2JQNgcvNlobtrKvjn+I9WXjZe6xjdC4=;
 b=VemhtVYN6G0CErmJKFOLdZPCm7BrLALWkEIC7fQ5SdewKkSd9YhbO3tZ5QFmcIiPYe
 H8w1L5dMMrCRhGT+dNY2q0OlBY957TIXIVikTmQp6S1X14Q4jrXz4BghjUn0UwIOpjjp
 RW/Sjj9/9MNdo8z6WkSi8+a6KhnAKOMJzzXGCbL9Undko2+HmIg1NUpubOLaTHDy/rSm
 biMpwCdJADacHrQbN+abGClBFpR0HWOHkcECIo2ZlgIoJqKxUp4Jyx1xXjHPQ4hig5cq
 MxsiBDD7Q3CB8gYTKz1e3agw0uSCy7Gh0ntaCi/e2yZu2BOa9GOWohFI7yO5vGN6OuDO
 jspQ==
X-Gm-Message-State: AO0yUKVwFTfFphGw3A8TNseZIdyJ0WCUvopD8ybOjRDGWLJWRSa0gTyB
 GS60If/SibSoN7fV0CCEG9I3PQ==
X-Google-Smtp-Source: AK7set/N6XcF6ldW4ZLzt0yvjXIhS5OhVpfnV0qmm11CDtuPdAxMBv0a/5f2gn7P/R0dCXY0WOPunw==
X-Received: by 2002:a17:90b:3e8e:b0:233:ee50:d28b with SMTP id
 rj14-20020a17090b3e8e00b00233ee50d28bmr963340pjb.16.1677832922195; 
 Fri, 03 Mar 2023 00:42:02 -0800 (PST)
Received: from localhost ([135.180.224.71]) by smtp.gmail.com with ESMTPSA id
 15-20020a17090a0f0f00b002310ed024adsm678130pjy.12.2023.03.03.00.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 00:42:01 -0800 (PST)
Subject: [PULL 33/59] target/riscv: Simplify getting RISCVCPU pointer from env
Date: Fri,  3 Mar 2023 00:37:14 -0800
Message-Id: <20230303083740.12817-34-palmer@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
References: <20230303083740.12817-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: qemu-riscv@nongnu.org,          qemu-devel@nongnu.org,
 Bin Meng <bmeng@tinylab.org>, Weiwei Li <liweiwei@iscas.ac.cn>,
 LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=palmer@rivosinc.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bmeng@tinylab.org>

Use env_archcpu() to get RISCVCPU pointer from env directly.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Message-ID: <20230228104035.1879882-10-bmeng@tinylab.org>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 target/riscv/csr.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index a3e0e5755c..8e827362cc 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -46,8 +46,7 @@ static RISCVException smstateen_acc_ok(CPURISCVState *env, int index,
                                        uint64_t bit)
 {
     bool virt = riscv_cpu_virt_enabled(env);
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (env->priv == PRV_M || !cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_NONE;
@@ -90,8 +89,7 @@ static RISCVException fs(CPURISCVState *env, int csrno)
 
 static RISCVException vs(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (env->misa_ext & RVV ||
         cpu->cfg.ext_zve32f || cpu->cfg.ext_zve64f) {
@@ -108,8 +106,7 @@ static RISCVException vs(CPURISCVState *env, int csrno)
 static RISCVException ctr(CPURISCVState *env, int csrno)
 {
 #if !defined(CONFIG_USER_ONLY)
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     int ctr_index;
     target_ulong ctr_mask;
     int base_csrno = CSR_CYCLE;
@@ -166,8 +163,7 @@ static RISCVException ctr32(CPURISCVState *env, int csrno)
 #if !defined(CONFIG_USER_ONLY)
 static RISCVException mctr(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     int ctr_index;
     int base_csrno = CSR_MHPMCOUNTER3;
 
@@ -195,8 +191,7 @@ static RISCVException mctr32(CPURISCVState *env, int csrno)
 
 static RISCVException sscofpmf(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_sscofpmf) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -321,8 +316,7 @@ static RISCVException umode32(CPURISCVState *env, int csrno)
 
 static RISCVException mstateen(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -333,8 +327,7 @@ static RISCVException mstateen(CPURISCVState *env, int csrno)
 
 static RISCVException hstateen_pred(CPURISCVState *env, int csrno, int base)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -363,8 +356,7 @@ static RISCVException sstateen(CPURISCVState *env, int csrno)
 {
     bool virt = riscv_cpu_virt_enabled(env);
     int index = csrno - CSR_SSTATEEN0;
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     if (!cpu->cfg.ext_smstateen) {
         return RISCV_EXCP_ILLEGAL_INST;
@@ -918,8 +910,7 @@ static RISCVException read_timeh(CPURISCVState *env, int csrno,
 
 static RISCVException sstc(CPURISCVState *env, int csrno)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
     bool hmode_check = false;
 
     if (!cpu->cfg.ext_sstc || !env->rdtime_fn) {
@@ -1152,8 +1143,7 @@ static RISCVException write_ignore(CPURISCVState *env, int csrno,
 static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
                                      target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     *val = cpu->cfg.mvendorid;
     return RISCV_EXCP_NONE;
@@ -1162,8 +1152,7 @@ static RISCVException read_mvendorid(CPURISCVState *env, int csrno,
 static RISCVException read_marchid(CPURISCVState *env, int csrno,
                                    target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     *val = cpu->cfg.marchid;
     return RISCV_EXCP_NONE;
@@ -1172,8 +1161,7 @@ static RISCVException read_marchid(CPURISCVState *env, int csrno,
 static RISCVException read_mimpid(CPURISCVState *env, int csrno,
                                   target_ulong *val)
 {
-    CPUState *cs = env_cpu(env);
-    RISCVCPU *cpu = RISCV_CPU(cs);
+    RISCVCPU *cpu = env_archcpu(env);
 
     *val = cpu->cfg.mimpid;
     return RISCV_EXCP_NONE;
-- 
2.39.2


