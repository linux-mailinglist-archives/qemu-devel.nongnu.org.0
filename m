Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BA161DC7F
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:34:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMqE-0000V5-53; Sat, 05 Nov 2022 13:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnc-00075A-HQ
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMnZ-0007Yt-5o
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:17:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LSGuNO4vjhRuhRUypjNteJrUGVo70hUc7qmpgDdqD3w=;
 b=MLtzVCwKvjrHOn4bCL9tTnnnsTN5v2CSf94GjrTAI+bRwRBZv1cG0X24Tu2Od7wJWeSksH
 pge0lyX+1/ZoD+QU0KMWgzu3iDD8nEP3ahcOd6mwNokbeDxXnG0iEv69Q91Mg5RyWdWjga
 yCqJVGhARLtPk2a9Nx+JNL3AATWyY34=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-198-Tz6LHT7oMheLu3OvhX2nHw-1; Sat, 05 Nov 2022 13:17:31 -0400
X-MC-Unique: Tz6LHT7oMheLu3OvhX2nHw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso6008934wms.1
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LSGuNO4vjhRuhRUypjNteJrUGVo70hUc7qmpgDdqD3w=;
 b=MMZ75QW+ONocgVBx1ZGlBVU/BG7WfbdnBlPD7e7oMZzsyQSB+eWn8DrC7phnr4BfuZ
 zEwWX/76IF9Av/D2FEdsoHi3R6+LVr0fpMkR4ZHq8PdLbsxt4hb4WSxmYvB4No0INeLD
 rySGLGvpy/8Y9Djm57gHDYixmF6ltvfXHlGdKQvLlbdlZW41g+dTCxAi63zqKFIyutV2
 E0aVaAn69XQEt4pMhd92VHUNZ9NdmOiI4spX7J3jbj+YGasr651H2yO6n1ZQCTPj4p1G
 6Q9DonCcW0pzdPsmybBIE+HAWR6sTuIehmpHwYFD1E6raeHLYupI+7WzjFaq1IQzz9TP
 3jSQ==
X-Gm-Message-State: ACrzQf1ai8gZBz+by3az6GWF2lmBBwmSfX+Z9gheA6JcG4tvuiOeejU/
 IgIz67CGEBGWEAO8eWFpZkBXVKpaQdwhGSjXG/K3OSNaN5AC5ujtcmz//6iHmbom91kXMYTMDLz
 ttPy5mJeFPzXDFrZIruRZu/8gkSE3ykk7qOFHfaHc1O2R+yLLvgLfzcpkYUhW
X-Received: by 2002:a7b:c2b2:0:b0:3cf:71af:7845 with SMTP id
 c18-20020a7bc2b2000000b003cf71af7845mr23004302wmk.7.1667668650100; 
 Sat, 05 Nov 2022 10:17:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6c8kaQasZggV2reCA3BQ58xBPiz5WtU49lTwsrA6FcC7Jo/k/vyogGwvKLLBo+gv5zrMj0Hw==
X-Received: by 2002:a7b:c2b2:0:b0:3cf:71af:7845 with SMTP id
 c18-20020a7bc2b2000000b003cf71af7845mr23004282wmk.7.1667668649717; 
 Sat, 05 Nov 2022 10:17:29 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 u13-20020a5d434d000000b0023647841c5bsm2603262wrr.60.2022.11.05.10.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:17:29 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:17:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Kangjie Xu <kangjie.xu@linux.alibaba.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL v3 41/81] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Message-ID: <20221105171116.432921-42-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Kangjie Xu <kangjie.xu@linux.alibaba.com>

Introduce vhost_net_virtqueue_restart(), which can restart the
specific virtqueue when the vhost net started running before.
If it fails to restart the virtqueue, the device will be stopped.

Here we do not reuse vhost_net_start_one() or vhost_dev_start()
because they work at queue pair level. The mem table and features
do not change, so we can call the vhost_virtqueue_start() to
restart a specific queue.

This patch only considers the case of vhost-kernel, when
NetClientDriver is NET_CLIENT_DRIVER_TAP.

Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221017092558.111082-11-xuanzhuo@linux.alibaba.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h |  2 ++
 hw/net/vhost_net-stub.c |  6 +++++
 hw/net/vhost_net.c      | 53 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 61 insertions(+)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 85d85a4957..40b9a40074 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
 
 void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                                int vq_index);
+int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                                int vq_index);
 #endif
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 2d745e359c..9f7daae99c 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -107,3 +107,9 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
 {
 
 }
+
+int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                                int vq_index)
+{
+    return 0;
+}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 8beecb4d22..d2926e2ed6 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -34,6 +34,7 @@
 #include "standard-headers/linux/virtio_ring.h"
 #include "hw/virtio/vhost.h"
 #include "hw/virtio/virtio-bus.h"
+#include "linux-headers/linux/vhost.h"
 
 
 /* Features supported by host kernel. */
@@ -556,3 +557,55 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                          net->dev.vqs + idx,
                          net->dev.vq_index + idx);
 }
+
+int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
+                                int vq_index)
+{
+    VHostNetState *net = get_vhost_net(nc->peer);
+    const VhostOps *vhost_ops = net->dev.vhost_ops;
+    struct vhost_vring_file file = { };
+    int idx, r;
+
+    if (!net->dev.started) {
+        return -EBUSY;
+    }
+
+    /* should only be called after backend is connected */
+    assert(vhost_ops);
+
+    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
+
+    r = vhost_virtqueue_start(&net->dev,
+                              vdev,
+                              net->dev.vqs + idx,
+                              net->dev.vq_index + idx);
+    if (r < 0) {
+        goto err_start;
+    }
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
+        file.index = idx;
+        file.fd = net->backend;
+        r = vhost_net_set_backend(&net->dev, &file);
+        if (r < 0) {
+            r = -errno;
+            goto err_start;
+        }
+    }
+
+    return 0;
+
+err_start:
+    error_report("Error when restarting the queue.");
+
+    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
+        file.fd = VHOST_FILE_UNBIND;
+        file.index = idx;
+        int r = vhost_net_set_backend(&net->dev, &file);
+        assert(r >= 0);
+    }
+
+    vhost_dev_stop(&net->dev, vdev);
+
+    return r;
+}
-- 
MST


