Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72A6A0620
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:26:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k5-0007mU-0P; Thu, 23 Feb 2023 05:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jo-0007LN-Ik
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:10 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jm-0002kN-Gg
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id z2so12367408plf.12
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oLrWHd65frzqttg6MaHuf9ZrkRsJYxBcXGezoOzJp74=;
 b=Lb5YjYspXP9iKqm21KoPXy/twMmfWEsLgLTPw2yUKjDjrtAf3RduhH2nIyGvEn1EIt
 6LQ/cR1IUxGep0tQmgluFW2q4O4vv1kdmA1QLYjQ37Jb2fWDSf55rcNLiMOD1eYLXZdw
 q0Z7oP+2BHlanebWUbz4aosuYPYUnwGetBVtGzB2I9jk0JseHZYJnCHCVFWqWPML8cb+
 4KdxZT/ddFtbfIpkXURBycOjR30/RR0iqrmhxLppFl4t2I+1xqdery6hcePofOKkKwVr
 9pKT3BeayISCUyg/aywoPGSTpO3hZy3Iy0pQAJrnvvqmE12sOGLg9r4qUg8Q6jD3yu58
 igwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oLrWHd65frzqttg6MaHuf9ZrkRsJYxBcXGezoOzJp74=;
 b=b6zNNuxPRBLZ12OE7HdTAVpS8J8YL0Cn65jRE2LXw7EZSu/p/nlSkv9eCu+4s4Aw0A
 muA70fvigJ3M8WAiukCL1/KeeK8kShZlpH4JDLucIL1jPmKVM6Fwc8QGlIbCI1vb0k2f
 1Y2sZ760UkyZNEKsyelLEzwtEFa7tR4i359x/NHVfvSWatmOsM+vR9XqqUaEgtBnw/YQ
 ueTBCNKxN9Jx6OmYgoN2aln+ApjF72YkHOu1EdHt6CTLd66p9fXaCrkC0Z0ofH61ksIx
 qeA3r3+BP4DKeuHU0/K9N6zkTrQDYa/y4OHRSOs+F/LqPLTnhmrJUXpfTYEYrk1xOaLf
 nloQ==
X-Gm-Message-State: AO0yUKXVzRZ42AjtiQFPm5qstuifKIVV/2IHHWZwYbnFfJE0ryBgLeug
 L4jauZha24gCCTtQCSxQIi+CuA==
X-Google-Smtp-Source: AK7set9vorw+BaxVepUi7sBtCvuddZrllhQQObVjcdvx7Zhw7Oog4CtC1YqZwNHPjktmSCVZnJkyQg==
X-Received: by 2002:a17:902:f54a:b0:19a:a647:1891 with SMTP id
 h10-20020a170902f54a00b0019aa6471891mr16123469plf.67.1677147724210; 
 Thu, 23 Feb 2023 02:22:04 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:03 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 24/34] e1000e: Perform software segmentation for loopback
Date: Thu, 23 Feb 2023 19:20:08 +0900
Message-Id: <20230223102018.141748-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

e1000e didn't perform software segmentation for loopback if virtio-net
header is enabled, which is wrong.

To fix the problem, introduce net_tx_pkt_send_custom(), which allows the
caller to specify whether offloading should be assumed or not.

net_tx_pkt_send_custom() also allows the caller to provide a custom
sending function. Packets with virtio-net headers and ones without
virtio-net headers will be provided at the same time so the function
can choose the preferred version. In case of e1000e loopback, it prefers
to have virtio-net headers as they allows to skip the checksum
verification if VIRTIO_NET_HDR_F_DATA_VALID is set.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 27 ++++++++++++++--
 hw/net/net_rx_pkt.c  |  7 ++++
 hw/net/net_rx_pkt.h  |  8 +++++
 hw/net/net_tx_pkt.c  | 76 +++++++++++++++++++++-----------------------
 hw/net/net_tx_pkt.h  | 21 ++++++------
 5 files changed, 88 insertions(+), 51 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 95245c42f5..ff93547f88 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -61,6 +61,10 @@ union e1000_rx_desc_union {
     union e1000_rx_desc_packet_split packet_split;
 };
 
+static ssize_t
+e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
+                        bool has_vnet);
+
 static inline void
 e1000e_set_interrupt_cause(E1000ECore *core, uint32_t val);
 
@@ -655,6 +659,15 @@ e1000e_setup_tx_offloads(E1000ECore *core, struct e1000e_tx *tx)
     return true;
 }
 
+static void e1000e_tx_pkt_callback(void *core,
+                                   const struct iovec *iov,
+                                   int iovcnt,
+                                   const struct iovec *virt_iov,
+                                   int virt_iovcnt)
+{
+    e1000e_receive_internal(core, virt_iov, virt_iovcnt, true);
+}
+
 static bool
 e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
 {
@@ -669,7 +682,8 @@ e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
 
     if ((core->phy[0][MII_BMCR] & MII_BMCR_LOOPBACK) ||
         ((core->mac[RCTL] & E1000_RCTL_LBM_MAC) == E1000_RCTL_LBM_MAC)) {
-        return net_tx_pkt_send_loopback(tx->tx_pkt, queue);
+        return net_tx_pkt_send_custom(tx->tx_pkt, false,
+                                      e1000e_tx_pkt_callback, core);
     } else {
         return net_tx_pkt_send(tx->tx_pkt, queue);
     }
@@ -1674,6 +1688,13 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
 
 ssize_t
 e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
+{
+    return e1000e_receive_internal(core, iov, iovcnt, core->has_vnet);
+}
+
+static ssize_t
+e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
+                        bool has_vnet)
 {
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
@@ -1696,9 +1717,11 @@ e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
     }
 
     /* Pull virtio header in */
-    if (core->has_vnet) {
+    if (has_vnet) {
         net_rx_pkt_set_vhdr_iovec(core->rx_pkt, iov, iovcnt);
         iov_ofs = sizeof(struct virtio_net_hdr);
+    } else {
+        net_rx_pkt_unset_vhdr(core->rx_pkt);
     }
 
     filter_buf = iov->iov_base + iov_ofs;
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index b309c2f476..a53e7561c5 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -463,6 +463,13 @@ void net_rx_pkt_set_vhdr_iovec(struct NetRxPkt *pkt,
     iov_to_buf(iov, iovcnt, 0, &pkt->virt_hdr, sizeof pkt->virt_hdr);
 }
 
+void net_rx_pkt_unset_vhdr(struct NetRxPkt *pkt)
+{
+    assert(pkt);
+
+    memset(&pkt->virt_hdr, 0, sizeof(pkt->virt_hdr));
+}
+
 bool net_rx_pkt_is_vlan_stripped(struct NetRxPkt *pkt)
 {
     assert(pkt);
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index 7277907a22..8b69ddb2da 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -312,6 +312,14 @@ void net_rx_pkt_set_vhdr(struct NetRxPkt *pkt,
 void net_rx_pkt_set_vhdr_iovec(struct NetRxPkt *pkt,
     const struct iovec *iov, int iovcnt);
 
+/**
+ * unset vhdr data from packet context
+ *
+ * @pkt:            packet
+ *
+ */
+void net_rx_pkt_unset_vhdr(struct NetRxPkt *pkt);
+
 /**
  * save packet type in packet context
  *
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index cf46c8457f..6afd3f6693 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -53,8 +53,6 @@ struct NetTxPkt {
     uint16_t hdr_len;
     eth_pkt_types_e packet_type;
     uint8_t l4proto;
-
-    bool is_loopback;
 };
 
 void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
@@ -508,12 +506,6 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt)
     iov_from_buf(iov, iov_len, csum_offset, &csum, sizeof csum);
 }
 
-enum {
-    NET_TX_PKT_FRAGMENT_L2_HDR_POS = 0,
-    NET_TX_PKT_FRAGMENT_L3_HDR_POS,
-    NET_TX_PKT_FRAGMENT_HEADER_NUM
-};
-
 #define NET_MAX_FRAG_SG_LIST (64)
 
 static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
@@ -522,7 +514,7 @@ static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
     size_t fetched = 0;
     struct iovec *src = pkt->vec;
 
-    *dst_idx = NET_TX_PKT_FRAGMENT_HEADER_NUM;
+    *dst_idx = NET_TX_PKT_PL_START_FRAG;
 
     while (fetched < IP_FRAG_ALIGN_SIZE(pkt->virt_hdr.gso_size)) {
 
@@ -555,18 +547,22 @@ static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
     return fetched;
 }
 
-static inline void net_tx_pkt_sendv(struct NetTxPkt *pkt,
-    NetClientState *nc, const struct iovec *iov, int iov_cnt)
+static void net_tx_pkt_sendv(
+    void *opaque, const struct iovec *iov, int iov_cnt,
+    const struct iovec *virt_iov, int virt_iov_cnt)
 {
-    if (pkt->is_loopback) {
-        qemu_receive_packet_iov(nc, iov, iov_cnt);
+    NetClientState *nc = opaque;
+
+    if (qemu_get_using_vnet_hdr(nc->peer)) {
+        qemu_sendv_packet(nc, virt_iov, virt_iov_cnt);
     } else {
         qemu_sendv_packet(nc, iov, iov_cnt);
     }
 }
 
 static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
-    NetClientState *nc)
+                                           NetTxPktCallback callback,
+                                           void *context)
 {
     struct iovec fragment[NET_MAX_FRAG_SG_LIST];
     size_t fragment_len = 0;
@@ -578,6 +574,10 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
     int src_idx =  NET_TX_PKT_PL_START_FRAG, dst_idx;
     size_t src_offset = 0;
     size_t fragment_offset = 0;
+    struct virtio_net_hdr virt_hdr = {
+        .flags = pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM ?
+                 VIRTIO_NET_HDR_F_DATA_VALID : 0
+    };
 
     l2_iov_base = pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_base;
     l2_iov_len = pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len;
@@ -585,10 +585,12 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
     l3_iov_len = pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len;
 
     /* Copy headers */
-    fragment[NET_TX_PKT_FRAGMENT_L2_HDR_POS].iov_base = l2_iov_base;
-    fragment[NET_TX_PKT_FRAGMENT_L2_HDR_POS].iov_len = l2_iov_len;
-    fragment[NET_TX_PKT_FRAGMENT_L3_HDR_POS].iov_base = l3_iov_base;
-    fragment[NET_TX_PKT_FRAGMENT_L3_HDR_POS].iov_len = l3_iov_len;
+    fragment[NET_TX_PKT_VHDR_FRAG].iov_base = &virt_hdr;
+    fragment[NET_TX_PKT_VHDR_FRAG].iov_len = sizeof(virt_hdr);
+    fragment[NET_TX_PKT_L2HDR_FRAG].iov_base = l2_iov_base;
+    fragment[NET_TX_PKT_L2HDR_FRAG].iov_len = l2_iov_len;
+    fragment[NET_TX_PKT_L3HDR_FRAG].iov_base = l3_iov_base;
+    fragment[NET_TX_PKT_L3HDR_FRAG].iov_len = l3_iov_len;
 
 
     /* Put as much data as possible and send */
@@ -603,7 +605,9 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
 
         eth_fix_ip4_checksum(l3_iov_base, l3_iov_len);
 
-        net_tx_pkt_sendv(pkt, nc, fragment, dst_idx);
+        callback(context,
+                 fragment + NET_TX_PKT_L2HDR_FRAG, dst_idx - NET_TX_PKT_L2HDR_FRAG,
+                 fragment + NET_TX_PKT_VHDR_FRAG, dst_idx - NET_TX_PKT_VHDR_FRAG);
 
         fragment_offset += fragment_len;
 
@@ -614,12 +618,16 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
 
 bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
 {
-    bool using_vnet_hdr = qemu_get_using_vnet_hdr(nc->peer);
+    bool offload = qemu_get_using_vnet_hdr(nc->peer);
+    return net_tx_pkt_send_custom(pkt, offload, net_tx_pkt_sendv, nc);
+}
 
+bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
+                            NetTxPktCallback callback, void *context)
+{
     assert(pkt);
 
-    if (!using_vnet_hdr &&
-        pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+    if (!offload && pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
         net_tx_pkt_do_sw_csum(pkt);
     }
 
@@ -635,28 +643,16 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
         }
     }
 
-    if (using_vnet_hdr ||
-        pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
-        int index = using_vnet_hdr ?
-                    NET_TX_PKT_VHDR_FRAG : NET_TX_PKT_L2HDR_FRAG;
+    if (offload || pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
         net_tx_pkt_fix_ip6_payload_len(pkt);
-        net_tx_pkt_sendv(pkt, nc, pkt->vec + index,
-            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - index);
+        callback(context, pkt->vec + NET_TX_PKT_L2HDR_FRAG,
+                 pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - NET_TX_PKT_L2HDR_FRAG,
+                 pkt->vec + NET_TX_PKT_VHDR_FRAG,
+                 pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - NET_TX_PKT_VHDR_FRAG);
         return true;
     }
 
-    return net_tx_pkt_do_sw_fragmentation(pkt, nc);
-}
-
-bool net_tx_pkt_send_loopback(struct NetTxPkt *pkt, NetClientState *nc)
-{
-    bool res;
-
-    pkt->is_loopback = true;
-    res = net_tx_pkt_send(pkt, nc);
-    pkt->is_loopback = false;
-
-    return res;
+    return net_tx_pkt_do_sw_fragmentation(pkt, callback, context);
 }
 
 void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt)
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 8d3faa42fb..f57b4e034b 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -26,6 +26,8 @@
 
 struct NetTxPkt;
 
+typedef void (* NetTxPktCallback)(void *, const struct iovec *, int, const struct iovec *, int);
+
 /**
  * Init function for tx packet functionality
  *
@@ -161,15 +163,16 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt);
 bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc);
 
 /**
-* Redirect packet directly to receive path (emulate loopback phy).
-* Handles sw offloads if vhdr is not supported.
-*
-* @pkt:            packet
-* @nc:             NetClientState
-* @ret:            operation result
-*
-*/
-bool net_tx_pkt_send_loopback(struct NetTxPkt *pkt, NetClientState *nc);
+ * Send packet with a custom function.
+ *
+ * @pkt:            packet
+ * @offload:        whether the callback implements offloading
+ * @callback:       a function to be called back for each transformed packet
+ * @context:        a pointer to be passed to the callback.
+ * @ret:            operation result
+ */
+bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
+                            NetTxPktCallback callback, void *context);
 
 /**
  * parse raw packet data and analyze offload requirements.
-- 
2.39.1


