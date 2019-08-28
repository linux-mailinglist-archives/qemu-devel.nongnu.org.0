Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 795BAA04DA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 16:26:40 +0200 (CEST)
Received: from localhost ([::1]:37042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2yuF-0003nP-CE
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 10:26:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <skrtbhtngr@gmail.com>) id 1i2yrp-0002G1-Ki
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <skrtbhtngr@gmail.com>) id 1i2yro-0000aI-Hi
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:09 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:35513)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <skrtbhtngr@gmail.com>)
 id 1i2yro-0000a1-C8
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:08 -0400
Received: by mail-pf1-x441.google.com with SMTP id d85so1848025pfd.2
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 07:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o3w6rrLptWsFl8HE0mEgf9b9opUynwdbAv9zKRjY76s=;
 b=C1TOLL70Bbbrw4z3o1ggTJAQzG23iiFszFlaEpNvJOnfuijwHaOKAQJizlhLP7yXMV
 uiQgD59DzTxVm0qLTp/mAztp9DqowRF1/X+iTLQ9URxaKo490LZXvpw7es8nSszgSOGc
 fNqwwCCTT74dENmdJWl7urAmsxkrRkJPxIVHK/C3P7dzHRGFzxlEoqdfC48DabfwrW6o
 2ec07kGoQeTj4G2vWX1MVw87jmDJY4Qjr1cmyiuGl33Iokjhd3GFhbfOewMYCRv5IQUg
 YRT+nFfKkIaGBtZ32TZvNyMlSLfatF0w6Z9f+3sDVMT70CmD9lcNUJF2146kPmS3HN3L
 xM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o3w6rrLptWsFl8HE0mEgf9b9opUynwdbAv9zKRjY76s=;
 b=evea9kSEWToE2/GGw6hUXQSVUdOU1K14N7wwy4HD3+ugdZC4PeJGYU0L34S7R0ZjSG
 SzQZ37x1Ub73wOe8t8OiFEy6vg08jTLNFzrkeTAzbjsfTioqe9q8ZIMWz6tdpWmz6Qyo
 sFELyC7Pp65f3tTfd/uuEhKQBENSVx6A1uO0rihmysYM8epKpx2XlvqpdXme7Unh3QZU
 Z/9okRAVR1yzvn/PIsP/wwoChf0u89OXijmHs2z4w2rIaRGIKhTGGUcSe6fUH99i0tEL
 D07Jm/6NLw1YDyfM0o+2d5mpgJWR16oZ6NFZtxTma7wRVWr4717cgxqhx2bYu2QJVIgt
 IxHw==
X-Gm-Message-State: APjAAAWXdo2mEYriyrhcTkaObc7ckeEzPJTvvKTrcith/nUaqPX6IVhs
 smeA6FfofaEs0pcEmxUzBuh7QNdb
X-Google-Smtp-Source: APXvYqxofj04wFpXvYD02jC2e+JAxfMsCOOb6/4d6RsBUe96hbmN/BQoNLgHhZL8bTyvOZG2+I0gSw==
X-Received: by 2002:a17:90a:6d43:: with SMTP id
 z61mr4607130pjj.32.1567002247071; 
 Wed, 28 Aug 2019 07:24:07 -0700 (PDT)
Received: from beta.it.iitb.ac.in ([2405:204:2200:9180:9ba0:a3d7:637f:11ad])
 by smtp.gmail.com with ESMTPSA id g1sm3180742pgg.27.2019.08.28.07.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:24:06 -0700 (PDT)
From: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 19:53:28 +0530
Message-Id: <20190828142328.24561-3-skrtbhtngr@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828142328.24561-1-skrtbhtngr@gmail.com>
References: <20190828142328.24561-1-skrtbhtngr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v1 2/2] hw/pvrdma: add live migration support
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
Cc: Yuval Shaia <yuval.shaia@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vmstate_pvrdma describes the PCI and MSIX states as well as the dma
address for dsr and the gid table of device.
vmstate_pvrdma_gids describes each gid in the gid table.

pvrdma_post_save() does the job of unregistering gid entries from the
backend device in the source host.

pvrdma_post_load() maps to dsr using the loaded dma address, registers
each loaded gid into the backend device, and finally calls load_dsr()
to perform other mappings and ring init operations.

Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Yuval Shaia <yuval.shaia@oracle.com>
Signed-off-by: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
---
 hw/rdma/vmw/pvrdma_main.c | 77 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index 6c90db96f9..6f8b56dea3 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -28,6 +28,7 @@
 #include "sysemu/sysemu.h"
 #include "monitor/monitor.h"
 #include "hw/rdma/rdma.h"
+#include "migration/register.h"
 
 #include "../rdma_rm.h"
 #include "../rdma_backend.h"
@@ -593,6 +594,81 @@ static void pvrdma_shutdown_notifier(Notifier *n, void *opaque)
     pvrdma_fini(pci_dev);
 }
 
+static int pvrdma_post_save(void *opaque)
+{
+    int i, rc;
+    PVRDMADev *dev = opaque;
+
+    for (i = 0; i < MAX_GIDS; i++) {
+
+        if (!dev->rdma_dev_res.port.gid_tbl[i].gid.global.interface_id) {
+            continue;
+        }
+        rc = rdma_backend_del_gid(&dev->backend_dev,
+                                   dev->backend_eth_device_name,
+                                   &dev->rdma_dev_res.port.gid_tbl[i].gid);
+        if (rc) {
+            return -EINVAL;
+        }
+    }
+
+    return 0;
+}
+
+static int pvrdma_post_load(void *opaque, int version_id)
+{
+    int i, rc;
+    PVRDMADev *dev = opaque;
+    PCIDevice *pci_dev = PCI_DEVICE(dev);
+    DSRInfo *dsr_info = &dev->dsr_info;
+
+    dsr_info->dsr = rdma_pci_dma_map(pci_dev, dsr_info->dma,
+                                sizeof(struct pvrdma_device_shared_region));
+    if (!dsr_info->dsr) {
+        rdma_error_report("Failed to map to DSR");
+        return -ENOMEM;
+    }
+
+    for (i = 0; i < MAX_GIDS; i++) {
+
+        if (!dev->rdma_dev_res.port.gid_tbl[i].gid.global.interface_id) {
+            continue;
+        }
+
+        rc = rdma_backend_add_gid(&dev->backend_dev,
+                                  dev->backend_eth_device_name,
+                                  &dev->rdma_dev_res.port.gid_tbl[i].gid);
+        if (rc) {
+            return -EINVAL;
+        }
+    }
+
+    return load_dsr(dev);
+}
+
+static const VMStateDescription vmstate_pvrdma_gids = {
+    .name = "pvrdma-gids",
+    .fields = (VMStateField[]) {
+            VMSTATE_UINT8_ARRAY_V(gid.raw, RdmaRmGid, 16, 0),
+            VMSTATE_END_OF_LIST()
+    }
+};
+
+static const VMStateDescription vmstate_pvrdma = {
+    .name = PVRDMA_HW_NAME,
+    .post_save = pvrdma_post_save,
+    .post_load = pvrdma_post_load,
+    .fields = (VMStateField[]) {
+            VMSTATE_PCI_DEVICE(parent_obj, PVRDMADev),
+            VMSTATE_MSIX(parent_obj, PVRDMADev),
+            VMSTATE_UINT64(dsr_info.dma, PVRDMADev),
+            VMSTATE_STRUCT_ARRAY(rdma_dev_res.port.gid_tbl, PVRDMADev,
+                                 MAX_PORT_GIDS, 0, vmstate_pvrdma_gids,
+                                 RdmaRmGid),
+            VMSTATE_END_OF_LIST()
+    }
+};
+
 static void pvrdma_realize(PCIDevice *pdev, Error **errp)
 {
     int rc = 0;
@@ -688,6 +764,7 @@ static void pvrdma_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "RDMA Device";
     dc->props = pvrdma_dev_properties;
+    dc->vmsd = &vmstate_pvrdma;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
 
     ir->print_statistics = pvrdma_print_statistics;
-- 
2.21.0


