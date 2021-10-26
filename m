Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ADD43B542
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 17:14:04 +0200 (CEST)
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfO9J-0003ad-0l
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 11:14:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mfNzD-0007dk-FO
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1mfNzA-0002Pt-85
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 11:03:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635260610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BzNjgFUB4iyrxWknv8GV1pkn/CY0+IEJjUC4ev4cACg=;
 b=dFFw3eXnUMZLNjJX1npKDU7IK/o1iMmphGKdDchSLqT8n/CFEhrTmUBC6aNK4yCCYpveKN
 r6OhdEf0LsDWzea7CHpo927a7mS1Xxljwppfstv6hxWNnS0fExvw35yZJn9NNgJbFr7nWB
 M/rXtEZqhebWBjHfT3RCW0TQLSGFXuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-GW5ZiKnvPG6AaVvgUVWPmw-1; Tue, 26 Oct 2021 11:03:29 -0400
X-MC-Unique: GW5ZiKnvPG6AaVvgUVWPmw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14F6C802CB6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 15:03:08 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.194.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DF39F60C5F;
 Tue, 26 Oct 2021 15:03:06 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] failover: specify an alternate MAC address
Date: Tue, 26 Oct 2021 17:03:05 +0200
Message-Id: <20211026150305.51962-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
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
Cc: Laurent Vivier <lvivier@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If the guest driver doesn't support the STANDBY feature, by default
we keep the virtio-net device and don't hotplug the VFIO device,
but in some cases, user can prefer to use the VFIO device rather
than the virtio-net one. We can't unplug the virtio-net device
(because on migration it is expected on the destination side) but
we can keep both interfaces if the MAC addresses are different
(to have the same MAC address can cause kernel crash with old
kernel). The VFIO device will be unplugged before the migration
like in the normal failover migration but without a failover device.

This patch adds a new property to the virtio-net device: "alt-mac"

If an alternate MAC address is provided with "alt-mac" and the
STANDBY feature is not supported, both interfaces are plugged
but the standby interface (virtio-net) MAC address is set to the
value provided by the "alt-mac" parameter.

If the STANDBY feature is supported by guest and QEMU, the virtio-net
failover acts as usual.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 docs/system/virtio-net-failover.rst | 17 ++++++++++
 hw/net/virtio-net.c                 | 48 +++++++++++++++++++++++------
 include/hw/virtio/virtio-net.h      |  6 ++++
 3 files changed, 62 insertions(+), 9 deletions(-)

diff --git a/docs/system/virtio-net-failover.rst b/docs/system/virtio-net-failover.rst
index 6002dc5d96e4..0b1699169ef6 100644
--- a/docs/system/virtio-net-failover.rst
+++ b/docs/system/virtio-net-failover.rst
@@ -51,6 +51,23 @@ Usage
   is only for pairing the devices within QEMU. The guest kernel module
   net_failover will match devices with identical MAC addresses.
 
+  The VIRTIO_NET_F_STANDBY must be supported by both sides, QEMU and guest
+  kernel, to allow the guest kernel module to pair the devices.
+  If the kernel module doesn't support the feature, only the standby device
+  (virtio-net) is plugged, this allows to do a live migration without any
+  connection loss.
+
+  In this case, You can force QEMU to keep both interfaces by providing an
+  alternate MAC address to the virtio-net device with the parameter alt-mac.
+  Both interfaces will be available separately:
+
+  -device virtio-net-pci,netdev=hostnet1,id=net1,mac=52:54:00:6f:55:cc, \
+    bus=root2,failover=on,alt-mac=52:54:00:12:34:56
+
+  As in the failover case, the (vfio)-pci device will be unplugged
+  automatically before the migration and plugged back on the destination side
+  after the migration.
+
 Hotplug
 -------
 
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index f2014d5ea0b3..7aba2ac78f87 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -45,6 +45,9 @@
 #include "net_rx_pkt.h"
 #include "hw/virtio/vhost.h"
 
+/* zero MAC address to check with */
+static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
+
 #define VIRTIO_NET_VM_VERSION    11
 
 #define MAC_TABLE_ENTRIES    64
@@ -126,7 +129,6 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     VirtIONet *n = VIRTIO_NET(vdev);
     struct virtio_net_config netcfg;
     NetClientState *nc = qemu_get_queue(n->nic);
-    static const MACAddr zero = { .a = { 0, 0, 0, 0, 0, 0 } };
 
     int ret = 0;
     memset(&netcfg, 0 , sizeof(struct virtio_net_config));
@@ -871,10 +873,21 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     error_propagate(errp, err);
 }
 
+static void failover_plug_primary(VirtIONet *n)
+{
+    Error *err = NULL;
+
+    qapi_event_send_failover_negotiated(n->netclient_name);
+    qatomic_set(&n->failover_primary_hidden, false);
+    failover_add_primary(n, &err);
+    if (err) {
+        warn_report_err(err);
+    }
+}
+
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
-    Error *err = NULL;
     int i;
 
     if (n->mtu_bypass_backend &&
@@ -921,12 +934,22 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
         memset(n->vlans, 0xff, MAX_VLAN >> 3);
     }
 
-    if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
-        qapi_event_send_failover_negotiated(n->netclient_name);
-        qatomic_set(&n->failover_primary_hidden, false);
-        failover_add_primary(n, &err);
-        if (err) {
-            warn_report_err(err);
+    if (n->failover) {
+        if (virtio_has_feature(features, VIRTIO_NET_F_STANDBY)) {
+            if (memcmp(&n->altmac, &zero, sizeof(zero)) != 0 &&
+                memcmp(n->mac, &n->altmac, ETH_ALEN) == 0) {
+                /*
+                 * set_features can be called twice, without & with F_STANDBY,
+                 * so restore original MAC address
+                 */
+                memcpy(n->mac, &n->nic->conf->macaddr, sizeof(n->mac));
+                qemu_format_nic_info_str(qemu_get_queue(n->nic), n->mac);
+            }
+            failover_plug_primary(n);
+        } else if (memcmp(&n->altmac, &zero, sizeof(zero)) != 0) {
+            memcpy(n->mac, &n->altmac, ETH_ALEN);
+            qemu_format_nic_info_str(qemu_get_queue(n->nic), n->mac);
+            failover_plug_primary(n);
         }
     }
 }
@@ -3595,9 +3618,15 @@ static bool primary_unplug_pending(void *opaque)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtIONet *n = VIRTIO_NET(vdev);
 
-    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY)) {
+    if (!n->failover) {
         return false;
     }
+
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_STANDBY) &&
+        memcmp(&n->altmac, &zero, sizeof(zero)) == 0) {
+        return false;
+    }
+
     primary = failover_find_primary_device(n);
     return primary ? primary->pending_deleted_event : false;
 }
@@ -3672,6 +3701,7 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
                        VIRTIO_NET_RSC_DEFAULT_INTERVAL),
     DEFINE_NIC_PROPERTIES(VirtIONet, nic_conf),
+    DEFINE_PROP_MACADDR("alt-mac",  VirtIONet, altmac),
     DEFINE_PROP_UINT32("x-txtimer", VirtIONet, net_conf.txtimer,
                        TX_TIMER_INTERVAL),
     DEFINE_PROP_INT32("x-txburst", VirtIONet, net_conf.txburst, TX_BURST),
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index eb87032627d2..c768c7662002 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -213,6 +213,12 @@ struct VirtIONet {
     QDict *primary_opts;
     bool primary_opts_from_json;
     Notifier migration_state;
+    /*
+     * failover: to provide an alternate MAC address allows to keep both
+     * cards, primary and stand-by, if the STANDBY feature is not supported
+     * by the guest
+     */
+    MACAddr altmac;
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
     struct EBPFRSSContext ebpf_rss;
-- 
2.31.1


