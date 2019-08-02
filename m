Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA07EAF9
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Aug 2019 06:09:18 +0200 (CEST)
Received: from localhost ([::1]:60326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htOsY-0002iv-6A
	for lists+qemu-devel@lfdr.de; Fri, 02 Aug 2019 00:09:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50574)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jasowang@redhat.com>) id 1htOqM-0006uJ-N7
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 00:07:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1htOqL-0001nf-Q0
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 00:07:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48320)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1htOqL-0001nb-LC
 for qemu-devel@nongnu.org; Fri, 02 Aug 2019 00:07:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E8B903090FC1;
 Fri,  2 Aug 2019 04:07:00 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
 (hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 925921001959;
 Fri,  2 Aug 2019 04:06:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com
Date: Fri,  2 Aug 2019 00:06:06 -0400
Message-Id: <20190802040606.22573-7-jasowang@redhat.com>
In-Reply-To: <20190802040606.22573-1-jasowang@redhat.com>
References: <20190802040606.22573-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 02 Aug 2019 04:07:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH V5 6/6] virtio: add property to enable packed
 virtqueue
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
Cc: yang.zhong@intel.com, tiwei.bie@intel.com, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, maxime.coquelin@redhat.com, jfreimann@redhat.com,
 weiyshay@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/virtio/virtio.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 226c94078f..3a4ed3ab34 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -285,7 +285,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
     DEFINE_PROP_BIT64("any_layout", _state, _field, \
                       VIRTIO_F_ANY_LAYOUT, true), \
     DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
-                      VIRTIO_F_IOMMU_PLATFORM, false)
+                      VIRTIO_F_IOMMU_PLATFORM, false), \
+    DEFINE_PROP_BIT64("packed", _state, _field, \
+                      VIRTIO_F_RING_PACKED, false)
 
 hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
 bool virtio_queue_enabled(VirtIODevice *vdev, int n);
-- 
2.18.1


