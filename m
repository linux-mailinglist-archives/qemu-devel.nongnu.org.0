Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A91E5FA32D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:09:49 +0200 (CEST)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxDo-0005WR-D4
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbg-0002Kd-Rn
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbb-0006wb-Rn
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cOgoTRITz2YMK+rYZGsAY2RNEeNGVK3YaF8wLkGM7II=;
 b=gzjSbO5YxsofssylfUNTabirYBa5JxvcZc+OxITvP7gNiGXXiw0B6RyiH7jyVtLbU3pSWG
 yoyn2FuHFYF3m6f2qIIs57N6KMXJE+lhCgrd21nwV6U3l/tZd49NSW6OlL6TQL4ZBk2mKa
 OH3s1ljty48g3pJ0DNLkWZDrnKY0xg8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-615-x4DS-xu8Nn-PUPcpVEtWJw-1; Mon, 10 Oct 2022 13:30:18 -0400
X-MC-Unique: x4DS-xu8Nn-PUPcpVEtWJw-1
Received: by mail-wr1-f69.google.com with SMTP id
 e19-20020adfa453000000b0022e3608df56so2976663wra.10
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOgoTRITz2YMK+rYZGsAY2RNEeNGVK3YaF8wLkGM7II=;
 b=54hsng6lBwqiK3nYcXE/BL9gMZ6iVWqcjO+KBBty2vOxLlgDtPfbgQJGfz513rE8+0
 xlozzT6M5zE0xewDHqM5tSAcMMKsZj9hmpam7G+WMtFueRkHPf5diRP8pQ4WY1wBha0l
 TC2RMHyEfAhFyZcd6Ms75aTtebHPqZ/83HwjxDfgCjDFibmW0k1mc5R/q0iu3xX3Kpxq
 A0FErs18a0MHJ8Gklhd+s2DAVv534wsUx2kw7Q287LtB1IQXiG2dAI6BM4z7WUVSJEsZ
 wIV+bq2znJq8CTEg0hAnsUW/Cjwsey8cNals8/JmzoZe3SSl+ZthfRp5llefAxuWIKe6
 rD1Q==
X-Gm-Message-State: ACrzQf2ZA/eaYMfEf73K6X4Gpr3P8foNNtrGHQXj9xnN7pDJaedEi5Rx
 WdJComDHdYPN5Kje8XxNFCw1z0JMjcLA0D/67NdR55OWXBUMbhmjdcZvX2jZHilswzJ6I1xuZkM
 9+/UOiu5+wHXthnSgmRU5yltbA8CFXy5yYdCFiok6o2gyaqtYEnFT5jqR8kel
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id
 p7-20020a5d59a7000000b00230365201aamr5094931wrr.308.1665423015423; 
 Mon, 10 Oct 2022 10:30:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Db9k5PAAqpCdvPjZ/UMNm70HZ8i3yDC2K0oErWScD9RBaPdUttkNPYp7ccKwU+0IUug5JCQ==
X-Received: by 2002:a5d:59a7:0:b0:230:3652:1aa with SMTP id
 p7-20020a5d59a7000000b00230365201aamr5094905wrr.308.1665423015066; 
 Mon, 10 Oct 2022 10:30:15 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b003c3c2df83ddsm9553148wmo.26.2022.10.10.10.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:14 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 21/55] virtio-blk: move config size params to virtio-blk-common
Message-ID: <20221010172813.204597-22-mst@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

This way we can reuse it for other virtio-blk devices, e.g
vhost-user-blk, which currently does not control its config space size
dynamically.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20220906073111.353245-3-d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
 hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
 hw/block/virtio-blk.c                 | 24 ++---------------
 MAINTAINERS                           |  2 ++
 hw/block/meson.build                  |  2 +-
 5 files changed, 64 insertions(+), 23 deletions(-)
 create mode 100644 include/hw/virtio/virtio-blk-common.h
 create mode 100644 hw/block/virtio-blk-common.c

diff --git a/include/hw/virtio/virtio-blk-common.h b/include/hw/virtio/virtio-blk-common.h
new file mode 100644
index 0000000000..31daada3e3
--- /dev/null
+++ b/include/hw/virtio/virtio-blk-common.h
@@ -0,0 +1,20 @@
+/*
+ * Virtio Block Device common helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef VIRTIO_BLK_COMMON_H
+#define VIRTIO_BLK_COMMON_H
+
+#include "hw/virtio/virtio.h"
+
+extern const VirtIOConfigSizeParams virtio_blk_cfg_size_params;
+
+#endif
diff --git a/hw/block/virtio-blk-common.c b/hw/block/virtio-blk-common.c
new file mode 100644
index 0000000000..ac52d7c176
--- /dev/null
+++ b/hw/block/virtio-blk-common.c
@@ -0,0 +1,39 @@
+/*
+ * Virtio Block Device common helpers
+ *
+ * Copyright IBM, Corp. 2007
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+
+#include "standard-headers/linux/virtio_blk.h"
+#include "hw/virtio/virtio.h"
+#include "hw/virtio/virtio-blk-common.h"
+
+/* Config size before the discard support (hide associated config fields) */
+#define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
+                                     max_discard_sectors)
+
+/*
+ * Starting from the discard feature, we can use this array to properly
+ * set the config size depending on the features enabled.
+ */
+static const VirtIOFeature feature_sizes[] = {
+    {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
+     .end = endof(struct virtio_blk_config, discard_sector_alignment)},
+    {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
+     .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
+    {}
+};
+
+const VirtIOConfigSizeParams virtio_blk_cfg_size_params = {
+    .min_size = VIRTIO_BLK_CFG_SIZE,
+    .max_size = sizeof(struct virtio_blk_config),
+    .feature_sizes = feature_sizes
+};
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 10c47c2934..8131ec2dbc 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -32,29 +32,9 @@
 #include "hw/virtio/virtio-bus.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-access.h"
+#include "hw/virtio/virtio-blk-common.h"
 #include "qemu/coroutine.h"
 
-/* Config size before the discard support (hide associated config fields) */
-#define VIRTIO_BLK_CFG_SIZE offsetof(struct virtio_blk_config, \
-                                     max_discard_sectors)
-/*
- * Starting from the discard feature, we can use this array to properly
- * set the config size depending on the features enabled.
- */
-static const VirtIOFeature feature_sizes[] = {
-    {.flags = 1ULL << VIRTIO_BLK_F_DISCARD,
-     .end = endof(struct virtio_blk_config, discard_sector_alignment)},
-    {.flags = 1ULL << VIRTIO_BLK_F_WRITE_ZEROES,
-     .end = endof(struct virtio_blk_config, write_zeroes_may_unmap)},
-    {}
-};
-
-static const VirtIOConfigSizeParams cfg_size_params = {
-    .min_size = VIRTIO_BLK_CFG_SIZE,
-    .max_size = sizeof(struct virtio_blk_config),
-    .feature_sizes = feature_sizes
-};
-
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
                                     VirtIOBlockReq *req)
 {
@@ -1202,7 +1182,7 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    s->config_size = virtio_get_config_size(&cfg_size_params,
+    s->config_size = virtio_get_config_size(&virtio_blk_cfg_size_params,
                                             s->host_features);
     virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
diff --git a/MAINTAINERS b/MAINTAINERS
index d0c0c8a55b..05b75805eb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2030,8 +2030,10 @@ virtio-blk
 M: Stefan Hajnoczi <stefanha@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
+F: hw/block/virtio-blk-common.c
 F: hw/block/virtio-blk.c
 F: hw/block/dataplane/*
+F: include/hw/virtio/virtio-blk-common.h
 F: tests/qtest/virtio-blk-test.c
 T: git https://github.com/stefanha/qemu.git block
 
diff --git a/hw/block/meson.build b/hw/block/meson.build
index 2389326112..8ee1f1f850 100644
--- a/hw/block/meson.build
+++ b/hw/block/meson.build
@@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swim.c'))
 softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
 softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
 
-specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'))
+specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c', 'virtio-blk-common.c'))
 specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-user-blk.c'))
 
 subdir('dataplane')
-- 
MST


