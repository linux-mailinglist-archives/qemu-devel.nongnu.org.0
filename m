Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE724A1F1
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 16:42:59 +0200 (CEST)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8PIo-0005pJ-Fs
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 10:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k8PFb-0000tL-Kz
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:39:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36993
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1k8PFX-00028t-KP
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 10:39:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597847975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PyjvQipO5fk4AXR6ZRzcuLhwiKd8Lh6A5C5j+BeJ9sc=;
 b=RDxpblX470LgrovBeXgPLS0rInRPzPiGbjzkP3IfL6C2vj/jsq497wgzr/h5lO5hhAAQGj
 89uQt7KiH73tlnH+V7YfLA3saWMJiraBNLI2/uNk5+6Au1nq0yX/AW3XVW8vk5l4naaoGA
 2QIkxz4/+wry0IkwqoBriK8LVW71B50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-RcMiTt0CMTuDSWwMKLFeuA-1; Wed, 19 Aug 2020 10:39:30 -0400
X-MC-Unique: RcMiTt0CMTuDSWwMKLFeuA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 764991007469;
 Wed, 19 Aug 2020 14:39:29 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-40.ams2.redhat.com
 [10.36.113.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDD555F7D8;
 Wed, 19 Aug 2020 14:39:14 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] vhost-user-vsock-pci: force virtio version 1
Date: Wed, 19 Aug 2020 16:38:50 +0200
Message-Id: <20200819143851.78069-3-sgarzare@redhat.com>
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
'disable-legacy=on' on vhost-user-vsock-pci device:

    $ ./qemu-system-x86_64 ... \
    -chardev socket,id=char0,reconnect=0,path=/tmp/vhost4.socket \
    -device vhost-user-vsock-pci,chardev=char0
        qemu-system-x86_64: -device vhost-user-vsock-pci,chardev=char0:
        device is modern-only, use disable-legacy=on

virtio-vsock was introduced after the release of VIRTIO 1.0
specifications, so it should be 'modern-only'.

This patch forces virtio version 1 and removes the 'transitional_name'
property, as done for vhost-vsock-pci, removing the need to specify
'disable-legacy=on' on vhost-user-vsock-pci device.

Cc: qemu-stable@nongnu.org
Suggested-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 hw/virtio/vhost-user-vsock-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user-vsock-pci.c b/hw/virtio/vhost-user-vsock-pci.c
index f4cf95873d..3e17cf0480 100644
--- a/hw/virtio/vhost-user-vsock-pci.c
+++ b/hw/virtio/vhost-user-vsock-pci.c
@@ -40,6 +40,7 @@ static void vhost_user_vsock_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
     VHostUserVSockPCI *dev = VHOST_USER_VSOCK_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
 
+    virtio_pci_force_virtio_1(vpci_dev);
     qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
 }
 
@@ -68,7 +69,6 @@ static void vhost_user_vsock_pci_instance_init(Object *obj)
 static const VirtioPCIDeviceTypeInfo vhost_user_vsock_pci_info = {
     .base_name             = TYPE_VHOST_USER_VSOCK_PCI,
     .generic_name          = "vhost-user-vsock-pci",
-    .transitional_name     = "vhost-user-vsock-pci-transitional",
     .non_transitional_name = "vhost-user-vsock-pci-non-transitional",
     .instance_size = sizeof(VHostUserVSockPCI),
     .instance_init = vhost_user_vsock_pci_instance_init,
-- 
2.26.2


