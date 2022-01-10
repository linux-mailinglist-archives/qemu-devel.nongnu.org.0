Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BB4890AC
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 08:21:19 +0100 (CET)
Received: from localhost ([::1]:56732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6ozU-0001dq-36
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 02:21:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oug-0007Bt-Pe
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n6oue-0001j2-Rr
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 02:16:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641798975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZUuqkza4Nvqmei+acVjd7Eu/xM5HJzUvA1DqMYNnPjk=;
 b=HK2HDy/pFDB3R0lZh9+mPv4N1r1Uqt0C/rhnsMcHXQErm6euf646RvH2OpefO9Tth4b8lQ
 HtcacMto1nvz2NCIOOBv0WF/CdomgZaVZEC2XDfwcZH6vTNFxOdx4H+1vodtfScmg2Zmim
 R2DToQQJX5RLv2ZxT3TfGaN2VhuW6l8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-a5-3x6a5PDy0MKa7WjgAQw-1; Mon, 10 Jan 2022 02:16:14 -0500
X-MC-Unique: a5-3x6a5PDy0MKa7WjgAQw-1
Received: by mail-wr1-f72.google.com with SMTP id
 v14-20020adfa1ce000000b001a49d6587ceso3758914wrv.21
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 23:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZUuqkza4Nvqmei+acVjd7Eu/xM5HJzUvA1DqMYNnPjk=;
 b=yMS0sGdovH7haxAU1U6jMIXr90kSGjAMHhzPH5KSHUzoBtiPRe1u6LGj15E/JvsD+E
 20DObWvv2/PLf59kPQXyP3zSzFPOKpCNOzeyBtJ4MdxWwHveoTf2BNTT9EkujA4EtLPw
 Yh3Q5tRtshj9+Z7SgybheGM2ksBe2ZE/gRCs3jwNdkVENj4PTEYPOw21ptK3KgkVa03F
 WWfL1EgNdyMmnAQI6u8iyvJe99Wpzyf5QRXUxNiXpH/Mj6HbWvr7sjxBefJlfsSwbcb3
 FvWycXi4syKu3c5YQxFvh+1yQXLLUZWi7jIDEMSUl31R8BGXEIPK5hcpXGrptMhLbVUl
 bt1g==
X-Gm-Message-State: AOAM533nOmBjCUR8XoU/c6pNXdx6J24DzuoZBW69GuufztxVp5r1fyw7
 RKJEl7jZDF2raAUeQMQj7SBgTdBGUjrpRHa2LJm3MESzij7vfduTVg2rvbpDCJUwA7USPa1SBuy
 lngi1P1o3kL6Kt03i8fKc66+L0yke1biaVqAqL9w8paMIcO5UZftxtaQYPflw
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr21077709wmq.109.1641798973349; 
 Sun, 09 Jan 2022 23:16:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7kXVcQAz9IT9BPXUs7WoTP6sl7SyCy4xMckPJ2hZy8Mg4rAk2GBxbX5x+cMdv5qkYZFGGUA==
X-Received: by 2002:a05:600c:3589:: with SMTP id
 p9mr21077692wmq.109.1641798973083; 
 Sun, 09 Jan 2022 23:16:13 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:107d:b60c:c297:16fe:7528:e989])
 by smtp.gmail.com with ESMTPSA id l2sm6224446wrs.43.2022.01.09.23.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 23:16:12 -0800 (PST)
Date: Mon, 10 Jan 2022 02:16:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/10] Revert "virtio-net: add support for configure interrupt"
Message-ID: <20220110071547.195669-4-mst@redhat.com>
References: <20220110071547.195669-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220110071547.195669-1-mst@redhat.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 497679d51087090d5a22fd265d1b96cf92d49d9d.
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


