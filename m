Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A2024A1EF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 16:41:23 +0200 (CEST)
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8PHG-0003UZ-7o
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 10:41:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k8PFI-0000KZ-0k
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:39:20 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42926
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k8PFG-00023m-7X
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597847957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzOh70yaTNs0uTiq2/vD5Wi4o5uIzFKgdVh1Pbo4ad4=;
 b=PXF21e7pA5+NDKlDdvBv5NoyGaCiV3eSbHmXXpm2SpGvjQi/64qzPYuWcoORDpWwM2NfHm
 m9CVkkgLC3B53KHu2AX+fdQgBZhID/SDCq8RREI/0egpJDcngEI9QR8BBJUP/s3TOS7+e2
 h5vTceWE/wowL+cvLFPoJ3U8xwebKMI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-wItj1giEN2q8AXfWr8REsw-1; Wed, 19 Aug 2020 10:39:15 -0400
X-MC-Unique: wItj1giEN2q8AXfWr8REsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 352D71014DF9;
 Wed, 19 Aug 2020 14:39:14 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-40.ams2.redhat.com
 [10.36.113.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDF2F5F7D8;
 Wed, 19 Aug 2020 14:39:09 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] vhost-vsock-pci: force virtio version 1
Date: Wed, 19 Aug 2020 16:38:49 +0200
Message-Id: <20200819143851.78069-2-sgarzare@redhat.com>
In-Reply-To: <20200819143851.78069-1-sgarzare@redhat.com>
References: <20200819143851.78069-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:57:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Qinghua Cheng <qcheng@redhat.com>,
 Qian Cai <caiqian@redhat.com>, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 9b3a35ec82 ("virtio: verify that legacy support is not
accidentally on") added a safety check that requires to set
'disable-legacy=on' on vhost-vsock-pci device:

    $ ./qemu-system-x86_64 ... -device vhost-vsock-pci,guest-cid=5
        qemu-system-x86_64: -device vhost-vsock-pci,guest-cid=5:
        device is modern-only, use disable-legacy=on

virtio-vsock was introduced after the release of VIRTIO 1.0
specifications, so it should be 'modern-only'.
In addition Cornelia verified that forcing a legacy mode on
vhost-vsock-pci device using x86-64 host and s390x guest, so with
different endianness, produces strange behaviours.

This patch forces virtio version 1 and removes the 'transitional_name'
property removing the need to specify 'disable-legacy=on' on
vhost-vsock-pci device.

Cc: qemu-stable@nongnu.org
Reported-by: Qian Cai <caiqian@redhat.com>
Reported-by: Qinghua Cheng <qcheng@redhat.com>
Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1868449
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-vsock-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vsock-pci.c b/hw/virtio/vhost-vsock-pci.c
index a815278e69..d1fcad0472 100644
--- a/hw/virtio/vhost-vsock-pci.c
+++ b/hw/virtio/vhost-vsock-pci.c
@@ -44,6 +44,7 @@ static void vhost_vsock_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VHostVSockPCI *dev = VHOST_VSOCK_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
+    virtio_pci_force_virtio_1(vpci_dev);
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
@@ -72,7 +73,6 @@ static void vhost_vsock_pci_instance_init(Object *obj)
 static const VirtioPCIDeviceTypeInfo vhost_vsock_pci_info = {
     .base_name             = TYPE_VHOST_VSOCK_PCI,
     .generic_name          = "vhost-vsock-pci",
-    .transitional_name     = "vhost-vsock-pci-transitional",
     .non_transitional_name = "vhost-vsock-pci-non-transitional",
     .instance_size = sizeof(VHostVSockPCI),
     .instance_init = vhost_vsock_pci_instance_init,
-- 
2.26.2


