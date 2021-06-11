Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB703A3B96
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 08:02:43 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lraFe-0006KW-DH
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 02:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDi-0003VS-RD
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lraDh-000241-3W
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 02:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623391240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h8X53W3anMw1Gcu1TRAGfO8A7bc8ps2x2B5b+g0DOG8=;
 b=Wy+WfmzqN87ec0lPEFhJ8SkL507UxAX/JnjNbZXXYJP4Ih3ceV7s4vusHxgSp4Js9SArKU
 tvFo9Hat2wweV7Y3lzaXFsrEgXSthF7fGES139PNvWv/7Hz4MhhC0n3izt3QjlCFXeY5X6
 TlT/vXrmuYNTVDDk5i2VGK3lMfSGI0Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-SakgO5oXMveXGetWeMfMiw-1; Fri, 11 Jun 2021 02:00:39 -0400
X-MC-Unique: SakgO5oXMveXGetWeMfMiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94EAB100C61C;
 Fri, 11 Jun 2021 06:00:38 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-78.pek2.redhat.com [10.72.13.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39EEB60937;
 Fri, 11 Jun 2021 06:00:36 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 04/12] vhost-vdpa: remove the unused
 vhost_vdpa_get_acked_features()
Date: Fri, 11 Jun 2021 14:00:16 +0800
Message-Id: <20210611060024.46763-5-jasowang@redhat.com>
In-Reply-To: <20210611060024.46763-1-jasowang@redhat.com>
References: <20210611060024.46763-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

No user for this helper, let's remove it.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/vhost-vdpa.h | 1 -
 net/vhost-vdpa.c         | 9 ---------
 2 files changed, 10 deletions(-)

diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
index 45e34b7..b81f9a6 100644
--- a/include/net/vhost-vdpa.h
+++ b/include/net/vhost-vdpa.h
@@ -15,7 +15,6 @@
 #define TYPE_VHOST_VDPA "vhost-vdpa"
 
 struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
-uint64_t vhost_vdpa_get_acked_features(NetClientState *nc);
 
 extern const int vdpa_feature_bits[];
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 8b14215..19187dc 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -68,15 +68,6 @@ VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
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
2.7.4


