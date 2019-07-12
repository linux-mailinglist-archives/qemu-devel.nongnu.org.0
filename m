Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC817667D4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 09:37:04 +0200 (CEST)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlq75-0001ap-QO
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 03:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39099)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pagupta@redhat.com>) id 1hlq6W-0007y4-IL
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pagupta@redhat.com>) id 1hlq6U-0000qE-GF
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pagupta@redhat.com>) id 1hlq6U-0000q1-9P
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 03:36:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9A6BC30001D7;
 Fri, 12 Jul 2019 07:36:25 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-201.sin2.redhat.com
 [10.67.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1972D6062B;
 Fri, 12 Jul 2019 07:36:21 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: mst@redhat.com
Date: Fri, 12 Jul 2019 13:05:54 +0530
Message-Id: <20190712073554.21918-4-pagupta@redhat.com>
In-Reply-To: <20190712073554.21918-1-pagupta@redhat.com>
References: <20190712073554.21918-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Fri, 12 Jul 2019 07:36:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 3/3] virtio pmem: remove transational device
 info
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
Cc: pagupta@redhat.com, peter.maydell@linaro.org, cohuck@redhat.com,
 qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove transactional & non transactional device info
for virtio pmem. 

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 hw/virtio/virtio-pmem-pci.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/virtio/virtio-pmem-pci.c b/hw/virtio/virtio-pmem-pci.c
index 0da6627469..fe2af00fa1 100644
--- a/hw/virtio/virtio-pmem-pci.c
+++ b/hw/virtio/virtio-pmem-pci.c
@@ -113,8 +113,6 @@ static void virtio_pmem_pci_instance_init(Object *obj)
 static const VirtioPCIDeviceTypeInfo virtio_pmem_pci_info = {
     .base_name             = TYPE_VIRTIO_PMEM_PCI,
     .generic_name          = "virtio-pmem-pci",
-    .transitional_name     = "virtio-pmem-pci-transitional",
-    .non_transitional_name = "virtio-pmem-pci-non-transitional",
     .instance_size = sizeof(VirtIOPMEMPCI),
     .instance_init = virtio_pmem_pci_instance_init,
     .class_init    = virtio_pmem_pci_class_init,
-- 
2.14.5


