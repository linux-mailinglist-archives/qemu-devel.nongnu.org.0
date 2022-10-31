Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CACA61370F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:54:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHk-0006pW-KP; Mon, 31 Oct 2022 08:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHF-00036k-P7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUHB-0002bd-GK
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eFQWqqY+3tR1cnu5RWTG0Hiv7Mx7f1y5gCPPpFAg8Tg=;
 b=PhANHd+gI4XCbnVvBswn+w9S73gtCzgsAL2Of+5UZ4lyCGSzdrIomSDiTn/7WgvxEKV4vw
 Vi6XDaLqFbDMBlYBk1ydmvjGYXsXLkVChMeyIf32j8ttY4GO3cTvwJDw1Voe40bIHfaJK2
 pVMattD/maT+9JaRzv3xCh6SSnIafI8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-258-jngeXsb-OwWmzljA8ti6NQ-1; Mon, 31 Oct 2022 08:52:22 -0400
X-MC-Unique: jngeXsb-OwWmzljA8ti6NQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 f26-20020a7bcc1a000000b003c03db14864so2569515wmh.6
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFQWqqY+3tR1cnu5RWTG0Hiv7Mx7f1y5gCPPpFAg8Tg=;
 b=COhy0B/UHXuzBGQ+f+An4/ENF1zWzIMCJM1luXmH0IYr1WLRqmG38TVThChdXuCt2I
 0tDa/bYkRJUSzYpiASQ+ute6nzD7oK7R0TiPKr12ynF0sEIbYrT9Nms7N0+mLphbxgVL
 +6jcOTtTPPT8kAC1SLEdzFM3xt704kuozEVcv73xciLjIqXcxCSbz/ZXSiV8DAmLEZcN
 uoJkv00gKs9mzGBdtmkoX5YEYWVlEsU7ONrQVRiN0zkhodYN3/c8Ui8sGvZB4/7cm1tg
 NBPKteIY4Ol/t15MlPzbEHvSc9ZfUbEwVndXYf+BtDFJGSNIdiAPZs9gf407vxkQ2gH0
 4dVA==
X-Gm-Message-State: ACrzQf3K1w9my3iyRVMusBEZwlH8RM0Q1+W2JvpwfPDwxX6I7zaz/9+4
 CZvuXK7Z1R47iUVcSmvoHC/nOOpLgtuQlOpREDWFGXXo5SoudlihscFBX1h5MKEY1RN69heDb4i
 hE8cPj2l/Zc5a5T0WKJltkRda4a7IFAFDzdZddUfrBCVZ+Qhem8DPkw+8TGGW
X-Received: by 2002:a05:6000:1203:b0:236:9aac:8d00 with SMTP id
 e3-20020a056000120300b002369aac8d00mr7686674wrx.221.1667220741458; 
 Mon, 31 Oct 2022 05:52:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM40xpuKGIYQVgj6S1HLqHp6F66lcdnOpuexsuGQV6G5hlRU0xnOJrXBxD4EKGNd1MA9S7cTiw==
X-Received: by 2002:a05:6000:1203:b0:236:9aac:8d00 with SMTP id
 e3-20020a056000120300b002369aac8d00mr7686643wrx.221.1667220741151; 
 Mon, 31 Oct 2022 05:52:21 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 g13-20020a5d698d000000b0022cc3e67fc5sm6836586wru.65.2022.10.31.05.52.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:52:20 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:52:18 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 33/86] vhost: Change the sequence of device start
Message-ID: <20221031124928.128475-34-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Yajun Wu <yajunw@nvidia.com>

This patch is part of adding vhost-user vhost_dev_start support. The
motivation is to improve backend configuration speed and reduce live
migration VM downtime.

Moving the device start routines after finishing all the necessary device
and VQ configuration, further aligning to the virtio specification for
"device initialization sequence".

Following patch will add vhost-user vhost_dev_start support.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

Message-Id: <20221017064452.1226514-2-yajunw@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 18 +++++++++++-------
 hw/net/vhost_net.c        | 12 ++++++------
 2 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 84902dde17..f4deb8cd5d 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -164,13 +164,6 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         goto err_guest_notifiers;
     }
 
-    ret = vhost_dev_start(&s->dev, vdev);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Error starting vhost");
-        goto err_guest_notifiers;
-    }
-    s->started_vu = true;
-
     /* guest_notifier_mask/pending not used yet, so just unmask
      * everything here. virtio-pci will do the right thing by
      * enabling/disabling irqfd.
@@ -179,9 +172,20 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         vhost_virtqueue_mask(&s->dev, vdev, i, false);
     }
 
+    s->dev.vq_index_end = s->dev.nvqs;
+    ret = vhost_dev_start(&s->dev, vdev);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Error starting vhost");
+        goto err_guest_notifiers;
+    }
+    s->started_vu = true;
+
     return ret;
 
 err_guest_notifiers:
+    for (i = 0; i < s->dev.nvqs; i++) {
+        vhost_virtqueue_mask(&s->dev, vdev, i, true);
+    }
     k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
 err_host_notifiers:
     vhost_dev_disable_notifiers(&s->dev, vdev);
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index d28f8b974b..d6924f5e57 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -387,21 +387,21 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
-        r = vhost_net_start_one(get_vhost_net(peer), dev);
-
-        if (r < 0) {
-            goto err_start;
-        }
 
         if (peer->vring_enable) {
             /* restore vring enable state */
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
-                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
+
+        r = vhost_net_start_one(get_vhost_net(peer), dev);
+        if (r < 0) {
+            vhost_net_stop_one(get_vhost_net(peer), dev);
+            goto err_start;
+        }
     }
 
     return 0;
-- 
MST


