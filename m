Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9982181833
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 13:37:16 +0100 (CET)
Received: from localhost ([::1]:50982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC0br-0006A2-MF
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 08:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45182)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jC0aE-0004T4-12
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 08:35:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jC0aC-0002np-78
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 08:35:33 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jC0aB-0002mb-W4
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 08:35:32 -0400
Received: by mail-wr1-x442.google.com with SMTP id m9so2362931wro.12
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CeJ8yzcUlsEMpe3g5WA0yYMk3APcOPfzJcFhE4rWVYY=;
 b=wbTAMAnZoVrW3KKQSbnSZoE4CxlnfdaAvt04ilHqDI3/R+HcNj/cjcSMHVYScjbYOb
 UmL5Ok5CDUAi2wLJSuGgzcZ8SP8k9WrWzxBgSIh1T9gyZUI8HCB/Xd3P4MnF7FjWrfOQ
 km4tpQmp5y4cPbwLMXD9LOCLHXnhde+bSqCNPu4Zv/+Jh08VpXW4chufUHVVJel5fdIp
 spyw/g7EqtpDLmA+FQp3HuZVrPMdWnUaXIUJOH0Kq5htinM6X3gkUwVybryMFJZdusMf
 x1enfUDqvSexr7Zow5uHlZTwL8QDpmEE0WDurR0y/GWKLAY5NcxqtGwtO5Lx+dfAoEWP
 wsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CeJ8yzcUlsEMpe3g5WA0yYMk3APcOPfzJcFhE4rWVYY=;
 b=hyESYsF3Sx/pGNKhpTOrP7hv/9SlFOtN2wH6KvYBKb7j2EcUDHvcoq8vj4wOq48dpo
 aw/aHLxe1WKOOmFDB7yX+yDUvTl9WtrWAU8qWgGCFKdTM8rp60ElCnX03rljXOSvYDdN
 gnchfNpGO60p96qgaEjF9vw6NHfs7OiykgKq7/VAqsyhhCuzuyzJVJTiQBuGglD6vybB
 Bp2tM/midwGnd97Pf/jeT7r/zYtSNXwfcxOfPeCDB7DpNEaVUD4d8f9ZJ7mvKwNQ6Kxh
 f43w40NvJHCteagO4MCaVOZL3NI1q8ROdaT5nTS/EVFijWAvsTAEBbWHGcJhKEMwc4XF
 hMeQ==
X-Gm-Message-State: ANhLgQ2nj3IAQivZ4iWNz2n/MRS/egapIwHsLXZe+s+R25Zo30tlYrpZ
 rhdSJqGs48//U2v8P4lqfOQ7hC83pggS7Q==
X-Google-Smtp-Source: ADFU+vtV4V1hCjSUwu3O8WSQk3CfHWhSlicwTPbQHpGWXieuo8/fOami9f/vqeYP3OHVi0vS7PIWKw==
X-Received: by 2002:a5d:4582:: with SMTP id p2mr4375939wrq.80.1583930130436;
 Wed, 11 Mar 2020 05:35:30 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-183-43-120.red.bezeqint.net.
 [79.183.43.120])
 by smtp.gmail.com with ESMTPSA id o11sm61480696wrn.6.2020.03.11.05.35.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 05:35:30 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH v3 2/6] virtio-net: implement RSS configuration command
Date: Wed, 11 Mar 2020 14:35:14 +0200
Message-Id: <20200311123518.4025-3-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311123518.4025-1-yuri.benditovich@daynix.com>
References: <20200311123518.4025-1-yuri.benditovich@daynix.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Optionally report RSS feature.
Handle RSS configuration command and keep RSS parameters
in virtio-net device context.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/trace-events            |   3 +
 hw/net/virtio-net.c            | 158 +++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-net.h |  16 ++++
 3 files changed, 168 insertions(+), 9 deletions(-)

diff --git a/hw/net/trace-events b/hw/net/trace-events
index a1da98a643..a84b9c3d9f 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -371,6 +371,9 @@ virtio_net_announce_notify(void) ""
 virtio_net_announce_timer(int round) "%d"
 virtio_net_handle_announce(int round) "%d"
 virtio_net_post_load_device(void)
+virtio_net_rss_disable(void)
+virtio_net_rss_error(const char *msg, uint32_t value) "%s, value 0x%08x"
+virtio_net_rss_enable(uint32_t p1, uint16_t p2, uint8_t p3) "hashes 0x%x, table of %d, key of %d"
 
 # tulip.c
 tulip_reg_write(uint64_t addr, const char *name, int size, uint64_t val) "addr 0x%02"PRIx64" (%s) size %d value 0x%08"PRIx64
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 9545b0e84f..1747b8dca7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -172,6 +172,16 @@ struct virtio_net_rss_config {
    tso/gso/gro 'off'. */
 #define VIRTIO_NET_RSC_DEFAULT_INTERVAL 300000
 
+#define VIRTIO_NET_RSS_SUPPORTED_HASHES (VIRTIO_NET_RSS_HASH_TYPE_IPv4 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_TCPv4 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_UDPv4 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_IPv6 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_TCPv6 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_UDPv6 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_IP_EX | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
+
 /* temporary until standard header include it */
 #if !defined(VIRTIO_NET_HDR_F_RSC_INFO)
 
@@ -203,6 +213,8 @@ static VirtIOFeature feature_sizes[] = {
      .end = endof(struct virtio_net_config, mtu)},
     {.flags = 1ULL << VIRTIO_NET_F_SPEED_DUPLEX,
      .end = endof(struct virtio_net_config, duplex)},
+    {.flags = 1ULL << VIRTIO_NET_F_RSS,
+     .end = endof(struct virtio_net_config, supported_hash_types)},
     {}
 };
 
@@ -233,6 +245,11 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     memcpy(netcfg.mac, n->mac, ETH_ALEN);
     virtio_stl_p(vdev, &netcfg.speed, n->net_conf.speed);
     netcfg.duplex = n->net_conf.duplex;
+    netcfg.rss_max_key_size = VIRTIO_NET_RSS_MAX_KEY_SIZE;
+    virtio_stw_p(vdev, &netcfg.rss_max_indirection_table_length,
+                 VIRTIO_NET_RSS_MAX_TABLE_LEN);
+    virtio_stl_p(vdev, &netcfg.supported_hash_types,
+                 VIRTIO_NET_RSS_SUPPORTED_HASHES);
     memcpy(config, &netcfg, n->config_size);
 }
 
@@ -796,6 +813,7 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
         return features;
     }
 
+    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
     vdev->backend_features = features;
 
@@ -955,6 +973,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
     }
 
     virtio_net_set_multiqueue(n,
+                              virtio_has_feature(features, VIRTIO_NET_F_RSS) ||
                               virtio_has_feature(features, VIRTIO_NET_F_MQ));
 
     virtio_net_set_mrg_rx_bufs(n,
@@ -1231,25 +1250,144 @@ static int virtio_net_handle_announce(VirtIONet *n, uint8_t cmd,
     }
 }
 
+static void virtio_net_disable_rss(VirtIONet *n)
+{
+    if (n->rss_data.enabled) {
+        trace_virtio_net_rss_disable();
+    }
+    n->rss_data.enabled = false;
+}
+
+static uint16_t virtio_net_handle_rss(VirtIONet *n,
+                                      struct iovec *iov, unsigned int iov_cnt)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    struct virtio_net_rss_config cfg;
+    size_t s, offset = 0, size_get;
+    uint16_t queues, i;
+    struct {
+        uint16_t us;
+        uint8_t b;
+    } QEMU_PACKED temp;
+    const char *err_msg = "";
+    uint32_t err_value = 0;
+
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_RSS)) {
+        err_msg = "RSS is not negotiated";
+        goto error;
+    }
+    size_get = offsetof(struct virtio_net_rss_config, indirection_table);
+    s = iov_to_buf(iov, iov_cnt, offset, &cfg, size_get);
+    if (s != size_get) {
+        err_msg = "Short command buffer";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    n->rss_data.hash_types = virtio_ldl_p(vdev, &cfg.hash_types);
+    n->rss_data.indirections_len =
+        virtio_lduw_p(vdev, &cfg.indirection_table_mask);
+    n->rss_data.indirections_len++;
+    if (!is_power_of_2(n->rss_data.indirections_len)) {
+        err_msg = "Invalid size of indirection table";
+        err_value = n->rss_data.indirections_len;
+        goto error;
+    }
+    if (n->rss_data.indirections_len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
+        err_msg = "Too large indirection table";
+        err_value = n->rss_data.indirections_len;
+        goto error;
+    }
+    n->rss_data.default_queue =
+        virtio_lduw_p(vdev, &cfg.unclassified_queue);
+    if (n->rss_data.default_queue >= n->max_queues) {
+        err_msg = "Invalid default queue";
+        err_value = n->rss_data.default_queue;
+        goto error;
+    }
+    offset += size_get;
+    size_get = sizeof(uint16_t) * n->rss_data.indirections_len;
+    s = iov_to_buf(iov, iov_cnt, offset, n->rss_data.indirections, size_get);
+    if (s != size_get) {
+        err_msg = "Short indirection table buffer";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    for (i = 0; i < n->rss_data.indirections_len; ++i) {
+        uint16_t val = n->rss_data.indirections[i];
+        n->rss_data.indirections[i] = virtio_lduw_p(vdev, &val);
+    }
+    offset += size_get;
+    size_get = sizeof(temp);
+    s = iov_to_buf(iov, iov_cnt, offset, &temp, size_get);
+    if (s != size_get) {
+        err_msg = "Can't get queues";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    queues = virtio_lduw_p(vdev, &temp.us);
+    if (queues == 0 || queues > n->max_queues) {
+        err_msg = "Invalid number of queues";
+        err_value = queues;
+        goto error;
+    }
+    if (temp.b > VIRTIO_NET_RSS_MAX_KEY_SIZE) {
+        err_msg = "Invalid key size";
+        err_value = temp.b;
+        goto error;
+    }
+    if (!temp.b && n->rss_data.hash_types) {
+        err_msg = "No key provided";
+        err_value = 0;
+        goto error;
+    }
+    if (!temp.b && !n->rss_data.hash_types) {
+        virtio_net_disable_rss(n);
+        return queues;
+    }
+    offset += size_get;
+    size_get = temp.b;
+    s = iov_to_buf(iov, iov_cnt, offset, n->rss_data.key, size_get);
+    if (s != size_get) {
+        err_msg = "Can get key buffer";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    n->rss_data.enabled = true;
+    trace_virtio_net_rss_enable(n->rss_data.hash_types,
+                                n->rss_data.indirections_len,
+                                temp.b);
+    return queues;
+error:
+    trace_virtio_net_rss_error(err_msg, err_value);
+    virtio_net_disable_rss(n);
+    return 0;
+}
+
 static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
                                 struct iovec *iov, unsigned int iov_cnt)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
-    struct virtio_net_ctrl_mq mq;
-    size_t s;
     uint16_t queues;
 
-    s = iov_to_buf(iov, iov_cnt, 0, &mq, sizeof(mq));
-    if (s != sizeof(mq)) {
-        return VIRTIO_NET_ERR;
-    }
+    virtio_net_disable_rss(n);
+    if (cmd == VIRTIO_NET_CTRL_MQ_RSS_CONFIG) {
+        queues = virtio_net_handle_rss(n, iov, iov_cnt);
+    } else if (cmd == VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET) {
+        struct virtio_net_ctrl_mq mq;
+        size_t s;
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ)) {
+            return VIRTIO_NET_ERR;
+        }
+        s = iov_to_buf(iov, iov_cnt, 0, &mq, sizeof(mq));
+        if (s != sizeof(mq)) {
+            return VIRTIO_NET_ERR;
+        }
+        queues = virtio_lduw_p(vdev, &mq.virtqueue_pairs);
 
-    if (cmd != VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET) {
+    } else {
         return VIRTIO_NET_ERR;
     }
 
-    queues = virtio_lduw_p(vdev, &mq.virtqueue_pairs);
-
     if (queues < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
         queues > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
         queues > n->max_queues ||
@@ -3304,6 +3442,8 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_BIT64("ctrl_guest_offloads", VirtIONet, host_features,
                     VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, true),
     DEFINE_PROP_BIT64("mq", VirtIONet, host_features, VIRTIO_NET_F_MQ, false),
+    DEFINE_PROP_BIT64("rss", VirtIONet, host_features,
+                    VIRTIO_NET_F_RSS, false),
     DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
                     VIRTIO_NET_F_RSC_EXT, false),
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 96c68d4a92..ebd81e29eb 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -126,6 +126,18 @@ typedef struct VirtioNetRscChain {
 /* Maximum packet size we can receive from tap device: header + 64k */
 #define VIRTIO_NET_MAX_BUFSIZE (sizeof(struct virtio_net_hdr) + (64 * KiB))
 
+#define VIRTIO_NET_RSS_MAX_KEY_SIZE     40
+#define VIRTIO_NET_RSS_MAX_TABLE_LEN    128
+
+typedef struct VirtioNetRssData {
+    bool    enabled;
+    uint32_t hash_types;
+    uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
+    uint16_t indirections[VIRTIO_NET_RSS_MAX_TABLE_LEN];
+    uint16_t indirections_len;
+    uint16_t default_queue;
+} VirtioNetRssData;
+
 typedef struct VirtIONetQueue {
     VirtQueue *rx_vq;
     VirtQueue *tx_vq;
@@ -199,6 +211,10 @@ struct VirtIONet {
     bool failover;
     DeviceListener primary_listener;
     Notifier migration_state;
+    union {
+        VirtioNetRssData rss_data;
+        uint8_t rss_data_migration[sizeof(VirtioNetRssData)];
+    };
 };
 
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
-- 
2.17.1


