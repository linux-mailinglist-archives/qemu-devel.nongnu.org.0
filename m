Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C935F41F0
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:25:59 +0200 (CEST)
Received: from localhost ([::1]:47690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofg3i-00038n-QQ
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz5-0005hG-Fa
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz1-0007fl-Ir
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664882466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9InghcT15qdHxz05tAYaIvWLbkY1HN3xvSc/VXL0Rmw=;
 b=WC5x+fwF82KWspO7IQi7lIiAq/pkUcxDSJqyQRs7yGi9r0UDUzHZMVeD/LRrTBPc4GJfjA
 o5VZ5nmoKfVT9VpIPjYWc8qXBSWViIDL3gLgYGEhHaPMIiJPvCL4jSFgD4Ije09ACarfTQ
 14HvTXVLRIDtViU5A3ulS0mRH7YAyLE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-651-987Wp8eWPfOFM1pP5SuYtA-1; Tue, 04 Oct 2022 07:21:03 -0400
X-MC-Unique: 987Wp8eWPfOFM1pP5SuYtA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76C9B86E91F;
 Tue,  4 Oct 2022 11:21:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22211112132D;
 Tue,  4 Oct 2022 11:21:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91497180084D; Tue,  4 Oct 2022 13:21:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 Pankaj Gupta <pankaj.gupta@amd.com>
Subject: [PATCH v3 3/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_PMEM
Date: Tue,  4 Oct 2022 13:20:58 +0200
Message-Id: <20221004112100.301935-4-kraxel@redhat.com>
In-Reply-To: <20221004112100.301935-1-kraxel@redhat.com>
References: <20221004112100.301935-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Not needed for a virtio 1.0 device.  virtio_pci_device_plugged()
overrides them anyway (so no functional change).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Tested-by: Pankaj Gupta <pankaj.gupta@amd.com>
---
 include/hw/pci/pci.h        | 1 -
 hw/virtio/virtio-pmem-pci.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b6aefb33fb17..42c83cb5ed00 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -84,7 +84,6 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_RNG         0x1005
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
 #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
-#define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
 
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
index 2b2a0b1eae10..7d9f4ec189b9 100644
--- a/hw/virtio/virtio-pmem-pci.c
+++ b/hw/virtio/virtio-pmem-pci.c
@@ -90,8 +90,6 @@ static void virtio_pmem_pci_class_init(ObjectClass *klass, void *data)
 
     k->realize = virtio_pmem_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
-    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_PMEM;
     pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
     pcidev_k->class_id = PCI_CLASS_OTHERS;
 
-- 
2.37.3


