Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD7434959
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 12:49:04 +0200 (CEST)
Received: from localhost ([::1]:43046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md99b-0001bd-JC
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 06:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8ic-0005T4-L6
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1md8iZ-00048V-TL
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nnn/3HRVnUNWCx0Wv3BkTqbCVqECd/CHiliKI8a4Djg=;
 b=GHLZdZAmtVY/X5X3lw1AH6warmxLB+q3ABBJ/Y6dXz9E6b4ZTsEI73Ok0I3AXq1hNtt+i1
 EUShCHYaS4FLSwjPcVL3cpSEuxmFCeXfz53L1X+1mNbDBNF4++4AUaF75Tu0Rme61KM02p
 B9KtEm1Xqi/XaKYhYAbfgP2eO8f8UaU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-TUqOgmeqNBSAiAG0pcQIQg-1; Wed, 20 Oct 2021 06:21:05 -0400
X-MC-Unique: TUqOgmeqNBSAiAG0pcQIQg-1
Received: by mail-ed1-f70.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so20538087edv.10
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Nnn/3HRVnUNWCx0Wv3BkTqbCVqECd/CHiliKI8a4Djg=;
 b=J33vNcbb8xeX68FdxsECfH1+2V27qM+N7070N+7BP8NAF0vZ5T6ODTzvblh+BeNwTG
 OV2YMfXkDCWO34WneqZuvYPuiD5PAVwQJBD+R+0rnXvOSEP3u3IDS5NYUb0XnoC5MpO8
 jClvkCMoE8XKe/XLb33gjWtZvH03A5u0moT9aX3vHGGKUqQSum9wbV92pyhX7GN5ohNb
 OPw+sjWG+/Kq3141PYvZSEw8UXVL38naq5GwAQ6wnUXk9MZhBomtrKybfJ91E2QXYbOV
 nCa8GF3bm+ERtkYFLxFB0/tmhYMOWPT2OxjKkARsim0Pla6Do8um9r9NKQOzoHuDRiGr
 FSwg==
X-Gm-Message-State: AOAM532tXls2RZtTT11/CdJSeHevWDqlQ4TIqs/6CXerDtcyfyMSs9eT
 sY1A//eiiAW/ZxDQGmOnR5uvB5VboHxaDiz1UsQzVcIXNHjWxXsVCA2xUviVYAGb4aRu8ikSJIb
 0y72PiXb5aDJEcPkruJL6TVDWi14So2Z/GNOa1YFMKZArMCsKPQ+lJJmn13YR
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr58452811eds.270.1634725264144; 
 Wed, 20 Oct 2021 03:21:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTSFqeTW17BJe5pe82UO646zyJPweqIgjGDH9bhXwnk1H4iczJSNV1dNeQTZlMJ+Ph82SY8w==
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr58452798eds.270.1634725263956; 
 Wed, 20 Oct 2021 03:21:03 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id k3sm841093ejk.7.2021.10.20.03.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 03:21:03 -0700 (PDT)
Date: Wed, 20 Oct 2021 06:21:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 39/44] virtio-net: vhost control virtqueue support
Message-ID: <20211020101844.988480-40-mst@redhat.com>
References: <20211020101844.988480-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211020101844.988480-1-mst@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch implements the control virtqueue support for vhost. This
requires virtio-net to figure out the datapath queue pairs and control
virtqueue via is_datapath and pass the number of those two types
of virtqueues to vhost_net_start()/vhost_net_stop().

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20211020045600.16082-10-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-net.h |  1 +
 hw/net/vhost_net.c             |  2 +-
 hw/net/virtio-net.c            | 23 +++++++++++++++++++----
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 2903b79a92..eb87032627 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -196,6 +196,7 @@ struct VirtIONet {
     int multiqueue;
     uint16_t max_queue_pairs;
     uint16_t curr_queue_pairs;
+    uint16_t max_ncs;
     size_t config_size;
     char *netclient_name;
     char *netclient_type;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 3aabab06ea..0d888f29a6 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -326,7 +326,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
     VirtIONet *n = VIRTIO_NET(dev);
     int nvhosts = data_queue_pairs + cvq;
     struct vhost_net *net;
-    int r, e, i, last_index = data_qps * 2;
+    int r, e, i, last_index = data_queue_pairs * 2;
     NetClientState *peer;
 
     if (!cvq) {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 7594f7ea92..f2014d5ea0 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -244,6 +244,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     NetClientState *nc = qemu_get_queue(n->nic);
     int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
+    int cvq = n->max_ncs - n->max_queue_pairs;
 
     if (!get_vhost_net(nc->peer)) {
         return;
@@ -285,14 +286,14 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
         }
 
         n->vhost_started = 1;
-        r = vhost_net_start(vdev, n->nic->ncs, queue_pairs, 0);
+        r = vhost_net_start(vdev, n->nic->ncs, queue_pairs, cvq);
         if (r < 0) {
             error_report("unable to start vhost net: %d: "
                          "falling back on userspace virtio", -r);
             n->vhost_started = 0;
         }
     } else {
-        vhost_net_stop(vdev, n->nic->ncs, queue_pairs, 0);
+        vhost_net_stop(vdev, n->nic->ncs, queue_pairs, cvq);
         n->vhost_started = 0;
     }
 }
@@ -3411,9 +3412,23 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    n->max_queue_pairs = MAX(n->nic_conf.peers.queues, 1);
+    n->max_ncs = MAX(n->nic_conf.peers.queues, 1);
+
+    /*
+     * Figure out the datapath queue pairs since the backend could
+     * provide control queue via peers as well.
+     */
+    if (n->nic_conf.peers.queues) {
+        for (i = 0; i < n->max_ncs; i++) {
+            if (n->nic_conf.peers.ncs[i]->is_datapath) {
+                ++n->max_queue_pairs;
+            }
+        }
+    }
+    n->max_queue_pairs = MAX(n->max_queue_pairs, 1);
+
     if (n->max_queue_pairs * 2 + 1 > VIRTIO_QUEUE_MAX) {
-        error_setg(errp, "Invalid number of queue_pairs (= %" PRIu32 "), "
+        error_setg(errp, "Invalid number of queue pairs (= %" PRIu32 "), "
                    "must be a positive integer less than %d.",
                    n->max_queue_pairs, (VIRTIO_QUEUE_MAX - 1) / 2);
         virtio_cleanup(vdev);
-- 
MST


