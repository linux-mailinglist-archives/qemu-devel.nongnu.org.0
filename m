Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D346321808
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 14:11:40 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEAzz-0002wK-OK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 08:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEAuD-0005Mb-Tm; Mon, 22 Feb 2021 08:05:42 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEAuA-00053w-P9; Mon, 22 Feb 2021 08:05:41 -0500
Received: by mail-pj1-x1034.google.com with SMTP id s23so5728204pji.1;
 Mon, 22 Feb 2021 05:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgVmljrfnYoZ9iw9Ao+sKotOrK8u96LmNqkDcRILy8E=;
 b=sSsKz2N0MkOWM0ephhV8u2iKMpN5Wg+lmLfGYYwjkwtJktGE+l/4hfGJsQOTWn34hY
 yMc4fqe06Ob/3MIDMf2I2W2hNF1q/ZqYP7kw+E0WrSWwjn13GBOa/ALHFSxsjfWU5c4D
 tE4aYrw5go1johSEYkhouDVb0kvJeURmIcYd2+US6PS1HHjoDjZkaRIxkKFii5yVLvNG
 sm+xG70HuogQeYp9kXl+TJ+y8YjpRdEdmpnu1sehf3rQ1JJBsA00OlghaX/TISO3DvyY
 RFMyhE3fQggpxKflhm0QFdEl03EY24YCzBG+BGyq+FQcyBS6BOGiWt3w0NybtXVwvwjw
 ap3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgVmljrfnYoZ9iw9Ao+sKotOrK8u96LmNqkDcRILy8E=;
 b=heqq394DO4osOHHqCaE9SyrbOB2p0GKi/eIJHGubPYZWzbIaBwhigoXB3yrKMWBjM4
 ai3/VKYR/NjXvPyfSRZ5TRkkbuZ308cFDWnBChlJycbPKfIzmPUhVIGx4NldS27wgwYa
 3nCybLcRJpgCHt0ccNoSboG2wmpG6LLGMvuDsnwGEJ8EAdHz4fr2Ry4hvKzQTtJHcVZX
 Jvxd9VFa10dANYi+dJ7DD1GZ19Q2j7M1VebZvajkSCidI6IE0Z2KCTqNY8sHeREdgvIL
 uSWy/sWnmpxCPbUcYAx+iOl9/dofG3aObX/+0s5OAzFZwU45/qodP7oQVl+habsF/MrG
 dpow==
X-Gm-Message-State: AOAM5314Tcxer3wu1jAq/YcWU9NRjjM5ipGcF36JIgQvKCvSOGDaCcyb
 rGVS1Szxfuxv9c+JzxhlkyE=
X-Google-Smtp-Source: ABdhPJxK7ztU09w4NviZ2vbzte4H4+xLyjZ3Q01+/MEs0Gkf0kBVN5kTVZL4Bwfty7kvLper13PIdw==
X-Received: by 2002:a17:902:b402:b029:e3:e880:9748 with SMTP id
 x2-20020a170902b402b02900e3e8809748mr8345855plr.72.1613999135185; 
 Mon, 22 Feb 2021 05:05:35 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q126sm19170171pfb.111.2021.02.22.05.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 05:05:34 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention issues
Date: Mon, 22 Feb 2021 21:05:11 +0800
Message-Id: <20210222130514.2167-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222130514.2167-1-bmeng.cn@gmail.com>
References: <20210222130514.2167-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1034.google.com
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


