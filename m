Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1DC3449E5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 16:54:22 +0100 (CET)
Received: from localhost ([::1]:51514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOMsn-0006A7-MN
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 11:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjv-0005N5-HK
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOMjs-00076g-Lt
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 11:45:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616427907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EeUbWNKIk7cGoc8diCDeN3aye5mUMnS1oxxE/sJ37XE=;
 b=SCeQUK9+bqs62ck3CYOoCZc6bZur++nbkuTtPP9W0mqYIvYB1QFTegr5OQBZxbr+Ea2hVo
 WKNeK7w3Rv7vuXfGTpi8dftDdbMnTxjKkr+foblC4CgZ+iBAia0eEyqeWB0KyiP2QCCJH8
 VFsqonAJ1LrT5lI9Lt7Hu5dOXTiHqcM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-rDAh5XYQMdKvCM46AWHlIw-1; Mon, 22 Mar 2021 11:45:05 -0400
X-MC-Unique: rDAh5XYQMdKvCM46AWHlIw-1
Received: by mail-wr1-f71.google.com with SMTP id i5so26318788wrp.8
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 08:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EeUbWNKIk7cGoc8diCDeN3aye5mUMnS1oxxE/sJ37XE=;
 b=HRbYzYDxCKHkXRy9CJDsii4jBitbp3aYH6RzypeN1hE2Xewy+W5/pHdkWNkARZ8YgR
 x4zIuvy0Vwel8pea92XjVgPG9Ho2z/5pi/4TzqkbBCF6fV5ZDmDclLkNh9ZGCs9ZjXzs
 4JgEPRERyrzjgf5Zdd5DxMK8bUkqPPqQPCEjSiUFxePxAkJmR+yHw2hJCsnUK67xvd7V
 n35oAv0X0tj7ogz2UmpqnY4loyidhEjOG1BwgUCIXKo+YaTCoAlRr8I2T2QbbQo6yddR
 9k9q+yGRrRt7GJIgUyEeIx/2qqjaJBN7sIO6/BwGpscDNnnZLYhjd/xCTuZQ8Gt+s3KO
 QsUA==
X-Gm-Message-State: AOAM5328dP57nSmhZPG48kWaYSvucYmBrXcRAHJ9HNwkcsohDwfXp37k
 AqqUZb0amYR/shNjSlXGZ/cO6a8ttWCAkDf42Dm+834B8HxaTMaEJhf3Lw2Bkov/hePxJlN9Niz
 f7FzNpTWwZ5Qr9hmAgsalwRI8aF099d8Qt002OnkafBhsJF4l9TLfBcZj3TpQ
X-Received: by 2002:a5d:558b:: with SMTP id i11mr188846wrv.176.1616427903699; 
 Mon, 22 Mar 2021 08:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLs5i9CN/bkQxVo7atLdB5S5fFiWwx6dXUnJyxMMWojgtH1O8q2dsflyXvul8noqw5Ut9dHg==
X-Received: by 2002:a5d:558b:: with SMTP id i11mr188830wrv.176.1616427903536; 
 Mon, 22 Mar 2021 08:45:03 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id y1sm16499898wmq.29.2021.03.22.08.45.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 08:45:03 -0700 (PDT)
Date: Mon, 22 Mar 2021 11:45:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] pci: acpi: ensure that acpi-index is unique
Message-ID: <20210322154417.524229-13-mst@redhat.com>
References: <20210322154417.524229-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210322154417.524229-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

it helps to avoid device naming conflicts when guest OS is
configured to use acpi-index for naming.
Spec ialso says so:

PCI Firmware Specification Revision 3.2
4.6.7.  _DSM for Naming a PCI or PCI Express Device Under Operating Systems
"
Instance number must be unique under \_SB scope. This instance number does not have to
be sequential in a given system configuration.
"

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210315180102.3008391-4-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/pcihp.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index ceab287bd3..f4cb3c979d 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -52,6 +52,21 @@ typedef struct AcpiPciHpFind {
     PCIBus *bus;
 } AcpiPciHpFind;
 
+static gint g_cmp_uint32(gconstpointer a, gconstpointer b, gpointer user_data)
+{
+    return a - b;
+}
+
+static GSequence *pci_acpi_index_list(void)
+{
+    static GSequence *used_acpi_index_list;
+
+    if (!used_acpi_index_list) {
+        used_acpi_index_list = g_sequence_new(NULL);
+    }
+    return used_acpi_index_list;
+}
+
 static int acpi_pcihp_get_bsel(PCIBus *bus)
 {
     Error *local_err = NULL;
@@ -277,6 +292,23 @@ void acpi_pcihp_device_pre_plug_cb(HotplugHandler *hotplug_dev,
                    ONBOARD_INDEX_MAX);
         return;
     }
+
+    /*
+     * make sure that acpi-index is unique across all present PCI devices
+     */
+    if (pdev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        if (g_sequence_lookup(used_indexes, GINT_TO_POINTER(pdev->acpi_index),
+                              g_cmp_uint32, NULL)) {
+            error_setg(errp, "a PCI device with acpi-index = %" PRIu32
+                       " already exist", pdev->acpi_index);
+            return;
+        }
+        g_sequence_insert_sorted(used_indexes,
+                                 GINT_TO_POINTER(pdev->acpi_index),
+                                 g_cmp_uint32, NULL);
+    }
 }
 
 void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
@@ -315,8 +347,22 @@ void acpi_pcihp_device_plug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
 void acpi_pcihp_device_unplug_cb(HotplugHandler *hotplug_dev, AcpiPciHpState *s,
                                  DeviceState *dev, Error **errp)
 {
+    PCIDevice *pdev = PCI_DEVICE(dev);
+
     trace_acpi_pci_unplug(PCI_SLOT(PCI_DEVICE(dev)->devfn),
                           acpi_pcihp_get_bsel(pci_get_bus(PCI_DEVICE(dev))));
+
+    /*
+     * clean up acpi-index so it could reused by another device
+     */
+    if (pdev->acpi_index) {
+        GSequence *used_indexes = pci_acpi_index_list();
+
+        g_sequence_remove(g_sequence_lookup(used_indexes,
+                          GINT_TO_POINTER(pdev->acpi_index),
+                          g_cmp_uint32, NULL));
+    }
+
     qdev_unrealize(dev);
 }
 
-- 
MST


