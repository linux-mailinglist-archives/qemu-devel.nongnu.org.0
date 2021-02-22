Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D396732184E
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:19:04 +0100 (CET)
Received: from localhost ([::1]:37642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEB79-00088T-Ql
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:19:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEB3r-0005tW-OT; Mon, 22 Feb 2021 08:15:45 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:42440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEB3g-00012t-Dt; Mon, 22 Feb 2021 08:15:39 -0500
Received: by mail-pf1-x436.google.com with SMTP id w18so6560037pfu.9;
 Mon, 22 Feb 2021 05:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgVmljrfnYoZ9iw9Ao+sKotOrK8u96LmNqkDcRILy8E=;
 b=i25vlYmXkJLLY2IG6duBSArsemYt3i3YpohslR9vOYgPK/ieJ7T0jKgVKQqzzXFxL9
 vZB3rK4465pXIM13t4FAgNBeopmsH9SOeb389xpa1OPF00yPG1PI0zPbJSAiJEekplUS
 uhxGfzN5smXhpgFPgOvKTf52k9KHFK7H/vC2ODGgDjqW+hKDbwwJyxfIrOMW8VEmjJNV
 6VlyiYFydzoDkSl/q/rqrsAwt2XwJa2+Y1kbn6z9w/BcLeXxNMrUG2nXNDu6KfnQYANH
 0LUp/DK2WYClfSwZDyp2IV6VstHgVpPUMDGmaX95y46raif1mujjD+KYn3rdiespYFMO
 cK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgVmljrfnYoZ9iw9Ao+sKotOrK8u96LmNqkDcRILy8E=;
 b=q4ENERvBzQ3wcTF9kek09DTrEvisL34Y2f8G0SyEPx+0Or0oNce6Q/TvLxpzYp0LPC
 Kw0ezwK0/AOvdaN/2m0R7lkrMlIRHfIKPvo2I7IcKcG0lmxWUE/29tcEvQFSBL0mwsQ4
 FnXGghUkyemSW3EDoLWEmBuCDelgPF4kV6SM5/AlvPjYUbhtilSWBMsKEPBK6CO7VzH4
 /Z9JMqRrEFpr2fvl5qysY3GIMhVvYxpktoYMatjpfkH58TDwePoR55g/fs4HMobRTbeO
 +0McUc9Nbtvv+nppYraW1fHHuDkqj9Huy0lXi8LrY7TF25ZL0F4K94zn3kAtld9urVsa
 /CaQ==
X-Gm-Message-State: AOAM5327IK6jqY38DgW2PWn3emJE9VogbhJNvmoQ/31B83hDOaQbRHUc
 OHtaX1KZIYeDVUZuvQ/XRNc=
X-Google-Smtp-Source: ABdhPJze6zPjIWFBU++0yr0587sp1o5m9Ps7EcnytalyE6MO1n26EVn+i6/iDkz5SkT1UXXVgZfqjQ==
X-Received: by 2002:a05:6a00:a83:b029:1ed:55fc:e22a with SMTP id
 b3-20020a056a000a83b02901ed55fce22amr13574553pfl.45.1613999726142; 
 Mon, 22 Feb 2021 05:15:26 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id p8sm17473190pgi.21.2021.02.22.05.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:15:25 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [RESEND PATCH v4 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention
 issues
Date: Mon, 22 Feb 2021 21:14:59 +0800
Message-Id: <20210222131502.3098-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222131502.3098-1-bmeng.cn@gmail.com>
References: <20210222131502.3098-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x436.google.com
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

Changes in v4:
- remove one change that is not a checkpatch warning

 include/hw/arm/xlnx-zynqmp.h | 3 ++-
 hw/arm/xlnx-zynqmp.c         | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 6f45387a17..be15cc8814 100644
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
index 881847255b..49465a2794 100644
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
2.25.1


