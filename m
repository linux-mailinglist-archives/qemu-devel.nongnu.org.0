Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D05316374
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:15:35 +0100 (CET)
Received: from localhost ([::1]:56964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mX0-0005Dh-LL
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSH-00009o-2c; Wed, 10 Feb 2021 05:10:41 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:37396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSA-00031l-Vd; Wed, 10 Feb 2021 05:10:40 -0500
Received: by mail-ej1-x633.google.com with SMTP id jj19so3086702ejc.4;
 Wed, 10 Feb 2021 02:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BZ8g2ECT89Ko7kszhPtszjRG/LCVRqOzQivisaMoOVg=;
 b=AY8fBZ/kRk5dyAqbeyd7jpL50Ksah+9NO2pkFawF+qhugxgztBk1OflT5RG+cGsdGL
 zYo6AZvWGGHKydSVtvTDq83ySJf5NW8FRsVyS3R2BNWncMdqJH3kKGTvxYi5Fn28wc8K
 8gda56ecF19v8ZwMjsvKdl/qlXxJDLURKVtUczWOzYx3yaXQV25b5kheeaAx0kbK9eRi
 1csK5pt3pGbLcL5hphMrHRxeaOb7DraDOTaXfMG7a5EoYHUw9uTe9Y6ioyj5V93wKqYA
 ElnK9zRptPQN3Ck+8MHKKeNHQNdcQZOsbsQCYP6EjzNf3TuCHjg3/6rN+aDkZ2vjKFBE
 4+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BZ8g2ECT89Ko7kszhPtszjRG/LCVRqOzQivisaMoOVg=;
 b=UnSpF702BFjhiPAeUxTxuvgJp8a0EbjysLQDzbmZKCugDGgNT4dgfU//7LSl3KEimT
 YEmZCbSecg7DsAkCHcDVq4Kv0ot1CpqE2YJN8dzucovZv1aAb494Cwv7m+hyplKH5Ul4
 km/Y3rPnIGDQMsSigVfgTMUhxmhEIqSGTeI3IM+fb4OF/DA8pMPppBDBBwqb0RBb6cWf
 01MrU4EjCtti7P/GnrcWVaAuyMNO3TO6coqUxBFGO/zxdwdZpDAd2RAFmoKF5yrDVaWk
 /rF6CRY6ING8oQv2us9JRNvvBTfbESMyKZFJNvSQoN9/PDDKgwlGUZcctJSdnOoLWcZV
 LiUQ==
X-Gm-Message-State: AOAM53022HOmicjMmAJGlwQYQ6tqQHaraq7T9Z+wqFO72zqZ7bWWiW+e
 I7NtnrKpGPQ4Lgv/YRgIZWU=
X-Google-Smtp-Source: ABdhPJzGIGaYiAt4uPdCyMoYDwPDAhxLO/t80RB8dWbzTiLHyV1g8BzaNngSB+92TKQnS2ehpgOHZQ==
X-Received: by 2002:a17:907:7346:: with SMTP id
 dq6mr2166883ejc.230.1612951832057; 
 Wed, 10 Feb 2021 02:10:32 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y11sm785418ejd.72.2021.02.10.02.10.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:10:31 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention issues
Date: Wed, 10 Feb 2021 18:10:10 +0800
Message-Id: <1612951813-50542-3-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xlnx-zynqmp.c and
xlnx-zynqmp.h, as reported by:

  $ ./scripts/checkpatch.pl include/hw/arm/xlnx-zynqmp.h
  $ ./scripts/checkpatch.pl hw/arm/xlnx-zynqmp.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- new patch: xlnx-zynqmp: Clean up coding convention issues

 include/hw/arm/xlnx-zynqmp.h |  3 ++-
 hw/arm/xlnx-zynqmp.c         | 11 +++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6f45387..be15cc8 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -60,7 +60,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 
 #define XLNX_ZYNQMP_GIC_REGIONS 6
 
-/* ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
+/*
+ * ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
  * and under-decodes the 64k region. This mirrors the 4k regions to every 4k
  * aligned address in the 64k region. To implement each GIC region needs a
  * number of memory region aliases.
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 8818472..76b94a5 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -301,11 +301,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     ram_size = memory_region_size(s->ddr_ram);
 
-    /* Create the DDR Memory Regions. User friendly checks should happen at
+    /*
+     * Create the DDR Memory Regions. User friendly checks should happen at
      * the board level
      */
     if (ram_size > XLNX_ZYNQMP_MAX_LOW_RAM_SIZE) {
-        /* The RAM size is above the maximum available for the low DDR.
+        /*
+         * The RAM size is above the maximum available for the low DDR.
          * Create the high DDR memory region as well.
          */
         assert(ram_size <= XLNX_ZYNQMP_MAX_RAM_SIZE);
@@ -351,7 +353,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     qdev_realize(DEVICE(&s->apu_cluster), NULL, &error_fatal);
 
-    /* Realize APUs before realizing the GIC. KVM requires this.  */
+    /* Realize APUs before realizing the GIC. KVM requires this. */
     for (i = 0; i < num_apus; i++) {
         const char *name;
 
@@ -526,7 +528,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
         Object *sdhci = OBJECT(&s->sdhci[i]);
 
-        /* Compatible with:
+        /*
+         * Compatible with:
          * - SD Host Controller Specification Version 3.00
          * - SDIO Specification Version 3.0
          * - eMMC Specification Version 4.51
-- 
2.7.4


