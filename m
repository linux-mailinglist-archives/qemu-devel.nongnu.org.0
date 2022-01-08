Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CE748807D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:25:47 +0100 (CET)
Received: from localhost ([::1]:46634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60UM-0000Rh-Va
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:25:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609c-0003sw-1f
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609Z-0002Ln-TL
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n1iLjx4SHThqUNpgxKUlFJfbmdTeh8ixg5DBOW9i3IU=;
 b=Wy40wOrEjvmdNt9b18RiONwnGxtffifLK8y89+pMzlLJ34o7rcFqK+szdfTN58/Gr2TlAO
 5+JkYCuEMN+/XHeLFunpiMphO0P9tcBXPAf+p9/7vIg9ujzeFjuDXnkB8VK0Q1LIYXbGDx
 PN9RVCKNzfn7/PstHa5rX1FhJfp5n2c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-fBjs4rqFNSyAponLElPqMg-1; Fri, 07 Jan 2022 20:04:16 -0500
X-MC-Unique: fBjs4rqFNSyAponLElPqMg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j8-20020a05600c1c0800b00346504f5743so5603467wms.6
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:04:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n1iLjx4SHThqUNpgxKUlFJfbmdTeh8ixg5DBOW9i3IU=;
 b=NZLg+t4abDN9Q/Yurktw6UbLuwRGUZuCfZ9pYna575LDPRg5q0akiqgV3XumnMIqUQ
 9n2DwUB9UETiYQqccxJqPHbPkD6+NC6IK7GSaJEdM6LjXx7fODy8HYuyU95YggeDCaxa
 elZBsXuEB+m2YUdAEraNyxmPdhGrcdxbpjsyH3rs3yEIfEIJ0+hOpL1h1NBFMh8zp6Ha
 0egCTmzf2eq2YgLRVLa5pBmWeGXqaiX4nN6PXeMO3kxeOrsYmV0up0prM3QbBILgAzmb
 ZYc3GHlj5R9v+WfwCcf0NJtO8cEkmwUVodqMaJIoeF4rvW7aSr01RyM+e5PuwqYqbt9M
 5IXA==
X-Gm-Message-State: AOAM533vfpudGKlDxWJ4VlpB45aq9o8r2HZANTjz/SIsZYFGMkjggbrx
 r40fW0JrlfxrdI7Vpbv9uj2nvi3hHFN/mATn738fz3WVUEmu1yN0TivUtcSh7mUss4JhA7T5MRb
 SLKjY9q3czsVglChF0odRaBGU9v/9AZMJl6a7mxFNkibUUCA+ANOKyIcWwkNA
X-Received: by 2002:adf:f5d2:: with SMTP id k18mr8927969wrp.567.1641603854753; 
 Fri, 07 Jan 2022 17:04:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxUXPY6FxrS3t2uqWP1nKFeFGFBr8k0VTgLtrO+e28j2goNFT6BmsfmLvUeQbfzXSK5EdE3YQ==
X-Received: by 2002:adf:f5d2:: with SMTP id k18mr8927957wrp.567.1641603854501; 
 Fri, 07 Jan 2022 17:04:14 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id i15sm247158wrf.6.2022.01.07.17.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:04:14 -0800 (PST)
Date: Fri, 7 Jan 2022 20:04:11 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 13/55] trace-events,pci: unify trace events format
Message-ID: <20220108003423.15830-14-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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


