Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5757B6F7A76
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 03:14:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujxG-0003S2-8W; Thu, 04 May 2023 21:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujw3-000222-QO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:37 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pujvx-0008EP-9g
 for qemu-devel@nongnu.org; Thu, 04 May 2023 21:08:32 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ab1b79d3a7so8013925ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683248906; x=1685840906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQmY7ILKe0W+JeOW0qS6RjqCim/5IbGU6lDV+NmnA70=;
 b=Cw6EAwCCxe07eFeRyAmd5h9t4EzNtFJGRPRSVHIXY3Uq9xeWx6aKtam2pJL/JBcLZw
 g5R9pgSPQPSEBATzlPV76+qzxT+ZP/S8manW5POJHe6OdxkJLAF8lg163U0PE654dvuA
 QT4Ks9wljnmkfXKmtL8RI1PJVhBPmzZ10KDF6YOJu1ZJCuOpUbFj9BivOXYkHUTfJJof
 XqJBMuTys1FjLRJXmmfLCXfrTYoz1Jc6qb9xngH1datUsI5SFYQ8a0nTdKpeu7Fl7zo5
 7Chmq709CRQSOxZFLNmdUQkHZaWsJPNLBpsZ2bUznnAe/5XOVZo1/UwPgLcpM5IyxYkA
 NL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683248906; x=1685840906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQmY7ILKe0W+JeOW0qS6RjqCim/5IbGU6lDV+NmnA70=;
 b=KQuJp4BKPsFd+OoPzLftk5uSMTsC0COR0Uvos2A1jAA0l1c+oUO+CQlVmwsp2Agluc
 7v1VLa9aDVyPiPFJhdxK0fJYOj3aUYu7esni3V2UKYWOdtE/69XugYWsJOc1zgg4gauM
 I4jNM58j2dM2fAWm/Q05j+Rwg3Qo8eU0P/dZlqut/TI1d53tNPztEfhRexz6TXQuBhJY
 1mvm7N429XAFm5zKcSteSa+TSaFBWbqBlfAj0qHxDS0YZXtwmy50qW/ftvKwq904eROK
 i0tuZVYoPUOwolTNjsLV8LK/uMCg9VxSVumdmbPgdlWJTxPah8D7IQTEoutSz74KoKuY
 Cotw==
X-Gm-Message-State: AC+VfDwSd8Un7R842iGdxTYcQAB1so1ThytEtkIZxHvQeYEPtULi2zIF
 5SIbpVVWLvgPoroXK5MmE9pP1BgltYDVwA==
X-Google-Smtp-Source: ACHHUZ7HpR6W7n2mR/nax9zpn2WN5RcajnvzV8HQuRvcJP+eYRi1XhOq9t4KNldsSR7b4FLzl2qEHQ==
X-Received: by 2002:a17:902:aa06:b0:1a6:7a19:331b with SMTP id
 be6-20020a170902aa0600b001a67a19331bmr4709536plb.5.1683248906425; 
 Thu, 04 May 2023 18:08:26 -0700 (PDT)
Received: from toolbox.alistair23.me
 (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net.
 [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a170902d35300b0019309be03e7sm218762plk.66.2023.05.04.18.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 18:08:25 -0700 (PDT)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Rahul Pathak <rpathak@ventanamicro.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 89/89] target/riscv: add Ventana's Veyron V1 CPU
Date: Fri,  5 May 2023 11:02:41 +1000
Message-Id: <20230505010241.21812-90-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=alistair23@gmail.com; helo=mail-pl1-x62f.google.com
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

From: Rahul Pathak <rpathak@ventanamicro.com>

Add a virtual CPU for Ventana's first CPU named veyron-v1. It runs
exclusively for the rv64 target. It's tested with the 'virt' board.

CPU specs and general information can be found here:

https://www.nextplatform.com/2023/02/02/the-first-risc-v-shot-across-the-datacenter-bow/

Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20230418123624.16414-1-dbarboza@ventanamicro.com>
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu-qom.h      |  1 +
 target/riscv/cpu_vendorid.h |  4 ++++
 target/riscv/cpu.c          | 38 +++++++++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b29090ad86..04af50983e 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -41,6 +41,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
 #define TYPE_RISCV_CPU_THEAD_C906       RISCV_CPU_TYPE_NAME("thead-c906")
+#define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #if defined(TARGET_RISCV32)
diff --git a/target/riscv/cpu_vendorid.h b/target/riscv/cpu_vendorid.h
index a5aa249bc9..96b6b9c2cb 100644
--- a/target/riscv/cpu_vendorid.h
+++ b/target/riscv/cpu_vendorid.h
@@ -3,4 +3,8 @@
 
 #define THEAD_VENDOR_ID         0x5b7
 
+#define VEYRON_V1_MARCHID       0x8000000000010000
+#define VEYRON_V1_MIMPID        0x111
+#define VEYRON_V1_MVENDORID     0x61f
+
 #endif /*  TARGET_RISCV_CPU_VENDORID_H */
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index befa64528f..db0875fb43 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -422,6 +422,43 @@ static void rv64_thead_c906_cpu_init(Object *obj)
 #endif
 }
 
+static void rv64_veyron_v1_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    RISCVCPU *cpu = RISCV_CPU(obj);
+
+    set_misa(env, MXL_RV64, RVG | RVC | RVS | RVU | RVH);
+    env->priv_ver = PRIV_VERSION_1_12_0;
+
+    /* Enable ISA extensions */
+    cpu->cfg.mmu = true;
+    cpu->cfg.ext_icbom = true;
+    cpu->cfg.cbom_blocksize = 64;
+    cpu->cfg.cboz_blocksize = 64;
+    cpu->cfg.ext_icboz = true;
+    cpu->cfg.ext_smaia = true;
+    cpu->cfg.ext_ssaia = true;
+    cpu->cfg.ext_sscofpmf = true;
+    cpu->cfg.ext_sstc = true;
+    cpu->cfg.ext_svinval = true;
+    cpu->cfg.ext_svnapot = true;
+    cpu->cfg.ext_svpbmt = true;
+    cpu->cfg.ext_smstateen = true;
+    cpu->cfg.ext_zba = true;
+    cpu->cfg.ext_zbb = true;
+    cpu->cfg.ext_zbc = true;
+    cpu->cfg.ext_zbs = true;
+    cpu->cfg.ext_XVentanaCondOps = true;
+
+    cpu->cfg.mvendorid = VEYRON_V1_MVENDORID;
+    cpu->cfg.marchid = VEYRON_V1_MARCHID;
+    cpu->cfg.mimpid = VEYRON_V1_MIMPID;
+
+#ifndef CONFIG_USER_ONLY
+    set_satp_mode_max_supported(cpu, VM_1_10_SV48);
+#endif
+}
+
 static void rv128_base_cpu_init(Object *obj)
 {
     if (qemu_tcg_mttcg_enabled()) {
@@ -1827,6 +1864,7 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SHAKTI_C,         rv64_sifive_u_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_THEAD_C906,       rv64_thead_c906_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_VEYRON_V1,        rv64_veyron_v1_cpu_init),
     DEFINE_DYNAMIC_CPU(TYPE_RISCV_CPU_BASE128,  rv128_base_cpu_init),
 #endif
 };
-- 
2.40.0


