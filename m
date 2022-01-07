Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C63D487656
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:20:00 +0100 (CET)
Received: from localhost ([::1]:39838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nHr-00088s-Kh
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:19:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2F-0007UR-74
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2D-0001pK-8s
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:03:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1iLjx4SHThqUNpgxKUlFJfbmdTeh8ixg5DBOW9i3IU=;
 b=YERIBamWbptOfrBKBN1AyxtrlyeCkAIgNX5jAjHfXFP3WGItFZhlRXLbogir1gdJNGLS6S
 WYF+i7M8QjQqSYg7XcvC/473+Z/c5G1lppjEkwbx2JUczIFanH2Z5vVybKQzP0kFZkRtcp
 41TI4zzzMvWp5HJlz0NzccN9gouYdyI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-M6-XiOpwMu6MELXKfS8lYQ-1; Fri, 07 Jan 2022 06:03:47 -0500
X-MC-Unique: M6-XiOpwMu6MELXKfS8lYQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so4498824wma.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n1iLjx4SHThqUNpgxKUlFJfbmdTeh8ixg5DBOW9i3IU=;
 b=FCZqx8mWVzkwz31fTKqgYfnHJZe+Yz5V7wuG/fUYRUb6ZoF3th+B7ikQAyqx77/yhA
 9ogf8LzPHkY43jCC+LNVagh/iDisShQwMI5XBvARDEafalN0IJ/koDBEQ44VgbL9dYcA
 Zrpr+/5bpnZAgVvELlUa5ucDALfEU556dyU2oHj4MpWDYwMnU6LoFB30fqjKvLJA9SxH
 EYr+K8FwpXEqmF/TqKgc+8lrV/1b1F9OpHs5g8IqaO385h8lL3p5x6bJIQYOadAXPelJ
 lCNaDOKlArTZRT0T/Gcb4cxwLp/mJEfTb/jHFTjokAQ82GQW2j3C7bz5ZGejfr9R03LW
 GIIA==
X-Gm-Message-State: AOAM530SGnlVaLBTlK0uOf8MS9P7MCcw4SkzGJ5nf+InBz/tWEe3nsEd
 uugDV7GuxGsGdNPyQaAi6tfnzVVvFZUGmTAUZ7TOz3ll+w4l4YSL2bmT748LfAZmxCw7HyzV2u2
 Oum3fX9jIk02KlIJMIiSfn2M05VaBiSL4lcXcIsxCK4VuB+bgaYlubQvnah+j
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr10909245wmq.54.1641553425995; 
 Fri, 07 Jan 2022 03:03:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+dgX47hnzw+2Tqrn86Mywn40BjJLkLpvQbEI9sCkvNw/tdK1vzNnjWjP8x5aQeJmb+os7oA==
X-Received: by 2002:a05:600c:3643:: with SMTP id
 y3mr10909225wmq.54.1641553425754; 
 Fri, 07 Jan 2022 03:03:45 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id b14sm4776030wri.112.2022.01.07.03.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:03:45 -0800 (PST)
Date: Fri, 7 Jan 2022 06:03:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 13/55] trace-events,pci: unify trace events format
Message-ID: <20220107102526.39238-14-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

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
Message-Id: <20211105192541.655831-1-lvivier@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci/pci.c        | 4 ++--
 hw/pci/pci_host.c   | 6 ++++--
 hw/pci/trace-events | 8 ++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e5993c1ef5..322ba450e7 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1390,7 +1390,7 @@ static void pci_update_mappings(PCIDevice *d)
 
         /* now do the real mapping */
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_del(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_del(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
@@ -1398,7 +1398,7 @@ static void pci_update_mappings(PCIDevice *d)
         }
         r->addr = new_addr;
         if (r->addr != PCI_BAR_UNMAPPED) {
-            trace_pci_update_mappings_add(d, pci_dev_bus_num(d),
+            trace_pci_update_mappings_add(d->name, pci_dev_bus_num(d),
                                           PCI_SLOT(d->devfn),
                                           PCI_FUNC(d->devfn),
                                           i, r->addr, r->size);
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 7beafd40a8..eaf217ff55 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -79,7 +79,8 @@ void pci_host_config_write_common(PCIDevice *pci_dev, uint32_t addr,
         return;
     }
 
-    trace_pci_cfg_write(pci_dev->name, PCI_SLOT(pci_dev->devfn),
+    trace_pci_cfg_write(pci_dev->name, pci_dev_bus_num(pci_dev),
+                        PCI_SLOT(pci_dev->devfn),
                         PCI_FUNC(pci_dev->devfn), addr, val);
     pci_dev->config_write(pci_dev, addr, val, MIN(len, limit - addr));
 }
@@ -104,7 +105,8 @@ uint32_t pci_host_config_read_common(PCIDevice *pci_dev, uint32_t addr,
     }
 
     ret = pci_dev->config_read(pci_dev, addr, MIN(len, limit - addr));
-    trace_pci_cfg_read(pci_dev->name, PCI_SLOT(pci_dev->devfn),
+    trace_pci_cfg_read(pci_dev->name, pci_dev_bus_num(pci_dev),
+                       PCI_SLOT(pci_dev->devfn),
                        PCI_FUNC(pci_dev->devfn), addr, ret);
 
     return ret;
diff --git a/hw/pci/trace-events b/hw/pci/trace-events
index fc777d0b5e..7570752c40 100644
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
MST


