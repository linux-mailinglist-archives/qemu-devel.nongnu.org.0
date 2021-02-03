Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4C30E13B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:39:05 +0100 (CET)
Received: from localhost ([::1]:42210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7M7M-0003YE-91
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Loj-0004Gh-Hm
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Log-0003rH-EY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612372785;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nr90Yzwoq06/56xL6reoAmyLnIJp44T6sVIESCbk0s=;
 b=Cd4jV5XgcNUh1EiDdSdI2H40TIFtfUBkBXyKFlmW0FtwEEYZ8oKpth2xI5OQX7UgPL1lAe
 0932KKu+EXD1UtWqKv1sYggnZSObbiQpJQyD7B6M/urOEanjNOkgwkGPUuA9EPQg7iad62
 cAXCYYH6SYImdhZPfZL2pk9yrnYEUUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-Xx6NzrIxNu2RXWd6X5CyEg-1; Wed, 03 Feb 2021 12:19:44 -0500
X-MC-Unique: Xx6NzrIxNu2RXWd6X5CyEg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 231FD8030BC;
 Wed,  3 Feb 2021 17:19:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F895C238;
 Wed,  3 Feb 2021 17:19:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 3/4] hw/virtio/virtio-balloon: Remove the "class" property
Date: Wed,  3 Feb 2021 18:18:31 +0100
Message-Id: <20210203171832.483176-4-thuth@redhat.com>
In-Reply-To: <20210203171832.483176-1-thuth@redhat.com>
References: <20210203171832.483176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This property was only required for compatibility reasons in the
pc-1.0 machine type and earlier. Now that these machine types have
been removed, the property is not useful anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/virtio/virtio-balloon-pci.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/hw/virtio/virtio-balloon-pci.c b/hw/virtio/virtio-balloon-pci.c
index a2c5cc7207..79a3ba979a 100644
--- a/hw/virtio/virtio-balloon-pci.c
+++ b/hw/virtio/virtio-balloon-pci.c
@@ -34,21 +34,13 @@ struct VirtIOBalloonPCI {
     VirtIOPCIProxy parent_obj;
     VirtIOBalloon vdev;
 };
-static Property virtio_balloon_pci_properties[] = {
-    DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
 
 static void virtio_balloon_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOBalloonPCI *dev = VIRTIO_BALLOON_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
-    if (vpci_dev->class_code != PCI_CLASS_OTHERS &&
-        vpci_dev->class_code != PCI_CLASS_MEMORY_RAM) { /* qemu < 1.1 */
-        vpci_dev->class_code = PCI_CLASS_OTHERS;
-    }
-
+    vpci_dev->class_code = PCI_CLASS_OTHERS;
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
@@ -59,7 +51,6 @@ static void virtio_balloon_pci_class_init(ObjectClass *klass, void *data)
     PCIDeviceClass *pcidev_k = PCI_DEVICE_CLASS(klass);
     k->realize = virtio_balloon_pci_realize;
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
-    device_class_set_props(dc, virtio_balloon_pci_properties);
     pcidev_k->vendor_id = PCI_VENDOR_ID_REDHAT_QUMRANET;
     pcidev_k->device_id = PCI_DEVICE_ID_VIRTIO_BALLOON;
     pcidev_k->revision = VIRTIO_PCI_ABI_VERSION;
-- 
2.27.0


