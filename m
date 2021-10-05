Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22EB42291E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 15:55:22 +0200 (CEST)
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXkug-0004D4-2b
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 09:55:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXkod-0006s6-9k
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:49:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mXkob-0001OU-R8
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 09:49:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633441744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2RL+bQ2UJeWy7buZBOTB5hHKHtPUL5LgJUdbuyJtIE=;
 b=ShC9L361py2BEFzGGWicR6ArziKnb9+kqt5yPdaSs/eHxwXwINrUjbSp0w5PEZ+l9a4p23
 iXYUkdj9iygGk5yEpzfZCCtrACmf3ioUOcX0bVxaLFc1P5prTJ2SnEMFTehHZwHKMBhKtd
 S2DBpv1kcfpmRAS/iD5HHduYMn+EVhE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-U7-O4U8yPO-3H3wMFaY9Yw-1; Tue, 05 Oct 2021 09:49:03 -0400
X-MC-Unique: U7-O4U8yPO-3H3wMFaY9Yw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EE79835DE3;
 Tue,  5 Oct 2021 13:49:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D81C1F42C;
 Tue,  5 Oct 2021 13:49:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/3] vdpa: Add vhost_vdpa_section_end
Date: Tue,  5 Oct 2021 15:48:42 +0200
Message-Id: <20211005134843.439050-3-eperezma@redhat.com>
In-Reply-To: <20211005134843.439050-1-eperezma@redhat.com>
References: <20211005134843.439050-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/virtio/vhost-vdpa.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index ea1aa71ad8..be7c63b4ba 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -24,6 +24,19 @@
 #include "trace.h"
 #include "qemu-common.h"
 
+/*
+ * Return one past the end of the end of section. Be careful with uint64_t
+ * conversions!
+ */
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
@@ -160,10 +173,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
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
@@ -221,9 +231,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
     }
 
     iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
+    llend = vhost_vdpa_section_end(section);
 
     trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
 
-- 
2.27.0


