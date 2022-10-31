Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CE6137B4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:19:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHn-00077k-8n; Mon, 31 Oct 2022 08:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHI-0003Tz-N2
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHG-0002cl-I2
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=PdEQoUrVx+0HeWgZDV7R35Ft3HyqnhVgIlrOm//Sibh5LzYLA+Nb3ezyN3tSXO82ovb7P8
 TDDBxQjzL1lXhP4zJWq2DYwBke/K3ZU+wWUxURwC7LV/gw1OTNk5X9ZbC9btiucxmnjS2e
 cuSgf0TbEIDenPIUdsa9LzMsNEbV2HE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-483-H0EsIeJrMjCy8G1jGPmnfA-1; Mon, 31 Oct 2022 08:52:28 -0400
X-MC-Unique: H0EsIeJrMjCy8G1jGPmnfA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso2572848wmj.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=Gi1vmS/15+BIOTmC1Vf8hnl7DHpCv+7ojf+5hXh+ThjwbkrxqLsfSJPAzwEqLB0ooq
 RD5MbqZmYEqI0T45slTeiqS22+EkIjCEaCe79Hrx5Y926hdUUyh+MAsZzQdcYOO6x2SP
 9f9x7sKw0/nrr/EbFqcjTbFuWTCoBnmYgecWQz9hPSPr8DxbbNdfX7b6AV0nWwfgSJ1a
 gKWqGeDwMcOnv5ULmdQfOFvW7ZlWnRDedwCLfzb4qRQr8Ul4ID5fIi8n8UDQGIlcm11K
 bPeFlyBIe+Hn5bm7cWlWjX0NmwithjlnIVfHZmXgXT6AR1I4mobtYIObGQhKI+L3i2sv
 2adQ==
X-Gm-Message-State: ACrzQf1H6+5JaKOQIe0EyDMJariLbaJRoebRkt5d6LYpEFWa7NvIl18L
 +78ZTOdgKxRG4IAFmg9kqDjRS5Hh0dSLy74ElGHvZc4F11PpmrKsmFBsG5KEOJKDoCNxwC8frqu
 T6hW0cE8akHjwhXVjjcWe9MVEArtU8K+Jlv6ynUEkx/QLYDqWym2xtn56amFt
X-Received: by 2002:a5d:50cf:0:b0:236:86df:257f with SMTP id
 f15-20020a5d50cf000000b0023686df257fmr8027786wrt.374.1667220746795; 
 Mon, 31 Oct 2022 05:52:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7GFiayqoq4LZqYZwquAjKwSSfOKyU5mn6YvqBco59Uj5hpYOOUxX6hmpB/fGuMJnXoiDxWLA==
X-Received: by 2002:a5d:50cf:0:b0:236:86df:257f with SMTP id
 f15-20020a5d50cf000000b0023686df257fmr8027769wrt.374.1667220746534; 
 Mon, 31 Oct 2022 05:52:26 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 k18-20020a05600c081200b003b4935f04a4sm7706069wmp.5.2022.10.31.05.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:26 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PULL 35/86] hw/virtio/virtio-iommu-pci: Enforce the device is
 plugged on the root bus
Message-ID: <20221031124928.128475-36-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Eric Auger <eric.auger@redhat.com>

In theory the virtio-iommu-pci could be plugged anywhere in the PCIe
topology and as long as the dt/acpi info are properly built this should
work. However at the moment we fail to do that because the
virtio-iommu-pci BDF is not computed at plug time and in that case
vms->virtio_iommu_bdf gets an incorrect value.

For instance if the virtio-iommu-pci is plugged onto a pcie root port
and the virtio-iommu protects a virtio-block-pci device the guest does
not boot.

So let's do not pretend we do support this case and fail the initialize()
if we detect the virtio-iommu-pci is plugged anywhere else than on the
root bus. Anyway this ability is not needed.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20221012163448.121368-1-eric.auger@redhat.com>
Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-iommu-pci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 79ea8334f0..7ef2f9dcdb 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -17,6 +17,7 @@
 #include "hw/qdev-properties-system.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/pci/pci_bus.h"
 #include "qom/object.h"
 
 typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
@@ -44,6 +45,7 @@ static Property virtio_iommu_pci_properties[] = {
 static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
+    PCIBus *pbus = pci_get_bus(&vpci_dev->pci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
 
@@ -57,11 +59,17 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
             s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
             error_setg(errp, "reserved region %d has an invalid type", i);
             error_append_hint(errp, "Valid values are 0 and 1\n");
+            return;
         }
     }
+    if (!pci_bus_is_root(pbus)) {
+        error_setg(errp, "virtio-iommu-pci must be plugged on the root bus");
+        return;
+    }
+
     object_property_set_link(OBJECT(dev), "primary-bus",
-                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
-                             &error_abort);
+                             OBJECT(pbus), &error_abort);
+
     virtio_pci_force_virtio_1(vpci_dev);
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
-- 
MST


