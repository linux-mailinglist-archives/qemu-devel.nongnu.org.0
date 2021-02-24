Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB12323C41
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:53:12 +0100 (CET)
Received: from localhost ([::1]:48126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtfD-0006LQ-U7
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtcw-0004cs-JA; Wed, 24 Feb 2021 07:50:50 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:37508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lEtcu-0003n9-4o; Wed, 24 Feb 2021 07:50:50 -0500
Received: by mail-pl1-x62d.google.com with SMTP id p5so1144803plo.4;
 Wed, 24 Feb 2021 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdPd6+T9TYulDYan4MqsgMWZ2nXNjoGfebenRUzAWpA=;
 b=EFcYHqEvXmecs/JaNzL8vwcbcMjSyrQTxA1Vx4206ENN1hQFVYxkAUhN3cuCmHUdGz
 yMLypY3jyN9EtU4j5rlE3w7mAA6qpYeoJmAcHkloMr/j/Oz+PQ3lJgbS+WTEvr5vZle+
 x5AsqUkcx2Fq74+baBGK/Pvj0lQyt3RbxMmSEjghU71zbQ/o08TwLeB3MsdLKY/a3EAi
 X8vFOBCBLWNQ83eQnaGuuxFe5/xv+8Oe/s9+EhjzMVYif3QmBGisTTntrJg6iC6TU/U9
 OTH5EELU6WMXQtr/hFMWEHddEDg9UPR4DGXyuqYlLHtlnVHN1Zm73YJE2EpgfCbHeMnG
 ExiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdPd6+T9TYulDYan4MqsgMWZ2nXNjoGfebenRUzAWpA=;
 b=C3nj24ZCCHQYSsiDjgQUBt2IiIgRQvX17vSWgjXdAVOMuuxYzvlKJLB0Tt/pzg2hHb
 uOTBtr47eFZeff2jV42D+Kp+VDmobG/QRf++G4mXjTJjZJAYwgyaqsN5zqQEUGgNejDh
 QDTXltatdGEkisjZhwk0WBTaChhDHblRJ3LiBPTcxt/M/zdHqGx6JrNmwnPBoAjZgcNK
 9O1LmYw/aiF+trfbX0axi1CNk/oq2m0NIkE2WXCEU3r2K2jUXDtZW4/qzoUq66MjXjA/
 kvXGRBke6I4zwKgnuoN2JSHZRK5esfe6bya91yxW5aHujHQvYmc1J2H3CaCsE56GjgRB
 SqPQ==
X-Gm-Message-State: AOAM530rv5NTuCvg5fo/WEy2lZ0QZcWs9WWhYd6rfVePKKcEL2MPs7XL
 KD6plVA+oThBs2pVaFbVhNE=
X-Google-Smtp-Source: ABdhPJzzXd9eRMrtp2ulzavOXIIvwDVRCyttQEJK2wlOBJgMpRj8m3vaFwC50OjpoOv8vyHERe+jnQ==
X-Received: by 2002:a17:90b:1bd2:: with SMTP id
 oa18mr4258627pjb.80.1614171046619; 
 Wed, 24 Feb 2021 04:50:46 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id e12sm2795661pjj.23.2021.02.24.04.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 04:50:46 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 2/5] hw/arm: xlnx-zynqmp: Clean up coding convention issues
Date: Wed, 24 Feb 2021 20:50:21 +0800
Message-Id: <20210224125024.4160-3-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210224125024.4160-1-bmeng.cn@gmail.com>
References: <20210224125024.4160-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62d.google.com
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


