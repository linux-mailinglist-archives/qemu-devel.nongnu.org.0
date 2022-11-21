Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 381AC6326DB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 15:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox873-0005FZ-ED; Mon, 21 Nov 2022 09:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ox871-0005FF-L8
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 09:49:31 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ox86z-0007HS-Om
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 09:49:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id t4so8624072wmj.5
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 06:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BSdkyMFtfO4tuATAOxv5GR3jdScU++IaxS6/nHCv1pI=;
 b=ZoNZvQ1F3eOl8XoxC8DXnerZHCwEWa9T36KPp7FHndekMeAtnh9NavhqhT+pIQRXo9
 tFmZCliu3TNNItu4cFQy4iwB6m/YNPk1OlYqlNwhp95OWyPFZohqLgbJI7vt1gLd14XI
 8zOVZbMzDCOdH+UAcJgm2treQYT61F39FQfr3muRzFxYUqAg+xxdadBzgyA6JL5qlz3j
 vWCarQt+wVO9JYjioPu9qfXxFUydv9MOT6SBlq4E1ywl8xKN0UYyZhhLNaMGrL9famLf
 zMJTZ3oMfNLU6Ypzxl6vvdyw2KcuPheXCUNa20XmqK2Mgr/wQxdG4P7pqmOucEa7YJ91
 FDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BSdkyMFtfO4tuATAOxv5GR3jdScU++IaxS6/nHCv1pI=;
 b=Pj0hGQHNfE7G41GGpGi+uXNJM5nj40wTa2h5KQlu63hayXd6+FI2+g55wL6PbAG4Nk
 /P8PMPjz6ILhjV6tmmsFChtL3pTL9FhSqRGW4Eao5yThiwZjbiKKWQkv040onasenT24
 xPRzRZTk1DXB26n+NixYaIfmTphOiZoiuTKlDl+EfBGbUT0gIvk8H9SnDOI6L94r1V69
 uE3oQXXfiroBXpIWvTMPXjFaO1fdnqhr4VXUKzstYJ3/6SHy/twP9tYQYVkgLCf2s56a
 rFJbhdaFfXr/S4JCUwLlZur+NDFqB/zWu2gqDRNSONLPMnoG0ZrN92OEkHhIJ2Xv7Vkh
 dj1A==
X-Gm-Message-State: ANoB5pnm9Pxo2FdhfV4QMBPxJtHAhxy9ASWCJsr/bT5qa3rr+EaTezmu
 dAP0bbRrCNEwSAs0Pew5906Aig==
X-Google-Smtp-Source: AA0mqf7jXQgcscAEuQthn/pGE6/p91KBWF0N47givMrApocOMGtcKi3cLbjv5C/10ZNjIpFDGCZZyw==
X-Received: by 2002:a05:600c:3542:b0:3cf:6c2f:950c with SMTP id
 i2-20020a05600c354200b003cf6c2f950cmr5685573wmq.146.1669042167616; 
 Mon, 21 Nov 2022 06:49:27 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003cfa81e2eb4sm15459051wms.38.2022.11.21.06.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 06:49:26 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 68E2D1FFB7;
 Mon, 21 Nov 2022 14:49:26 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>
Subject: [RFC PATCH] include/hw: attempt to document VirtIO feature variables
 (!DISCUSS!)
Date: Mon, 21 Nov 2022 14:49:21 +0000
Message-Id: <20221121144921.2830330-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We have a bunch of variables associated with the device and the vhost
backend which are used inconsistently throughout the code base. Lets
start trying to bring some order by agreeing what each variable is
for. Some cases to address (vho/vio renames to avoid ambiguous results
while grepping):

virtio->guest_features is mostly the live status of the features field
and read and written as such by the guest. It does get manipulated by
the various load state via virtio_set_features_nocheck(vdev, val) for
migration.

virtio->host_features is the result of vcd->get_features() most of the
time and for vhost-user devices eventually ends up down at the vhost
get features message:

  ./hw/virtio/virtio-bus.c:66:    vdev->host_features = vdc->get_features(vdev, vdev->host_features,

However virtio-net does a lot of direct modification of it:

  ./hw/net/virtio-net.c:3517:        n->host_features |= (1ULL << VIRTIO_NET_F_MTU);
  ./hw/net/virtio-net.c:3529:        n->host_features |= (1ULL << VIRTIO_NET_F_SPEED_DUPLEX);
  ./hw/net/virtio-net.c:3539:        n->host_features |= (1ULL << VIRTIO_NET_F_SPEED_DUPLEX);
  ./hw/net/virtio-net.c:3548:        n->host_features |= (1ULL << VIRTIO_NET_F_STANDBY);
  ./hw/virtio/virtio.c:3438:    bool bad = (val & ~(vdev->host_features)) != 0;

And we have this case which propagates the global QMP values for the
device to the host features. This causes the resent regression of
vhost-user-sock due to 69e1c14aa2 (virtio: core: vq reset feature
negotation support) because the reset feature was rejected by the
vhost-user backend causing it to freeze:

  ./hw/virtio/virtio.c:4667:    status->host_features = qmp_decode_features(vdev->device_id,

virtio->backend_features is only used by virtio-net to stash the
vhost_net_get_features features for checking later:

    features = vhost_net_get_features(get_vhost_net(nc->peer), features);
    vdev->vio_backend_features = features;

and:

    if (n->mtu_bypass_backend &&
            !virtio_has_feature(vdev->vio_backend_features, VIRTIO_NET_F_MTU)) {
        features &= ~(1ULL << VIRTIO_NET_F_MTU);
    }

vhost_dev->acked_features seems to mostly reflect
virtio->guest_features (but where in the negotiation cycle?). Except
for vhost_net where is becomes vhost_dev->backend_features

  ./backends/vhost-user.c:87:    b->dev.vho_acked_features = b->vdev->guest_features;
  ./hw/block/vhost-user-blk.c:149:    s->dev.vho_acked_features = vdev->guest_features;
  ./hw/net/vhost_net.c:132:    net->dev.vho_acked_features = net->dev.vho_backend_features;
  ./hw/scsi/vhost-scsi-common.c:53:    vsc->dev.vho_acked_features = vdev->guest_features;
  ./hw/virtio/vhost-user-fs.c:77:    fs->vhost_dev.vho_acked_features = vdev->guest_features;
  ./hw/virtio/vhost-user-i2c.c:46:    i2c->vhost_dev.vho_acked_features = vdev->guest_features;
  ./hw/virtio/vhost-user-rng.c:44:    rng->vhost_dev.vho_acked_features = vdev->guest_features;
  ./hw/virtio/vhost-vsock-common.c:71:    vvc->vhost_dev.vho_acked_features = vdev->guest_features;
  ./hw/virtio/vhost.c:1631:            hdev->vho_acked_features |= bit_mask;

vhost_dev->backend_features has become overloaded with two use cases:

  ./hw/block/vhost-user-blk.c:336:    s->dev.vho_backend_features = 0;
  ./hw/net/vhost_net.c:180:        net->dev.vho_backend_features = qemu_has_vnet_hdr(options->net_backend)
  ./hw/net/vhost_net.c:185:        net->dev.vho_backend_features = 0;
  ./hw/scsi/vhost-scsi.c:220:    vsc->dev.vho_backend_features = 0;
  ./hw/scsi/vhost-user-scsi.c:121:    vsc->dev.vho_backend_features = 0;
  ./hw/virtio/vhost-user.c:2083:        dev->vho_backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
One use for saving the availability of a vhost-net feature and another
for ensuring we add the protocol feature negotiation bit when querying
a vhost backend. Maybe the places where this is queried should really
be bools that can be queried in the appropriate places?

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Stefano Garzarella <sgarzare@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>
---
 include/hw/virtio/vhost.h  | 18 +++++++++++++++---
 include/hw/virtio/virtio.h | 20 +++++++++++++++++++-
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 353252ac3e..502aa5677a 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -88,13 +88,25 @@ struct vhost_dev {
     int vq_index_end;
     /* if non-zero, minimum required value for max_queues */
     int num_queues;
+    /**
+     * vhost feature handling requires matching the feature set
+     * offered by a backend which may be a subset of the total
+     * features eventually offered to the guest.
+     *
+     * @features: available features provided by the backend
+     * @acked_features: final set of negotiated features with the
+     * front-end driver
+     * @backend_features: additional feature bits applied during negotiation
+     *
+     * Finally the @protocol_features is the final protocal feature
+     * set negotiated between QEMU and the backend (after
+     * VHOST_USER_F_PROTOCOL_FEATURES is negotiated)
+     */
     uint64_t features;
-    /** @acked_features: final set of negotiated features */
     uint64_t acked_features;
-    /** @backend_features: backend specific feature bits */
     uint64_t backend_features;
-    /** @protocol_features: final negotiated protocol features */
     uint64_t protocol_features;
+
     uint64_t max_queues;
     uint64_t backend_cap;
     /* @started: is the vhost device started? */
diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index a973811cbf..9939a0a632 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -93,6 +93,12 @@ enum virtio_device_endian {
     VIRTIO_DEVICE_ENDIAN_BIG,
 };
 
+/**
+ * struct VirtIODevice - common VirtIO structure
+ * @name: name of the device
+ * @status: VirtIO Device Status field
+ *
+ */
 struct VirtIODevice
 {
     DeviceState parent_obj;
@@ -100,9 +106,21 @@ struct VirtIODevice
     uint8_t status;
     uint8_t isr;
     uint16_t queue_sel;
-    uint64_t guest_features;
+    /**
+     * These fields represent a set of VirtIO features at various
+     * levels of the stack. @host_features indicates the complete
+     * feature set the VirtIO device can offer to the driver.
+     * @guest_features indicates which features the VirtIO driver can
+     * support. Finally @backend_features represents everything
+     * supported by the backend. This set might be split between stuff
+     * done by QEMU itself and stuff handled by an external backend
+     * (e.g. vhost). As a result some feature bits may be added or
+     * masked from the backend.
+     */
     uint64_t host_features;
+    uint64_t guest_features;
     uint64_t backend_features;
+
     size_t config_len;
     void *config;
     uint16_t config_vector;
-- 
2.34.1


