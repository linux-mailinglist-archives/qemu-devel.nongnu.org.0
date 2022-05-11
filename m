Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9A0524018
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 00:11:05 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nouXw-0001Fq-0l
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 18:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNW-0004bK-Ek
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:00:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:38525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nouNS-0006fs-UH
 for qemu-devel@nongnu.org; Wed, 11 May 2022 18:00:18 -0400
Received: by mail-pg1-x530.google.com with SMTP id 137so2925795pgb.5
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 15:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYLWZ0AYEvI9FBKwXnehy1Q/hHHMEHlwZRLdtpEy/kg=;
 b=8XVsZqYqvgsyuCbAmC1P7WtONitrDbyuIo6rXd6Vjw7OBoyosds369O2yhggZJcP3C
 rc1nReAOZlfa822CuuzChjdpOcwLTz3xWhUrQAieqN5kFkys2vbbHGNu3S1IyG4GK8GQ
 iBNHlej70AmqdzwzfpLN1nPqEqs/Pz2SI4w+y+z25Aowk2fEILVFu6+w393JMzknZge1
 d/XKEZDs9XNSZNx6YBUM9ywMl/iMz60ptOQE3Wn/7aLoY9MobXYHIEilqCfWpG59hj2S
 B6nloDA2L48vKKqS9lU4yPGNiG3fKurPv8+7RHFqxjltRdxsTaZU+dXAggKMsvx97qFg
 MX/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYLWZ0AYEvI9FBKwXnehy1Q/hHHMEHlwZRLdtpEy/kg=;
 b=lzHXRF+R67GXBzZlpBdC3dlDxJLJ5BseQ9Kdstdc4xaZStkrQCxoW4Z6IB1I4twI0T
 wmPnZpCo2UuCZ9Zw6WzVDLf4dfmLap6p8L8CX7vYCvOYjaDI7KW/CSnFnEvH/pqTnf4I
 Hj7P4OwU3kXIi+NEgL1xSHAQfQi4qCf5EAgTKmptkwR+k3Ij3+SyUXgBZKfWAB+2pm7H
 UR6PZdSQpcRdDhKkbbDPilDsuWW+3q3l0zjyWAWW6jtyh0vEWdu9VrqGquMBQDdj3kvn
 AwxjyYOEMI1Eqpk2TeyGj3EzYiqVin3YhXI794rjxb7AegyEY/3SQExDYVvvo2Amp7Y0
 iUgQ==
X-Gm-Message-State: AOAM530q4N96xAdJXQo7VwCCbSigwfV1kksOoQ73XG9JOEzrhhYzUugB
 j1/mrs2cdSOQcVttxyWXPKMmeQ==
X-Google-Smtp-Source: ABdhPJzRXGY9IIhw1vr6kOjOGeJN1WZT7FkL5PWxwXudYM+a6J+4P/o7WA3ynuu5ZsYU6vd8WXjwcA==
X-Received: by 2002:a05:6a00:a1e:b0:50d:bb0c:2e27 with SMTP id
 p30-20020a056a000a1e00b0050dbb0c2e27mr27009583pfh.49.1652306413555; 
 Wed, 11 May 2022 15:00:13 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r23-20020a62e417000000b0050dc762816asm2261303pfh.68.2022.05.11.15.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 15:00:13 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Atish Patra <atishp@rivosinc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 03/12] target/riscv: pmu: Rename the counters extension to
 pmu
Date: Wed, 11 May 2022 14:59:47 -0700
Message-Id: <20220511215956.2351243-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511215956.2351243-1-atishp@rivosinc.com>
References: <20220511215956.2351243-1-atishp@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=atishp@rivosinc.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
index ccacdee21575..5ad17b40189f 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -822,7 +822,7 @@ static Property riscv_cpu_properties[] = {
     DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
     DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, false),
     DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
-    DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
+    DEFINE_PROP_BOOL("pmu", RISCVCPU, cfg.ext_pmu, true),
     DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
     DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
     DEFINE_PROP_BOOL("Zfh", RISCVCPU, cfg.ext_zfh, false),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index fe6c9a2c9238..09a0c71093c5 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -391,7 +391,7 @@ struct RISCVCPUConfig {
     bool ext_zksed;
     bool ext_zksh;
     bool ext_zkt;
-    bool ext_counters;
+    bool ext_pmu;
     bool ext_ifencei;
     bool ext_icsr;
     bool ext_svinval;
diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index d175fe3f1af3..c625b17dd58e 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -74,8 +74,8 @@ static RISCVException ctr(CPURISCVState *env, int csrno)
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


