Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B532D5FA36E
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:37:18 +0200 (CEST)
Received: from localhost ([::1]:48924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxeP-0006rz-MH
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcf-0003LN-7J
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwcV-0007G3-I0
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WBlOrpQpKsF4J+lMEP6yJyXmp3pWOVsxYQe/9UUnuag=;
 b=b5AKqBN/kk4gaQSZrLj+kzQ1C3IrWoGOasAjSWOLjfnzZsiNC3rSfqOH1vyjt79XOzBY9P
 ijLbgh6g3jy1nGnFpzBhanYYqr+0/knmgr/Qv137crtFoPGnZ1ezMmx3KQgR4FcitdCI//
 FB+MzrapZy0+enUUNBH3N9EEf4zwRQY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-125-GIEUizQVOD2dB3yWssfCww-1; Mon, 10 Oct 2022 13:31:08 -0400
X-MC-Unique: GIEUizQVOD2dB3yWssfCww-1
Received: by mail-wm1-f70.google.com with SMTP id
 k21-20020a7bc415000000b003b4fac53006so3262006wmi.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:31:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WBlOrpQpKsF4J+lMEP6yJyXmp3pWOVsxYQe/9UUnuag=;
 b=DbkwctS6/6LLDY+UKkjsQpqfKL5r9XH3s1LWTMvaZMQeqOCmIPVZkXUc3tJRfwkboK
 k5Q4/ClIJp7FiZI7JCee4tyyybsr0qvTKrGew4CYOdfsK50GzP0813z6RnrZTr48YKKD
 etuK8RiUovVPRyG5v/xPRqMAMqK8GW0xRpL1LweyOHhltgoc+cJ682FJxOfuHv/50yCR
 nEDhgMbcugn3CgG1v6uKDeiPO0CFOWUCAQH9URr4euSBkJxb0qHcLhMnLVb4GI0USMAa
 aXYMHeBfZseSgC+bjyl8ZgToFVYONt5UXVzUENH+Zc9CVRQ0QRkuoo1+z8Rn+dpb9gFt
 GC3g==
X-Gm-Message-State: ACrzQf2Y1Mk9ZJdSWHBAfgyvHjG0T86bprwG6gIvHHuIiguEKmiALFLS
 Ga9PmQFhEtOX38cQWcCEAfTIX3LRcgX66HofUQFK8vHC9xpNcTmKtkHSfbjtGHdDX6E7E7Ri88Y
 iN5+2l95rWbMThJIT/RGT5bnHUjMgXKDTNPTq92vFKXirt9zGKqnYudGo6K09
X-Received: by 2002:a05:600c:1c82:b0:3c6:c225:eb99 with SMTP id
 k2-20020a05600c1c8200b003c6c225eb99mr540387wms.23.1665423066660; 
 Mon, 10 Oct 2022 10:31:06 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM76VbPxQEJzrQCxfKaPubmI/ywvthMU48xAdBJUqEGnPXuNJiqU059Ll7Gh6hWQ4/kNt4wn7Q==
X-Received: by 2002:a05:600c:1c82:b0:3c6:c225:eb99 with SMTP id
 k2-20020a05600c1c8200b003c6c225eb99mr540329wms.23.1665423065507; 
 Mon, 10 Oct 2022 10:31:05 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 l2-20020a05600c4f0200b003a682354f63sm18157895wmq.11.2022.10.10.10.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:31:05 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:31:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Jonah Palmer <jonah.palmer@oracle.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 32/55] qmp: decode feature & status bits in virtio-status
Message-ID: <20221010172813.204597-33-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laurent Vivier <lvivier@redhat.com>

Display feature names instead of bitmaps for host, guest, and
backend for VirtIODevices.

Display status names instead of bitmaps for VirtIODevices.

Display feature names instead of bitmaps for backend, protocol,
acked, and features (hdev->features) for vhost devices.

Decode features according to device ID. Decode statuses
according to configuration status bitmap (config_status_map).
Decode vhost user protocol features according to vhost user
protocol bitmap (vhost_user_protocol_map).

Transport features are on the first line. Undecoded bits (if
any) are stored in a separate field.

[Jonah: Several changes made to this patch from prev. version (v14):
 - Moved all device features mappings to hw/virtio/virtio.c
 - Renamed device features mappings (less generic)
 - Generalized @FEATURE_ENTRY macro for all device mappings
 - Virtio device feature map definitions include descriptions of
   feature bits
 - Moved @VHOST_USER_F_PROTOCOL_FEATURES feature bit from transport
   feature map to vhost-user-supported device feature mappings
   (blk, fs, i2c, rng, net, gpu, input, scsi, vsock)
 - New feature bit added for virtio-vsock: @VIRTIO_VSOCK_F_SEQPACKET
 - New feature bit added for virtio-iommu: @VIRTIO_IOMMU_F_BYPASS_CONFIG
 - New feature bit added for virtio-mem: @VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE
 - New virtio transport feature bit added: @VIRTIO_F_IN_ORDER
 - Added device feature map definition for virtio-rng
]

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
Message-Id: <1660220684-24909-4-git-send-email-jonah.palmer@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 qapi/virtio.json           | 251 +++++++++++++--
 include/hw/virtio/vhost.h  |   3 +
 include/hw/virtio/virtio.h |   5 +
 hw/virtio/virtio.c         | 643 ++++++++++++++++++++++++++++++++++++-
 4 files changed, 874 insertions(+), 28 deletions(-)

diff --git a/qapi/virtio.json b/qapi/virtio.json
index c86b3bc635..c9c8201e66 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -106,10 +106,10 @@
             'n-tmp-sections': 'int',
             'nvqs': 'uint32',
             'vq-index': 'int',
-            'features': 'uint64',
-            'acked-features': 'uint64',
-            'backend-features': 'uint64',
-            'protocol-features': 'uint64',
+            'features': 'VirtioDeviceFeatures',
+            'acked-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
+            'protocol-features': 'VhostDeviceProtocols',
             'max-queues': 'uint64',
             'backend-cap': 'uint64',
             'log-enabled': 'bool',
@@ -176,11 +176,11 @@
             'device-id': 'uint16',
             'vhost-started': 'bool',
             'device-endian': 'str',
-            'guest-features': 'uint64',
-            'host-features': 'uint64',
-            'backend-features': 'uint64',
+            'guest-features': 'VirtioDeviceFeatures',
+            'host-features': 'VirtioDeviceFeatures',
+            'backend-features': 'VirtioDeviceFeatures',
             'num-vqs': 'int',
-            'status': 'uint8',
+            'status': 'VirtioDeviceStatus',
             'isr': 'uint8',
             'queue-sel': 'uint16',
             'vm-running': 'bool',
@@ -222,14 +222,41 @@
 #          "name": "virtio-crypto",
 #          "started": true,
 #          "device-id": 20,
-#          "backend-features": 0,
+#          "backend-features": {
+#              "transports": [],
+#              "dev-features": []
+#          },
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#              "statuses": [
+#                  "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found",
+#                  "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device",
+#                  "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete",
+#                  "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"
+#              ]
+#          },
 #          "num-vqs": 2,
-#          "guest-features": 5100273664,
-#          "host-features": 6325010432,
+#          "guest-features": {
+#              "dev-features": [],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
+#              ]
+#          },
+#          "host-features": {
+#              "unknown-dev-features": 1073741824,
+#              "dev-features": [],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                  "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                  "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#              ]
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 1,
@@ -257,22 +284,147 @@
 #              "max-queues": 1,
 #              "backend-cap": 2,
 #              "log-size": 0,
-#              "backend-features": 0,
+#              "backend-features": {
+#                  "dev-features": [],
+#                  "transports": []
+#              },
 #              "nvqs": 2,
-#              "protocol-features": 0,
+#              "protocol-features": {
+#                  "protocols": []
+#              },
 #              "vq-index": 0,
 #              "log-enabled": false,
-#              "acked-features": 5100306432,
-#              "features": 13908344832
+#              "acked-features": {
+#                  "dev-features": [
+#                      "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"
+#                  ],
+#                  "transports": [
+#                      "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                      "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                      "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
+#                  ]
+#              },
+#              "features": {
+#                  "dev-features": [
+#                      "VHOST_F_LOG_ALL: Logging write descriptors supported",
+#                      "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"
+#                  ],
+#                  "transports": [
+#                      "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                      "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                      "VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform",
+#                      "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                      "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                      "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#                  ]
+#              }
+#          },
+#          "backend-features": {
+#              "dev-features": [
+#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
+#                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
+#                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
+#                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
+#                  "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported",
+#                  "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported",
+#                  "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported",
+#                  "VIRTIO_NET_F_CTRL_VQ: Control channel available",
+#                  "VIRTIO_NET_F_STATUS: Configuration status field available",
+#                  "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers",
+#                  "VIRTIO_NET_F_HOST_UFO: Device can receive UFO",
+#                  "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN",
+#                  "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6",
+#                  "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4",
+#                  "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO",
+#                  "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN",
+#                  "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6",
+#                  "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4",
+#                  "VIRTIO_NET_F_MAC: Device has given MAC address",
+#                  "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading reconfig. supported",
+#                  "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial checksum supported",
+#                  "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum supported"
+#              ],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                  "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                  "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#              ]
 #          },
-#          "backend-features": 6337593319,
 #          "start-on-kick": false,
 #          "isr": 1,
 #          "broken": false,
-#          "status": 15,
+#          "status": {
+#              "statuses": [
+#                  "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found",
+#                  "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device",
+#                  "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete",
+#                  "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"
+#              ]
+#          },
 #          "num-vqs": 3,
-#          "guest-features": 5111807911,
-#          "host-features": 6337593319,
+#          "guest-features": {
+#              "dev-features": [
+#                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
+#                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
+#                  "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported",
+#                  "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported",
+#                  "VIRTIO_NET_F_CTRL_VQ: Control channel available",
+#                  "VIRTIO_NET_F_STATUS: Configuration status field available",
+#                  "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers",
+#                  "VIRTIO_NET_F_HOST_UFO: Device can receive UFO",
+#                  "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN",
+#                  "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6",
+#                  "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4",
+#                  "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO",
+#                  "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN",
+#                  "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6",
+#                  "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4",
+#                  "VIRTIO_NET_F_MAC: Device has given MAC address",
+#                  "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading reconfig. supported",
+#                  "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial checksum supported",
+#                  "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum supported"
+#              ],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"
+#             ]
+#          },
+#          "host-features": {
+#              "dev-features": [
+#                  "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features negotation supported",
+#                  "VIRTIO_NET_F_GSO: Handling GSO-type packets supported",
+#                  "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control channel",
+#                  "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets supported",
+#                  "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported",
+#                  "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported",
+#                  "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported",
+#                  "VIRTIO_NET_F_CTRL_VQ: Control channel available",
+#                  "VIRTIO_NET_F_STATUS: Configuration status field available",
+#                  "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers",
+#                  "VIRTIO_NET_F_HOST_UFO: Device can receive UFO",
+#                  "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN",
+#                  "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6",
+#                  "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4",
+#                  "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO",
+#                  "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN",
+#                  "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6",
+#                  "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4",
+#                  "VIRTIO_NET_F_MAC: Device has given MAC address",
+#                  "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading reconfig. supported",
+#                  "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial checksum supported",
+#                  "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum supported"
+#              ],
+#              "transports": [
+#                  "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled",
+#                  "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported",
+#                  "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)",
+#                  "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts",
+#                  "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. descs. on VQ"
+#             ]
+#          },
 #          "use-guest-notifier-mask": true,
 #          "vm-running": true,
 #          "queue-sel": 2,
@@ -288,3 +440,62 @@
   'data': { 'path': 'str' },
   'returns': 'VirtioStatus',
   'features': [ 'unstable' ] }
+
+##
+# @VirtioDeviceStatus:
+#
+# A structure defined to list the configuration statuses of a virtio
+# device
+#
+# @statuses: List of decoded configuration statuses of the virtio
+#            device
+#
+# @unknown-statuses: Virtio device statuses bitmap that have not been decoded
+#
+# Since: 7.1
+##
+
+{ 'struct': 'VirtioDeviceStatus',
+  'data': { 'statuses': [ 'str' ],
+            '*unknown-statuses': 'uint8' } }
+
+##
+# @VhostDeviceProtocols:
+#
+# A structure defined to list the vhost user protocol features of a
+# Vhost User device
+#
+# @protocols: List of decoded vhost user protocol features of a vhost
+#             user device
+#
+# @unknown-protocols: Vhost user device protocol features bitmap that
+#                     have not been decoded
+#
+# Since: 7.1
+##
+
+{ 'struct': 'VhostDeviceProtocols',
+  'data': { 'protocols': [ 'str' ],
+            '*unknown-protocols': 'uint64' } }
+
+##
+# @VirtioDeviceFeatures:
+#
+# The common fields that apply to most Virtio devices. Some devices
+# may not have their own device-specific features (e.g. virtio-rng).
+#
+# @transports: List of transport features of the virtio device
+#
+# @dev-features: List of device-specific features (if the device has
+#                unique features)
+#
+# @unknown-dev-features: Virtio device features bitmap that have not
+#                        been decoded
+#
+# Since: 7.1
+##
+
+{ 'struct': 'VirtioDeviceFeatures',
+  'data': { 'transports': [ 'str' ],
+            '*dev-features': [ 'str' ],
+            '*unknown-dev-features': 'uint64' } }
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 61b957e927..d7eb557885 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -5,6 +5,9 @@
 #include "hw/virtio/virtio.h"
 #include "exec/memory.h"
 
+#define VHOST_F_DEVICE_IOTLB 63
+#define VHOST_USER_F_PROTOCOL_FEATURES 30
+
 /* Generic structures common for any vhost based device. */
 
 struct vhost_inflight {
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 9eeb958e39..f41b4a7e64 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -82,6 +82,11 @@ typedef struct VirtQueueElement
 #define TYPE_VIRTIO_DEVICE "virtio-device"
 OBJECT_DECLARE_TYPE(VirtIODevice, VirtioDeviceClass, VIRTIO_DEVICE)
 
+typedef struct {
+    int virtio_bit;
+    const char *feature_desc;
+} qmp_virtio_feature_map_t;
+
 enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_UNKNOWN,
     VIRTIO_DEVICE_ENDIAN_LITTLE,
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 696e19126a..6c530567b0 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -34,10 +34,433 @@
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
 #include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/vhost_types.h"
+#include "standard-headers/linux/virtio_blk.h"
+#include "standard-headers/linux/virtio_console.h"
+#include "standard-headers/linux/virtio_gpu.h"
+#include "standard-headers/linux/virtio_net.h"
+#include "standard-headers/linux/virtio_scsi.h"
+#include "standard-headers/linux/virtio_i2c.h"
+#include "standard-headers/linux/virtio_balloon.h"
+#include "standard-headers/linux/virtio_iommu.h"
+#include "standard-headers/linux/virtio_mem.h"
+#include "standard-headers/linux/virtio_vsock.h"
+#include CONFIG_DEVICES
 
 /* QAPI list of realized VirtIODevices */
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
 
+/*
+ * Maximum size of virtio device config space
+ */
+#define VHOST_USER_MAX_CONFIG_SIZE 256
+
+#define FEATURE_ENTRY(name, desc) (qmp_virtio_feature_map_t) \
+    { .virtio_bit = name, .feature_desc = desc }
+
+enum VhostUserProtocolFeature {
+    VHOST_USER_PROTOCOL_F_MQ = 0,
+    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
+    VHOST_USER_PROTOCOL_F_RARP = 2,
+    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
+    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
+    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
+    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
+    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
+    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
+    VHOST_USER_PROTOCOL_F_CONFIG = 9,
+    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
+    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
+    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
+    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
+    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
+    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
+    VHOST_USER_PROTOCOL_F_MAX
+};
+
+/* Virtio transport features mapping */
+static qmp_virtio_feature_map_t virtio_transport_map[] = {
+    /* Virtio device transport features */
+#ifndef VIRTIO_CONFIG_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
+            "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. "
+            "descs. on VQ"),
+    FEATURE_ENTRY(VIRTIO_F_ANY_LAYOUT, \
+            "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts"),
+#endif /* !VIRTIO_CONFIG_NO_LEGACY */
+    FEATURE_ENTRY(VIRTIO_F_VERSION_1, \
+            "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"),
+    FEATURE_ENTRY(VIRTIO_F_IOMMU_PLATFORM, \
+            "VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform"),
+    FEATURE_ENTRY(VIRTIO_F_RING_PACKED, \
+            "VIRTIO_F_RING_PACKED: Device supports packed VQ layout"),
+    FEATURE_ENTRY(VIRTIO_F_IN_ORDER, \
+            "VIRTIO_F_IN_ORDER: Device uses buffers in same order as made "
+            "available by driver"),
+    FEATURE_ENTRY(VIRTIO_F_ORDER_PLATFORM, \
+            "VIRTIO_F_ORDER_PLATFORM: Memory accesses ordered by platform"),
+    FEATURE_ENTRY(VIRTIO_F_SR_IOV, \
+            "VIRTIO_F_SR_IOV: Device supports single root I/O virtualization"),
+    /* Virtio ring transport features */
+    FEATURE_ENTRY(VIRTIO_RING_F_INDIRECT_DESC, \
+            "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported"),
+    FEATURE_ENTRY(VIRTIO_RING_F_EVENT_IDX, \
+            "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled"),
+    { -1, "" }
+};
+
+/* Vhost-user protocol features mapping */
+static qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
+            "VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
+            "VHOST_USER_PROTOCOL_F_LOG_SHMFD: Shared log memory fd supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RARP, \
+            "VHOST_USER_PROTOCOL_F_RARP: Vhost-user back-end RARP broadcasting "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_REPLY_ACK, \
+            "VHOST_USER_PROTOCOL_F_REPLY_ACK: Requested operation status ack. "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
+            "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
+            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
+            "requests supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
+            "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
+            "devices supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CRYPTO_SESSION, \
+            "VHOST_USER_PROTOCOL_F_CRYPTO_SESSION: Session creation for crypto "
+            "operations supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_PAGEFAULT, \
+            "VHOST_USER_PROTOCOL_F_PAGEFAULT: Request servicing on userfaultfd "
+            "for accessed pages supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
+            "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
+            "device configuration space supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
+            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
+            "channel supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
+            "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
+            "VQs supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD, \
+            "VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD: Shared inflight I/O buffers "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RESET_DEVICE, \
+            "VHOST_USER_PROTOCOL_F_RESET_DEVICE: Disabling all rings and "
+            "resetting internal device state supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS, \
+            "VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS: In-band messaging "
+            "supported"),
+    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS, \
+            "VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS: Configuration for "
+            "memory slots supported"),
+    { -1, "" }
+};
+
+/* virtio device configuration statuses */
+static qmp_virtio_feature_map_t virtio_config_status_map[] = {
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
+            "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
+            "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER, \
+            "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_NEEDS_RESET, \
+            "VIRTIO_CONFIG_S_NEEDS_RESET: Irrecoverable error, device needs "
+            "reset"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_FAILED, \
+            "VIRTIO_CONFIG_S_FAILED: Error in guest, device failed"),
+    FEATURE_ENTRY(VIRTIO_CONFIG_S_ACKNOWLEDGE, \
+            "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found"),
+    { -1, "" }
+};
+
+/* virtio-blk features mapping */
+qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
+            "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
+            "VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_GEOMETRY, \
+            "VIRTIO_BLK_F_GEOMETRY: Legacy geometry available"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_RO, \
+            "VIRTIO_BLK_F_RO: Device is read-only"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_BLK_SIZE, \
+            "VIRTIO_BLK_F_BLK_SIZE: Block size of disk available"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_TOPOLOGY, \
+            "VIRTIO_BLK_F_TOPOLOGY: Topology information available"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_MQ, \
+            "VIRTIO_BLK_F_MQ: Multiqueue supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_DISCARD, \
+            "VIRTIO_BLK_F_DISCARD: Discard command supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
+            "VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported"),
+#ifndef VIRTIO_BLK_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
+            "VIRTIO_BLK_F_BARRIER: Request barriers supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_SCSI, \
+            "VIRTIO_BLK_F_SCSI: SCSI packet commands supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_FLUSH, \
+            "VIRTIO_BLK_F_FLUSH: Flush command supported"),
+    FEATURE_ENTRY(VIRTIO_BLK_F_CONFIG_WCE, \
+            "VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and writethrough modes "
+            "supported"),
+#endif /* !VIRTIO_BLK_NO_LEGACY */
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-serial features mapping */
+qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
+            "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
+            "VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported"),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
+            "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
+    { -1, "" }
+};
+
+/* virtio-gpu features mapping */
+qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
+            "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
+            "VIRTIO_GPU_F_EDID: EDID metadata supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_UUID, \
+            "VIRTIO_GPU_F_RESOURCE_UUID: Resource UUID assigning supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_BLOB, \
+            "VIRTIO_GPU_F_RESOURCE_BLOB: Size-based blob resources supported"),
+    FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
+            "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
+            "timelines supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-input features mapping */
+qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-net features mapping */
+qmp_virtio_feature_map_t virtio_net_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
+            "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_CSUM, \
+            "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial "
+            "checksum supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
+            "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading "
+            "reconfig. supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MTU, \
+            "VIRTIO_NET_F_MTU: Device max MTU reporting supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MAC, \
+            "VIRTIO_NET_F_MAC: Device has given MAC address"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO4, \
+            "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO6, \
+            "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ECN, \
+            "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_UFO, \
+            "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO4, \
+            "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO6, \
+            "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_ECN, \
+            "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HOST_UFO, \
+            "VIRTIO_NET_F_HOST_UFO: Device can receive UFO"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MRG_RXBUF, \
+            "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"),
+    FEATURE_ENTRY(VIRTIO_NET_F_STATUS, \
+            "VIRTIO_NET_F_STATUS: Configuration status field available"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VQ, \
+            "VIRTIO_NET_F_CTRL_VQ: Control channel available"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX, \
+            "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VLAN, \
+            "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX_EXTRA, \
+            "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ANNOUNCE, \
+            "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_MQ, \
+            "VIRTIO_NET_F_MQ: Multiqueue with automatic receive steering "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_MAC_ADDR, \
+            "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control "
+            "channel"),
+    FEATURE_ENTRY(VIRTIO_NET_F_HASH_REPORT, \
+            "VIRTIO_NET_F_HASH_REPORT: Hash reporting supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_RSS, \
+            "VIRTIO_NET_F_RSS: RSS RX steering supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_RSC_EXT, \
+            "VIRTIO_NET_F_RSC_EXT: Extended coalescing info supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_STANDBY, \
+            "VIRTIO_NET_F_STANDBY: Device acting as standby for primary "
+            "device with same MAC addr. supported"),
+    FEATURE_ENTRY(VIRTIO_NET_F_SPEED_DUPLEX, \
+            "VIRTIO_NET_F_SPEED_DUPLEX: Device set linkspeed and duplex"),
+#ifndef VIRTIO_NET_NO_LEGACY
+    FEATURE_ENTRY(VIRTIO_NET_F_GSO, \
+            "VIRTIO_NET_F_GSO: Handling GSO-type packets supported"),
+#endif /* !VIRTIO_NET_NO_LEGACY */
+    FEATURE_ENTRY(VHOST_NET_F_VIRTIO_NET_HDR, \
+            "VHOST_NET_F_VIRTIO_NET_HDR: Virtio-net headers for RX and TX "
+            "packets supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-scsi features mapping */
+qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
+            "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
+            "buffers suppoted"),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
+            "VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_CHANGE, \
+            "VIRTIO_SCSI_F_CHANGE: Reporting and handling LUN changes "
+            "supported"),
+    FEATURE_ENTRY(VIRTIO_SCSI_F_T10_PI, \
+            "VIRTIO_SCSI_F_T10_PI: T10 info included in request header"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio/vhost-user-fs features mapping */
+qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio/vhost-user-i2c features mapping */
+qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
+            "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio/vhost-vsock features mapping */
+qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
+            "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
+/* virtio-balloon features mapping */
+qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
+            "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
+            "pages"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_STATS_VQ, \
+            "VIRTIO_BALLOON_F_STATS_VQ: Guest memory stats VQ available"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_DEFLATE_ON_OOM, \
+            "VIRTIO_BALLOON_F_DEFLATE_ON_OOM: Deflate balloon when guest OOM"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_FREE_PAGE_HINT, \
+            "VIRTIO_BALLOON_F_FREE_PAGE_HINT: VQ reporting free pages enabled"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_PAGE_POISON, \
+            "VIRTIO_BALLOON_F_PAGE_POISON: Guest page poisoning enabled"),
+    FEATURE_ENTRY(VIRTIO_BALLOON_F_REPORTING, \
+            "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
+    { -1, "" }
+};
+
+/* virtio-crypto features mapping */
+qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    { -1, "" }
+};
+
+/* virtio-iommu features mapping */
+qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
+            "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
+            "available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_DOMAIN_RANGE, \
+            "VIRTIO_IOMMU_F_DOMAIN_RANGE: Number of supported domains "
+            "available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_MAP_UNMAP, \
+            "VIRTIO_IOMMU_F_MAP_UNMAP: Map and unmap requests available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS, \
+            "VIRTIO_IOMMU_F_BYPASS: Endpoints not attached to domains are in "
+            "bypass mode"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_PROBE, \
+            "VIRTIO_IOMMU_F_PROBE: Probe requests available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_MMIO, \
+            "VIRTIO_IOMMU_F_MMIO: VIRTIO_IOMMU_MAP_F_MMIO flag available"),
+    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS_CONFIG, \
+            "VIRTIO_IOMMU_F_BYPASS_CONFIG: Bypass field of IOMMU config "
+            "available"),
+    { -1, "" }
+};
+
+/* virtio-mem features mapping */
+qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+#ifndef CONFIG_ACPI
+    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
+            "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
+#endif /* !CONFIG_ACPI */
+    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
+            "VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be "
+            "accessed"),
+    { -1, "" }
+};
+
+/* virtio-rng features mapping */
+qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -3984,6 +4407,203 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
+#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
+    ({                                                   \
+        type *list = NULL;                               \
+        type *node;                                      \
+        for (i = 0; map[i].virtio_bit != -1; i++) {      \
+            if (is_status) {                             \
+                bit = map[i].virtio_bit;                 \
+            }                                            \
+            else {                                       \
+                bit = 1ULL << map[i].virtio_bit;         \
+            }                                            \
+            if ((bitmap & bit) == 0) {                   \
+                continue;                                \
+            }                                            \
+            node = g_new0(type, 1);                      \
+            node->value = g_strdup(map[i].feature_desc); \
+            node->next = list;                           \
+            list = node;                                 \
+            bitmap ^= bit;                               \
+        }                                                \
+        list;                                            \
+    })
+
+static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
+{
+    VirtioDeviceStatus *status;
+    uint8_t bit;
+    int i;
+
+    status = g_new0(VirtioDeviceStatus, 1);
+    status->statuses = CONVERT_FEATURES(strList, virtio_config_status_map,
+                                        1, bitmap);
+    status->has_unknown_statuses = bitmap != 0;
+    if (status->has_unknown_statuses) {
+        status->unknown_statuses = bitmap;
+    }
+
+    return status;
+}
+
+static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
+{
+    VhostDeviceProtocols *vhu_protocols;
+    uint64_t bit;
+    int i;
+
+    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
+    vhu_protocols->protocols =
+                    CONVERT_FEATURES(strList,
+                                     vhost_user_protocol_map, 0, bitmap);
+    vhu_protocols->has_unknown_protocols = bitmap != 0;
+    if (vhu_protocols->has_unknown_protocols) {
+        vhu_protocols->unknown_protocols = bitmap;
+    }
+
+    return vhu_protocols;
+}
+
+static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
+                                                 uint64_t bitmap)
+{
+    VirtioDeviceFeatures *features;
+    uint64_t bit;
+    int i;
+
+    features = g_new0(VirtioDeviceFeatures, 1);
+    features->has_dev_features = true;
+
+    /* transport features */
+    features->transports = CONVERT_FEATURES(strList, virtio_transport_map, 0,
+                                            bitmap);
+
+    /* device features */
+    switch (device_id) {
+#ifdef CONFIG_VIRTIO_SERIAL
+    case VIRTIO_ID_CONSOLE:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BLK
+    case VIRTIO_ID_BLOCK:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_GPU
+    case VIRTIO_ID_GPU:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_NET
+    case VIRTIO_ID_NET:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_net_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_SCSI
+    case VIRTIO_ID_SCSI:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_scsi_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_BALLOON
+    case VIRTIO_ID_BALLOON:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_balloon_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_IOMMU
+    case VIRTIO_ID_IOMMU:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_iommu_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_INPUT
+    case VIRTIO_ID_INPUT:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_input_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_USER_FS
+    case VIRTIO_ID_FS:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_fs_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VHOST_VSOCK
+    case VIRTIO_ID_VSOCK:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_vsock_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_CRYPTO
+    case VIRTIO_ID_CRYPTO:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_crypto_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_MEM
+    case VIRTIO_ID_MEM:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_mem_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+    case VIRTIO_ID_I2C_ADAPTER:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_i2c_feature_map, 0, bitmap);
+        break;
+#endif
+#ifdef CONFIG_VIRTIO_RNG
+    case VIRTIO_ID_RNG:
+        features->dev_features =
+            CONVERT_FEATURES(strList, virtio_rng_feature_map, 0, bitmap);
+        break;
+#endif
+    /* No features */
+    case VIRTIO_ID_9P:
+    case VIRTIO_ID_PMEM:
+    case VIRTIO_ID_IOMEM:
+    case VIRTIO_ID_RPMSG:
+    case VIRTIO_ID_CLOCK:
+    case VIRTIO_ID_MAC80211_WLAN:
+    case VIRTIO_ID_MAC80211_HWSIM:
+    case VIRTIO_ID_RPROC_SERIAL:
+    case VIRTIO_ID_MEMORY_BALLOON:
+    case VIRTIO_ID_CAIF:
+    case VIRTIO_ID_SIGNAL_DIST:
+    case VIRTIO_ID_PSTORE:
+    case VIRTIO_ID_SOUND:
+    case VIRTIO_ID_BT:
+    case VIRTIO_ID_RPMB:
+    case VIRTIO_ID_VIDEO_ENCODER:
+    case VIRTIO_ID_VIDEO_DECODER:
+    case VIRTIO_ID_SCMI:
+    case VIRTIO_ID_NITRO_SEC_MOD:
+    case VIRTIO_ID_WATCHDOG:
+    case VIRTIO_ID_CAN:
+    case VIRTIO_ID_DMABUF:
+    case VIRTIO_ID_PARAM_SERV:
+    case VIRTIO_ID_AUDIO_POLICY:
+    case VIRTIO_ID_GPIO:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    features->has_unknown_dev_features = bitmap != 0;
+    if (features->has_unknown_dev_features) {
+        features->unknown_dev_features = bitmap;
+    }
+
+    return features;
+}
+
 VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
@@ -3999,9 +4619,12 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     status->name = g_strdup(vdev->name);
     status->device_id = vdev->device_id;
     status->vhost_started = vdev->vhost_started;
-    status->guest_features = vdev->guest_features;
-    status->host_features = vdev->host_features;
-    status->backend_features = vdev->backend_features;
+    status->guest_features = qmp_decode_features(vdev->device_id,
+                                                 vdev->guest_features);
+    status->host_features = qmp_decode_features(vdev->device_id,
+                                                vdev->host_features);
+    status->backend_features = qmp_decode_features(vdev->device_id,
+                                                   vdev->backend_features);
 
     switch (vdev->device_endian) {
     case VIRTIO_DEVICE_ENDIAN_LITTLE:
@@ -4016,7 +4639,7 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
     }
 
     status->num_vqs = virtio_get_num_queues(vdev);
-    status->status = vdev->status;
+    status->status = qmp_decode_status(vdev->status);
     status->isr = vdev->isr;
     status->queue_sel = vdev->queue_sel;
     status->vm_running = vdev->vm_running;
@@ -4039,10 +4662,14 @@ VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
         status->vhost_dev->n_tmp_sections = hdev->n_tmp_sections;
         status->vhost_dev->nvqs = hdev->nvqs;
         status->vhost_dev->vq_index = hdev->vq_index;
-        status->vhost_dev->features = hdev->features;
-        status->vhost_dev->acked_features = hdev->acked_features;
-        status->vhost_dev->backend_features = hdev->backend_features;
-        status->vhost_dev->protocol_features = hdev->protocol_features;
+        status->vhost_dev->features =
+            qmp_decode_features(vdev->device_id, hdev->features);
+        status->vhost_dev->acked_features =
+            qmp_decode_features(vdev->device_id, hdev->acked_features);
+        status->vhost_dev->backend_features =
+            qmp_decode_features(vdev->device_id, hdev->backend_features);
+        status->vhost_dev->protocol_features =
+            qmp_decode_protocols(hdev->protocol_features);
         status->vhost_dev->max_queues = hdev->max_queues;
         status->vhost_dev->backend_cap = hdev->backend_cap;
         status->vhost_dev->log_enabled = hdev->log_enabled;
-- 
MST


