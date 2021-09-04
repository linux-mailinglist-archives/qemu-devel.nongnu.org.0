Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1A9400D23
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:42:16 +0200 (CEST)
Received: from localhost ([::1]:51544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdQW-0001C9-06
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLC-0005St-6W
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLA-00018P-LN
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xjmYjxZE9lLfwg0tVzBHYCGbkvW274evNrtxFcpgMnM=;
 b=dLPXaikmGUMzu0DMxU6mIC2TnQir1flQy6I/YU5+VgAMr2/iz1CmFS6k5deDYBBT/NWkHx
 vpcUufpua5TMdSW3U5FiIWGlENtXPU9OixKH8fD2Y40Vu8vOhS3rrDZx0PGR5JhjyFIAsU
 NBLAMJJQOwCWJsHxOZmRpNT0hUVpKx4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-DlpemcnYO8mBI2c0xZPkxg-1; Sat, 04 Sep 2021 17:36:41 -0400
X-MC-Unique: DlpemcnYO8mBI2c0xZPkxg-1
Received: by mail-ej1-f72.google.com with SMTP id
 q15-20020a17090622cf00b005c42d287e6aso841749eja.18
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xjmYjxZE9lLfwg0tVzBHYCGbkvW274evNrtxFcpgMnM=;
 b=aVr7aCcL35+EG7P+wBLju5+SdFdG5FtYW54K5Ampj/frsfmdz1eY7H2Z4dfd1+iwCm
 Sj4daG36SSW3SbrszQePsE9iCO6BNs+euAGnqsaAUwSXZSNm9YL2d1Gz34i7mipb5vUs
 ZpCG55tvCADrxTG1FEENECwejeAf342YoKDDjt4zk/GN0rM8bJqF4QqPn6HVAgWQa5V5
 D3V3bZtbWxJqvvOn3peEyQ5baIdk9kGIJcWfQ615Y+qIzwxwsoCW7HlfWYepYGkalckw
 DueDFN6SDmR4YfuuL4qCkwFubWgIri9XX/5dI22fQi0erJF574EB+buTeCsI506f0wI2
 Rxzg==
X-Gm-Message-State: AOAM5315IFEksNQHLuIH5DU9/YK6TAM3+Xr2GOdg/A9rNT6B+/aS/sMQ
 cVSRahvnmbccZgeeJqdmjFSB2IkaywF2jCwumgy8R4X37lORHaj3lgXIGadWh7jI8sL8o/fFYAk
 +EVAPBHBs7K4i2GLmX0Jh28f2keKtUmoSl9NCv3bKMQTeyEpqT83sK12ZiVqy
X-Received: by 2002:a05:6402:2032:: with SMTP id
 ay18mr5922492edb.364.1630791400017; 
 Sat, 04 Sep 2021 14:36:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyGnp9GfQAUtemjZtKWjIfWiKDyH+L/VggMK4PX/cPUvgYhagCIKEJeM9tkbKOvN5LEzV0JA==
X-Received: by 2002:a05:6402:2032:: with SMTP id
 ay18mr5922474edb.364.1630791399748; 
 Sat, 04 Sep 2021 14:36:39 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id lb12sm1523638ejc.28.2021.09.04.14.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:39 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/35] virtio-pci: implement iommu_enabled()
Message-ID: <20210904213506.486886-15-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch implements the PCI transport version of iommu_enabled. This
is done by comparing the address space returned by
pci_device_iommu_address_space() against address_space_memory.

Note that an ideal approach is to use pci_device_iommu_address_space()
in get_dma_as(), but it might not work well since the IOMMU could be
initialized after the virtio-pci device is initialized.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210804034803.1644-3-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 433060ac02..6e16e2705c 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1121,6 +1121,19 @@ static AddressSpace *virtio_pci_get_dma_as(DeviceState *d)
     return pci_get_address_space(dev);
 }
 
+static bool virtio_pci_iommu_enabled(DeviceState *d)
+{
+    VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
+    PCIDevice *dev = &proxy->pci_dev;
+    AddressSpace *dma_as = pci_device_iommu_address_space(dev);
+
+    if (dma_as == &address_space_memory) {
+        return false;
+    }
+
+    return true;
+}
+
 static bool virtio_pci_queue_enabled(DeviceState *d, int n)
 {
     VirtIOPCIProxy *proxy = VIRTIO_PCI(d);
@@ -2202,6 +2215,7 @@ static void virtio_pci_bus_class_init(ObjectClass *klass, void *data)
     k->ioeventfd_enabled = virtio_pci_ioeventfd_enabled;
     k->ioeventfd_assign = virtio_pci_ioeventfd_assign;
     k->get_dma_as = virtio_pci_get_dma_as;
+    k->iommu_enabled = virtio_pci_iommu_enabled;
     k->queue_enabled = virtio_pci_queue_enabled;
 }
 
-- 
MST


