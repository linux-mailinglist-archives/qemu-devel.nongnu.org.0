Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731DD4D0B79
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:50:33 +0100 (CET)
Received: from localhost ([::1]:59618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRMBU-00061s-GB
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:50:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6N-0006CI-Nh
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRM6L-0005PV-Jt
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:45:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646693113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xYUjGCjqDKAb5NDT97RnxRdsQlEA2CnL9zsqzwpbiAQ=;
 b=KxK7m0sHzgx+Dfdtb2GxY1IzlxTJmXrXEPNuRGdZaOk98a5YTmzhjbmjylK2VFBER/D4dL
 y4YI9jK0gquCzvbQ3ZrIYS/F1q27OlauL9wCmb96Bd1PnDkPwYX2bVAEAObo7x075TSwFY
 HUgh7jpWwupK21hiVFduevaHUIB4Zpw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-568-EIIbyrLmP5a4LmUl9cmj_Q-1; Mon, 07 Mar 2022 17:45:12 -0500
X-MC-Unique: EIIbyrLmP5a4LmUl9cmj_Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 v67-20020a1cac46000000b00383e71bb26fso5575322wme.1
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 14:45:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xYUjGCjqDKAb5NDT97RnxRdsQlEA2CnL9zsqzwpbiAQ=;
 b=4WyF5/URl6ei1ij4nE/it6FwtTrCZP42W0es4B45cj1UlBz+Wk4j6dt8iIaT1bQwhN
 siMKcE9UwatgMcqrUuHPXli7tmGGvnKUZB6Axvgg9sbBPjfa7KjT2yOMFL6iAgwJSMaZ
 dcv00mMveOi+ayuXJeWYaUpbdbQNWuAu2XANAb8R7SwYnfbRgK2K9Yu2DKnF4lDFtnr6
 3wJr1Xbs+1g/18ArWVGxOL3+/atijdeYAKqvKoHxVteGkXvQpy8NEY/eH5m0sPCNFa4J
 paGkVBLgQMK3PGZytPWVcGH6l6pl7ZCfqvk0sOkzKZST9ggkL0lfAsns7rvFFHlMZ7yw
 esaA==
X-Gm-Message-State: AOAM532Xa3Po4y37bfYYZgCuL8IUXHwFDZh5ObSJYmYQ8xFfwFiyRLMc
 nZoRpvJqu6Q7Ok2Zvn1oxlcteMP3ZGZIup8PpQOHml/89Bq/ycrHcnf7jDY+ldAp+Oasb8vXieq
 tz47H3kAznriLx1hQ7eoM3EARYFmZ8ciwve2ws8HE+GToXcgimHYOfaRPxQ1s
X-Received: by 2002:a05:6000:1a86:b0:1f0:3437:86af with SMTP id
 f6-20020a0560001a8600b001f0343786afmr9910249wry.700.1646693110725; 
 Mon, 07 Mar 2022 14:45:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTFFulLOXy8bVaFtIWCGXXB3aycp4KOfREITQBriOu2MSTAj1UD2HKRQ7LYsZ6rbcvPqV2Xg==
X-Received: by 2002:a05:6000:1a86:b0:1f0:3437:86af with SMTP id
 f6-20020a0560001a8600b001f0343786afmr9910237wry.700.1646693110459; 
 Mon, 07 Mar 2022 14:45:10 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 r5-20020a5d4945000000b001f06372fa9fsm18755313wrs.54.2022.03.07.14.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 14:45:09 -0800 (PST)
Date: Mon, 7 Mar 2022 17:45:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v4 12/47] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Message-ID: <20220307224357.682101-13-mst@redhat.com>
References: <20220307224357.682101-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307224357.682101-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Viresh Kumar <viresh.kumar@linaro.org>

VIRTIO_I2C_F_ZERO_LENGTH_REQUEST is a mandatory feature, that must be
implemented by everyone. Add its support.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <fc47ab63b1cd414319c9201e8d6c7705b5ec3bd9.1644490993.git.viresh.kumar@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/virtio/vhost-user-i2c.h |  3 +++
 hw/virtio/vhost-user-i2c.c         | 11 +++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/vhost-user-i2c.h b/include/hw/virtio/vhost-user-i2c.h
index deae47a76d..d8372f3b43 100644
--- a/include/hw/virtio/vhost-user-i2c.h
+++ b/include/hw/virtio/vhost-user-i2c.h
@@ -25,4 +25,7 @@ struct VHostUserI2C {
     bool connected;
 };
 
+/* Virtio Feature bits */
+#define VIRTIO_I2C_F_ZERO_LENGTH_REQUEST		0
+
 #endif /* _QEMU_VHOST_USER_I2C_H */
diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index d172632bb0..42c7f6d9e5 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -19,6 +19,11 @@
 #define VIRTIO_ID_I2C_ADAPTER                34
 #endif
 
+static const int feature_bits[] = {
+    VIRTIO_I2C_F_ZERO_LENGTH_REQUEST,
+    VHOST_INVALID_FEATURE_BIT
+};
+
 static void vu_i2c_start(VirtIODevice *vdev)
 {
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
@@ -113,8 +118,10 @@ static void vu_i2c_set_status(VirtIODevice *vdev, uint8_t status)
 static uint64_t vu_i2c_get_features(VirtIODevice *vdev,
                                     uint64_t requested_features, Error **errp)
 {
-    /* No feature bits used yet */
-    return requested_features;
+    VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
+
+    virtio_add_feature(&requested_features, VIRTIO_I2C_F_ZERO_LENGTH_REQUEST);
+    return vhost_get_features(&i2c->vhost_dev, feature_bits, requested_features);
 }
 
 static void vu_i2c_handle_output(VirtIODevice *vdev, VirtQueue *vq)
-- 
MST


