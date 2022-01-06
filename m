Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55686486550
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 14:34:25 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5SuO-0005Fc-Et
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 08:34:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdR-000478-V9
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5SdM-0000oq-7o
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:16:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641475007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hk3B2Abvr8nT1jKUQbmrWarvr90bi4+YLo3wLpkRHks=;
 b=KI4WXNkD0MkrkZCFb6YStG/9ItHbTsS336kr50CRIAzPHYSbn2eJwRSgo85LLgFpjbf0CJ
 0mORhdMK3ivYLOHqpR8ENtUAicoAss/5vzEeyRTAYcGPbzNfAItPiI0GsynithRZ7yPppL
 koJ3i3uOty8RjZGfhfCBvX0Z/MRB3fY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-b5z4Fdu9N8G8vfM_5QqSEw-1; Thu, 06 Jan 2022 08:16:46 -0500
X-MC-Unique: b5z4Fdu9N8G8vfM_5QqSEw-1
Received: by mail-wm1-f69.google.com with SMTP id
 m15-20020a7bce0f000000b003473d477618so544097wmc.8
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hk3B2Abvr8nT1jKUQbmrWarvr90bi4+YLo3wLpkRHks=;
 b=375tAL4pS7911onC+TrjpmDlgOoCGwqOi2X417CthE/6DRLkEladnkEooE6sPKFxas
 tY7b5AwCXQjzkKEBk3/vBQCNMqK3mpG5qS+q6ZxF0oTWXUy0khB/rdX/eJBGmdKjFChA
 H3IN54ORXeMEiPKnupcYMUGLcEUdxQTkf0dswYwPg5oUxQh02Dg6FiC+wmXkBFYLlaNY
 AVT51CvLjbqhAps/EZkOjaSiI6VICeJMLFWPA2A3yDH1+71p1KwDKtHLXbx/3xrYPbDU
 PL9I4F0E7xrxPR8PH79RYneJKT+ePaK64blmX3SzOIrSJ6RQVLvyuOpIsoHA4lVgfotr
 mWgg==
X-Gm-Message-State: AOAM5306zBDVLhs2jMkgryQ32QLYs9YToLIhfUCrmaUiL6nTSePXVa6I
 aP9Blx7f61stMZiES4P7Z3LmwL3e6kGmzKjd15wMjGFjXjyXlzflRYrotU+vqbL98Y569HQl0Lv
 qvtQfDuqtPH0KgRLdTkmBNYssLKTPC/MiKwMZWw0el6Ga8VzHF31T9piOB9by
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr48801217wrd.682.1641475005126; 
 Thu, 06 Jan 2022 05:16:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwAPuiGhNJCyx9RG5C/fAOorqU/xc6Ioy6KzrQmimhwnQwpVVaHdy6g4M1bJ3/+6V5HiHZ6DQ==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr48801196wrd.682.1641475004803; 
 Thu, 06 Jan 2022 05:16:44 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id w6sm1311444wro.114.2022.01.06.05.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:16:44 -0800 (PST)
Date: Thu, 6 Jan 2022 08:16:42 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/52] virtio-net: add support for configure interrupt
Message-ID: <20220106131534.423671-11-mst@redhat.com>
References: <20220106131534.423671-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220106131534.423671-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

Add functions to support configure interrupt in virtio_net
The functions are config_pending and config_mask, while
this input idx is VIRTIO_CONFIG_IRQ_IDX will check the
function of configure interrupt.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-9-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h | 2 ++
 hw/net/vhost_net.c      | 9 +++++++++
 hw/net/virtio-net.c     | 4 ++--
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 387e913e4e..fc37498550 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -39,6 +39,8 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
                               int idx, bool mask);
+bool vhost_net_config_pending(VHostNetState *net);
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask);
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 30379d2ca4..9c9fd0a73f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -457,6 +457,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
+bool vhost_net_config_pending(VHostNetState *net)
+{
+    return vhost_config_pending(&net->dev);
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
+{
+    vhost_config_mask(&net->dev, dev, mask);
+}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5e03c0dd14..5806a50c8d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3169,7 +3169,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
+        return vhost_net_config_pending(get_vhost_net(nc->peer));
     }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
@@ -3181,9 +3181,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
         return;
     }
-
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
-- 
MST


