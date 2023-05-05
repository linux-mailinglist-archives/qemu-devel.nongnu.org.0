Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD656F7A8E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:17:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtD-0000J5-2U; Thu, 04 May 2023 21:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtA-00008O-00
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:36 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujt7-0007XC-Uj
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:35 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-64115eef620so16301391b3a.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248732; x=1685840732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vgul8x4Qi/Uxz9Qmr5Jz3geBJliOPBQT6thdE7BzeNQ=;
 b=NJA2xJ4m7mTqB9Zpcl3dEIz2XDoBB7sdXTxfVQRCCxZEMLieNGjd8LaUGygdvdA2Co
 VXu9LqVQEuyAnJDbLa4E9L4ZkKMu2uaCF915WCmlgJEvpxNc4eFNZy4HQw2tP/lDXGHe
 wWa51CeVmZVHjDFiigvoUuK6rTE7WMldgJKW2BWzWG02XXD9Uzo8z2sYxQsXI88CDBYX
 QkXXB+CxNfTIq684POjt8TuO1LUXTb93Mv9oaVm7t1dEKRGpZFsWjRuPfPX71u5oyKzS
 PLUhXHG3nTlhSU2knVZIxiLd45x8J8nlUopt0J8+pmu2sslmTZC1zIaOuI4Sm96r6MzS
 jTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248732; x=1685840732;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vgul8x4Qi/Uxz9Qmr5Jz3geBJliOPBQT6thdE7BzeNQ=;
 b=D0x83FT0/EcVWa/wqa6hDjxJjtiXLMJB6ZyI15D1Nb8BVbQgD5+3J7BuUqn8MD7Ima
 RfVQvX7NTgMKfaP8iMTCb1g0es/JYARjHOBf7Hz7x/xEDxdOA/qUAYsGC9aNSqO1hWru
 St3CVNIlCVWOqHUJhU4ITPzntzOz1HRgPgT2Ll8W5c4TWhvboJyJENBSlfXJq2rHa+Uv
 PZI3QCvQ+oooYreSOCgv+0Co7s/XXW8HwheG+yJsm1GkU71j+DghrSBij8SUekGTPqlV
 Om+U0LzfZVNBQ6h8/wSy6GYiBVKPcNrjxx5jcBpwxNoAlEVfwYAQbnpOYOdA8OCFzQ+h
 KbTw==
X-Gm-Message-State: AC+VfDzlTUKZfmuuBe5twT0Zl2VNWicIcwhFe+hI0cqxSQ+gHFYNyTXB
 MK2VLchL/5MUqdVbfwGqWuMdC8sYGHk4rQ==
X-Google-Smtp-Source: ACHHUZ7Ye6eMhcfU8XrSywibWPB3iG1yWTXAb4TDVoXprsZfjVbCyy1sAzQtt6SHSLHOtph3vlcGEA==
X-Received: by 2002:a17:903:1208:b0:1a9:7912:850e with SMTP id
 l8-20020a170903120800b001a97912850emr5850883plh.10.1683248732297; 
 Thu, 04 May 2023 18:05:32 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:31 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 39/89] target/riscv: remove cpu->cfg.ext_d
Date: Fri,  5 May 2023 11:01:51 +1000
Message-Id: <20230505010241.21812-40-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Create a new "d" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVD. Instances of cpu->cfg.ext_d and similar are
replaced with riscv_has_ext(env, RVD).

Remove the old "d" property and 'ext_d' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-8-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 -
 target/riscv/cpu.c | 17 ++++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 9a3847329c..fba5e9a33c 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -427,7 +427,6 @@ struct RISCVCPUConfig {
     bool ext_g;
     bool ext_m;
     bool ext_f;
-    bool ext_d;
     bool ext_s;
     bool ext_u;
     bool ext_h;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2e00b8f20a..5bb03e2ee5 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -819,13 +819,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && cpu->cfg.ext_d &&
+                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_f = true;
-        cpu->cfg.ext_d = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -881,7 +880,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_d && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -901,7 +900,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zve32f = true;
     }
 
-    if (cpu->cfg.ext_zve64d && !cpu->cfg.ext_d) {
+    if (cpu->cfg.ext_zve64d && !riscv_has_ext(env, RVD)) {
         error_setg(errp, "Zve64d/V extensions require D extension");
         return;
     }
@@ -961,7 +960,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
             cpu->cfg.ext_zcf = true;
         }
-        if (cpu->cfg.ext_d) {
+        if (riscv_has_ext(env, RVD)) {
             cpu->cfg.ext_zcd = true;
         }
     }
@@ -976,7 +975,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (!cpu->cfg.ext_d && cpu->cfg.ext_zcd) {
+    if (!riscv_has_ext(env, RVD) && cpu->cfg.ext_zcd) {
         error_setg(errp, "Zcd extension requires D extension");
         return;
     }
@@ -1164,7 +1163,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_cpu_cfg(env)->ext_f) {
         ext |= RVF;
     }
-    if (riscv_cpu_cfg(env)->ext_d) {
+    if (riscv_has_ext(env, RVD)) {
         ext |= RVD;
     }
     if (riscv_has_ext(env, RVC)) {
@@ -1499,6 +1498,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVA, .enabled = true},
     {.name = "c", .description = "Compressed instructions",
      .misa_bit = RVC, .enabled = true},
+    {.name = "d", .description = "Double-precision float point",
+     .misa_bit = RVD, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1526,7 +1527,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
     DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
-    DEFINE_PROP_BOOL("d", RISCVCPU, cfg.ext_d, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1647,7 +1647,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_f = misa_ext & RVF;
-        cpu->cfg.ext_d = misa_ext & RVD;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
-- 
2.40.0


