Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F69E397F93
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:32:57 +0200 (CEST)
Received: from localhost ([::1]:33154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHcm-0000Bf-37
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loHbd-00079E-ND
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1loHbZ-0000zH-8Z
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:31:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622604700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FCQdaciWLlOOmCMbSFHbP6pcHZwPA9BCFXRF4r0Tawc=;
 b=GvJ9HKcXpWOmIsZ9P9QTNeP5cSWuMk2zcgJG+HPted6R+Gyjq30nRWWvxpR4MWhlb5LwDa
 U98a/29FlCxQBdsIyzbVUkLgXG2Og9faqIrfoxT5Qtu2lhMjZKsXMHKEYFNjPDgSiyKly9
 TdCi20o/NiVgjC29PRQDOYfSGgnvEYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-g3nLeTu6N1y-HGsO0G_ApA-1; Tue, 01 Jun 2021 23:31:39 -0400
X-MC-Unique: g3nLeTu6N1y-HGsO0G_ApA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D647501F3;
 Wed,  2 Jun 2021 03:31:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-99.pek2.redhat.com [10.72.12.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 371C760C0F;
 Wed,  2 Jun 2021 03:31:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] vhost-vdpa: remove the unused
 vhost_vdpa_get_acked_features()
Date: Wed,  2 Jun 2021 11:31:27 +0800
Message-Id: <20210602033127.40149-2-jasowang@redhat.com>
In-Reply-To: <20210602033127.40149-1-jasowang@redhat.com>
References: <20210602033127.40149-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, lulu@redhat.com, gdawar@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No user for this helper, let's remove it.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/vhost-vdpa.h | 1 -
 net/vhost-vdpa.c         | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
index 45e34b7cfc..b81f9a6f2a 100644
--- a/include/net/vhost-vdpa.h
+++ b/include/net/vhost-vdpa.h
@@ -15,7 +15,6 @@
 #define TYPE_VHOST_VDPA "vhost-vdpa"
 
 struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
-uint64_t vhost_vdpa_get_acked_features(NetClientState *nc);
 
 extern const int vdpa_feature_bits[];
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fe659ec9e2..8dc86332a6 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -66,15 +66,6 @@ VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
     return s->vhost_net;
 }
 
-uint64_t vhost_vdpa_get_acked_features(NetClientState *nc)
-{
-    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
-    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
-    s->acked_features = vhost_net_get_acked_features(s->vhost_net);
-
-    return s->acked_features;
-}
-
 static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
 {
     uint32_t device_id;
-- 
2.25.1


