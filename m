Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B44337C47
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:16:15 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKPr4-00075C-FI
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:16:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3vlxKYAgKCqkfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com>)
 id 1lKPkC-0007AV-2X
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:08 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:49593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3vlxKYAgKCqkfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com>)
 id 1lKPk8-0000ba-OV
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:09:07 -0500
Received: by mail-pg1-x54a.google.com with SMTP id p1so11888450pgi.16
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=AE7pQ5meJ679ZcNGV9XyhD2Z5HGvzHS0MV/3HumzxtM=;
 b=hp2NA0LaoXc2BqFxXYC2YaWwYSirhjTZ66eHHQ6vXT21q3Iq6r56KqkoySv6fMLTXq
 sVd5hAC42eNhhLkzJ/LbxWvlR9o8+4kUYF5yG6zUHJ4d4FsW2IvC0GyIqI81bODsCrvK
 R7Ai8RxFVaRecM2uJLd0kngpEoWV/BxBVVVHuIlLOPGRAsDiFsDoNZgSs5ornIFfoW0a
 A0lIQNxs6BwK10ghQwtYhwCr9O8zwJWLwvt7+MoxyIMYWdJzGEaglIE8CwnqLfMSFsnx
 /GBIVwerpwlGprW66B30jfzYtQn+X36YZbUo2nxNWTUdof+ioHmC5aDZvT6FpPALwaGg
 alAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=AE7pQ5meJ679ZcNGV9XyhD2Z5HGvzHS0MV/3HumzxtM=;
 b=JQgHLUID9GlH3YxvfUzlxnpyVNSxRTEC8q1JTLZ3Tj4NVf8M7MsHJQ/crsEbR7DmEe
 MHbVx6f2raCSe1kAjwRVPECZrqtbOuh84fuVDtnp4svplCRZcis51nQ9T/PbSv2EOIIy
 ERLNFSfAPz1rcZvTwrBGTu02HaOb7dozwdUVq5i840t6zh0jgwkvD/CBAyllmrkIzMav
 wXzzDQmUf0GmyA2e5c8vogQhvyu6K9f3wQdTbXanawZGQslNOvOqGz63UE9NdREpDMBd
 RTkzIk34FCYfLqywUx0KQW2O2wuPBQXjUYIJ8zZ0Ty1DwRh7Z7lTx/N4llu6/Du6SEDd
 epLg==
X-Gm-Message-State: AOAM533x+tY/vd4fHySVyiKDdzTlgsIsYSKOYa1fofsR+kGWHEga3jZM
 OCLLFIKugCtGb6S0YiOq3suFOz0hOuHn7g==
X-Google-Smtp-Source: ABdhPJzKakDmdc3oIojeLH5HiK5ZyLeDaVAyLLB93T33/CtWjzrLrKYK9/wJbhulDkDcD7ADWsVy4OJZZTcEcg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:f68a:b029:e5:b17f:9154 with SMTP
 id l10-20020a170902f68ab02900e5b17f9154mr9019443plg.28.1615486142639; Thu, 11
 Mar 2021 10:09:02 -0800 (PST)
Date: Thu, 11 Mar 2021 10:08:53 -0800
In-Reply-To: <20210311180855.149764-1-wuhaotsh@google.com>
Message-Id: <20210311180855.149764-4-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
Subject: [PATCH v2 3/5] hw/arm: Add MFT device to NPCM7xx Soc
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com, 
 kfting@nuvoton.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 venture@google.com, dje@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3vlxKYAgKCqkfdQJXcbQPXXPUN.LXVZNVd-MNeNUWXWPWd.XaP@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds the recently implemented MFT device to the NPCM7XX
SoC file.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
---
 docs/system/arm/nuvoton.rst |  2 +-
 hw/arm/npcm7xx.c            | 45 ++++++++++++++++++++++++++++++-------
 include/hw/arm/npcm7xx.h    |  2 ++
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index f9fb9224da..d3cf2d9cd7 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -45,6 +45,7 @@ Supported devices
  * Pulse Width Modulation (PWM)
  * SMBus controller (SMBF)
  * Ethernet controller (EMC)
+ * Tachometer
 
 Missing devices
 ---------------
@@ -63,7 +64,6 @@ Missing devices
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
- * Tachometer
  * PCI and PCIe root complex and bridges
  * VDM and MCTP support
  * Serial I/O expansion
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 9bd1e83f02..495b0f8e91 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -122,6 +122,14 @@ enum NPCM7xxInterrupt {
     NPCM7XX_SMBUS15_IRQ,
     NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
     NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
+    NPCM7XX_MFT0_IRQ            = 96,   /* MFT module 0 */
+    NPCM7XX_MFT1_IRQ,                   /* MFT module 1 */
+    NPCM7XX_MFT2_IRQ,                   /* MFT module 2 */
+    NPCM7XX_MFT3_IRQ,                   /* MFT module 3 */
+    NPCM7XX_MFT4_IRQ,                   /* MFT module 4 */
+    NPCM7XX_MFT5_IRQ,                   /* MFT module 5 */
+    NPCM7XX_MFT6_IRQ,                   /* MFT module 6 */
+    NPCM7XX_MFT7_IRQ,                   /* MFT module 7 */
     NPCM7XX_EMC2RX_IRQ          = 114,
     NPCM7XX_EMC2TX_IRQ,
     NPCM7XX_GPIO0_IRQ           = 116,
@@ -172,6 +180,18 @@ static const hwaddr npcm7xx_pwm_addr[] = {
     0xf0104000,
 };
 
+/* Register base address for each MFT Module */
+static const hwaddr npcm7xx_mft_addr[] = {
+    0xf0180000,
+    0xf0181000,
+    0xf0182000,
+    0xf0183000,
+    0xf0184000,
+    0xf0185000,
+    0xf0186000,
+    0xf0187000,
+};
+
 /* Direct memory-mapped access to each SMBus Module. */
 static const hwaddr npcm7xx_smbus_addr[] = {
     0xf0080000,
@@ -417,6 +437,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->mft); i++) {
+        object_initialize_child(obj, "mft[*]", &s->mft[i], TYPE_NPCM7XX_MFT);
+    }
+
     for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
@@ -603,6 +627,19 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
     }
 
+    /* MFT Modules. Cannot fail. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_mft_addr) != ARRAY_SIZE(s->mft));
+    for (i = 0; i < ARRAY_SIZE(s->mft); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->mft[i]);
+
+        qdev_connect_clock_in(DEVICE(&s->mft[i]), "clock-in",
+                              qdev_get_clock_out(DEVICE(&s->clk),
+                                                 "apb4-clock"));
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_mft_addr[i]);
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, NPCM7XX_MFT0_IRQ + i));
+    }
+
     /*
      * EMC Modules. Cannot fail.
      * The mapping of the device to its netdev backend works as follows:
@@ -680,14 +717,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[0]",       0xf0180000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[1]",       0xf0181000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[2]",       0xf0182000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[3]",       0xf0183000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[4]",       0xf0184000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[5]",       0xf0185000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[6]",       0xf0186000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[7]",       0xf0187000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pspi1",        0xf0200000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pspi2",        0xf0201000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index d32849a456..3f70554d0f 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -24,6 +24,7 @@
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
@@ -82,6 +83,7 @@ typedef struct NPCM7xxState {
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
     NPCM7xxPWMState     pwm[2];
+    NPCM7xxMFTState     mft[8];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
     NPCM7xxMCState      mc;
-- 
2.31.0.rc2.261.g7f71774620-goog


