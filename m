Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D55FA330
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:12:43 +0200 (CEST)
Received: from localhost ([::1]:39612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxGc-0008A0-M7
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbY-0002Dm-Dn
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbV-0006vQ-Bb
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6Zgc/f/oExp1Oq3yCEWAHTzhom8dFVVHPot0BXkafs=;
 b=JI01/RVT6liu2BoRNkNsTlOGjR2yXiHcyR2iCi2yoL9VyIpbsLU/gzLcrOFBKfoL+ZZV65
 VpAxjN7jcfS9WS8fQC0/LKOEPnxxEcXc0DfI0deFdYAm6O4ZoQHvCTh7nq9tpU+lrJ+4lS
 jEOZnGXW1XRnhojPrOD3uiHV96G3+zQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-sttR7A0-NFGkqxHti4Myhg-1; Mon, 10 Oct 2022 13:30:11 -0400
X-MC-Unique: sttR7A0-NFGkqxHti4Myhg-1
Received: by mail-wr1-f70.google.com with SMTP id
 s4-20020adfbc04000000b0022e03fc10a9so2955539wrg.15
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a6Zgc/f/oExp1Oq3yCEWAHTzhom8dFVVHPot0BXkafs=;
 b=YplNnP4HzQl2Samgm6pPGlKgGZWbvOK6FDnGUTpa7WQFzDyNqBGNAsSOLSGhTWZPCM
 /2Qce8a8yqh0vGh55ZkCeMLPlt/puqnPkAhKcJPhGSZOPuSAil8x4RXKLxmDs1VmRf2O
 l5FwociFS3Vk4n74kzHFwVuDQ9SW3oi5LeETgtctwNxEVvbZch1keHqgziyL8y04VUdc
 kP1DAOitYDvmIF3WMJuM6JrT5RQjQe6maNPKzAO2wrpqHdxiME2CJ9j7TIAt1+y9cYBr
 /gTA7wurjMUXuK/PZIAERhp0mV9WIRQ+t8Xm6JThM1MI68325J+Qp1wyDHz74mcoaDsK
 T+ow==
X-Gm-Message-State: ACrzQf2udxr4Y4OyLXM/xREfkvnyMf4Oy/Zwu2XkOczE8lgZ+h9fBhds
 1MCPib4y1FDnZETmE4RPDWJSgJajynWQAMJ69RBL+J3SGsk0oT71s+e6aUeqnTn1nRM4srlHy7w
 ObZDDRRLVqu1mSfy2vM2b6hgwCwTrtvtV22vJYNFKWIguB5xbZ7cZ5f3S8jAk
X-Received: by 2002:adf:d215:0:b0:22e:479e:8cc1 with SMTP id
 j21-20020adfd215000000b0022e479e8cc1mr13028651wrh.39.1665423010018; 
 Mon, 10 Oct 2022 10:30:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6bfRSsNOgYba3EOI4xorECx4f7WukBzalel3I6UMI9a2VU6inI8ZKA2pvihrNADgT5VGVkVQ==
X-Received: by 2002:adf:d215:0:b0:22e:479e:8cc1 with SMTP id
 j21-20020adfd215000000b0022e479e8cc1mr13028625wrh.39.1665423009643; 
 Mon, 10 Oct 2022 10:30:09 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 g11-20020a5d488b000000b00228d7078c4esm9349924wrq.4.2022.10.10.10.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:09 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniil Tatianin <d-tatianin@yandex-team.ru>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 20/55] virtio: introduce VirtIOConfigSizeParams &
 virtio_get_config_size
Message-ID: <20221010172813.204597-21-mst@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniil Tatianin <d-tatianin@yandex-team.ru>

This is the first step towards moving all device config size calculation
logic into the virtio core code. In particular, this adds a struct that
contains all the necessary information for common virtio code to be able
to calculate the final config size for a device. This is expected to be
used with the new virtio_get_config_size helper, which calculates the
final length based on the provided host features.

This builds on top of already existing code like VirtIOFeature and
virtio_feature_get_config_size(), but adds additional fields, as well as
sanity checking so that device-specifc code doesn't have to duplicate it.

An example usage would be:

    static const VirtIOFeature dev_features[] = {
        {.flags = 1ULL << FEATURE_1_BIT,
         .end = endof(struct virtio_dev_config, feature_1)},
        {.flags = 1ULL << FEATURE_2_BIT,
         .end = endof(struct virtio_dev_config, feature_2)},
        {}
    };

    static const VirtIOConfigSizeParams dev_cfg_size_params = {
        .min_size = DEV_BASE_CONFIG_SIZE,
        .max_size = sizeof(struct virtio_dev_config),
        .feature_sizes = dev_features
    };

    // code inside my_dev_device_realize()
    size_t config_size = virtio_get_config_size(&dev_cfg_size_params,
                                                host_features);
    virtio_init(vdev, VIRTIO_ID_MYDEV, config_size);

Currently every device is expected to write its own boilerplate from the
example above in device_realize(), however, the next step of this
transition is moving VirtIOConfigSizeParams into VirtioDeviceClass,
so that it can be done automatically by the virtio initialization code.

All of the users of virtio_feature_get_config_size have been converted
to use virtio_get_config_size so it's no longer needed and is removed
with this commit.

Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
Message-Id: <20220906073111.353245-2-d-tatianin@yandex-team.ru>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/virtio.h | 10 ++++++++--
 hw/block/virtio-blk.c      | 16 +++++++---------
 hw/net/virtio-net.c        |  9 +++++++--
 hw/virtio/virtio.c         | 10 ++++++----
 4 files changed, 28 insertions(+), 17 deletions(-)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 74e7ad5a92..cecfb7c552 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -49,8 +49,14 @@ typedef struct VirtIOFeature {
     size_t end;
 } VirtIOFeature;
 
-size_t virtio_feature_get_config_size(const VirtIOFeature *features,
-                                      uint64_t host_features);
+typedef struct VirtIOConfigSizeParams {
+    size_t min_size;
+    size_t max_size;
+    const VirtIOFeature *feature_sizes;
+} VirtIOConfigSizeParams;
+
+size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
+                              uint64_t host_features);
 
 typedef struct VirtQueue VirtQueue;
 
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index e9ba752f6b..10c47c2934 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -49,13 +49,11 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
-static void virtio_blk_set_config_size(VirtIOBlock *s, uint64_t host_features)
-{
-    s->config_size = MAX(VIRTIO_BLK_CFG_SIZE,
-        virtio_feature_get_config_size(feature_sizes, host_features));
-
-    assert(s->config_size <= sizeof(struct virtio_blk_config));
-}
+static const VirtIOConfigSizeParams cfg_size_params = {
+    .min_size = VIRTIO_BLK_CFG_SIZE,
+    .max_size = sizeof(struct virtio_blk_config),
+    .feature_sizes = feature_sizes
+};
 
 static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
                                     VirtIOBlockReq *req)
@@ -1204,8 +1202,8 @@ static void virtio_blk_device_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    virtio_blk_set_config_size(s, s->host_features);
-
+    s->config_size = virtio_get_config_size(&cfg_size_params,
+                                            s->host_features);
     virtio_init(vdev, VIRTIO_ID_BLOCK, s->config_size);
 
     s->blk = conf->conf.blk;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 63a8332cd0..e9f696b4cf 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -106,6 +106,12 @@ static const VirtIOFeature feature_sizes[] = {
     {}
 };
 
+static const VirtIOConfigSizeParams cfg_size_params = {
+    .min_size = endof(struct virtio_net_config, mac),
+    .max_size = sizeof(struct virtio_net_config),
+    .feature_sizes = feature_sizes
+};
+
 static VirtIONetQueue *virtio_net_get_subqueue(NetClientState *nc)
 {
     VirtIONet *n = qemu_get_nic_opaque(nc);
@@ -3241,8 +3247,7 @@ static void virtio_net_set_config_size(VirtIONet *n, uint64_t host_features)
 {
     virtio_add_feature(&host_features, VIRTIO_NET_F_MAC);
 
-    n->config_size = virtio_feature_get_config_size(feature_sizes,
-                                                    host_features);
+    n->config_size = virtio_get_config_size(&cfg_size_params, host_features);
 }
 
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 97a6307c0f..2cc1d7d24a 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3006,11 +3006,12 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     return ret;
 }
 
-size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
-                                      uint64_t host_features)
+size_t virtio_get_config_size(const VirtIOConfigSizeParams *params,
+                              uint64_t host_features)
 {
-    size_t config_size = 0;
-    int i;
+    size_t config_size = params->min_size;
+    const VirtIOFeature *feature_sizes = params->feature_sizes;
+    size_t i;
 
     for (i = 0; feature_sizes[i].flags != 0; i++) {
         if (host_features & feature_sizes[i].flags) {
@@ -3018,6 +3019,7 @@ size_t virtio_feature_get_config_size(const VirtIOFeature *feature_sizes,
         }
     }
 
+    assert(config_size <= params->max_size);
     return config_size;
 }
 
-- 
MST


