Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F8F61372F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:59:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUJF-00052m-TM; Mon, 31 Oct 2022 08:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIn-00048h-LN
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUIj-0003P7-JL
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDXu9jRd9qqj00cFTHUQFrz69Hk7wjTE7YTb3iWea4A=;
 b=fT4Ox/EKtI63YX6HjwXfqWJBI/yP0TK1cHbYAAbBrx6QlhkcyKU8vvYnftbWvdLFh1P1RZ
 winpNPynZ0uE3+77JPjNIYZwOQnl60jUYxPCqTtSyL7OS9yCRzMVF0siMi3dTSP7ZjCYMl
 BwETykj/Ilkev9BU73fD1MSGhqL+MG8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-470-ceswJAT_ODKs-gZjwXtMAw-1; Mon, 31 Oct 2022 08:53:59 -0400
X-MC-Unique: ceswJAT_ODKs-gZjwXtMAw-1
Received: by mail-wr1-f71.google.com with SMTP id
 r22-20020adfa156000000b0023660e969ddso3011271wrr.19
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PDXu9jRd9qqj00cFTHUQFrz69Hk7wjTE7YTb3iWea4A=;
 b=ArQNSma798Ne+di9hmvK49Nzv0nPg0M6xiuisHkaprc0eDtBQFxg27LKIeKbF0+6lL
 W8X1/moQwX/zaJ+AH1YLrj5FdIfG9UPomkz2+hshhzUTnx83kxmsmt2TcYEuQ2mopIob
 FFL/YiZtdPgo+PhMbwq2oQh15n/rg4qaOasgpoLMuCVqJ1WQ5XNGNgEpOpxIZ0xE6M/v
 SJbK3Msw0mj9umSBNpbqI/OfxohGfWGNJ7PIWBiDSfesysduN2+y+LVDPOiSt/4JFCAM
 UtPkkns8ArqaH/7pAjYj6IVhny2Wau7ojuD4fuATtjOWrB5DE/2PR6P9IyWpYtoU3YLZ
 rM3Q==
X-Gm-Message-State: ACrzQf3qbKPN/nmzkwXMMsONcAs8kNxFNUJCMjUMZLYMy8TF4U1KZu7u
 xfKZzKGkACu1Kq60CziMc8QP+yPq2xQxB5a13c83Wjdg4xwqqKT3Rw/CBqOSgGy+HEx739mqF3P
 IOT6sXDV7jnc4aOBDZ5bB8V8KJB8fqoL5M9vPK35KokKEwCTGEIm5ZsbiHvX2
X-Received: by 2002:adf:ded2:0:b0:236:bad7:c850 with SMTP id
 i18-20020adfded2000000b00236bad7c850mr5859736wrn.565.1667220837806; 
 Mon, 31 Oct 2022 05:53:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5lsJIzKtpjH0mfcwyvrLwJaEjwmQQrAP3ydYbIworOoqVpb/JRH68SVRJxwIyeCtLsKLw9rA==
X-Received: by 2002:adf:ded2:0:b0:236:bad7:c850 with SMTP id
 i18-20020adfded2000000b00236bad7c850mr5859708wrn.565.1667220837483; 
 Mon, 31 Oct 2022 05:53:57 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k17-20020a05600c1c9100b003cf4ec90938sm566310wms.21.2022.10.31.05.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:53:57 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:53:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lev Kujawski <lkujaw@mailbox.org>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 68/86] hw/ide/piix: Ignore writes of hardwired PCI command
 register bits
Message-ID: <20221031124928.128475-69-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Lev Kujawski <lkujaw@mailbox.org>

One method to enable PCI bus mastering for IDE controllers, often used
by x86 firmware, is to write 0x7 to the PCI command register.  Neither
the PIIX 3/4 specifications nor actual PIIX 3 hardware (a Tyan S1686D
system) permit setting the Memory Space Enable (MSE) bit, thus the
command register would be left in an unspecified state without this
patch.

* hw/core/machine.c
  Facilitate migration by not masking writes to the PIIX 3/4 PCICMD
  register for machine states of QEMU versions prior to 7.2.
* hw/ide/piix.c
  a) Add a reference to the PIIX 4 data sheet.
  b) Mask the MSE bit using the QEMU PCI device wmask field.
  c) Define a new boolean property, x-filter-pcicmd, to control
     whether the write mask is enabled and enable it by default
     for both the PIIX 3 and PIIX 4 IDE controllers.
* include/hw/ide/pci.h
  Add the boolean filter_pcicmd field to the PCIIDEState structure,
  because the PIIX IDE controllers do not define their own state.
* tests/qtest/ide-test.c
  Use the command_disabled field of the QPCIDevice testing model to
  indicate that PCI_COMMAND_MEMORY is hardwired within PIIX 3/4 IDE
  controllers.

Signed-off-by: Lev Kujawski <lkujaw@mailbox.org>
Message-Id: <20221024094621.512806-3-lkujaw@mailbox.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/ide/pci.h   |  1 +
 hw/core/machine.c      |  2 ++
 hw/ide/piix.c          | 24 ++++++++++++++++++++++++
 tests/qtest/ide-test.c |  1 +
 4 files changed, 28 insertions(+)

diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..5424b00a9e 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -53,6 +53,7 @@ struct PCIIDEState {
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];
+    bool filter_pcicmd; /* used only for piix3/4 */
 };
 
 static inline IDEState *bmdma_active_if(BMDMAState *bmdma)
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 907fa78ff0..65fdfe2fed 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -42,6 +42,8 @@
 
 GlobalProperty hw_compat_7_1[] = {
     { "virtio-device", "queue_reset", "false" },
+    { "piix3-ide", "x-filter-pcicmd", "false" },
+    { "piix4-ide", "x-filter-pcicmd", "false" },
 };
 const size_t hw_compat_7_1_len = G_N_ELEMENTS(hw_compat_7_1);
 
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index de1f4f0efb..a3af32e126 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -25,6 +25,8 @@
  * References:
  *  [1] 82371FB (PIIX) AND 82371SB (PIIX3) PCI ISA IDE XCELERATOR,
  *      290550-002, Intel Corporation, April 1997.
+ *  [2] 82371AB PCI-TO-ISA / IDE XCELERATOR (PIIX4), 290562-001,
+ *      Intel Corporation, April 1997.
  */
 
 #include "qemu/osdep.h"
@@ -160,6 +162,21 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     uint8_t *pci_conf = dev->config;
     int rc;
 
+    /*
+     * Mask all IDE PCI command register bits except for Bus Master
+     * Function Enable (bit 2) and I/O Space Enable (bit 0), as the
+     * remainder are hardwired to 0 [1, p.48] [2, p.89-90].
+     *
+     * NOTE: According to the PIIX3 datasheet [1], the Memory Space
+     * Enable (MSE, bit 1) is hardwired to 1, but this is contradicted
+     * by actual PIIX3 hardware, the datasheet itself (viz., Default
+     * Value: 0000h), and the PIIX4 datasheet [2].
+     */
+    if (d->filter_pcicmd) {
+        pci_set_word(dev->wmask + PCI_COMMAND,
+                     PCI_COMMAND_MASTER | PCI_COMMAND_IO);
+    }
+
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_setup_bar(d);
@@ -185,6 +202,11 @@ static void pci_piix_ide_exitfn(PCIDevice *dev)
     }
 }
 
+static Property pci_piix_ide_properties[] = {
+    DEFINE_PROP_BOOL("x-filter-pcicmd", PCIIDEState, filter_pcicmd, TRUE),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
 /* NOTE: for the PIIX3, the IRQs and IOports are hardcoded */
 static void piix3_ide_class_init(ObjectClass *klass, void *data)
 {
@@ -198,6 +220,7 @@ static void piix3_ide_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_INTEL_82371SB_1;
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, pci_piix_ide_properties);
     dc->hotpluggable = false;
 }
 
@@ -220,6 +243,7 @@ static void piix4_ide_class_init(ObjectClass *klass, void *data)
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB;
     k->class_id = PCI_CLASS_STORAGE_IDE;
     set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
+    device_class_set_props(dc, pci_piix_ide_properties);
     dc->hotpluggable = false;
 }
 
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index dbe1563b23..d5cec7c14c 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -174,6 +174,7 @@ static QPCIDevice *get_pci_device(QTestState *qts, QPCIBar *bmdma_bar,
 
     *ide_bar = qpci_legacy_iomap(dev, IDE_BASE);
 
+    dev->command_disabled = PCI_COMMAND_MEMORY;
     qpci_device_enable(dev);
 
     return dev;
-- 
MST


