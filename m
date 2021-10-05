Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3142207E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:17:57 +0200 (CEST)
Received: from localhost ([::1]:59960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfe8-0007M9-9a
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXfQO-0001OX-Mb
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXfOS-0000ge-7x
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633420903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8+g+Ee9iMHc2qvX8RtMM+YrYu4G5r2V4WvvWxsP2l8k=;
 b=GcqBVNIs4lmluZnc/cpDgSmLE6CmZoxYAT95jKhOxIrqevvJn4uKq0bdT7TkScGgNvc++Y
 15RS5HhKGeQzOm9Fx2Ec0FaLn7bPCFU3SKbLZ8qDVt14+VsnPTYhIvnCbzZ/tNXm/ninMa
 FfnGC1ECtKBAanBVedbQkBnQ6FBZYzw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-McJRgIcmOFyGa8kntkvbTw-1; Tue, 05 Oct 2021 04:01:41 -0400
X-MC-Unique: McJRgIcmOFyGa8kntkvbTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A6E218414A7;
 Tue,  5 Oct 2021 08:01:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAED160BF4;
 Tue,  5 Oct 2021 08:01:38 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] vdpa: Add vhost_vdpa_section_end
Date: Tue,  5 Oct 2021 10:01:30 +0200
Message-Id: <20211005080131.408506-3-eperezma@redhat.com>
In-Reply-To: <20211005080131.408506-1-eperezma@redhat.com>
References: <20211005080131.408506-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Abstract this operation, that will be reused when validating the region
against the iova range that the device supports.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ea1aa71ad8..a1de6c7c9c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -24,6 +24,15 @@
 #include "trace.h"
 #include "qemu-common.h"
 
+static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
+{
+    Int128 llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+
+    return llend;
+}
+
 static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
 {
     return (!memory_region_is_ram(section->mr) &&
@@ -160,10 +169,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
-
+    llend = vhost_vdpa_section_end(section);
     if (int128_ge(int128_make64(iova), llend)) {
         return;
     }
@@ -221,9 +227,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    llend = vhost_vdpa_section_end(section);
 
     trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
 
-- 
2.27.0


