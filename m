Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC614ED0C9
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:17:26 +0200 (CEST)
Received: from localhost ([::1]:34258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZiVB-0003TD-MJ
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:17:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFz-000539-VH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:43 -0400
Received: from [2607:f8b0:4864:20::42a] (port=37747
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nZiFy-0005Uh-BK
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:01:43 -0400
Received: by mail-pf1-x42a.google.com with SMTP id bo5so854731pfb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 17:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=crKuTFEYCuqkZngfqut65l9QHgVcBY/Hz2Hil9Yr5dw=;
 b=bGUYlyBWqHYAuAPK5iijOoQU54zSjlT0+M+aekEXybGY86cgbQPdM1/x8NtFoz/Ic1
 5/e2wUH4cgo/7AvP+WeIDhbN7YPFFNJxeEwea4pmdV/ktgKXltsejiMj3gjx3zI8TGNz
 o5L2ZEtv0i83xfFrntJcwAfYriJ3sC2g4e9VLcC/SnXPm/7mruXabE7zptpbbOrpbhMg
 LEh2Gq5BFUnLX+kTIw4VpK1G1MK0cjHwpUt/XXedt+ir+fsZsja0Z/L9RGNRnmOKdMlE
 uF4s3dyBIDRQ4sKolV9OSRRfkVeE9vd9BKUesLoUOf3HFsOOcyWpQxpMGdj2nRFoQzOh
 vR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=crKuTFEYCuqkZngfqut65l9QHgVcBY/Hz2Hil9Yr5dw=;
 b=ilYbowsksu7hMz1Jnh7KrXL8ArSzkYWNKgvasad02y5ogaTTKP/KT80jjzrR5VSgXK
 af70hw2z/Zg6k3s8u5KlZdDWzoO4PMSt6jnIcj9axcOorrug39k8fcoQY3c5UQHGuY4U
 B8BmNWsuP6bN9yCXJdkGCcEfOwmz7R2iYiecA7kdmUYr1dCKf1nF94CpCT7dVlTYngeM
 DP8oM+cuJHavZSeolexyUa+WDygH4OZ5VxyBQ4YfMbjO+0cxEleD9xEsM8mG2uEgYE7S
 t756ncp3g8F38Qy3tUJn9Kvb1sDkYuXPrK5xLLarq4xRyTJYUKBv6d87p1qdBqbkWGSW
 Qj3g==
X-Gm-Message-State: AOAM533XDYRvBFpb6TfomSCURV7vUFRPH05/NUcME46dq9dfvXzOOkCh
 TiLNTCoUzsR9tg9yMh/n03I91TGy2NuZNw==
X-Google-Smtp-Source: ABdhPJxDkUJkMSAHxaFLM1pT7+smWK0CD8mgNEwkPfKAH+4IryFcurra6iH4Ss8RIQ9ZpyLImKkomg==
X-Received: by 2002:a65:4143:0:b0:375:89f4:b46a with SMTP id
 x3-20020a654143000000b0037589f4b46amr8159315pgp.335.1648684900693; 
 Wed, 30 Mar 2022 17:01:40 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 ij17-20020a17090af81100b001c67c964d93sm8891669pjb.2.2022.03.30.17.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 17:01:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/12] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Wed, 30 Mar 2022 17:01:17 -0700
Message-Id: <20220331000127.2107823-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220331000127.2107823-1-atishp@rivosinc.com>
References: <20220331000127.2107823-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=atishp@rivosinc.com; helo=mail-pf1-x42a.google.com
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
index 86e48ff54dd1..1995ed0d6979 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -794,7 +794,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index d351b0ce12bf..92bad7e35e4d 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -378,7 +378,7 @@ struct RISCVCPUConfig {
     bool ext_zbb;
     bool ext_zbc;
     bool ext_zbs;
-    bool ext_counters;
+    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 914b3f96ef67..f1b264b2c7a4 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -72,8 +72,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
     RISCVCPU *cpu = RISCV_CPU(cs);
     int ctr_index;
 
-    if (!cpu->cfg.ext_counters) {
-        /* The Counters extensions is not enabled */
+    if (!cpu->cfg.ext_pmu) {
+        /* The PMU extension is not enabled */
         return RISCV_EXCP_ILLEGAL_INST;
     }
 
-- 
2.25.1


