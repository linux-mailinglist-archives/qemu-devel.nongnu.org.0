Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D7021379B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 11:25:46 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrHx3-0000h8-C3
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 05:25:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrHdP-0001sJ-QE
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:05:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51539
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jrHdM-0004dk-PK
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 05:05:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593767124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lWrpFH2CiygCO5uciNVA5FaqB2VaYbCK0AZiDA9UeM=;
 b=dC0fr232nKPleewPy//UtgLzYptzlUYVRp9cu7AEWc9JatR+IDxCME0Owwr3rlNs/75vmA
 8IlGYuN21IJFFAbtLlm3o8QVGt5GN0+xTW0qf6h6ynAb+NmV5AAsBaIqvxRYRFO0CEDCy3
 u2jlFE6ZlurMhANz/EzSPtyW1ZdHpkw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-3my4vMv-OB2a-WOkJSudRA-1; Fri, 03 Jul 2020 05:05:22 -0400
X-MC-Unique: 3my4vMv-OB2a-WOkJSudRA-1
Received: by mail-wr1-f72.google.com with SMTP id j5so31095377wro.6
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 02:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4lWrpFH2CiygCO5uciNVA5FaqB2VaYbCK0AZiDA9UeM=;
 b=W6u/neug59BYNNGzvVfMlKtvpmGJiS4dTxZ19oy6tYr/sUTONFLHfJV0B2agkwK6Uy
 XG0aGYh9TxFCkKB/zeBqIznkxkPtQqD+bazQgqWNNDkuEuIXeX9ukiRDUv19Q2D44Bwe
 b+HWehcGmAKDvzWw2uDYQZA+VDaTKyamBAUPdkSSm/zY1ScxajnL1daqpU00LJ2/drDE
 Wk6SyFL/zxI+VTUhMUw+xe5mwZrpmAEWv1DF6f47ZA6+IFb447BRwLMwFAWxI0RpoEWZ
 sVm92X1cj0rg/w97zhqh/zyEbhlhTDRztiZEXUE9XPBAFV/JleGQJPyfrsNTwiwGaenV
 BEDQ==
X-Gm-Message-State: AOAM532Au8phhxi+cwCgvg9ZbDcYEBgYOOQQ37pNB7qT//Q+bGbv2lko
 Ze4F6x+sxhu3YcfM8OPzqPQijEW9fHEa4f5jpPEhXaRrfEfb8Wg9VVQHdwHOt6srOdv/RdDldzF
 FkRKwe0h4pgGtnWM=
X-Received: by 2002:adf:fa81:: with SMTP id h1mr37517276wrr.288.1593767120688; 
 Fri, 03 Jul 2020 02:05:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyndo4k2CJKMNmigFNFENSZMbKA+5k3QpYp17PU0YGF22QZO0UIugjtWebpjI7nFBhdxRwCXQ==
X-Received: by 2002:adf:fa81:: with SMTP id h1mr37517234wrr.288.1593767120301; 
 Fri, 03 Jul 2020 02:05:20 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 g145sm4297039wmg.23.2020.07.03.02.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 02:05:19 -0700 (PDT)
Date: Fri, 3 Jul 2020 05:05:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/41] vhost-vdpa: introduce vhost-vdpa net client
Message-ID: <20200703090252.368694-42-mst@redhat.com>
References: <20200703090252.368694-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200703090252.368694-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/03 03:38:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Tiwei Bie <tiwei.bie@intel.com>, Jason Wang <jasowang@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Lingshan Zhu <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

This patch set introduces a new net client type: vhost-vdpa.
vhost-vdpa net client will set up a vDPA device which is specified
by a "vhostdev" parameter.

Signed-off-by: Lingshan Zhu <lingshan.zhu@intel.com>
Signed-off-by: Tiwei Bie <tiwei.bie@intel.com>
Signed-off-by: Cindy Lu <lulu@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20200701145538.22333-15-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 qapi/net.json            |  28 ++++-
 include/net/vhost-vdpa.h |  22 ++++
 net/clients.h            |   2 +
 net/net.c                |   3 +
 net/vhost-vdpa.c         | 228 +++++++++++++++++++++++++++++++++++++++
 net/Makefile.objs        |   2 +-
 6 files changed, 282 insertions(+), 3 deletions(-)
 create mode 100644 include/net/vhost-vdpa.h
 create mode 100644 net/vhost-vdpa.c

diff --git a/qapi/net.json b/qapi/net.json
index 9244c9af56..558d520a2f 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -428,16 +428,39 @@
     '*vhostforce':    'bool',
     '*queues':        'int' } }
 
+##
+# @NetdevVhostVDPAOptions:
+#
+# Vhost-vdpa network backend
+#
+# vDPA device is a device that uses a datapath which complies with the virtio
+# specifications with a vendor specific control path.
+#
+# @vhostdev: path of vhost-vdpa device
+#            (default:'/dev/vhost-vdpa-0')
+#
+# @queues: number of queues to be created for multiqueue vhost-vdpa
+#          (default: 1)
+#
+# Since: 5.1
+##
+{ 'struct': 'NetdevVhostVDPAOptions',
+  'data': {
+    '*vhostdev':     'str',
+    '*queues':       'int' } }
+
 ##
 # @NetClientDriver:
 #
 # Available netdev drivers.
 #
 # Since: 2.7
+#
+# @vhost-vdpa since 5.1
 ##
 { 'enum': 'NetClientDriver',
   'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', 'vde',
-            'bridge', 'hubport', 'netmap', 'vhost-user' ] }
+            'bridge', 'hubport', 'netmap', 'vhost-user', 'vhost-vdpa' ] }
 
 ##
 # @Netdev:
@@ -465,7 +488,8 @@
     'bridge':   'NetdevBridgeOptions',
     'hubport':  'NetdevHubPortOptions',
     'netmap':   'NetdevNetmapOptions',
-    'vhost-user': 'NetdevVhostUserOptions' } }
+    'vhost-user': 'NetdevVhostUserOptions',
+    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
 
 ##
 # @NetFilterDirection:
diff --git a/include/net/vhost-vdpa.h b/include/net/vhost-vdpa.h
new file mode 100644
index 0000000000..45e34b7cfc
--- /dev/null
+++ b/include/net/vhost-vdpa.h
@@ -0,0 +1,22 @@
+/*
+ * vhost-vdpa.h
+ *
+ * Copyright(c) 2017-2018 Intel Corporation.
+ * Copyright(c) 2020 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef VHOST_VDPA_H
+#define VHOST_VDPA_H
+
+#define TYPE_VHOST_VDPA "vhost-vdpa"
+
+struct vhost_net *vhost_vdpa_get_vhost_net(NetClientState *nc);
+uint64_t vhost_vdpa_get_acked_features(NetClientState *nc);
+
+extern const int vdpa_feature_bits[];
+
+#endif /* VHOST_VDPA_H */
diff --git a/net/clients.h b/net/clients.h
index a6ef267e19..92f9b59aed 100644
--- a/net/clients.h
+++ b/net/clients.h
@@ -61,4 +61,6 @@ int net_init_netmap(const Netdev *netdev, const char *name,
 int net_init_vhost_user(const Netdev *netdev, const char *name,
                         NetClientState *peer, Error **errp);
 
+int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
+                        NetClientState *peer, Error **errp);
 #endif /* QEMU_NET_CLIENTS_H */
diff --git a/net/net.c b/net/net.c
index 9099a327dd..94dc546fb2 100644
--- a/net/net.c
+++ b/net/net.c
@@ -966,6 +966,9 @@ static int (* const net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
 #ifdef CONFIG_VHOST_NET_USER
         [NET_CLIENT_DRIVER_VHOST_USER] = net_init_vhost_user,
 #endif
+#ifdef CONFIG_VHOST_NET_VDPA
+        [NET_CLIENT_DRIVER_VHOST_VDPA] = net_init_vhost_vdpa,
+#endif
 #ifdef CONFIG_L2TPV3
         [NET_CLIENT_DRIVER_L2TPV3]    = net_init_l2tpv3,
 #endif
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
new file mode 100644
index 0000000000..bc0e0d2d35
--- /dev/null
+++ b/net/vhost-vdpa.c
@@ -0,0 +1,228 @@
+/*
+ * vhost-vdpa.c
+ *
+ * Copyright(c) 2017-2018 Intel Corporation.
+ * Copyright(c) 2020 Red Hat, Inc.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "clients.h"
+#include "net/vhost_net.h"
+#include "net/vhost-vdpa.h"
+#include "hw/virtio/vhost-vdpa.h"
+#include "qemu/config-file.h"
+#include "qemu/error-report.h"
+#include "qemu/option.h"
+#include "qapi/error.h"
+#include <sys/ioctl.h>
+#include <err.h>
+#include "standard-headers/linux/virtio_net.h"
+#include "monitor/monitor.h"
+#include "hw/virtio/vhost.h"
+
+/* Todo:need to add the multiqueue support here */
+typedef struct VhostVDPAState {
+    NetClientState nc;
+    struct vhost_vdpa vhost_vdpa;
+    VHostNetState *vhost_net;
+    uint64_t acked_features;
+    bool started;
+} VhostVDPAState;
+
+const int vdpa_feature_bits[] = {
+    VIRTIO_F_NOTIFY_ON_EMPTY,
+    VIRTIO_RING_F_INDIRECT_DESC,
+    VIRTIO_RING_F_EVENT_IDX,
+    VIRTIO_F_ANY_LAYOUT,
+    VIRTIO_F_VERSION_1,
+    VIRTIO_NET_F_CSUM,
+    VIRTIO_NET_F_GUEST_CSUM,
+    VIRTIO_NET_F_GSO,
+    VIRTIO_NET_F_GUEST_TSO4,
+    VIRTIO_NET_F_GUEST_TSO6,
+    VIRTIO_NET_F_GUEST_ECN,
+    VIRTIO_NET_F_GUEST_UFO,
+    VIRTIO_NET_F_HOST_TSO4,
+    VIRTIO_NET_F_HOST_TSO6,
+    VIRTIO_NET_F_HOST_ECN,
+    VIRTIO_NET_F_HOST_UFO,
+    VIRTIO_NET_F_MRG_RXBUF,
+    VIRTIO_NET_F_MTU,
+    VIRTIO_F_IOMMU_PLATFORM,
+    VIRTIO_F_RING_PACKED,
+    VIRTIO_NET_F_GUEST_ANNOUNCE,
+    VHOST_INVALID_FEATURE_BIT
+};
+
+VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    return s->vhost_net;
+}
+
+uint64_t vhost_vdpa_get_acked_features(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    s->acked_features = vhost_net_get_acked_features(s->vhost_net);
+
+    return s->acked_features;
+}
+
+static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
+{
+    uint32_t device_id;
+    int ret;
+    struct vhost_dev *hdev;
+
+    hdev = (struct vhost_dev *)&net->dev;
+    ret = hdev->vhost_ops->vhost_get_device_id(hdev, &device_id);
+    if (device_id != VIRTIO_ID_NET) {
+        return -ENOTSUP;
+    }
+    return ret;
+}
+
+static void vhost_vdpa_del(NetClientState *ncs)
+{
+    VhostVDPAState *s;
+    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    s = DO_UPCAST(VhostVDPAState, nc, ncs);
+    if (s->vhost_net) {
+        vhost_net_cleanup(s->vhost_net);
+    }
+}
+
+static int vhost_vdpa_add(NetClientState *ncs, void *be)
+{
+    VhostNetOptions options;
+    struct vhost_net *net = NULL;
+    VhostVDPAState *s;
+    int ret;
+
+    options.backend_type = VHOST_BACKEND_TYPE_VDPA;
+    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    s = DO_UPCAST(VhostVDPAState, nc, ncs);
+    options.net_backend = ncs;
+    options.opaque      = be;
+    options.busyloop_timeout = 0;
+
+    net = vhost_net_init(&options);
+    if (!net) {
+        error_report("failed to init vhost_net for queue");
+        goto err;
+    }
+    if (s->vhost_net) {
+        vhost_net_cleanup(s->vhost_net);
+        g_free(s->vhost_net);
+    }
+    s->vhost_net = net;
+    ret = vhost_vdpa_net_check_device_id(net);
+    if (ret) {
+        goto err;
+    }
+    return 0;
+err:
+    if (net) {
+        vhost_net_cleanup(net);
+    }
+    vhost_vdpa_del(ncs);
+    return -1;
+}
+
+static void vhost_vdpa_cleanup(NetClientState *nc)
+{
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+
+    if (s->vhost_net) {
+        vhost_net_cleanup(s->vhost_net);
+        g_free(s->vhost_net);
+        s->vhost_net = NULL;
+    }
+}
+
+static bool vhost_vdpa_has_vnet_hdr(NetClientState *nc)
+{
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+
+    return true;
+}
+
+static bool vhost_vdpa_has_ufo(NetClientState *nc)
+{
+    assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
+    uint64_t features = 0;
+    features |= (1ULL << VIRTIO_NET_F_HOST_UFO);
+    features = vhost_net_get_features(s->vhost_net, features);
+    return !!(features & (1ULL << VIRTIO_NET_F_HOST_UFO));
+
+}
+
+static NetClientInfo net_vhost_vdpa_info = {
+        .type = NET_CLIENT_DRIVER_VHOST_VDPA,
+        .size = sizeof(VhostVDPAState),
+        .cleanup = vhost_vdpa_cleanup,
+        .has_vnet_hdr = vhost_vdpa_has_vnet_hdr,
+        .has_ufo = vhost_vdpa_has_ufo,
+};
+
+static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
+                               const char *name, const char *vhostdev)
+{
+    NetClientState *nc = NULL;
+    VhostVDPAState *s;
+    int vdpa_device_fd = -1;
+    int ret = 0;
+    assert(name);
+    nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, name);
+    snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
+    nc->queue_index = 0;
+    s = DO_UPCAST(VhostVDPAState, nc, nc);
+    vdpa_device_fd = qemu_open(vhostdev, O_RDWR);
+    if (vdpa_device_fd == -1) {
+        return -errno;
+    }
+    s->vhost_vdpa.device_fd = vdpa_device_fd;
+    ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
+    assert(s->vhost_net);
+    return ret;
+}
+
+static int net_vhost_check_net(void *opaque, QemuOpts *opts, Error **errp)
+{
+    const char *name = opaque;
+    const char *driver, *netdev;
+
+    driver = qemu_opt_get(opts, "driver");
+    netdev = qemu_opt_get(opts, "netdev");
+    if (!driver || !netdev) {
+        return 0;
+    }
+    if (strcmp(netdev, name) == 0 &&
+        !g_str_has_prefix(driver, "virtio-net-")) {
+        error_setg(errp, "vhost-vdpa requires frontend driver virtio-net-*");
+        return -1;
+    }
+    return 0;
+}
+
+int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
+                        NetClientState *peer, Error **errp)
+{
+    const NetdevVhostVDPAOptions *opts;
+
+    assert(netdev->type == NET_CLIENT_DRIVER_VHOST_VDPA);
+    opts = &netdev->u.vhost_vdpa;
+    /* verify net frontend */
+    if (qemu_opts_foreach(qemu_find_opts("device"), net_vhost_check_net,
+                          (char *)name, errp)) {
+        return -1;
+    }
+    return net_vhost_vdpa_init(peer, TYPE_VHOST_VDPA, name, opts->vhostdev);
+}
diff --git a/net/Makefile.objs b/net/Makefile.objs
index c5d076d19c..5ab45545db 100644
--- a/net/Makefile.objs
+++ b/net/Makefile.objs
@@ -26,7 +26,7 @@ tap-obj-$(CONFIG_SOLARIS) = tap-solaris.o
 tap-obj-y ?= tap-stub.o
 common-obj-$(CONFIG_POSIX) += tap.o $(tap-obj-y)
 common-obj-$(CONFIG_WIN32) += tap-win32.o
-
+common-obj-$(CONFIG_VHOST_NET_VDPA) += vhost-vdpa.o
 vde.o-libs = $(VDE_LIBS)
 
 common-obj-$(CONFIG_CAN_BUS) += can/
-- 
MST


