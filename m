Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA905B9EFA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:36:27 +0200 (CEST)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYqug-0005xg-Qr
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkj-0008PO-JR; Thu, 15 Sep 2022 11:26:09 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:44767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oYqkh-0007M3-N7; Thu, 15 Sep 2022 11:26:09 -0400
Received: by mail-ej1-x631.google.com with SMTP id r18so42959653eja.11;
 Thu, 15 Sep 2022 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rhTmNBnLg4CAv1/ayazcWGv0FN4nN+3D+JQoQ1f1V9w=;
 b=VsyLihotKdwkqdRe2oE+0zVLeR2UnGSElRHfKKpnnezx5um8KMmVyiv5gCyTVcBb6T
 SdMbKJ8YgwaWJMjbF82QvItfWEuMJfc8aexFIPDxWBWUry3dPNu5vFL9HIe+07iaLsue
 kNFstl0WqUEYqJvlsaWp9oZgr89NiEWhH7SCC1ODHqim7vwVWRaSe8K6pAgboMOABkyd
 7vfP1kddYDeEAvDPOHDqq9TPvrk2mqUctkihIRpZEcbjQLmRRELwd4D7qj5yL7/zcxvt
 MTpXdDbjEneGoCQ53+uBtJ1nVbpuRU8xHo0uyzTzfTOB2HV6BkUOtsjPCamjTmBv11HW
 SBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rhTmNBnLg4CAv1/ayazcWGv0FN4nN+3D+JQoQ1f1V9w=;
 b=RD8IvKXzZFQzKYFw7qW7lWYJUvdTHpdg8QtCMHOO8UGqUyclGLqBbREzHl6qhjn6iP
 a1xNoLnE3Olvh7o00iaZx8W8uK2BgxJe/pkuy5ktGD5DC/HM3ueW2qF+o5WQi561IHy8
 WoPucSumFaF0XNG59pNM8ggLOQZ5Ts0cGSImzaug9D69Zrc+TfFbPCVo03o1wr2o0Yf4
 QVG7kZaVqthoCnzSdS3QWQVsMIl6IfmWANkhklOaZMEGZOcuO/O41oVO8luZGe4WaloS
 f4V7ZY/UmMiUVKb90a620jtvYDjf39n7abqcDGF8bowwQegZzk+ujJ+2J2DUDbWsj15G
 eOmg==
X-Gm-Message-State: ACrzQf3TPX9iAmPAAzjttZhTtmPp7klW1xsKUZ6Ur5lshySjTvG8vbrI
 AXU5NcqVw7Ky/vsoU12xrjxsb6fxww0=
X-Google-Smtp-Source: AMsMyM5aZovK2ofMF/Y2DfYEAxa2hSdDLVWc1zE4w7DdF5rOeK4gZ7k+l+DlbgZ+N8vlzhQlM2OwVQ==
X-Received: by 2002:a17:906:8466:b0:77b:43e9:48b5 with SMTP id
 hx6-20020a170906846600b0077b43e948b5mr372685ejc.254.1663255565404; 
 Thu, 15 Sep 2022 08:26:05 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-191-182-143.77.191.pool.telefonica.de. [77.191.182.143])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170906210200b00730979f568fsm9297138ejt.150.2022.09.15.08.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 08:26:04 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/11] hw/sd/sdhci: Implement Freescale eSDHC device model
Date: Thu, 15 Sep 2022 17:25:19 +0200
Message-Id: <20220915152520.21948-11-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915152520.21948-1-shentey@gmail.com>
References: <20220915152520.21948-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Will allow e500 boards to access SD cards using just their own devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/sd/sdhci.c         | 147 +++++++++++++++++++++++++++++++++++++++++-
 include/hw/sd/sdhci.h |   3 +
 2 files changed, 149 insertions(+), 1 deletion(-)

diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 7a5996caad..09285ccfa1 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1369,6 +1369,7 @@ void sdhci_initfn(SDHCIState *s)
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, sdhci_data_transfer, s);
 
     s->io_ops = &sdhci_mmio_ops;
+    s->io_registers_map_size = SDHC_REGISTERS_MAP_SIZE;
 }
 
 void sdhci_uninitfn(SDHCIState *s)
@@ -1392,7 +1393,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     s->fifo_buffer = g_malloc0(s->buf_maxsz);
 
     memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, "sdhci",
-                          SDHC_REGISTERS_MAP_SIZE);
+                          s->io_registers_map_size);
 }
 
 void sdhci_common_unrealize(SDHCIState *s)
@@ -1575,6 +1576,149 @@ static const TypeInfo sdhci_bus_info = {
     .class_init = sdhci_bus_class_init,
 };
 
+/* --- qdev Freescale eSDHC --- */
+
+/* Host Controller Capabilities Register 2 */
+#define ESDHC_CAPABILITIES_1        0x114
+
+/* Control Register for DMA transfer */
+#define ESDHC_DMA_SYSCTL            0x40c
+#define ESDHC_PERIPHERAL_CLK_SEL    0x00080000
+#define ESDHC_FLUSH_ASYNC_FIFO      0x00040000
+#define ESDHC_DMA_SNOOP             0x00000040
+
+#define ESDHC_REGISTERS_MAP_SIZE    0x410
+
+static uint64_t esdhci_read(void *opaque, hwaddr offset, unsigned size)
+{
+    uint64_t ret;
+
+    if (size != 4) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " wrong size\n", size, offset);
+        return 0;
+    }
+
+    if (offset & 0x3) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " unaligned\n", size, offset);
+        return 0;
+    }
+
+    switch (offset) {
+    case SDHC_SYSAD:
+    case SDHC_BLKSIZE:
+    case SDHC_ARGUMENT:
+    case SDHC_TRNMOD:
+    case SDHC_RSPREG0:
+    case SDHC_RSPREG1:
+    case SDHC_RSPREG2:
+    case SDHC_RSPREG3:
+    case SDHC_BDATA:
+    case SDHC_PRNSTS:
+    case SDHC_HOSTCTL:
+    case SDHC_CLKCON:
+    case SDHC_NORINTSTS:
+    case SDHC_NORINTSTSEN:
+    case SDHC_NORINTSIGEN:
+    case SDHC_ACMD12ERRSTS:
+    case SDHC_CAPAB:
+    case SDHC_SLOT_INT_STATUS:
+        ret = sdhci_read(opaque, offset, size);
+        break;
+
+    case ESDHC_DMA_SYSCTL:
+    case 0x44:
+        ret = 0;
+        qemu_log_mask(LOG_UNIMP, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " not implemented\n", size, offset);
+        break;
+
+    default:
+        ret = 0;
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC rd_%ub @0x%02" HWADDR_PRIx
+                      " unknown offset\n", size, offset);
+        break;
+    }
+
+    return ret;
+}
+
+static void esdhci_write(void *opaque, hwaddr offset, uint64_t val,
+                         unsigned size)
+{
+    if (size != 4) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08lx wrong size\n", size, offset, val);
+        return;
+    }
+
+    if (offset & 0x3) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08lx unaligned\n", size, offset, val);
+        return;
+    }
+
+    switch (offset) {
+    case SDHC_SYSAD:
+    case SDHC_BLKSIZE:
+    case SDHC_ARGUMENT:
+    case SDHC_TRNMOD:
+    case SDHC_BDATA:
+    case SDHC_HOSTCTL:
+    case SDHC_CLKCON:
+    case SDHC_NORINTSTS:
+    case SDHC_NORINTSTSEN:
+    case SDHC_NORINTSIGEN:
+    case SDHC_FEAER:
+        sdhci_write(opaque, offset, val, size);
+        break;
+
+    case ESDHC_DMA_SYSCTL:
+    case 0x44:
+        qemu_log_mask(LOG_UNIMP, "ESDHC wr_%ub @0x%02" HWADDR_PRIx " <- 0x%08lx "
+                      "not implemented\n", size, offset, val);
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "ESDHC wr_%ub @0x%02" HWADDR_PRIx
+                      " <- 0x%08lx unknown offset\n", size, offset, val);
+        break;
+    }
+}
+
+static const MemoryRegionOps esdhc_mmio_ops = {
+    .read = esdhci_read,
+    .write = esdhci_write,
+    .valid = {
+        .min_access_size = 1,
+        .max_access_size = 4,
+        .unaligned = false
+    },
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void esdhci_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+    SDHCIState *s = SYSBUS_SDHCI(obj);
+
+    s->io_ops = &esdhc_mmio_ops;
+    s->io_registers_map_size = ESDHC_REGISTERS_MAP_SIZE;
+
+    /*
+     * Compatible with:
+     * - SD Host Controller Specification Version 2.0 Part A2
+     */
+    qdev_prop_set_uint8(dev, "sd-spec-version", 2);
+}
+
+static const TypeInfo esdhc_info = {
+    .name = TYPE_FSL_ESDHC,
+    .parent = TYPE_SYSBUS_SDHCI,
+    .instance_init = esdhci_init,
+};
+
 /* --- qdev i.MX eSDHC --- */
 
 #define USDHC_MIX_CTRL                  0x48
@@ -1907,6 +2051,7 @@ static void sdhci_register_types(void)
 {
     type_register_static(&sdhci_sysbus_info);
     type_register_static(&sdhci_bus_info);
+    type_register_static(&esdhc_info);
     type_register_static(&imx_usdhc_info);
     type_register_static(&sdhci_s3c_info);
 }
diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 01a64c5442..5b32e83eee 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -45,6 +45,7 @@ struct SDHCIState {
     AddressSpace *dma_as;
     MemoryRegion *dma_mr;
     const MemoryRegionOps *io_ops;
+    uint64_t io_registers_map_size;
 
     QEMUTimer *insert_timer;       /* timer for 'changing' sd card. */
     QEMUTimer *transfer_timer;
@@ -122,6 +123,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, PCI_SDHCI,
 DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
                          TYPE_SYSBUS_SDHCI)
 
+#define TYPE_FSL_ESDHC "fsl-esdhc"
+
 #define TYPE_IMX_USDHC "imx-usdhc"
 
 #define TYPE_S3C_SDHCI "s3c-sdhci"
-- 
2.37.3


