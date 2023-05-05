Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF316F7A69
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:10:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtG-0000qo-Rs; Thu, 04 May 2023 21:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtE-0000gR-H8
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:40 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtC-0007Xi-ET
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-517bdd9957dso777347a12.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248735; x=1685840735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6iiRDMO1BoKrdTyUbzxXDF1q/gFGnkP+7i3/uiWy+N0=;
 b=dKpYtEedMcucsSBafHJOMiW+XCMwBJPvO93orka7qCG0czak+23tn4HIQSvBhq4fhs
 ghE8v66U84A06bCFECDGcSy3N0tDvjLKvDs5yMMgA+eOTALgcxSvaX3il1KCOuJ9CzeR
 euwC4YwGF+tqSS6Rt2fd0yHJpypYjTHpPJpUgT1KWjwNwPjkfxYiHD8F2uLCEoWkHCRO
 JlrEqZSxw4CJfId0JMevz1pPkgDK6iY3kh8EUWlhfekVOxzyhPztj1aYCPj/VbWg+5so
 1+9drxkjIL0tAknHTXDnRDXl5SEmN9G3/8BKE+KIFqWOKwiAcJXpSWcPT9qmSnReKN1y
 B/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248735; x=1685840735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6iiRDMO1BoKrdTyUbzxXDF1q/gFGnkP+7i3/uiWy+N0=;
 b=Ovfx9kdapHJfXbiZYUGENwTjomFhkWjsXRFQuS/Iu7tulYfxXnKpg0XsuerBu2j4X3
 Kliks/p3vJ+hwJD+tb1yzR2knGwpTTDPpCVQT3+jKl3ZapZCfDJ6xWfRqploKb8J47UN
 UTJTBWQ0QcfMHOSu+vUWpvLlAlhxt8WqzsKyyT2sxYuhqtsT3/I39QTTtUwyKkOSZYJO
 JzR0mt1chZS0ezZUkeuitszVOX1MhWIJ1vOqaXLHu8/u+JvlnmkCecmFcOB6SXk1482y
 OodFzlTypZCdxpTg5sgwiuj0BYHH0f+fFUW4iUhHhTjmozqukNO+79HrHgOtGEjan3to
 FuCg==
X-Gm-Message-State: AC+VfDw7YC1QZYdQd3tkEYiq+//Rad+bbmtFxuSx3y83RrJYOU0iqeh+
 5+C7gFVCfiQyKdabQYmg5BV9f9nbOBKI9Q==
X-Google-Smtp-Source: ACHHUZ6lDcJu+eQUlMm1YqsIDphV4QXSn/mMltrK1oe6/xfl0xHbYikffUDW4q4dS9AM14SgH01aSA==
X-Received: by 2002:a17:903:191:b0:1a9:3c2d:65f2 with SMTP id
 z17-20020a170903019100b001a93c2d65f2mr6790797plg.43.1683248735505; 
 Thu, 04 May 2023 18:05:35 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:34 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 40/89] target/riscv: remove cpu->cfg.ext_f
Date: Fri,  5 May 2023 11:01:52 +1000
Message-Id: <20230505010241.21812-41-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x529.google.com
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

Create a new "f" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVF. Instances of cpu->cfg.ext_f and similar are
replaced with riscv_has_ext(env, RVF).

Remove the old "f" property and 'ext_f' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-9-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 -
 target/riscv/cpu.c | 26 +++++++++++++-------------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fba5e9a33c..e5680b0709 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -426,7 +426,6 @@ struct RISCVCPUConfig {
     bool ext_e;
     bool ext_g;
     bool ext_m;
-    bool ext_f;
     bool ext_s;
     bool ext_u;
     bool ext_h;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 5bb03e2ee5..715cbca1b3 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -819,12 +819,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     /* Do some ISA extension error checking */
     if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
-                            cpu->cfg.ext_f && riscv_has_ext(env, RVD) &&
+                            riscv_has_ext(env, RVF) &&
+                            riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
-        cpu->cfg.ext_f = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
 
@@ -861,7 +861,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_f && !cpu->cfg.ext_icsr) {
+    if (riscv_has_ext(env, RVF) && !cpu->cfg.ext_icsr) {
         error_setg(errp, "F extension requires Zicsr");
         return;
     }
@@ -875,12 +875,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zfhmin = true;
     }
 
-    if (cpu->cfg.ext_zfhmin && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zfhmin && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "Zfh/Zfhmin extensions require F extension");
         return;
     }
 
-    if (riscv_has_ext(env, RVD) && !cpu->cfg.ext_f) {
+    if (riscv_has_ext(env, RVD) && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "D extension requires F extension");
         return;
     }
@@ -905,7 +905,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_zve32f && !cpu->cfg.ext_f) {
+    if (cpu->cfg.ext_zve32f && !riscv_has_ext(env, RVF)) {
         error_setg(errp, "Zve32f/Zve64f extensions require F extension");
         return;
     }
@@ -938,7 +938,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
             error_setg(errp, "Zfinx extension requires Zicsr");
             return;
         }
-        if (cpu->cfg.ext_f) {
+        if (riscv_has_ext(env, RVF)) {
             error_setg(errp,
                        "Zfinx cannot be supported together with F extension");
             return;
@@ -950,14 +950,14 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         cpu->cfg.ext_zcb = true;
         cpu->cfg.ext_zcmp = true;
         cpu->cfg.ext_zcmt = true;
-        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
             cpu->cfg.ext_zcf = true;
         }
     }
 
     if (riscv_has_ext(env, RVC)) {
         cpu->cfg.ext_zca = true;
-        if (cpu->cfg.ext_f && env->misa_mxl_max == MXL_RV32) {
+        if (riscv_has_ext(env, RVF) && env->misa_mxl_max == MXL_RV32) {
             cpu->cfg.ext_zcf = true;
         }
         if (riscv_has_ext(env, RVD)) {
@@ -970,7 +970,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (!cpu->cfg.ext_f && cpu->cfg.ext_zcf) {
+    if (!riscv_has_ext(env, RVF) && cpu->cfg.ext_zcf) {
         error_setg(errp, "Zcf extension requires F extension");
         return;
     }
@@ -1160,7 +1160,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
     if (riscv_has_ext(env, RVA)) {
         ext |= RVA;
     }
-    if (riscv_cpu_cfg(env)->ext_f) {
+    if (riscv_has_ext(env, RVF)) {
         ext |= RVF;
     }
     if (riscv_has_ext(env, RVD)) {
@@ -1500,6 +1500,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVC, .enabled = true},
     {.name = "d", .description = "Double-precision float point",
      .misa_bit = RVD, .enabled = true},
+    {.name = "f", .description = "Single-precision float point",
+     .misa_bit = RVF, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1526,7 +1528,6 @@ static Property riscv_cpu_extensions[] = {
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
-    DEFINE_PROP_BOOL("f", RISCVCPU, cfg.ext_f, true),
     DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
@@ -1646,7 +1647,6 @@ static void register_cpu_props(Object *obj)
         cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
-        cpu->cfg.ext_f = misa_ext & RVF;
         cpu->cfg.ext_v = misa_ext & RVV;
         cpu->cfg.ext_s = misa_ext & RVS;
         cpu->cfg.ext_u = misa_ext & RVU;
-- 
2.40.0


