Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 849656F7A64
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:09:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujtd-00026c-CR; Thu, 04 May 2023 21:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtP-0001wf-0X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:51 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtE-0007YY-B8
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:05:50 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-64115e652eeso16417696b3a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248739; x=1685840739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mjm7hy5NUkBT/uOHj61PYQmyww7/dxN5VdhuTdeHgcQ=;
 b=OO2xFhKALJxSFSDTj3Znq4OHXZe9gKAMiZHCzDnYRCcob6DELJdre1OCTSDa0NpCvr
 FwCM8jk/Z0klgYk5L8ZfQnHUZQaJrbDaqM3XQ25tBGkP7Z6ABWEc89tmcfBOIbqCyupX
 GeTvNfGHSuzKQs6gj5d9VNWeAAYBwI4QmQLb9K8q1DEqc7lRenztgUdSCqXhhVz4CZno
 G4gPFgTs0HzD/QVpoMI4M84jgK/NQL4egzlY9SF+3WxnV+er17e8WfpOjvNFsoGXREOG
 brOEcHCJmI8go5Eogq/k1DxQ8+rH6rWI7Aadmp/1Z9lgVtzBqt8RlJqb4woRBIJu5OJG
 Wm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248739; x=1685840739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mjm7hy5NUkBT/uOHj61PYQmyww7/dxN5VdhuTdeHgcQ=;
 b=VgTqci5OieUt5jECk025Rgo/aKSWPFcUvZQ4NINp6u+7BlVav+LyRXC5Sbd3Sb0BZ5
 qsFRt9WDg5VPeXqLD9cS036gbRgXF73hJ/tfTQdGM0yQXGtpKA1Iwu2bMJ94vRmwQrlP
 aNIyqxV/5sifB8p1l4yWrpYu/89Cxr1G0x0SQc7AvgQT64P9+40pFtsiv1cRyubqyudg
 rEHojUU36L8sUeMB9Yr//Mb+u00kGz+UY53UfUbqPyFWPywfB3RSQE8kMOpiCHkhWcX+
 dxUURWNypsutF04ctmsgEmVeNi1QWYcEk2t8GedVj5qLAe5q9ElIKR8Uq/TpwekjQpOW
 /Cow==
X-Gm-Message-State: AC+VfDyLRm1fftv4AHOXBdH0iFllRGHBBQ2lt7va8DN798CZQyN3LQ6j
 BcRVjs0Y/Pj4NZYOcy/bzd24eke1Jb9JUQ==
X-Google-Smtp-Source: ACHHUZ5wEqRllom/5RNcMvQfYdDfo2xiExxLtPVyFyaOdapz2+SOMNhBJz6JSsv/4E0xKbx5bwEB6g==
X-Received: by 2002:a17:90b:198f:b0:246:5787:6f5d with SMTP id
 mv15-20020a17090b198f00b0024657876f5dmr4649097pjb.10.1683248738646; 
 Thu, 04 May 2023 18:05:38 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:05:38 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 41/89] target/riscv: remove cpu->cfg.ext_i
Date: Fri,  5 May 2023 11:01:53 +1000
Message-Id: <20230505010241.21812-42-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=alistair23@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

Create a new "i" RISCVCPUMisaExtConfig property that will update
env->misa_ext* with RVI. Instances of cpu->cfg.ext_i and similar are
replaced with riscv_has_ext(env, RVI).

Remove the old "i" property and 'ext_i' from RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-10-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  1 -
 target/riscv/cpu.c | 15 +++++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e5680b0709..479b654d54 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -422,7 +422,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_i;
     bool ext_e;
     bool ext_g;
     bool ext_m;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 715cbca1b3..f082748569 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -817,13 +817,12 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(cpu->cfg.ext_i && cpu->cfg.ext_m &&
+    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) && cpu->cfg.ext_m &&
                             riscv_has_ext(env, RVA) &&
                             riscv_has_ext(env, RVF) &&
                             riscv_has_ext(env, RVD) &&
                             cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
-        cpu->cfg.ext_i = true;
         cpu->cfg.ext_m = true;
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
@@ -832,13 +831,13 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         env->misa_ext_mask = env->misa_ext;
     }
 
-    if (cpu->cfg.ext_i && cpu->cfg.ext_e) {
+    if (riscv_has_ext(env, RVI) && cpu->cfg.ext_e) {
         error_setg(errp,
                    "I and E extensions are incompatible");
         return;
     }
 
-    if (!cpu->cfg.ext_i && !cpu->cfg.ext_e) {
+    if (!riscv_has_ext(env, RVI) && !cpu->cfg.ext_e) {
         error_setg(errp,
                    "Either I or E extension must be set");
         return;
@@ -850,7 +849,7 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
         return;
     }
 
-    if (cpu->cfg.ext_h && !cpu->cfg.ext_i) {
+    if (cpu->cfg.ext_h && !riscv_has_ext(env, RVI)) {
         error_setg(errp,
                    "H depends on an I base integer ISA with 32 x registers");
         return;
@@ -1148,7 +1147,7 @@ static void riscv_cpu_sync_misa_cfg(CPURISCVState *env)
 {
     uint32_t ext = 0;
 
-    if (riscv_cpu_cfg(env)->ext_i) {
+    if (riscv_has_ext(env, RVI)) {
         ext |= RVI;
     }
     if (riscv_cpu_cfg(env)->ext_e) {
@@ -1502,6 +1501,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVD, .enabled = true},
     {.name = "f", .description = "Single-precision float point",
      .misa_bit = RVF, .enabled = true},
+    {.name = "i", .description = "Base integer instruction set",
+     .misa_bit = RVI, .enabled = true},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1524,7 +1525,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("i", RISCVCPU, cfg.ext_i, true),
     DEFINE_PROP_BOOL("e", RISCVCPU, cfg.ext_e, false),
     DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_BOOL("m", RISCVCPU, cfg.ext_m, true),
@@ -1644,7 +1644,6 @@ static void register_cpu_props(Object *obj)
      * later on.
      */
     if (cpu->env.misa_ext != 0) {
-        cpu->cfg.ext_i = misa_ext & RVI;
         cpu->cfg.ext_e = misa_ext & RVE;
         cpu->cfg.ext_m = misa_ext & RVM;
         cpu->cfg.ext_v = misa_ext & RVV;
-- 
2.40.0


