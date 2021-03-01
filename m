Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE8327F63
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:24:31 +0100 (CET)
Received: from localhost ([::1]:54128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGiXG-0005gp-5l
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:24:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTR-0003SF-Sf; Mon, 01 Mar 2021 08:20:33 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:44983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTQ-0003HD-3E; Mon, 01 Mar 2021 08:20:33 -0500
Received: by mail-pg1-x530.google.com with SMTP id a4so11521323pgc.11;
 Mon, 01 Mar 2021 05:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdPd6+T9TYulDYan4MqsgMWZ2nXNjoGfebenRUzAWpA=;
 b=RS4N8xskyyjO4Hup1c5xUtdVJ02QjYVCeulzK/BTF/3x+YscJcVnxmSjveIGwWVg88
 zqCzDOHOp2nsTjgs8EfqCfXORRZeU5MSVnchxcPkKPl4wWV9xrR7zNdS2L/d201xmKmx
 Vt177bYBXKMh7mBruajWelRcuDv2p7vxnCw0UGXHdCXQlkKjeYWTirYKpc2LkPAEyTcB
 hZn/Pm9hLY8SBogkibEMZl6x+qPxr/NghX6wOMqxHtLYy1agegmktbS/tK9kBsj6QXy+
 xr4traOvAEkBviBvj5ZY33QJjw1f+dEG4cMx4lRkecl0BuFeOZzFGlZbHEYsO+nzoov1
 F5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdPd6+T9TYulDYan4MqsgMWZ2nXNjoGfebenRUzAWpA=;
 b=BDQqipKTB5F3QVVg77mvAHV7MBkAPtwpj0unXwXW7PK8X1VbN85vATvWpwTP/7KLdb
 93NZXIWdEqWCgPDNZK8qFwzp81FnObnkY3ERKtcR78JNczbofZ0H937s8nUE0w+eNl8O
 0RgbF5nrbwq7OUprr4swzGFvCBDQMpyeUAqflEDN0JDF1EYqcCKSeplTUU5C5beIX749
 1kJXwmklpQ2Xm+aib4W7jUx1isRR/AA6MMVB6b+E+rVomGOdIxLniwu/1Ie0D9k7e9YP
 4QO5hj05Bg3ecOpjTaWYgIyAPykn09v93T7h6DgaJp3T693w05UxDLIVXIXxxAQcDeD9
 fl9A==
X-Gm-Message-State: AOAM533l9rWKNfWy+cXfMxEXyTnAzz6hSebqQCyNsEB3Edml0yePTY4W
 lP31JzyvoJh5Shq1g4yAKns=
X-Google-Smtp-Source: ABdhPJwnId9eDK4SvhFvCZxg//vUhHiUGstQXW+QKrD/jtUTiYxKpOMzicMzu9GbbUVF5GCFWoieGw==
X-Received: by 2002:a63:905:: with SMTP id 5mr9686960pgj.337.1614604829382;
 Mon, 01 Mar 2021 05:20:29 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q2sm17748793pfl.158.2021.03.01.05.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 05:20:28 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention issues
Date: Mon,  1 Mar 2021 21:20:08 +0800
Message-Id: <20210301132011.8494-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301132011.8494-1-bmeng.cn@gmail.com>
References: <20210301132011.8494-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x530.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org
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
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

---

(no changes since v4)

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


