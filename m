Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1DB25F41EF
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 13:25:58 +0200 (CEST)
Received: from localhost ([::1]:54166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofg3h-00033L-Pb
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 07:25:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz5-0005hH-G6
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1offz2-0007fq-Ip
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 07:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664882467;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEkOloB4baIi/51hPzceH4bCVxljRlhlsqVRhpVKGYE=;
 b=f7yLqidQWV7csV/WLu9/1g/7TzbkwpxfLJd9LW+5mmIOTbNmXDlEy9k96aFp+uw8nov7zn
 IWiRBwH56q8pvm+tQf+8C/9FeIMslKq3M7jcjprlRwglAxSiqPQTcVV9FiQi8jWGarJ8M7
 35NA8k3f6lx/9ieUVk6ohzDOOIQnIOg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-scWVY2J5OOaO5srNm1UGtA-1; Tue, 04 Oct 2022 07:21:03 -0400
X-MC-Unique: scWVY2J5OOaO5srNm1UGtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 707D285A59D;
 Tue,  4 Oct 2022 11:21:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.48])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 205AE2166B26;
 Tue,  4 Oct 2022 11:21:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8280E1800848; Tue,  4 Oct 2022 13:21:00 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 peter.maydell@linaro.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 2/5] pci-ids: drop PCI_DEVICE_ID_VIRTIO_MEM
Date: Tue,  4 Oct 2022 13:20:57 +0200
Message-Id: <20221004112100.301935-3-kraxel@redhat.com>
In-Reply-To: <20221004112100.301935-1-kraxel@redhat.com>
References: <20221004112100.301935-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Not needed for a virtio 1.0 device.  virtio_pci_device_plugged()
overrides them anyway (so no functional change).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 include/hw/pci/pci.h       | 1 -
 hw/virtio/virtio-mem-pci.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 89eaca429389..b6aefb33fb17 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -85,7 +85,6 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
 #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
 #define PCI_DEVICE_ID_VIRTIO_PMEM        0x1013
-#define PCI_DEVICE_ID_VIRTIO_MEM         0x1015
 
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
diff --git a/hw/virtio/virtio-mem-pci.c b/hw/virtio/virtio-mem-pci.c
index be2383b0c522..5c5c1e3ae3da 100644
--- a/hw/virtio/virtio-mem-pci.c
+++ b/hw/virtio/virtio-mem-pci.c
@@ -104,8 +104,6 @@ static void virtio_mem_pci_class_init(ObjectClass *klass, void *data)
 
     k->realize = virtio_mem_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
-    pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_MEM;
     pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
     pcidev_k->class_id = PCI_CLASS_OTHERS;
 
-- 
2.37.3


