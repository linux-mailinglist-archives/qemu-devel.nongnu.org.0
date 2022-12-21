Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F586531F7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:45:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7zOd-0005J8-4I; Wed, 21 Dec 2022 08:44:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7zOa-0005H7-GA
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:44:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7zOW-0002ym-LX
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671630268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nX2ugyqPpT41yWoSywJYNsTYxkz7hROzkuAg6S6Dmx8=;
 b=ARJLugJP4a4U7I96oEksscyYrVcQknsAzglQaMm3s7rdgTDF88Fn7ZfsNYJyljE+TahbvS
 Xppz6W4+IMLeh2+KkJ5CsLIbS4wcQJOoF7/E2AUirHyjbH1xnslR6N00OmQ85tDA5S9gUw
 b/Xh1/KgHlq4Mh1HpvDjmKbCsp2rj4s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-140-PpwnP1BnPP60GYwBToNCiQ-1; Wed, 21 Dec 2022 08:44:26 -0500
X-MC-Unique: PpwnP1BnPP60GYwBToNCiQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 n8-20020a05600c294800b003d1cc68889dso692774wmd.7
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:44:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nX2ugyqPpT41yWoSywJYNsTYxkz7hROzkuAg6S6Dmx8=;
 b=S+zmtJHxjnVrHcRBcl7/58gU8vry2m7Y4YOvNgRuA7do6q9nzHHCGhny5NU8xBrRDs
 3IRTS1oms83QZRTQ1Iu4FRh+sD2XovDYilRZ3tvh8NNMbA0XpnNc7Q/K1zLJileUAFpf
 L0uesJiyDFR0MLBGhNrsjNDD+m2WMmEZVShbIOxZI9Xao08N8qxI73H7KV0Nu2U67I1e
 A+e7UD1FKlQ7Jm1uno7aYV2AnmKV4y9kXHCGE5zoSV44217dGcETNGi+Y+ox7nWh8mZy
 HiBjsHK2dLy6IOUm8HaUQ9IPwYuMlWa2IBae++o+EEBlA1T4HRPUW8CHXyn2X1nkBKwU
 xiLA==
X-Gm-Message-State: AFqh2krpyNhkO9SGUQ2HwkyAsb5MK61fZMJiE01KSBV4e/D+IEUPHEKI
 kt/3VqnmO3Xu9lWnQ5btC2MiTnVXDOZRsqXmC7pTd6p8nNxqN14onjte54LpFMvnI45+x1dmUUR
 ijaZp6twjsKYcd5Vm3pI4JXJv7lSFgKaleWSABQqjnDEvuzTuhWFRdrtHkEsn
X-Received: by 2002:adf:e946:0:b0:242:1ef7:9ad1 with SMTP id
 m6-20020adfe946000000b002421ef79ad1mr1183730wrn.70.1671630264669; 
 Wed, 21 Dec 2022 05:44:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsCMFHBQahykBXVUbSO9s+96nZo3FmS1AyLUqXdwaekW3DYthbDxSDjlquMS8ShIfy0Jv7IvQ==
X-Received: by 2002:adf:e946:0:b0:242:1ef7:9ad1 with SMTP id
 m6-20020adfe946000000b002421ef79ad1mr1183702wrn.70.1671630264045; 
 Wed, 21 Dec 2022 05:44:24 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 bn22-20020a056000061600b002366e3f1497sm15671291wrb.6.2022.12.21.05.44.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:44:23 -0800 (PST)
Date: Wed, 21 Dec 2022 08:44:21 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, philmd@linaro.org
Subject: [PULL 39/41] hw/virtio: Extract QMP related code virtio-qmp.c
Message-ID: <20221221130339.1234592-40-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The monitor decoders are the only functions using the CONFIG_xxx
definitions declared in the target specific CONFIG_DEVICES header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221213111707.34921-7-philmd@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <a class="moz-txt-link-rfc2396E" href="mailto:philmd@linaro.org">&lt;philmd@linaro.org&gt;</a>
---
 hw/virtio/virtio-qmp.h |  20 ++
 hw/virtio/virtio-qmp.c | 659 +++++++++++++++++++++++++++++++++++++++++
 hw/virtio/virtio.c     | 635 +--------------------------------------
 hw/virtio/meson.build  |   2 +-
 4 files changed, 682 insertions(+), 634 deletions(-)
 create mode 100644 hw/virtio/virtio-qmp.h
 create mode 100644 hw/virtio/virtio-qmp.c

diff --git a/hw/virtio/virtio-qmp.h b/hw/virtio/virtio-qmp.h
new file mode 100644
index 0000000000..075fc27030
--- /dev/null
+++ b/hw/virtio/virtio-qmp.h
@@ -0,0 +1,20 @@
+/*
+ * Virtio QMP helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_VIRTIO_QMP_H
+#define HW_VIRTIO_QMP_H
+
+#include "qapi/qapi-types-virtio.h"
+
+VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap);
+VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap);
+VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap);
+
+#endif
diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
new file mode 100644
index 0000000000..8e7282658f
--- /dev/null
+++ b/hw/virtio/virtio-qmp.c
@@ -0,0 +1,659 @@
+/*
+ * Virtio QMP helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/virtio/virtio.h"
+#include "virtio-qmp.h"
+
+#include "standard-headers/linux/virtio_ids.h"
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
+
+#include CONFIG_DEVICES
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
+static const qmp_virtio_feature_map_t virtio_transport_map[] = {
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
+static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
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
+static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
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
+#ifdef CONFIG_VIRTIO_BLK
+static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
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
+#endif
+
+/* virtio-serial features mapping */
+#ifdef CONFIG_VIRTIO_SERIAL
+static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
+            "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
+            "VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported"),
+    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
+            "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
+    { -1, "" }
+};
+#endif
+
+/* virtio-gpu features mapping */
+#ifdef CONFIG_VIRTIO_GPU
+static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
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
+#endif
+
+/* virtio-input features mapping */
+#ifdef CONFIG_VIRTIO_INPUT
+static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+#endif
+
+/* virtio-net features mapping */
+#ifdef CONFIG_VIRTIO_NET
+static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
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
+#endif
+
+/* virtio-scsi features mapping */
+#ifdef CONFIG_VIRTIO_SCSI
+static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
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
+#endif
+
+/* virtio/vhost-user-fs features mapping */
+#ifdef CONFIG_VHOST_USER_FS
+static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+#endif
+
+/* virtio/vhost-user-i2c features mapping */
+#ifdef CONFIG_VIRTIO_I2C_ADAPTER
+static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
+            "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+#endif
+
+/* virtio/vhost-vsock features mapping */
+#ifdef CONFIG_VHOST_VSOCK
+static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
+    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
+            "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+#endif
+
+/* virtio-balloon features mapping */
+#ifdef CONFIG_VIRTIO_BALLOON
+static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
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
+#endif
+
+/* virtio-crypto features mapping */
+#ifdef CONFIG_VIRTIO_CRYPTO
+static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    { -1, "" }
+};
+#endif
+
+/* virtio-iommu features mapping */
+#ifdef CONFIG_VIRTIO_IOMMU
+static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
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
+#endif
+
+/* virtio-mem features mapping */
+#ifdef CONFIG_VIRTIO_MEM
+static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
+#ifndef CONFIG_ACPI
+    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
+            "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
+#endif /* !CONFIG_ACPI */
+    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
+            "VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be "
+            "accessed"),
+    { -1, "" }
+};
+#endif
+
+/* virtio-rng features mapping */
+#ifdef CONFIG_VIRTIO_RNG
+static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
+    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
+            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
+    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
+            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
+            "negotiation supported"),
+    { -1, "" }
+};
+#endif
+
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
+VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
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
+VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
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
+VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id, uint64_t bitmap)
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
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e0aa70248a..289eb71045 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -16,7 +16,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qapi/qapi-commands-virtio.h"
 #include "qapi/qapi-commands-qom.h"
-#include "qapi/qapi-visit-virtio.h"
 #include "qapi/qmp/qjson.h"
 #include "trace.h"
 #include "qemu/error-report.h"
@@ -33,6 +32,8 @@
 #include "hw/virtio/virtio-access.h"
 #include "sysemu/dma.h"
 #include "sysemu/runstate.h"
+#include "virtio-qmp.h"
+
 #include "standard-headers/linux/virtio_ids.h"
 #include "standard-headers/linux/vhost_types.h"
 #include "standard-headers/linux/virtio_blk.h"
@@ -45,7 +46,6 @@
 #include "standard-headers/linux/virtio_iommu.h"
 #include "standard-headers/linux/virtio_mem.h"
 #include "standard-headers/linux/virtio_vsock.h"
-#include CONFIG_DEVICES
 
 /* QAPI list of realized VirtIODevices */
 static QTAILQ_HEAD(, VirtIODevice) virtio_list;
@@ -55,440 +55,6 @@ static QTAILQ_HEAD(, VirtIODevice) virtio_list;
  */
 #define VHOST_USER_MAX_CONFIG_SIZE 256
 
-#define FEATURE_ENTRY(name, desc) (qmp_virtio_feature_map_t) \
-    { .virtio_bit = name, .feature_desc = desc }
-
-enum VhostUserProtocolFeature {
-    VHOST_USER_PROTOCOL_F_MQ = 0,
-    VHOST_USER_PROTOCOL_F_LOG_SHMFD = 1,
-    VHOST_USER_PROTOCOL_F_RARP = 2,
-    VHOST_USER_PROTOCOL_F_REPLY_ACK = 3,
-    VHOST_USER_PROTOCOL_F_NET_MTU = 4,
-    VHOST_USER_PROTOCOL_F_SLAVE_REQ = 5,
-    VHOST_USER_PROTOCOL_F_CROSS_ENDIAN = 6,
-    VHOST_USER_PROTOCOL_F_CRYPTO_SESSION = 7,
-    VHOST_USER_PROTOCOL_F_PAGEFAULT = 8,
-    VHOST_USER_PROTOCOL_F_CONFIG = 9,
-    VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD = 10,
-    VHOST_USER_PROTOCOL_F_HOST_NOTIFIER = 11,
-    VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD = 12,
-    VHOST_USER_PROTOCOL_F_RESET_DEVICE = 13,
-    VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS = 14,
-    VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS = 15,
-    VHOST_USER_PROTOCOL_F_MAX
-};
-
-/* Virtio transport features mapping */
-static const qmp_virtio_feature_map_t virtio_transport_map[] = {
-    /* Virtio device transport features */
-#ifndef VIRTIO_CONFIG_NO_LEGACY
-    FEATURE_ENTRY(VIRTIO_F_NOTIFY_ON_EMPTY, \
-            "VIRTIO_F_NOTIFY_ON_EMPTY: Notify when device runs out of avail. "
-            "descs. on VQ"),
-    FEATURE_ENTRY(VIRTIO_F_ANY_LAYOUT, \
-            "VIRTIO_F_ANY_LAYOUT: Device accepts arbitrary desc. layouts"),
-#endif /* !VIRTIO_CONFIG_NO_LEGACY */
-    FEATURE_ENTRY(VIRTIO_F_VERSION_1, \
-            "VIRTIO_F_VERSION_1: Device compliant for v1 spec (legacy)"),
-    FEATURE_ENTRY(VIRTIO_F_IOMMU_PLATFORM, \
-            "VIRTIO_F_IOMMU_PLATFORM: Device can be used on IOMMU platform"),
-    FEATURE_ENTRY(VIRTIO_F_RING_PACKED, \
-            "VIRTIO_F_RING_PACKED: Device supports packed VQ layout"),
-    FEATURE_ENTRY(VIRTIO_F_IN_ORDER, \
-            "VIRTIO_F_IN_ORDER: Device uses buffers in same order as made "
-            "available by driver"),
-    FEATURE_ENTRY(VIRTIO_F_ORDER_PLATFORM, \
-            "VIRTIO_F_ORDER_PLATFORM: Memory accesses ordered by platform"),
-    FEATURE_ENTRY(VIRTIO_F_SR_IOV, \
-            "VIRTIO_F_SR_IOV: Device supports single root I/O virtualization"),
-    /* Virtio ring transport features */
-    FEATURE_ENTRY(VIRTIO_RING_F_INDIRECT_DESC, \
-            "VIRTIO_RING_F_INDIRECT_DESC: Indirect descriptors supported"),
-    FEATURE_ENTRY(VIRTIO_RING_F_EVENT_IDX, \
-            "VIRTIO_RING_F_EVENT_IDX: Used & avail. event fields enabled"),
-    { -1, "" }
-};
-
-/* Vhost-user protocol features mapping */
-static const qmp_virtio_feature_map_t vhost_user_protocol_map[] = {
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_MQ, \
-            "VHOST_USER_PROTOCOL_F_MQ: Multiqueue protocol supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_LOG_SHMFD, \
-            "VHOST_USER_PROTOCOL_F_LOG_SHMFD: Shared log memory fd supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RARP, \
-            "VHOST_USER_PROTOCOL_F_RARP: Vhost-user back-end RARP broadcasting "
-            "supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_REPLY_ACK, \
-            "VHOST_USER_PROTOCOL_F_REPLY_ACK: Requested operation status ack. "
-            "supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_NET_MTU, \
-            "VHOST_USER_PROTOCOL_F_NET_MTU: Expose host MTU to guest supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_REQ, \
-            "VHOST_USER_PROTOCOL_F_SLAVE_REQ: Socket fd for back-end initiated "
-            "requests supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CROSS_ENDIAN, \
-            "VHOST_USER_PROTOCOL_F_CROSS_ENDIAN: Endianness of VQs for legacy "
-            "devices supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CRYPTO_SESSION, \
-            "VHOST_USER_PROTOCOL_F_CRYPTO_SESSION: Session creation for crypto "
-            "operations supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_PAGEFAULT, \
-            "VHOST_USER_PROTOCOL_F_PAGEFAULT: Request servicing on userfaultfd "
-            "for accessed pages supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIG, \
-            "VHOST_USER_PROTOCOL_F_CONFIG: Vhost-user messaging for virtio "
-            "device configuration space supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD, \
-            "VHOST_USER_PROTOCOL_F_SLAVE_SEND_FD: Slave fd communication "
-            "channel supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_HOST_NOTIFIER, \
-            "VHOST_USER_PROTOCOL_F_HOST_NOTIFIER: Host notifiers for specified "
-            "VQs supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD, \
-            "VHOST_USER_PROTOCOL_F_INFLIGHT_SHMFD: Shared inflight I/O buffers "
-            "supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_RESET_DEVICE, \
-            "VHOST_USER_PROTOCOL_F_RESET_DEVICE: Disabling all rings and "
-            "resetting internal device state supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS, \
-            "VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS: In-band messaging "
-            "supported"),
-    FEATURE_ENTRY(VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS, \
-            "VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS: Configuration for "
-            "memory slots supported"),
-    { -1, "" }
-};
-
-/* virtio device configuration statuses */
-static const qmp_virtio_feature_map_t virtio_config_status_map[] = {
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER_OK, \
-            "VIRTIO_CONFIG_S_DRIVER_OK: Driver setup and ready"),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_FEATURES_OK, \
-            "VIRTIO_CONFIG_S_FEATURES_OK: Feature negotiation complete"),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_DRIVER, \
-            "VIRTIO_CONFIG_S_DRIVER: Guest OS compatible with device"),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_NEEDS_RESET, \
-            "VIRTIO_CONFIG_S_NEEDS_RESET: Irrecoverable error, device needs "
-            "reset"),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_FAILED, \
-            "VIRTIO_CONFIG_S_FAILED: Error in guest, device failed"),
-    FEATURE_ENTRY(VIRTIO_CONFIG_S_ACKNOWLEDGE, \
-            "VIRTIO_CONFIG_S_ACKNOWLEDGE: Valid virtio device found"),
-    { -1, "" }
-};
-
-/* virtio-blk features mapping */
-#ifdef CONFIG_VIRTIO_BLK
-static const qmp_virtio_feature_map_t virtio_blk_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_BLK_F_SIZE_MAX, \
-            "VIRTIO_BLK_F_SIZE_MAX: Max segment size is size_max"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_SEG_MAX, \
-            "VIRTIO_BLK_F_SEG_MAX: Max segments in a request is seg_max"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_GEOMETRY, \
-            "VIRTIO_BLK_F_GEOMETRY: Legacy geometry available"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_RO, \
-            "VIRTIO_BLK_F_RO: Device is read-only"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_BLK_SIZE, \
-            "VIRTIO_BLK_F_BLK_SIZE: Block size of disk available"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_TOPOLOGY, \
-            "VIRTIO_BLK_F_TOPOLOGY: Topology information available"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_MQ, \
-            "VIRTIO_BLK_F_MQ: Multiqueue supported"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_DISCARD, \
-            "VIRTIO_BLK_F_DISCARD: Discard command supported"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_WRITE_ZEROES, \
-            "VIRTIO_BLK_F_WRITE_ZEROES: Write zeroes command supported"),
-#ifndef VIRTIO_BLK_NO_LEGACY
-    FEATURE_ENTRY(VIRTIO_BLK_F_BARRIER, \
-            "VIRTIO_BLK_F_BARRIER: Request barriers supported"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_SCSI, \
-            "VIRTIO_BLK_F_SCSI: SCSI packet commands supported"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_FLUSH, \
-            "VIRTIO_BLK_F_FLUSH: Flush command supported"),
-    FEATURE_ENTRY(VIRTIO_BLK_F_CONFIG_WCE, \
-            "VIRTIO_BLK_F_CONFIG_WCE: Cache writeback and writethrough modes "
-            "supported"),
-#endif /* !VIRTIO_BLK_NO_LEGACY */
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-serial features mapping */
-#ifdef CONFIG_VIRTIO_SERIAL
-static const qmp_virtio_feature_map_t virtio_serial_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_CONSOLE_F_SIZE, \
-            "VIRTIO_CONSOLE_F_SIZE: Host providing console size"),
-    FEATURE_ENTRY(VIRTIO_CONSOLE_F_MULTIPORT, \
-            "VIRTIO_CONSOLE_F_MULTIPORT: Multiple ports for device supported"),
-    FEATURE_ENTRY(VIRTIO_CONSOLE_F_EMERG_WRITE, \
-            "VIRTIO_CONSOLE_F_EMERG_WRITE: Emergency write supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-gpu features mapping */
-#ifdef CONFIG_VIRTIO_GPU
-static const qmp_virtio_feature_map_t virtio_gpu_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_GPU_F_VIRGL, \
-            "VIRTIO_GPU_F_VIRGL: Virgl 3D mode supported"),
-    FEATURE_ENTRY(VIRTIO_GPU_F_EDID, \
-            "VIRTIO_GPU_F_EDID: EDID metadata supported"),
-    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_UUID, \
-            "VIRTIO_GPU_F_RESOURCE_UUID: Resource UUID assigning supported"),
-    FEATURE_ENTRY(VIRTIO_GPU_F_RESOURCE_BLOB, \
-            "VIRTIO_GPU_F_RESOURCE_BLOB: Size-based blob resources supported"),
-    FEATURE_ENTRY(VIRTIO_GPU_F_CONTEXT_INIT, \
-            "VIRTIO_GPU_F_CONTEXT_INIT: Context types and synchronization "
-            "timelines supported"),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-input features mapping */
-#ifdef CONFIG_VIRTIO_INPUT
-static const qmp_virtio_feature_map_t virtio_input_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-net features mapping */
-#ifdef CONFIG_VIRTIO_NET
-static const qmp_virtio_feature_map_t virtio_net_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_NET_F_CSUM, \
-            "VIRTIO_NET_F_CSUM: Device handling packets with partial checksum "
-            "supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_CSUM, \
-            "VIRTIO_NET_F_GUEST_CSUM: Driver handling packets with partial "
-            "checksum supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, \
-            "VIRTIO_NET_F_CTRL_GUEST_OFFLOADS: Control channel offloading "
-            "reconfig. supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_MTU, \
-            "VIRTIO_NET_F_MTU: Device max MTU reporting supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_MAC, \
-            "VIRTIO_NET_F_MAC: Device has given MAC address"),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO4, \
-            "VIRTIO_NET_F_GUEST_TSO4: Driver can receive TSOv4"),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_TSO6, \
-            "VIRTIO_NET_F_GUEST_TSO6: Driver can receive TSOv6"),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ECN, \
-            "VIRTIO_NET_F_GUEST_ECN: Driver can receive TSO with ECN"),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_UFO, \
-            "VIRTIO_NET_F_GUEST_UFO: Driver can receive UFO"),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO4, \
-            "VIRTIO_NET_F_HOST_TSO4: Device can receive TSOv4"),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_TSO6, \
-            "VIRTIO_NET_F_HOST_TSO6: Device can receive TSOv6"),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_ECN, \
-            "VIRTIO_NET_F_HOST_ECN: Device can receive TSO with ECN"),
-    FEATURE_ENTRY(VIRTIO_NET_F_HOST_UFO, \
-            "VIRTIO_NET_F_HOST_UFO: Device can receive UFO"),
-    FEATURE_ENTRY(VIRTIO_NET_F_MRG_RXBUF, \
-            "VIRTIO_NET_F_MRG_RXBUF: Driver can merge receive buffers"),
-    FEATURE_ENTRY(VIRTIO_NET_F_STATUS, \
-            "VIRTIO_NET_F_STATUS: Configuration status field available"),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VQ, \
-            "VIRTIO_NET_F_CTRL_VQ: Control channel available"),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX, \
-            "VIRTIO_NET_F_CTRL_RX: Control channel RX mode supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_VLAN, \
-            "VIRTIO_NET_F_CTRL_VLAN: Control channel VLAN filtering supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_RX_EXTRA, \
-            "VIRTIO_NET_F_CTRL_RX_EXTRA: Extra RX mode control supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_GUEST_ANNOUNCE, \
-            "VIRTIO_NET_F_GUEST_ANNOUNCE: Driver sending gratuitous packets "
-            "supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_MQ, \
-            "VIRTIO_NET_F_MQ: Multiqueue with automatic receive steering "
-            "supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_CTRL_MAC_ADDR, \
-            "VIRTIO_NET_F_CTRL_MAC_ADDR: MAC address set through control "
-            "channel"),
-    FEATURE_ENTRY(VIRTIO_NET_F_HASH_REPORT, \
-            "VIRTIO_NET_F_HASH_REPORT: Hash reporting supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_RSS, \
-            "VIRTIO_NET_F_RSS: RSS RX steering supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_RSC_EXT, \
-            "VIRTIO_NET_F_RSC_EXT: Extended coalescing info supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_STANDBY, \
-            "VIRTIO_NET_F_STANDBY: Device acting as standby for primary "
-            "device with same MAC addr. supported"),
-    FEATURE_ENTRY(VIRTIO_NET_F_SPEED_DUPLEX, \
-            "VIRTIO_NET_F_SPEED_DUPLEX: Device set linkspeed and duplex"),
-#ifndef VIRTIO_NET_NO_LEGACY
-    FEATURE_ENTRY(VIRTIO_NET_F_GSO, \
-            "VIRTIO_NET_F_GSO: Handling GSO-type packets supported"),
-#endif /* !VIRTIO_NET_NO_LEGACY */
-    FEATURE_ENTRY(VHOST_NET_F_VIRTIO_NET_HDR, \
-            "VHOST_NET_F_VIRTIO_NET_HDR: Virtio-net headers for RX and TX "
-            "packets supported"),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-scsi features mapping */
-#ifdef CONFIG_VIRTIO_SCSI
-static const qmp_virtio_feature_map_t virtio_scsi_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_SCSI_F_INOUT, \
-            "VIRTIO_SCSI_F_INOUT: Requests including read and writable data "
-            "buffers suppoted"),
-    FEATURE_ENTRY(VIRTIO_SCSI_F_HOTPLUG, \
-            "VIRTIO_SCSI_F_HOTPLUG: Reporting and handling hot-plug events "
-            "supported"),
-    FEATURE_ENTRY(VIRTIO_SCSI_F_CHANGE, \
-            "VIRTIO_SCSI_F_CHANGE: Reporting and handling LUN changes "
-            "supported"),
-    FEATURE_ENTRY(VIRTIO_SCSI_F_T10_PI, \
-            "VIRTIO_SCSI_F_T10_PI: T10 info included in request header"),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio/vhost-user-fs features mapping */
-#ifdef CONFIG_VHOST_USER_FS
-static const qmp_virtio_feature_map_t virtio_fs_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio/vhost-user-i2c features mapping */
-#ifdef CONFIG_VIRTIO_I2C_ADAPTER
-static const qmp_virtio_feature_map_t virtio_i2c_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_I2C_F_ZERO_LENGTH_REQUEST, \
-            "VIRTIO_I2C_F_ZERO_LEGNTH_REQUEST: Zero length requests supported"),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio/vhost-vsock features mapping */
-#ifdef CONFIG_VHOST_VSOCK
-static const qmp_virtio_feature_map_t virtio_vsock_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_VSOCK_F_SEQPACKET, \
-            "VIRTIO_VSOCK_F_SEQPACKET: SOCK_SEQPACKET supported"),
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-balloon features mapping */
-#ifdef CONFIG_VIRTIO_BALLOON
-static const qmp_virtio_feature_map_t virtio_balloon_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_MUST_TELL_HOST, \
-            "VIRTIO_BALLOON_F_MUST_TELL_HOST: Tell host before reclaiming "
-            "pages"),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_STATS_VQ, \
-            "VIRTIO_BALLOON_F_STATS_VQ: Guest memory stats VQ available"),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_DEFLATE_ON_OOM, \
-            "VIRTIO_BALLOON_F_DEFLATE_ON_OOM: Deflate balloon when guest OOM"),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_FREE_PAGE_HINT, \
-            "VIRTIO_BALLOON_F_FREE_PAGE_HINT: VQ reporting free pages enabled"),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_PAGE_POISON, \
-            "VIRTIO_BALLOON_F_PAGE_POISON: Guest page poisoning enabled"),
-    FEATURE_ENTRY(VIRTIO_BALLOON_F_REPORTING, \
-            "VIRTIO_BALLOON_F_REPORTING: Page reporting VQ enabled"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-crypto features mapping */
-#ifdef CONFIG_VIRTIO_CRYPTO
-static const qmp_virtio_feature_map_t virtio_crypto_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-iommu features mapping */
-#ifdef CONFIG_VIRTIO_IOMMU
-static const qmp_virtio_feature_map_t virtio_iommu_feature_map[] = {
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_INPUT_RANGE, \
-            "VIRTIO_IOMMU_F_INPUT_RANGE: Range of available virtual addrs. "
-            "available"),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_DOMAIN_RANGE, \
-            "VIRTIO_IOMMU_F_DOMAIN_RANGE: Number of supported domains "
-            "available"),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_MAP_UNMAP, \
-            "VIRTIO_IOMMU_F_MAP_UNMAP: Map and unmap requests available"),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS, \
-            "VIRTIO_IOMMU_F_BYPASS: Endpoints not attached to domains are in "
-            "bypass mode"),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_PROBE, \
-            "VIRTIO_IOMMU_F_PROBE: Probe requests available"),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_MMIO, \
-            "VIRTIO_IOMMU_F_MMIO: VIRTIO_IOMMU_MAP_F_MMIO flag available"),
-    FEATURE_ENTRY(VIRTIO_IOMMU_F_BYPASS_CONFIG, \
-            "VIRTIO_IOMMU_F_BYPASS_CONFIG: Bypass field of IOMMU config "
-            "available"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-mem features mapping */
-#ifdef CONFIG_VIRTIO_MEM
-static const qmp_virtio_feature_map_t virtio_mem_feature_map[] = {
-#ifndef CONFIG_ACPI
-    FEATURE_ENTRY(VIRTIO_MEM_F_ACPI_PXM, \
-            "VIRTIO_MEM_F_ACPI_PXM: node_id is an ACPI PXM and is valid"),
-#endif /* !CONFIG_ACPI */
-    FEATURE_ENTRY(VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE, \
-            "VIRTIO_MEM_F_UNPLUGGED_INACCESSIBLE: Unplugged memory cannot be "
-            "accessed"),
-    { -1, "" }
-};
-#endif
-
-/* virtio-rng features mapping */
-#ifdef CONFIG_VIRTIO_RNG
-static const qmp_virtio_feature_map_t virtio_rng_feature_map[] = {
-    FEATURE_ENTRY(VHOST_F_LOG_ALL, \
-            "VHOST_F_LOG_ALL: Logging write descriptors supported"),
-    FEATURE_ENTRY(VHOST_USER_F_PROTOCOL_FEATURES, \
-            "VHOST_USER_F_PROTOCOL_FEATURES: Vhost-user protocol features "
-            "negotiation supported"),
-    { -1, "" }
-};
-#endif
-
 /*
  * The alignment to use between consumer and producer parts of vring.
  * x86 pagesize again. This is the default, used by transports like PCI
@@ -4296,203 +3862,6 @@ static VirtIODevice *virtio_device_find(const char *path)
     return NULL;
 }
 
-#define CONVERT_FEATURES(type, map, is_status, bitmap)   \
-    ({                                                   \
-        type *list = NULL;                               \
-        type *node;                                      \
-        for (i = 0; map[i].virtio_bit != -1; i++) {      \
-            if (is_status) {                             \
-                bit = map[i].virtio_bit;                 \
-            }                                            \
-            else {                                       \
-                bit = 1ULL << map[i].virtio_bit;         \
-            }                                            \
-            if ((bitmap & bit) == 0) {                   \
-                continue;                                \
-            }                                            \
-            node = g_new0(type, 1);                      \
-            node->value = g_strdup(map[i].feature_desc); \
-            node->next = list;                           \
-            list = node;                                 \
-            bitmap ^= bit;                               \
-        }                                                \
-        list;                                            \
-    })
-
-static VirtioDeviceStatus *qmp_decode_status(uint8_t bitmap)
-{
-    VirtioDeviceStatus *status;
-    uint8_t bit;
-    int i;
-
-    status = g_new0(VirtioDeviceStatus, 1);
-    status->statuses = CONVERT_FEATURES(strList, virtio_config_status_map,
-                                        1, bitmap);
-    status->has_unknown_statuses = bitmap != 0;
-    if (status->has_unknown_statuses) {
-        status->unknown_statuses = bitmap;
-    }
-
-    return status;
-}
-
-static VhostDeviceProtocols *qmp_decode_protocols(uint64_t bitmap)
-{
-    VhostDeviceProtocols *vhu_protocols;
-    uint64_t bit;
-    int i;
-
-    vhu_protocols = g_new0(VhostDeviceProtocols, 1);
-    vhu_protocols->protocols =
-                    CONVERT_FEATURES(strList,
-                                     vhost_user_protocol_map, 0, bitmap);
-    vhu_protocols->has_unknown_protocols = bitmap != 0;
-    if (vhu_protocols->has_unknown_protocols) {
-        vhu_protocols->unknown_protocols = bitmap;
-    }
-
-    return vhu_protocols;
-}
-
-static VirtioDeviceFeatures *qmp_decode_features(uint16_t device_id,
-                                                 uint64_t bitmap)
-{
-    VirtioDeviceFeatures *features;
-    uint64_t bit;
-    int i;
-
-    features = g_new0(VirtioDeviceFeatures, 1);
-    features->has_dev_features = true;
-
-    /* transport features */
-    features->transports = CONVERT_FEATURES(strList, virtio_transport_map, 0,
-                                            bitmap);
-
-    /* device features */
-    switch (device_id) {
-#ifdef CONFIG_VIRTIO_SERIAL
-    case VIRTIO_ID_CONSOLE:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_serial_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_BLK
-    case VIRTIO_ID_BLOCK:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_blk_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_GPU
-    case VIRTIO_ID_GPU:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_gpu_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_NET
-    case VIRTIO_ID_NET:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_net_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_SCSI
-    case VIRTIO_ID_SCSI:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_scsi_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_BALLOON
-    case VIRTIO_ID_BALLOON:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_balloon_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_IOMMU
-    case VIRTIO_ID_IOMMU:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_iommu_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_INPUT
-    case VIRTIO_ID_INPUT:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_input_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VHOST_USER_FS
-    case VIRTIO_ID_FS:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_fs_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VHOST_VSOCK
-    case VIRTIO_ID_VSOCK:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_vsock_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_CRYPTO
-    case VIRTIO_ID_CRYPTO:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_crypto_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_MEM
-    case VIRTIO_ID_MEM:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_mem_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_I2C_ADAPTER
-    case VIRTIO_ID_I2C_ADAPTER:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_i2c_feature_map, 0, bitmap);
-        break;
-#endif
-#ifdef CONFIG_VIRTIO_RNG
-    case VIRTIO_ID_RNG:
-        features->dev_features =
-            CONVERT_FEATURES(strList, virtio_rng_feature_map, 0, bitmap);
-        break;
-#endif
-    /* No features */
-    case VIRTIO_ID_9P:
-    case VIRTIO_ID_PMEM:
-    case VIRTIO_ID_IOMEM:
-    case VIRTIO_ID_RPMSG:
-    case VIRTIO_ID_CLOCK:
-    case VIRTIO_ID_MAC80211_WLAN:
-    case VIRTIO_ID_MAC80211_HWSIM:
-    case VIRTIO_ID_RPROC_SERIAL:
-    case VIRTIO_ID_MEMORY_BALLOON:
-    case VIRTIO_ID_CAIF:
-    case VIRTIO_ID_SIGNAL_DIST:
-    case VIRTIO_ID_PSTORE:
-    case VIRTIO_ID_SOUND:
-    case VIRTIO_ID_BT:
-    case VIRTIO_ID_RPMB:
-    case VIRTIO_ID_VIDEO_ENCODER:
-    case VIRTIO_ID_VIDEO_DECODER:
-    case VIRTIO_ID_SCMI:
-    case VIRTIO_ID_NITRO_SEC_MOD:
-    case VIRTIO_ID_WATCHDOG:
-    case VIRTIO_ID_CAN:
-    case VIRTIO_ID_DMABUF:
-    case VIRTIO_ID_PARAM_SERV:
-    case VIRTIO_ID_AUDIO_POLICY:
-    case VIRTIO_ID_GPIO:
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    features->has_unknown_dev_features = bitmap != 0;
-    if (features->has_unknown_dev_features) {
-        features->unknown_dev_features = bitmap;
-    }
-
-    return features;
-}
-
 VirtioStatus *qmp_x_query_virtio_status(const char *path, Error **errp)
 {
     VirtIODevice *vdev;
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index a52f4e5c01..f93be2e137 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -5,7 +5,7 @@ softmmu_virtio_ss.add(when: 'CONFIG_VIRTIO_MMIO', if_true: files('virtio-mmio.c'
 
 specific_virtio_ss = ss.source_set()
 specific_virtio_ss.add(files('virtio.c'))
-specific_virtio_ss.add(files('virtio-config-io.c'))
+specific_virtio_ss.add(files('virtio-config-io.c', 'virtio-qmp.c'))
 
 if have_vhost
   specific_virtio_ss.add(files('vhost.c', 'vhost-backend.c', 'vhost-iova-tree.c'))
-- 
MST


