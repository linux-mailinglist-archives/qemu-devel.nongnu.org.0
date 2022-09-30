Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D245F0D23
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 16:11:56 +0200 (CEST)
Received: from localhost ([::1]:40458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeGk7-0006uT-3p
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 10:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeGX1-000455-Nz
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:58:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oeGWy-0002Of-Fc
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 09:58:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664546299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XiWuXMrnHYJ64lWJS4tlR3CpP/fqVjBguglbMGWm9EA=;
 b=Bd1ib+8AAAo+Rw+vd8huXstgdZqKdNldaIiU6xRseyAJf2i4GO2y37bZFifLIUOPNWixZU
 AXzgvWlsFgd1sX3iO5Bt5Ro3axJzz4fVaZoq5vyNjAeql7N5OwEnTruVWJw1EnGn7hCgl1
 O13Vaz5qTWcfvphgmDm9HL/7xodWhQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-P4vpPl3PM1CpSJvoWN3G2A-1; Fri, 30 Sep 2022 09:58:15 -0400
X-MC-Unique: P4vpPl3PM1CpSJvoWN3G2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ACF5101E14C;
 Fri, 30 Sep 2022 13:58:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1685F140EBF6;
 Fri, 30 Sep 2022 13:58:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 255691800630; Fri, 30 Sep 2022 15:58:11 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>, David Hildenbrand <david@redhat.com>,
 peter.maydell@linaro.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 4/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_VSOCK
Date: Fri, 30 Sep 2022 15:58:09 +0200
Message-Id: <20220930135810.1892149-5-kraxel@redhat.com>
In-Reply-To: <20220930135810.1892149-1-kraxel@redhat.com>
References: <20220930135810.1892149-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not needed for a virtio 1.0 device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/pci/pci.h             | 1 -
 hw/virtio/vhost-user-vsock-pci.c | 2 --
 hw/virtio/vhost-vsock-pci.c      | 2 --
 3 files changed, 5 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 42c83cb5ed00..fe103f35d9d6 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -83,7 +83,6 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_SCSI        0x1004
 #define PCI_DEVICE_ID_VIRTIO_RNG         0x1005
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
-#define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
 
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
index e5a86e801362..8499b6871f50 100644
--- a/hw/virtio/vhost-user-vsock-pci.c
+++ b/hw/virtio/vhost-user-vsock-pci.c
@@ -55,8 +55,6 @@ static void vhost_user_vsock_pci_class_init(ObjectClass *klass, void *data)
     k->realize = vhost_user_vsock_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     device_class_set_props(dc, vhost_user_vsock_pci_properties);
-    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
-    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_VSOCK;
     pcidev_k->revision = 0x00;
     pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
 }
diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index 9f34414d3814..170a806b6765 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -65,8 +65,6 @@ static void vhost_vsock_pci_class_init(ObjectClass *klass, void *data)
     k->realize = vhost_vsock_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     device_class_set_props(dc, vhost_vsock_pci_properties);
-    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
-    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_VSOCK;
     pcidev_k->revision = 0x00;
     pcidev_k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
 }
-- 
2.37.3


