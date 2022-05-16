Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FEC5283CA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 14:03:42 +0200 (CEST)
Received: from localhost ([::1]:41340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZRt-0001sX-Gn
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 08:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8b-0001Rr-4X
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY8Z-0005ev-AF
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8fsb11g7Z/r9felQ/mYfcCmnlXTX8/HfVlLGPmxAWLE=;
 b=bGr9sCMsurGKrcM/sTkwwnlPaNhSrTRizaj+IcMVNoVWkP7Dmn40rfF1pw6awUliiSbZWQ
 ZzTBsg99hT8TJBZs0TSKCv63/hreuA+TtHlkJlWNNaAB/P0Zn+A+kPBkK6hBnbnDKNXaHs
 lHB16kv8GGpXnPo5XTJt2wqGRorFDVQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-xnaEZzODPZ6X7ps8samlGA-1; Mon, 16 May 2022 06:39:37 -0400
X-MC-Unique: xnaEZzODPZ6X7ps8samlGA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u11-20020a056000038b00b0020c9ea8b64fso3787258wrf.2
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8fsb11g7Z/r9felQ/mYfcCmnlXTX8/HfVlLGPmxAWLE=;
 b=3rhvpRZKHzGu6b8lPdTMDko6yaOM9pjPWQLadrIOz93Q9PFAQqxVvccMGEP5twjm+8
 5LE4WrifHEElk53bRAagK8Y3BuDhXap7Hl5uXx/qkCWjoonfr2i/s9GOdr5pDDI6wh6v
 EVNoN+btJuEoeFRrZg1YsBdtvJ+k8IjV5qN45Cw9ScaI/DCmG5/SdIXtvKpCuCOZgJh0
 lveqSyUxIS8ZwdpwIlssFjvZ5IFftkDJ7/W9VjIqA1VFCkbe5CjLDFauh55+WrZfgRf9
 SSQYL77bDEr73pD5N0QYaHSQVYv2SV/m/Vir74SDyhSh3sUuYXloxhvw6JbbNfZI3h5U
 8pCg==
X-Gm-Message-State: AOAM533ut6y5R3O69/r+Qq5kiRe7H4cDoGiow8kWpVGIihmT9cIf+buQ
 yyZBF/15yZYBqcEpsOWtlnwzg0pFUE5cyLcXkOUg92N0nHMP3eEEM/YduxvxvAlzI6G2MnXz6M1
 aNHxtLAnakx8yL1JQsImmYGFjAvTj2jDFk7TeAlDyeh3ElnbzLnOECn6hdT3c
X-Received: by 2002:a5d:64a5:0:b0:20d:af2:ed9f with SMTP id
 m5-20020a5d64a5000000b0020d0af2ed9fmr2524670wrp.271.1652697576186; 
 Mon, 16 May 2022 03:39:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc8fKXe2UoAC/jZ9ErHzpLccaX4SxEir4Z7LS4wIaTOIE9wHavK9X4OtUzL1byizfDNHo5Ig==
X-Received: by 2002:a5d:64a5:0:b0:20d:af2:ed9f with SMTP id
 m5-20020a5d64a5000000b0020d0af2ed9fmr2524642wrp.271.1652697575856; 
 Mon, 16 May 2022 03:39:35 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 j10-20020adfc68a000000b0020c635ca28bsm9225755wrg.87.2022.05.16.03.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:39:35 -0700 (PDT)
Date: Mon, 16 May 2022 06:39:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 68/91] hw/virtio/vhost-user: don't suppress F_CONFIG when
 supported
Message-ID: <20220516095448.507876-69-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Alex Bennée <alex.bennee@linaro.org>

Previously we would silently suppress VHOST_USER_PROTOCOL_F_CONFIG
during the protocol negotiation if the QEMU stub hadn't implemented
the vhost_dev_config_notifier. However this isn't the only way we can
handle config messages, the existing vdc->get/set_config can do this
as well.

Lightly re-factor the code to check for both potential methods and
instead of silently squashing the feature error out. It is unlikely
that a vhost-user backend expecting to handle CONFIG messages will
behave correctly if they never get sent.

Fixes: 1c3e5a2617 ("vhost-user: back SET/GET_CONFIG requests with a protocol feature")
Cc: Maxime Coquelin <maxime.coquelin@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Message-Id: <20220321153037.3622127-13-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user.h |  1 +
 hw/scsi/vhost-user-scsi.c      |  1 +
 hw/virtio/vhost-user.c         | 44 ++++++++++++++++++++++++----------
 3 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/include/hw/virtio/vhost-user.h b/include/hw/virtio/vhost-user.h
index e44a41bb70..6e0e8a71a3 100644
--- a/include/hw/virtio/vhost-user.h
+++ b/include/hw/virtio/vhost-user.h
@@ -22,6 +22,7 @@ typedef struct VhostUserState {
     CharBackend *chr;
     VhostUserHostNotifier notifier[VIRTIO_QUEUE_MAX];
     int memory_slots;
+    bool supports_config;
 } VhostUserState;
 
 bool vhost_user_init(VhostUserState *user, CharBackend *chr, Error **errp);
diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
index 1b2f7eed98..9be21d07ee 100644
--- a/hw/scsi/vhost-user-scsi.c
+++ b/hw/scsi/vhost-user-scsi.c
@@ -121,6 +121,7 @@ static void vhost_user_scsi_realize(DeviceState *dev, Error **errp)
     vsc->dev.backend_features = 0;
     vqs = vsc->dev.vqs;
 
+    s->vhost_user.supports_config = true;
     ret = vhost_dev_init(&vsc->dev, &s->vhost_user,
                          VHOST_BACKEND_TYPE_USER, 0, errp);
     if (ret < 0) {
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 6c8f722262..b0d417651d 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1949,14 +1949,15 @@ static int vhost_user_postcopy_notifier(NotifierWithReturn *notifier,
 static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
                                    Error **errp)
 {
-    uint64_t features, protocol_features, ram_slots;
+    uint64_t features, ram_slots;
     struct vhost_user *u;
+    VhostUserState *vus = (VhostUserState *) opaque;
     int err;
 
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_USER);
 
     u = g_new0(struct vhost_user, 1);
-    u->user = opaque;
+    u->user = vus;
     u->dev = dev;
     dev->opaque = u;
 
@@ -1967,6 +1968,10 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
     }
 
     if (virtio_has_feature(features, VHOST_USER_F_PROTOCOL_FEATURES)) {
+        bool supports_f_config = vus->supports_config ||
+            (dev->config_ops && dev->config_ops->vhost_dev_config_notifier);
+        uint64_t protocol_features;
+
         dev->backend_features |= 1ULL << VHOST_USER_F_PROTOCOL_FEATURES;
 
         err = vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
@@ -1976,19 +1981,34 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
             return -EPROTO;
         }
 
-        dev->protocol_features =
-            protocol_features & VHOST_USER_PROTOCOL_FEATURE_MASK;
+        /*
+         * We will use all the protocol features we support - although
+         * we suppress F_CONFIG if we know QEMUs internal code can not support
+         * it.
+         */
+        protocol_features &= VHOST_USER_PROTOCOL_FEATURE_MASK;
 
-        if (!dev->config_ops || !dev->config_ops->vhost_dev_config_notifier) {
-            /* Don't acknowledge CONFIG feature if device doesn't support it */
-            dev->protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
-        } else if (!(protocol_features &
-                    (1ULL << VHOST_USER_PROTOCOL_F_CONFIG))) {
-            error_setg(errp, "Device expects VHOST_USER_PROTOCOL_F_CONFIG "
-                       "but backend does not support it.");
-            return -EINVAL;
+        if (supports_f_config) {
+            if (!virtio_has_feature(protocol_features,
+                                    VHOST_USER_PROTOCOL_F_CONFIG)) {
+                error_setg(errp, "vhost-user device %s expecting "
+                           "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-user backend does "
+                           "not support it.", dev->vdev->name);
+                return -EPROTO;
+            }
+        } else {
+            if (virtio_has_feature(protocol_features,
+                                   VHOST_USER_PROTOCOL_F_CONFIG)) {
+                warn_reportf_err(*errp, "vhost-user backend supports "
+                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
+                                 "device %s but QEMU does not.",
+                                 dev->vdev->name);
+                protocol_features &= ~(1ULL << VHOST_USER_PROTOCOL_F_CONFIG);
+            }
         }
 
+        /* final set of protocol features */
+        dev->protocol_features = protocol_features;
         err = vhost_user_set_protocol_features(dev, dev->protocol_features);
         if (err < 0) {
             error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
-- 
MST


