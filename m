Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D092C3381A5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 00:44:05 +0100 (CET)
Received: from localhost ([::1]:44212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKUyK-000155-AO
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 18:44:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUxT-0000TH-Sa
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:43:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lKUxQ-0002a7-Uv
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 18:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615506188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kr1sYdGqvkblDq7E7beNUefzJun9ajdTevpLu/YGYQ8=;
 b=ZB3cfsyxD0zg8TiW74DoGNJzGST0T1XK3Nx0KViAPjbY7+DrHJxSALWz3/jUYvpYRmFQFB
 hJay6o1y6Aa2TkaBHnyuxpGJdVplMQ0RYUBKI4czV9Om8iVQFzXKfZhRwgosiUFNgeb7rK
 sIzohfdomcv1wyitPiPEA29vSaGE4Ww=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-287-_Z72TYDMOTK1DeVOtX_bcw-1; Thu, 11 Mar 2021 18:43:06 -0500
X-MC-Unique: _Z72TYDMOTK1DeVOtX_bcw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17B6A801817;
 Thu, 11 Mar 2021 23:43:05 +0000 (UTC)
Received: from gimli.home (ovpn-112-255.phx2.redhat.com [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CAAD95D742;
 Thu, 11 Mar 2021 23:43:01 +0000 (UTC)
Subject: [PULL 01/10] vfio: Fix vfio_listener_log_sync function name typo
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 11 Mar 2021 16:43:01 -0700
Message-ID: <161550618144.21070.14144611866226905521.stgit@gimli.home>
In-Reply-To: <161550593889.21070.5662039089881992714.stgit@gimli.home>
References: <161550593889.21070.5662039089881992714.stgit@gimli.home>
User-Agent: StGit/0.21-2-g8ef5
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Zenghui Yu <yuzenghui@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Zenghui Yu <yuzenghui@huawei.com>

There is an obvious typo in the function name of the .log_sync() callback.
Spell it correctly.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
Message-Id: <20201204014240.772-1-yuzenghui@huawei.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763f8..d360d6f2da14 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1118,7 +1118,7 @@ static int vfio_sync_dirty_bitmap(VFIOContainer *container,
                        int128_get64(section->size), ram_addr);
 }
 
-static void vfio_listerner_log_sync(MemoryListener *listener,
+static void vfio_listener_log_sync(MemoryListener *listener,
         MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
@@ -1136,7 +1136,7 @@ static void vfio_listerner_log_sync(MemoryListener *listener,
 static const MemoryListener vfio_memory_listener = {
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
-    .log_sync = vfio_listerner_log_sync,
+    .log_sync = vfio_listener_log_sync,
 };
 
 static void vfio_listener_release(VFIOContainer *container)


