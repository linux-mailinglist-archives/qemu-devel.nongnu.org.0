Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308BA5FD5EA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 10:06:42 +0200 (CEST)
Received: from localhost ([::1]:32922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oitEn-0001Zt-94
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 04:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6G-0005Wx-Uj
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1ois6F-0006ul-Bt
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 02:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665644026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3TFNT0UF/29ZYG3Iovs5QCCFjKpnZTnvzRsmSk8wX3g=;
 b=Xh9l6+/3ja3WEbRXoFgAT/XdVQqa4Ex+5P2WiHjt+1SyMJH5dnTBHiiqStXemchClw7Fhx
 Md9pN44KHSufvfSHGSsVJu0FomVJJYA3YbfJ9mRvA0mPn5SJzsVH5HPwdfG4nv3QvLA7j6
 wtUMVOLkmDh5kgnKKqkFkhMeWp+PANA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-M8LjOHYTN5OS83EFEKuNRQ-1; Thu, 13 Oct 2022 02:53:42 -0400
X-MC-Unique: M8LjOHYTN5OS83EFEKuNRQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3CC1B86F131;
 Thu, 13 Oct 2022 06:53:42 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CACD7414A809;
 Thu, 13 Oct 2022 06:53:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8BD361800D54; Thu, 13 Oct 2022 08:52:25 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PULL 21/26] pci-ids: document modern virtio-pci ids in pci.h too
Date: Thu, 13 Oct 2022 08:52:19 +0200
Message-Id: <20221013065224.1864145-22-kraxel@redhat.com>
In-Reply-To: <20221013065224.1864145-1-kraxel@redhat.com>
References: <20221013065224.1864145-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
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

While being at it add a #define for the magic 0x1040 number.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20221004112100.301935-6-kraxel@redhat.com>
---
 include/hw/pci/pci.h   | 10 ++++++++++
 hw/virtio/virtio-pci.c |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 42c83cb5ed00..d1ac308574f1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -76,6 +76,7 @@ extern bool pci_available;
 #define PCI_SUBVENDOR_ID_REDHAT_QUMRANET 0x1af4
 #define PCI_SUBDEVICE_ID_QEMU            0x1100
 
+/* legacy virtio-pci devices */
 #define PCI_DEVICE_ID_VIRTIO_NET         0x1000
 #define PCI_DEVICE_ID_VIRTIO_BLOCK       0x1001
 #define PCI_DEVICE_ID_VIRTIO_BALLOON     0x1002
@@ -85,6 +86,15 @@ extern bool pci_available;
 #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
 #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
 
+/*
+ * modern virtio-pci devices get their id assigned automatically,
+ * there is no need to add #defines here.  It gets calculated as
+ *
+ * PCI_DEVICE_ID = PCI_DEVICE_ID_VIRTIO_10_BASE +
+ *                 virtio_bus_get_vdev_id(bus)
+ */
+#define PCI_DEVICE_ID_VIRTIO_10_BASE     0x1040
+
 #define PCI_VENDOR_ID_REDHAT             0x1b36
 #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
 #define PCI_DEVICE_ID_REDHAT_SERIAL      0x0002
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index a50c5a57d7e5..e7d80242b73f 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1688,7 +1688,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
         pci_set_word(config + PCI_VENDOR_ID,
                      PCI_VENDOR_ID_REDHAT_QUMRANET);
         pci_set_word(config + PCI_DEVICE_ID,
-                     0x1040 + virtio_bus_get_vdev_id(bus));
+                     PCI_DEVICE_ID_VIRTIO_10_BASE + virtio_bus_get_vdev_id(bus));
         pci_config_set_revision(config, 1);
     }
     config[PCI_INTERRUPT_PIN] = 1;
-- 
2.37.3


