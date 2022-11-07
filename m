Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9546202A3
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAwD-0000TV-Hd; Mon, 07 Nov 2022 17:49:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwB-0000QN-K1
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAwA-0003UL-0H
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=cRsOyAc8o2iboJ641Q7iruED3uOFosCV+RougIOw3mMxpncZhqTbUG/RYTkFtEs9WOP2wv
 Z6IsJ6Sni6RpjL8BwI1M1J6F4Zo7FeouaKmzLXe5hPEFtYaeVQtOPnoN4yo1LjFaT+oqc9
 MpzFk+2sshOfDGGS47IWcEK1qWJdQpc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-592-2CzJ1W_tOJCF-umzD8KtIg-1; Mon, 07 Nov 2022 17:49:48 -0500
X-MC-Unique: 2CzJ1W_tOJCF-umzD8KtIg-1
Received: by mail-qt1-f198.google.com with SMTP id
 z11-20020a05622a028b00b003a550fa8989so8936948qtw.12
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:49:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/T3Dt9wIyzlRr9uFngTKw2OSvTs4mJnNOFX6ReE5Y4=;
 b=KH8TBIYlqo8R1Iz2EQMtbIAwl4oG/wRki/pS5SKwppgCNnk85xOtiXPHu3C4yP0SD5
 7ncEx064zD6YrRREpkHoiQW1fGSHSmHT9ALBVItEq1AHJE0S8EyaIdrCagwOF1zLKIeY
 4dgMfYwvVY8iTkXsvKgaexwmND1O9LH3qfaKg0xIpekqsF8e6MVomkWo2ybEse1KXhlk
 wVX7v+Or28gw7ASPjFbQu87SGLenRJZj944aPS7usdgilYsXpq9iIaQp38RmMdic/Im8
 t8S0wtM/tOxL9xNEVVbjWAB0fCAJeHwc7iFOycyj6Mn4udPUlCJQhdAuZS8JmABL1Znv
 Q73Q==
X-Gm-Message-State: ACrzQf1Zpw/j3tZ7l5PC+FoxIcQLrafjJONfGvJ+nWZFLiLzdicmEpMW
 +JYbdm2kBmVrIJ2NAHtdrxxhj3AGiT94mDd4XF+T37J8uXWNSYntTNrEEUf2jtfqc3KDYCYOMQZ
 Il43Vo/QK/z0rz6Qt5C4oR3deSjcEYWczBbBWSDkC3/Gs2fH6SiMz6Ob7e63g
X-Received: by 2002:a05:622a:4c10:b0:3a5:2772:2eb1 with SMTP id
 ey16-20020a05622a4c1000b003a527722eb1mr32936947qtb.37.1667861387583; 
 Mon, 07 Nov 2022 14:49:47 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6PU0br31DZtN4Vwks81agoBJyKR38T35uYllPaoRnfZrnhy7VkMhv+ITXVzr2D1YZxSbmD6w==
X-Received: by 2002:a05:622a:4c10:b0:3a5:2772:2eb1 with SMTP id
 ey16-20020a05622a4c1000b003a527722eb1mr32936922qtb.37.1667861387254; 
 Mon, 07 Nov 2022 14:49:47 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 x23-20020a05620a0b5700b006bb78d095c5sm7848705qkg.79.2022.11.07.14.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:49:46 -0800 (PST)
Date: Mon, 7 Nov 2022 17:49:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PULL v4 26/83] hw/virtio/virtio-iommu-pci: Enforce the device is
 plugged on the root bus
Message-ID: <20221107224600.934080-27-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


