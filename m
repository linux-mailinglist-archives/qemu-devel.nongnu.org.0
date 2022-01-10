Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF5448A19A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 22:14:04 +0100 (CET)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n71zQ-0008RA-13
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 16:14:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71qg-0007t8-1n
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n71qe-0004Ox-8T
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 16:05:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641848699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oSxj4xdPVr/3qhzeZpQDNoN8eLz690ZpLWYWK/mAKv0=;
 b=V0dKcCS8NSitTVbtoTwDt/1nffTF57cQ6UuEMYxFU5Pc9lUs5jQyshPgb2GRZiUmZy7XDg
 c76rwoojhIZ7RPEsueouPlh1Jrlpim9QIvh7A4g1ANLChAI/WynxwxaefPr9BSGpzeyfQI
 E7Lay23tr8PGLjorAJmc5A1dz0v6OIs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-NZThdcQFNgqQ9KCvpqEDKQ-1; Mon, 10 Jan 2022 16:04:58 -0500
X-MC-Unique: NZThdcQFNgqQ9KCvpqEDKQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bh10-20020a05600c3d0a00b00347aa76728fso616275wmb.9
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 13:04:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oSxj4xdPVr/3qhzeZpQDNoN8eLz690ZpLWYWK/mAKv0=;
 b=eYTPnTXXy+BmYSzA6etAGuhvuClQhfAi1Enc5IYIi9arV161D80ZhIwMYXbufhVoTq
 fCPWKdwGEEM3mEhdeBixiP9GzBKPJ7a+MmSb2R8Ts/MBPp6UBSYet3LgLRPx6K0uRBLR
 9Q6zQ7mnNn/Fdf4+ushYDrItt/vb2r8sG5Wu33+w0xrqKdGJ13ZVkjAAyTIi9UEQdZ2q
 53elWTBwQ87/3+tPSIRKaxtYzAo5uB4YNRLXv5sf/3p5AzNTJVrqpyEDeY7chYemxiK0
 FqXMpYUyJ7ReK+rmh7+Ko04dAboRK5Iu7+URGuH+opFjhsdzqs0i+oC8u43Hjd7H7aXe
 jhAw==
X-Gm-Message-State: AOAM531jWOMlgUq9pStcfhK5IDF7dcqp+mBfu+k7Ve0p3qalCrweKBb8
 1SPAPcnSUg9bubeNZEY23erbZToybAZCoOGgE++5NWiqAFUz5oKasqo+y5W03yKibfI+sMsD4Cz
 c6jhNsmXtmpfXyUJZujeIMyrDCe1cWr1LYeLE0mWFCNt1kiqp0aDNye64vhtX
X-Received: by 2002:adf:efc2:: with SMTP id i2mr1182643wrp.89.1641848697167;
 Mon, 10 Jan 2022 13:04:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpGL1d4zlFDTpvBEGXWPVyV5JQpygPKJ/2Go2tX/cceK2Qf1uLZ28JMpgWxn2uzfJDePHJAQ==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr1182627wrp.89.1641848696907;
 Mon, 10 Jan 2022 13:04:56 -0800 (PST)
Received: from redhat.com ([2.55.19.241])
 by smtp.gmail.com with ESMTPSA id h20sm3615355wmq.38.2022.01.10.13.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:04:56 -0800 (PST)
Date: Mon, 10 Jan 2022 16:04:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 03/10] Revert "virtio-net: add support for configure
 interrupt"
Message-ID: <20220110210416.18779-4-mst@redhat.com>
References: <20220110210416.18779-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110210416.18779-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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

This reverts commit 497679d51087090d5a22fd265d1b96cf92d49d9d.

Fixes: 497679d510 ("virtio-net: add support for configure interrupt")
Cc: "Cindy Lu" <lulu@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h | 2 --
 hw/net/vhost_net-stub.c | 9 ---------
 hw/net/vhost_net.c      | 9 ---------
 hw/net/virtio-net.c     | 4 ++--
 4 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index fc37498550..387e913e4e 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -39,8 +39,6 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
                               int idx, bool mask);
-bool vhost_net_config_pending(VHostNetState *net);
-void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask);
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 126ee35b70..89d71cfb8e 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -101,12 +101,3 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
 {
     return 0;
 }
-
-bool vhost_net_config_pending(VHostNetState *net)
-{
-    return false;
-}
-
-void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
-{
-}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 9c9fd0a73f..30379d2ca4 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -457,15 +457,6 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
-bool vhost_net_config_pending(VHostNetState *net)
-{
-    return vhost_config_pending(&net->dev);
-}
-
-void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
-{
-    vhost_config_mask(&net->dev, dev, mask);
-}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5806a50c8d..5e03c0dd14 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3169,7 +3169,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return vhost_net_config_pending(get_vhost_net(nc->peer));
+        return false;
     }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
@@ -3181,9 +3181,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
     NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
     assert(n->vhost_started);
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
         return;
     }
+
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
-- 
MST


