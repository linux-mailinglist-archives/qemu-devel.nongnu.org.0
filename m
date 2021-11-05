Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0512D44691D
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 20:27:41 +0100 (CET)
Received: from localhost ([::1]:54170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj4sF-0006GX-OO
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 15:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mj4qY-00045D-CL
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 15:25:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mj4qV-0006vq-KJ
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 15:25:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636140349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W0xby7xdJIVIXviqKy+KpvMH0lTXfsDYL2f4Z5k54BI=;
 b=gHgVl/R47fFWxtLmZUnHAdbrBIMecIGK5QjX5B5mTQaskrq5IdeIcp3OhjEKKd+cEbWtRI
 Xq4IV+TFV0/DQ7Pa87y+2QacoEAtHxtQaGMmN79CVxA0QU/zOHQvquDKaA+wirmrSQ9Fhc
 xNsaBEaAH1iS/ExlJXj6K6xyEDcjxAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-Hgv-3FHiNbSbfj3A3XAUUg-1; Fri, 05 Nov 2021 15:25:47 -0400
X-MC-Unique: Hgv-3FHiNbSbfj3A3XAUUg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E4651922023;
 Fri,  5 Nov 2021 19:25:46 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 685E157CAB;
 Fri,  5 Nov 2021 19:25:42 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] trace-events,pci: unify trace events format
Date: Fri,  5 Nov 2021 20:25:41 +0100
Message-Id: <20211105192541.655831-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Unify format used by trace_pci_update_mappings_del(),
trace_pci_update_mappings_add(), trace_pci_cfg_write() and
trace_pci_cfg_read() to print the device name and bus number,
slot number and function number.

For instance:

  pci_cfg_read virtio-net-pci 00:0 @0x20 -> 0xffffc00c
  pci_cfg_write virtio-net-pci 00:0 @0x20 <- 0xfea0000c
  pci_update_mappings_del d=0x555810b92330 01:00.0 4,0xffffc000+0x4000
  pci_update_mappings_add d=0x555810b92330 01:00.0 4,0xfea00000+0x4000

becomes

  pci_cfg_read virtio-net-pci 01:00.0 @0x20 -> 0xffffc00c
  pci_cfg_write virtio-net-pci 01:00.0 @0x20 <- 0xfea0000c
  pci_update_mappings_del virtio-net-pci 01:00.0 4,0xffffc000+0x4000
  pci_update_mappings_add virtio-net-pci 01:00.0 4,0xfea00000+0x4000

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 hw/pci/pci.c        | 4 ++--
 hw/pci/pci_host.c   | 6 ++++--
 hw/pci/trace-events | 8 ++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 4a84e478cef5..9a76905d38c7 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1387,7 +1387,7 @@ static void pci_update_mappings(PCIDevice *d)
 
         /* now do the real mapping */
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_del(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_del(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
@@ -1395,7 +1395,7 @@ static void pci_update_mappings(PCIDevice *d)
         }
         r->addr = new_addr;
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_add(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_add(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index cf02f0d6a501..0768893aafcf 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -78,7 +78,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
         return;
     }
 
-    trace_pci_cfg_write(pci_dev->name, PCI_SLOT(pci_dev->devfn),
+    trace_pci_cfg_write(pci_dev->name, pci_dev_bus_num(pci_dev),
+                        PCI_SLOT(pci_dev->devfn),
                         PCI_FUNC(pci_dev->devfn), addr, val);
     pci_dev->config_write(pci_dev, addr, val, MIN(len, limit - addr));
 }
@@ -102,7 +103,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
     }
 
     ret = pci_dev->config_read(pci_dev, addr, MIN(len, limit - addr));
-    trace_pci_cfg_read(pci_dev->name, PCI_SLOT(pci_dev->devfn),
+    trace_pci_cfg_read(pci_dev->name, pci_dev_bus_num(pci_dev),
+                       PCI_SLOT(pci_dev->devfn),
                        PCI_FUNC(pci_dev->devfn), addr, ret);
 
     return ret;
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index fc777d0b5e6e..7570752c4045 100644
--- a/hw/pci/trace-events
+++ b/hw/pci/trace-events
@@ -1,12 +1,12 @@
 # See docs/devel/tracing.rst for syntax documentation.
 
 # pci.c
-pci_update_mappings_del(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
-pci_update_mappings_add(void *d, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "d=%p %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
+pci_update_mappings_del(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
+pci_update_mappings_add(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, int bar, uint64_t addr, uint64_t size) "%s %02x:%02x.%x %d,0x%"PRIx64"+0x%"PRIx64
 
 # pci_host.c
-pci_cfg_read(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x -> 0x%x"
-pci_cfg_write(const char *dev, unsigned devid, unsigned fnid, unsigned offs, unsigned val) "%s %02u:%u @0x%x <- 0x%x"
+pci_cfg_read(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x -> 0x%x"
+pci_cfg_write(const char *dev, uint32_t bus, uint32_t slot, uint32_t func, unsigned offs, unsigned val) "%s %02x:%02x.%x @0x%x <- 0x%x"
 
 # msix.c
 msix_write_config(char *name, bool enabled, bool masked) "dev %s enabled %d masked %d"
-- 
2.31.1


