Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CAA422DB7
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 18:18:03 +0200 (CEST)
Received: from localhost ([::1]:52088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXn8k-0006pD-8a
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 12:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsp-0000B3-Eb
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmsl-0004ye-Jp
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hX3b5CaKP1VVugxs36uHglvddVRMuC85IYkRRxHHhEk=;
 b=Ar7OJwddF+vRiMBm5zAOJkiagVa6Xn3zq5oue20pMsMjKesFHJufAjvT7V+bbCUBH+M0fk
 xsr3cTi9hSBiP+DdxRku7DnJ6dwWRgKuH9MPx0JheE/Tgcqdl0TuUmcPJZpK9ULsBCQuli
 sXGNk9D8s50IQe1nrfFnKHZ0GV0f9e8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-qUOJN0hwNfmzMETjGnYdkg-1; Tue, 05 Oct 2021 12:01:29 -0400
X-MC-Unique: qUOJN0hwNfmzMETjGnYdkg-1
Received: by mail-wm1-f69.google.com with SMTP id
 z22-20020a7bc7d6000000b0030d5c26120fso1221368wmk.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:01:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hX3b5CaKP1VVugxs36uHglvddVRMuC85IYkRRxHHhEk=;
 b=GwRzK4wDq/wHOUDQaxAO57AbD1yABmRV72tnzP2A2pZDQLzlnvw40FurPLas9mIMv4
 KSk05vXK2CU5KNysjE1qHCFr6y95MeURdduLisGI7Il1XOkvHPrLNFL+wWtcrGCZGSAr
 hiJ+sFA6fyQF1eLOvjMrPfxST3Y+ijo1cm6xB65HliO3BzAs2/5M30rWCQZq/szXm29m
 1VywkrloRZWCFFf8xr+KtAGeN0VZot8SLxxVy3EFqCtvhdlRRIDk+KL2vWVITHGbxBno
 u3a5AltO3n7FxwP0X3OmW1frrfW8rOqGAZCEkcjOd3xwIPORU0Zpt8nCPWVLbdIRDDhV
 GqrA==
X-Gm-Message-State: AOAM532l6oiCkZm9HcPKtRD867U1LS3qYkugDohTaUZm1jDcsE/NMT7B
 thiV0EaEo+xMe0h4enenefvx8m6J4vzaomfqozvyBljPb/MBTXWL1Fh4A72weXfUKIpPk5rChNO
 u4QeJ/WzdIjPf5jBt/dbYivKpUqQpNdu45ql218dmtX8Su7HEsIxZD1vxdMrH
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr203653wmq.158.1633449687131; 
 Tue, 05 Oct 2021 09:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZy5hHeKlvleZe78zO8dW2PSCwXhbF3xk+juPEz+6RDCarvJfFCCwoF7Cv8vGZEffoLjmH+Q==
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr203618wmq.158.1633449686801; 
 Tue, 05 Oct 2021 09:01:26 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id f3sm2305698wmb.12.2021.10.05.09.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:01:26 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:01:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/57] vhost-vdpa: multiqueue support
Message-ID: <20211005155946.513818-13-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jason Wang <jasowang@redhat.com>

This patch implements the multiqueue support for vhost-vdpa. This is
done simply by reading the number of queue pairs from the config space
and initialize the datapath and control path net client.

Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20210907090322.1756-11-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c |   2 +-
 net/vhost-vdpa.c       | 105 +++++++++++++++++++++++++++++++++++++----
 2 files changed, 97 insertions(+), 10 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 8587d30918..f9acfe9bdb 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -590,7 +590,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
         vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
     }
 
-    if (vhost_vdpa_one_time_request(dev)) {
+    if (dev->vq_index + dev->nvqs != dev->last_index) {
         return 0;
     }
 
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 834dab28dd..533b15ae8c 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -18,6 +18,7 @@
 #include "qemu/error-report.h"
 #include "qemu/option.h"
 #include "qapi/error.h"
+#include <linux/vhost.h>
 #include <sys/ioctl.h>
 #include <err.h>
 #include "standard-headers/linux/virtio_net.h"
@@ -51,6 +52,14 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_HOST_UFO,
     VIRTIO_NET_F_MRG_RXBUF,
     VIRTIO_NET_F_MTU,
+    VIRTIO_NET_F_CTRL_RX,
+    VIRTIO_NET_F_CTRL_RX_EXTRA,
+    VIRTIO_NET_F_CTRL_VLAN,
+    VIRTIO_NET_F_GUEST_ANNOUNCE,
+    VIRTIO_NET_F_CTRL_MAC_ADDR,
+    VIRTIO_NET_F_RSS,
+    VIRTIO_NET_F_MQ,
+    VIRTIO_NET_F_CTRL_VQ,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
     VIRTIO_NET_F_RSS,
@@ -81,7 +90,8 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
     return ret;
 }
 
-static int vhost_vdpa_add(NetClientState *ncs, void *be)
+static int vhost_vdpa_add(NetClientState *ncs, void *be,
+                          int queue_pair_index, int nvqs)
 {
     VhostNetOptions options;
     struct vhost_net *net = NULL;
@@ -94,7 +104,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
     options.net_backend = ncs;
     options.opaque      = be;
     options.busyloop_timeout = 0;
-    options.nvqs = 2;
+    options.nvqs = nvqs;
 
     net = vhost_net_init(&options);
     if (!net) {
@@ -158,18 +168,28 @@ static NetClientInfo net_vhost_vdpa_info = {
 static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
                                            const char *device,
                                            const char *name,
-                                           int vdpa_device_fd)
+                                           int vdpa_device_fd,
+                                           int queue_pair_index,
+                                           int nvqs,
+                                           bool is_datapath)
 {
     NetClientState *nc = NULL;
     VhostVDPAState *s;
     int ret = 0;
     assert(name);
-    nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
+    if (is_datapath) {
+        nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device,
+                                 name);
+    } else {
+        nc = qemu_new_net_control_client(&net_vhost_vdpa_info, peer,
+                                         device, name);
+    }
     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
     s = DO_UPCAST(VhostVDPAState, nc, nc);
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
-    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
+    s->vhost_vdpa.index = queue_pair_index;
+    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
     if (ret) {
         qemu_del_net_client(nc);
         return NULL;
@@ -195,12 +215,52 @@ static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
     return 0;
 }
 
+static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
+{
+    unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
+    struct vhost_vdpa_config *config;
+    __virtio16 *max_queue_pairs;
+    uint64_t features;
+    int ret;
+
+    ret = ioctl(fd, VHOST_GET_FEATURES, &features);
+    if (ret) {
+        error_setg(errp, "Fail to query features from vhost-vDPA device");
+        return ret;
+    }
+
+    if (features & (1 << VIRTIO_NET_F_CTRL_VQ)) {
+        *has_cvq = 1;
+    } else {
+        *has_cvq = 0;
+    }
+
+    if (features & (1 << VIRTIO_NET_F_MQ)) {
+        config = g_malloc0(config_size + sizeof(*max_queue_pairs));
+        config->off = offsetof(struct virtio_net_config, max_virtqueue_pairs);
+        config->len = sizeof(*max_queue_pairs);
+
+        ret = ioctl(fd, VHOST_VDPA_GET_CONFIG, config);
+        if (ret) {
+            error_setg(errp, "Fail to get config from vhost-vDPA device");
+            return -ret;
+        }
+
+        max_queue_pairs = (__virtio16 *)&config->buf;
+
+        return lduw_le_p(max_queue_pairs);
+    }
+
+    return 1;
+}
+
 int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp)
 {
     const NetdevVhostVDPAOptions *opts;
     int vdpa_device_fd;
-    NetClientState *nc;
+    NetClientState **ncs, *nc;
+    int queue_pairs, i, has_cvq = 0;
 
     assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
     opts = &netdev->u.vhost_vdpa;
@@ -215,11 +275,38 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
         return -errno;
     }
 
-    nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, vdpa_device_fd);
-    if (!nc) {
+    queue_pairs = vhost_vdpa_get_max_queue_pairs(vdpa_device_fd,
+                                                 &has_cvq, errp);
+    if (queue_pairs < 0) {
         qemu_close(vdpa_device_fd);
-        return -1;
+        return queue_pairs;
     }
 
+    ncs = g_malloc0(sizeof(*ncs) * queue_pairs);
+
+    for (i = 0; i < queue_pairs; i++) {
+        ncs[i] = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
+                                     vdpa_device_fd, i, 2, true);
+        if (!ncs[i])
+            goto err;
+    }
+
+    if (has_cvq) {
+        nc = net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name,
+                                 vdpa_device_fd, i, 1, false);
+        if (!nc)
+            goto err;
+    }
+
+    g_free(ncs);
     return 0;
+
+err:
+    if (i) {
+        qemu_del_net_client(ncs[0]);
+    }
+    qemu_close(vdpa_device_fd);
+    g_free(ncs);
+
+    return -1;
 }
-- 
MST


