Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F81318CD69
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 13:03:47 +0100 (CET)
Received: from localhost ([::1]:51762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFGNO-0006ud-4g
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 08:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jFGHx-0007m6-2y
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <yuri.benditovich@daynix.com>) id 1jFGHv-0000KU-2k
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:58:09 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jFGHu-0000Jv-Ri
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 07:58:07 -0400
Received: by mail-wm1-x343.google.com with SMTP id r7so7071368wmg.0
 for <qemu-devel@nongnu.org>; Fri, 20 Mar 2020 04:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yOupkg2tDjhA9k/ASRMhbHI4PkMh+TlmWpBkkRpxw3U=;
 b=Sn5IOewDEAPX8s3C8Ml1ASAToxLM4/6Qz/US9I7XjYOI5AwA5s/YbVPU0ar6zE3/d4
 N50wmeGkO7FB+EUkYmGhTOWnYbDdgVhMJEF3Mgk1lVDVjZd7bcVC7XA/A678AMoeX+W9
 JEpeoCgkqhtwOcKNAtI1CwB3FtPQGDFrOmM0ysX07QjZNAMtkbsaSQiPAUekAOIS4Tl7
 GOtTd1mYVWRZkbqPyVKRnWr9KxN+dEZ1jtX5GNLbkjJ+4eYSqSkOzsBK/ltPmBBuuRyl
 tICkl+UTWcoU4+dPWdVP2l0FRX4/4Dsv5EsoQowzpury+eFqkBLOJ1CK3MAI5/SdJ2Wt
 a2UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yOupkg2tDjhA9k/ASRMhbHI4PkMh+TlmWpBkkRpxw3U=;
 b=qTWHomR/u0CSV/NBZcuGugG6XZlyFQIC442Pfq9UkyJHRZ4hUYS6rcN9SAN3s9konX
 6FRrwhpYEK+ZtyiNwfzIAeyi8MhW/47QKV1mpl4vhCgrNMoTIclc7aSOHBCr9Qda1ayA
 Olkg+HehgP1nhDTKhPblSG3KRxDTxpvHM2SuMhIRcF6tOLN4TFQScHAdhJSOhFHcn0QY
 S0hOdWDAqxaD4OUgCACHlkbMlq8OpLWNxIBfV+Iiq6M5HVpKXivKCQYYThJk+G/RUpeO
 nIfwkDUc/3Aky0qOZZPVschuFOGtMcbFvIxfi9b24Nr6GDbpiqybYba/Eb2pYgA/ySHU
 kDWg==
X-Gm-Message-State: ANhLgQ1KdqwfAEUDwnFckuFW23ehJwa7YHhvbyd6OL1V70BhFgrXzznH
 d1L/Angn/QVwYtT3QqvXhngsvnqJf3m5kg==
X-Google-Smtp-Source: ADFU+vt+viySfJpkjWB3yhZ3Hn799Pb+T1oJ/3n5JsL4IYwQbRpq+RkLWIsCeAcKNClRM8dyzX8sYg==
X-Received: by 2002:a1c:4805:: with SMTP id v5mr9556977wma.98.1584705485248;
 Fri, 20 Mar 2020 04:58:05 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-179-79-224.red.bezeqint.net.
 [79.179.79.224])
 by smtp.gmail.com with ESMTPSA id c18sm6637645wrx.5.2020.03.20.04.58.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 04:58:04 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH v6 5/7] virtio-net: reference implementation of hash report
Date: Fri, 20 Mar 2020 13:57:49 +0200
Message-Id: <20200320115751.19446-6-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320115751.19446-1-yuri.benditovich@daynix.com>
References: <20200320115751.19446-1-yuri.benditovich@daynix.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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

Suggest VIRTIO_NET_F_HASH_REPORT if specified in device
parameters.
If the VIRTIO_NET_F_HASH_REPORT is set,
the device extends configuration space. If the feature
is negotiated, the packet layout is extended to
accomodate the hash information. In this case deliver
packet's hash value and report type in virtio header
extension.
Use for configuration the same procedure as already
used for RSS. We add two fields in rss_data that
controls what the device does with the calculated hash
if rss_data.enabled is set. If field 'populate' is set
the hash is set in the packet, if field 'redirect' is
set the hash is used to decide the queue to place the
packet to.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/virtio-net.c            | 99 +++++++++++++++++++++++++++-------
 include/hw/virtio/virtio-net.h |  2 +
 2 files changed, 81 insertions(+), 20 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index de2d68d4ca..a0614ad4e6 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -184,7 +184,7 @@ static VirtIOFeature feature_sizes[] = {
      .end = endof(struct virtio_net_config, mtu)},
     {.flags = 1ULL << VIRTIO_NET_F_SPEED_DUPLEX,
      .end = endof(struct virtio_net_config, duplex)},
-    {.flags = 1ULL << VIRTIO_NET_F_RSS,
+    {.flags = (1ULL << VIRTIO_NET_F_RSS) | (1ULL << VIRTIO_NET_F_HASH_REPORT),
      .end = endof(struct virtio_net_config_with_rss, supported_hash_types)},
     {}
 };
@@ -218,7 +218,8 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     netcfg.cfg.duplex = n->net_conf.duplex;
     netcfg.rss_max_key_size = VIRTIO_NET_RSS_MAX_KEY_SIZE;
     virtio_stw_p(vdev, &netcfg.rss_max_indirection_table_length,
-                 VIRTIO_NET_RSS_MAX_TABLE_LEN);
+                 virtio_host_has_feature(vdev, VIRTIO_NET_F_RSS) ?
+                 VIRTIO_NET_RSS_MAX_TABLE_LEN : 1);
     virtio_stl_p(vdev, &netcfg.supported_hash_types,
                  VIRTIO_NET_RSS_SUPPORTED_HASHES);
     memcpy(config, &netcfg, n->config_size);
@@ -644,7 +645,7 @@ static int peer_has_ufo(VirtIONet *n)
 }
 
 static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
-                                       int version_1)
+                                       int version_1, int hash_report)
 {
     int i;
     NetClientState *nc;
@@ -652,7 +653,10 @@ static void virtio_net_set_mrg_rx_bufs(VirtIONet *n, int mergeable_rx_bufs,
     n->mergeable_rx_bufs = mergeable_rx_bufs;
 
     if (version_1) {
-        n->guest_hdr_len = sizeof(struct virtio_net_hdr_mrg_rxbuf);
+        n->guest_hdr_len = hash_report ?
+            sizeof(struct virtio_net_hdr_v1_hash) :
+            sizeof(struct virtio_net_hdr_mrg_rxbuf);
+        n->rss_data.populate_hash = true;
     } else {
         n->guest_hdr_len = n->mergeable_rx_bufs ?
             sizeof(struct virtio_net_hdr_mrg_rxbuf) :
@@ -773,6 +777,8 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
         virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_TSO4);
         virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_TSO6);
         virtio_clear_feature(&features, VIRTIO_NET_F_GUEST_ECN);
+
+        virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
     }
 
     if (!peer_has_vnet_hdr(n) || !peer_has_ufo(n)) {
@@ -785,6 +791,7 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
     }
 
     virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
+    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
     vdev->backend_features = features;
 
@@ -951,12 +958,15 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
                                virtio_has_feature(features,
                                                   VIRTIO_NET_F_MRG_RXBUF),
                                virtio_has_feature(features,
-                                                  VIRTIO_F_VERSION_1));
+                                                  VIRTIO_F_VERSION_1),
+                               virtio_has_feature(features,
+                                                  VIRTIO_NET_F_HASH_REPORT));
 
     n->rsc4_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
         virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO4);
     n->rsc6_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
         virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
+    n->rss_data.redirect = virtio_has_feature(features, VIRTIO_NET_F_RSS);
 
     if (n->has_vnet_hdr) {
         n->curr_guest_offloads =
@@ -1230,7 +1240,9 @@ static void virtio_net_disable_rss(VirtIONet *n)
 }
 
 static uint16_t virtio_net_handle_rss(VirtIONet *n,
-                                      struct iovec *iov, unsigned int iov_cnt)
+                                      struct iovec *iov,
+                                      unsigned int iov_cnt,
+                                      bool do_rss)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
     struct virtio_net_rss_config cfg;
@@ -1243,10 +1255,14 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
     const char *err_msg = "";
     uint32_t err_value = 0;
 
-    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_RSS)) {
+    if (do_rss && !virtio_vdev_has_feature(vdev, VIRTIO_NET_F_RSS)) {
         err_msg = "RSS is not negotiated";
         goto error;
     }
+    if (!do_rss && !virtio_vdev_has_feature(vdev, VIRTIO_NET_F_HASH_REPORT)) {
+        err_msg = "Hash report is not negotiated";
+        goto error;
+    }
     size_get = offsetof(struct virtio_net_rss_config, indirection_table);
     s = iov_to_buf(iov, iov_cnt, offset, &cfg, size_get);
     if (s != size_get) {
@@ -1258,6 +1274,9 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
     n->rss_data.indirections_len =
         virtio_lduw_p(vdev, &cfg.indirection_table_mask);
     n->rss_data.indirections_len++;
+    if (!do_rss) {
+        n->rss_data.indirections_len = 1;
+    }
     if (!is_power_of_2(n->rss_data.indirections_len)) {
         err_msg = "Invalid size of indirection table";
         err_value = n->rss_data.indirections_len;
@@ -1268,8 +1287,8 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
         err_value = n->rss_data.indirections_len;
         goto error;
     }
-    n->rss_data.default_queue =
-        virtio_lduw_p(vdev, &cfg.unclassified_queue);
+    n->rss_data.default_queue = do_rss ?
+        virtio_lduw_p(vdev, &cfg.unclassified_queue) : 0;
     if (n->rss_data.default_queue >= n->max_queues) {
         err_msg = "Invalid default queue";
         err_value = n->rss_data.default_queue;
@@ -1303,7 +1322,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
         err_value = (uint32_t)s;
         goto error;
     }
-    queues = virtio_lduw_p(vdev, &temp.us);
+    queues = do_rss ? virtio_lduw_p(vdev, &temp.us) : n->curr_queues;
     if (queues == 0 || queues > n->max_queues) {
         err_msg = "Invalid number of queues";
         err_value = queues;
@@ -1349,8 +1368,12 @@ static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
     uint16_t queues;
 
     virtio_net_disable_rss(n);
+    if (cmd == VIRTIO_NET_CTRL_MQ_HASH_CONFIG) {
+        queues = virtio_net_handle_rss(n, iov, iov_cnt, false);
+        return queues ? VIRTIO_NET_OK : VIRTIO_NET_ERR;
+    }
     if (cmd == VIRTIO_NET_CTRL_MQ_RSS_CONFIG) {
-        queues = virtio_net_handle_rss(n, iov, iov_cnt);
+        queues = virtio_net_handle_rss(n, iov, iov_cnt, true);
     } else if (cmd == VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET) {
         struct virtio_net_ctrl_mq mq;
         size_t s;
@@ -1637,15 +1660,34 @@ static uint8_t virtio_net_get_hash_type(bool isip4,
     return 0xff;
 }
 
+static void virtio_set_packet_hash(const uint8_t *buf, uint8_t report,
+                                   uint32_t hash)
+{
+    struct virtio_net_hdr_v1_hash *hdr = (void *)buf;
+    hdr->hash_value = hash;
+    hdr->hash_report = report;
+}
+
 static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
                                   size_t size)
 {
     VirtIONet *n = qemu_get_nic_opaque(nc);
-    unsigned int index = nc->queue_index, new_index;
+    unsigned int index = nc->queue_index, new_index = index;
     struct NetRxPkt *pkt = n->rx_pkt;
     uint8_t net_hash_type;
     uint32_t hash;
     bool isip4, isip6, isudp, istcp;
+    static const uint8_t reports[NetPktRssIpV6UdpEx + 1] = {
+        VIRTIO_NET_HASH_REPORT_IPv4,
+        VIRTIO_NET_HASH_REPORT_TCPv4,
+        VIRTIO_NET_HASH_REPORT_TCPv6,
+        VIRTIO_NET_HASH_REPORT_IPv6,
+        VIRTIO_NET_HASH_REPORT_IPv6_EX,
+        VIRTIO_NET_HASH_REPORT_TCPv6_EX,
+        VIRTIO_NET_HASH_REPORT_UDPv4,
+        VIRTIO_NET_HASH_REPORT_UDPv6,
+        VIRTIO_NET_HASH_REPORT_UDPv6_EX
+    };
 
     net_rx_pkt_set_protocols(pkt, buf + n->host_hdr_len,
                              size - n->host_hdr_len);
@@ -1659,16 +1701,24 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
     net_hash_type = virtio_net_get_hash_type(isip4, isip6, isudp, istcp,
                                              n->rss_data.hash_types);
     if (net_hash_type > NetPktRssIpV6UdpEx) {
-        return n->rss_data.default_queue;
+        if (n->rss_data.populate_hash) {
+            virtio_set_packet_hash(buf, VIRTIO_NET_HASH_REPORT_NONE, 0);
+        }
+        return n->rss_data.redirect ? n->rss_data.default_queue : -1;
     }
 
     hash = net_rx_pkt_calc_rss_hash(pkt, net_hash_type, n->rss_data.key);
-    new_index = hash & (n->rss_data.indirections_len - 1);
-    new_index = n->rss_data.indirections_table[new_index];
-    if (index == new_index) {
-        return -1;
+
+    if (n->rss_data.populate_hash) {
+        virtio_set_packet_hash(buf, reports[net_hash_type], hash);
     }
-    return new_index;
+
+    if (n->rss_data.redirect) {
+        new_index = hash & (n->rss_data.indirections_len - 1);
+        new_index = n->rss_data.indirections_table[new_index];
+    }
+
+    return (index == new_index) ? -1 : new_index;
 }
 
 static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
@@ -1744,6 +1794,11 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
             }
 
             receive_header(n, sg, elem->in_num, buf, size);
+            if (n->rss_data.populate_hash) {
+                offset = sizeof(mhdr);
+                iov_from_buf(sg, elem->in_num, offset,
+                             buf + offset, n->host_hdr_len - sizeof(mhdr));
+            }
             offset = n->host_hdr_len;
             total += n->guest_hdr_len;
             guest_offset = n->guest_hdr_len;
@@ -2736,7 +2791,9 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
     trace_virtio_net_post_load_device();
     virtio_net_set_mrg_rx_bufs(n, n->mergeable_rx_bufs,
                                virtio_vdev_has_feature(vdev,
-                                                       VIRTIO_F_VERSION_1));
+                                                       VIRTIO_F_VERSION_1),
+                               virtio_vdev_has_feature(vdev,
+                                                       VIRTIO_NET_F_HASH_REPORT));
 
     /* MAC_TABLE_ENTRIES may be different from the saved image */
     if (n->mac_table.in_use > MAC_TABLE_ENTRIES) {
@@ -3352,7 +3409,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
 
     n->vqs[0].tx_waiting = 0;
     n->tx_burst = n->net_conf.txburst;
-    virtio_net_set_mrg_rx_bufs(n, 0, 0);
+    virtio_net_set_mrg_rx_bufs(n, 0, 0, 0);
     n->promisc = 1; /* for compatibility */
 
     n->mac_table.macs = g_malloc0(MAC_TABLE_ENTRIES * ETH_ALEN);
@@ -3507,6 +3564,8 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_BIT64("mq", VirtIONet, host_features, VIRTIO_NET_F_MQ, false),
     DEFINE_PROP_BIT64("rss", VirtIONet, host_features,
                     VIRTIO_NET_F_RSS, false),
+    DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
+                    VIRTIO_NET_F_HASH_REPORT, false),
     DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
                     VIRTIO_NET_F_RSC_EXT, false),
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 5081f3c52a..a45ef8278e 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -131,6 +131,8 @@ typedef struct VirtioNetRscChain {
 
 typedef struct VirtioNetRssData {
     bool    enabled;
+    bool    redirect;
+    bool    populate_hash;
     uint32_t hash_types;
     uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
     uint16_t indirections_len;
-- 
2.17.1


