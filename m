Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E76F7A6A
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:12:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujto-00042n-Vc; Thu, 04 May 2023 21:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtm-0003qc-Qx
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:14 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujtk-0007gH-QF
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:06:14 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1aaf7067647so8240185ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248771; x=1685840771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r7PYDlMmen8qFAQjWPuusLTWBhWo0OdwyZiWfqo+jQs=;
 b=BI11k2ETIbJpayY+dAGdcOVkaPTrTfQFi01OK6ZcKqXvXN2rtCPm0usVEgZFzujpCL
 0naYr7bMhIw0YCBbTN07iLSvk1YuP8OWkGOqs5s2wmVyu6zpRmVhdIMGikfivTfFaHg+
 rfEj2LpyM9iG1CQQYni9cVC+WKrn6Qy3f6eYn/EiC82/VhLC4wamZ3WXXbSXTI7NhWGl
 2fL/BGeQmbPSXY/SymTFXEC+IfVgHxYyUOm2Tag6CBtWzNrr0JA1o8uKTDTnE4ljsYHR
 afWXaCtHgacNWHSsXcrWOQY+7T9mbI0rNoYnOZ98hdmkpUhRkK3Q757r6ogNlvMxXWMw
 BXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248771; x=1685840771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r7PYDlMmen8qFAQjWPuusLTWBhWo0OdwyZiWfqo+jQs=;
 b=fRLUHNUtgBrrg7Li15kbw+CEbtMU6amBInfBJkB8ISEbj6kTqnaEMecGJAc2+HF4Lx
 u68aeykwj64mFrYfaHBekLa4U3c7SNS++ilJbNmN6WQSN4Mf6pU73Spi/txK3NE7dwjl
 mxIog6caoSjd39rc5jCWOUE/hwNd6CXlP7Mfqz+vF3+YwvpxMJl7V9bdukkwR9DXSf8I
 Lme39J21d/WRshDXkbzeUr+AFQBbD3ZBTf9rmvgVnvpxl/H7Skjnx1oplPiRcZUzBnk8
 fNWx6efcpk/X0mm09J47Z4zkSiWtoV2gKxHDlU8ERzKPAPqbz0kLMuyfn6+0b2WvURoi
 TGBg==
X-Gm-Message-State: AC+VfDxlg/K3l8HYCVWVHrQfvxzXLJiErqbTnng1CwKr2NDPSQ9ie6G/
 K/UJrDqpvOCxyzmLL6V8e2Iilk5eoeUOoQ==
X-Google-Smtp-Source: ACHHUZ6GBiT86EWHjXmQqjLjsSoiWH+i8aM9M3vqVub5ZKOA0nS+jojTHfDBt9lQ4EQJ38a6xdr4VA==
X-Received: by 2002:a17:903:4d2:b0:1a6:b1a2:5f21 with SMTP id
 jm18-20020a17090304d200b001a6b1a25f21mr5374000plb.8.1683248771252; 
 Thu, 04 May 2023 18:06:11 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:06:10 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 51/89] target/riscv: add RVG and remove cpu->cfg.ext_g
Date: Fri,  5 May 2023 11:02:03 +1000
Message-Id: <20230505010241.21812-52-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x634.google.com
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

We're still have one RISCVCPUConfig MISA flag, 'ext_g'. We'll remove it
the same way we did with the others: create a "g" RISCVCPUMisaExtConfig
property, remove the old "g" property, remove all instances of 'cfg.ext_g'
and use riscv_has_ext(env, RVG).

The caveat is that we don't have RVG, so add it. RVG will be used right
off the bat in set_misa() of rv64_thead_c906_cpu_init() because the CPU is
enabling G via the now removed 'ext_g' flag.

After this patch, there are no more MISA extensions represented by flags
in RISCVCPUConfig.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230406180351.570807-20-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h |  2 +-
 target/riscv/cpu.c | 17 ++++++++---------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index e011cf6ca4..070547234b 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -81,6 +81,7 @@
 #define RVU RV('U')
 #define RVH RV('H')
 #define RVJ RV('J')
+#define RVG RV('G')
 
 
 /* Privileged specification version */
@@ -422,7 +423,6 @@ typedef struct {
 } RISCVSATPMap;
 
 struct RISCVCPUConfig {
-    bool ext_g;
     bool ext_zba;
     bool ext_zbb;
     bool ext_zbc;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b005bcb786..143079a8df 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -403,10 +403,9 @@ static void rv64_thead_c906_cpu_init(Object *obj)
     CPURISCVState *env = &RISCV_CPU(obj)->env;
     RISCVCPU *cpu = RISCV_CPU(obj);
 
-    set_misa(env, MXL_RV64, RVC | RVS | RVU);
+    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU);
     set_priv_version(env, PRIV_VERSION_1_11_0);
 
-    cpu->cfg.ext_g = true;
     cpu->cfg.ext_zfh = true;
     cpu->cfg.mmu = true;
     cpu->cfg.ext_xtheadba = true;
@@ -814,12 +813,11 @@ static void riscv_cpu_validate_set_extensions(RISCVCPU *cpu, Error **errp)
     CPURISCVState *env = &cpu->env;
 
     /* Do some ISA extension error checking */
-    if (cpu->cfg.ext_g && !(riscv_has_ext(env, RVI) &&
-                            riscv_has_ext(env, RVM) &&
-                            riscv_has_ext(env, RVA) &&
-                            riscv_has_ext(env, RVF) &&
-                            riscv_has_ext(env, RVD) &&
-                            cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
+    if (riscv_has_ext(env, RVG) &&
+        !(riscv_has_ext(env, RVI) && riscv_has_ext(env, RVM) &&
+          riscv_has_ext(env, RVA) && riscv_has_ext(env, RVF) &&
+          riscv_has_ext(env, RVD) &&
+          cpu->cfg.ext_icsr && cpu->cfg.ext_ifencei)) {
         warn_report("Setting G will also set IMAFD_Zicsr_Zifencei");
         cpu->cfg.ext_icsr = true;
         cpu->cfg.ext_ifencei = true;
@@ -1462,6 +1460,8 @@ static const RISCVCPUMisaExtConfig misa_ext_cfgs[] = {
      .misa_bit = RVJ, .enabled = false},
     {.name = "v", .description = "Vector operations",
      .misa_bit = RVV, .enabled = false},
+    {.name = "g", .description = "General purpose (IMAFD_Zicsr_Zifencei)",
+     .misa_bit = RVG, .enabled = false},
 };
 
 static void riscv_cpu_add_misa_properties(Object *cpu_obj)
@@ -1484,7 +1484,6 @@ static void riscv_cpu_add_misa_properties(Object *cpu_obj)
 
 static Property riscv_cpu_extensions[] = {
     /* Defaults for standard extensions */
-    DEFINE_PROP_BOOL("g", RISCVCPU, cfg.ext_g, false),
     DEFINE_PROP_UINT8("pmu-num", RISCVCPU, cfg.pmu_num, 16),
     DEFINE_PROP_BOOL("sscofpmf", RISCVCPU, cfg.ext_sscofpmf, false),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
-- 
2.40.0


