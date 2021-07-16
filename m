Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B593CB9AD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:22:56 +0200 (CEST)
Received: from localhost ([::1]:40464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pfz-0006kK-78
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYq-00015b-5R
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYo-000485-I9
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x7ZuFpyOa5DAu/c2wYuyH48s1IkBMXPNPbP+hmJeKHY=;
 b=JPkxbaw1IKCCZNkKMRSRaf0arCL7RkjABdFxBv2EbwRP0emRf1kudOJMFQth6ooooDuLEf
 yImyN5w+WMf8ZKhGBtzlJJnDMjdnTDIFsmbqvP6WD8IE+Ph7N20qgNJXL5dxOTxH3j3oU+
 vrlGJdow/E7bthHb6u9aro6Ql32uUuE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-MpdlAX5RM2qbp6gj501uJw-1; Fri, 16 Jul 2021 11:15:28 -0400
X-MC-Unique: MpdlAX5RM2qbp6gj501uJw-1
Received: by mail-wm1-f70.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so1303744wms.5
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x7ZuFpyOa5DAu/c2wYuyH48s1IkBMXPNPbP+hmJeKHY=;
 b=q4q08hTkbAcHohH2TTqTq6INJ3mjj9cqjG/WrUSmTLPZLuHhM00VMHragZ8C53GvTw
 HVDBXs0kuHJahjlJstNmX6n7/H9n6LCbN1E6B4KYxwWFCCfBdaBXZ06xUNuIlY7qluyx
 Pn8e55666RcPG434MoCHHAubttKGn8tgHpP/1STg5kmA+sFAiaIQIT7TYo6373m6keiD
 HPv1NkSc3Q2HfA3BfpOnG7/5PhnUWoHWV7qdMNPxJezs5SCuptUcFj5r0KEJ8Y+Iz7kO
 hmotHak7RK1mrsdXh9q3PhIatlB4DnYstKMBh6bRAAfk3Gkqd+pestf/fxPhiiIBvZWh
 BoRA==
X-Gm-Message-State: AOAM531xP+oPpgosBSAZXmcd9CH7ZKZfoxYCBrx6TZb+PhLiHuYf165W
 GRtevpFBjRov6PxrUnGxiy/ikpd9vwXs/uPJYt912nE6XL+yklntiXpX4sLXYDRry2+8UOVjLjI
 v/i+Ky1kPFl9WR0uAFMQwxMnP7NG8VbkNbEMoI01GxSSMcd6M4Yd4gX3d1SNw
X-Received: by 2002:adf:cf07:: with SMTP id o7mr12927931wrj.216.1626448527226; 
 Fri, 16 Jul 2021 08:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzojQ1LWq/fooruqcVvE/wmaOfDiMpi0kgKlvczK5lesIaIrZSXvygBUS8+3QtZC61cLlg/cw==
X-Received: by 2002:adf:cf07:: with SMTP id o7mr12927909wrj.216.1626448527050; 
 Fri, 16 Jul 2021 08:15:27 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id y16sm10477648wrw.42.2021.07.16.08.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:26 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 10/19] hw/pci/pci_host: Allow PCI host to bypass iommu
Message-ID: <20210716151416.155127-11-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Xingang Wang <wangxingang5@huawei.com>, Eric Auger <eric.auger@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Add a new bypass_iommu property for PCI host and use it to check
whether devices attached to the PCI root bus will bypass iommu.
In pci_device_iommu_address_space(), check the property and
avoid getting iommu address space for devices bypass iommu.

Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <1625748919-52456-2-git-send-email-wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/pci/pci.h      |  1 +
 include/hw/pci/pci_host.h |  1 +
 hw/pci/pci.c              | 18 +++++++++++++++++-
 hw/pci/pci_host.c         |  1 +
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 6be4e0c460..f4d51b672b 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -480,6 +480,7 @@ void pci_for_each_bus(PCIBus *bus,
 
 PCIBus *pci_device_root_bus(const PCIDevice *d);
 const char *pci_root_bus_path(PCIDevice *dev);
+bool pci_bus_bypass_iommu(PCIBus *bus);
 PCIDevice *pci_find_device(PCIBus *bus, int bus_num, uint8_t devfn);
 int pci_qdev_find_device(const char *id, PCIDevice **pdev);
 void pci_bus_get_w64_range(PCIBus *bus, Range *range);
diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
index 52e038c019..c6f4eb4585 100644
--- a/include/hw/pci/pci_host.h
+++ b/include/hw/pci/pci_host.h
@@ -43,6 +43,7 @@ struct PCIHostState {
     uint32_t config_reg;
     bool mig_enabled;
     PCIBus *bus;
+    bool bypass_iommu;
 
     QLIST_ENTRY(PCIHostState) next;
 };
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 377084f1a8..27d588e268 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -416,6 +416,22 @@ const char *pci_root_bus_path(PCIDevice *dev)
     return rootbus->qbus.name;
 }
 
+bool pci_bus_bypass_iommu(PCIBus *bus)
+{
+    PCIBus *rootbus = bus;
+    PCIHostState *host_bridge;
+
+    if (!pci_bus_is_root(bus)) {
+        rootbus = pci_device_root_bus(bus->parent_dev);
+    }
+
+    host_bridge = PCI_HOST_BRIDGE(rootbus->qbus.parent);
+
+    assert(host_bridge->bus == rootbus);
+
+    return host_bridge->bypass_iommu;
+}
+
 static void pci_root_bus_init(PCIBus *bus, DeviceState *parent,
                               MemoryRegion *address_space_mem,
                               MemoryRegion *address_space_io,
@@ -2718,7 +2734,7 @@ AddressSpace *pci_device_iommu_address_space(PCIDevice *dev)
 
         iommu_bus = parent_bus;
     }
-    if (iommu_bus && iommu_bus->iommu_fn) {
+    if (!pci_bus_bypass_iommu(bus) && iommu_bus && iommu_bus->iommu_fn) {
         return iommu_bus->iommu_fn(bus, iommu_bus->iommu_opaque, devfn);
     }
     return &address_space_memory;
diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index 8ca5fadcbd..cf02f0d6a5 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -222,6 +222,7 @@ const VMStateDescription vmstate_pcihost = {
 static Property pci_host_properties_common[] = {
     DEFINE_PROP_BOOL("x-config-reg-migration-enabled", PCIHostState,
                      mig_enabled, true),
+    DEFINE_PROP_BOOL("bypass-iommu", PCIHostState, bypass_iommu, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


