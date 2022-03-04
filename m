Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581404CD5E9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 15:07:21 +0100 (CET)
Received: from localhost ([::1]:60840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8aW-0003ZO-Dx
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 09:07:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89B-0000VH-OH
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ89A-0000Uw-9K
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:39:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646401143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xYUjGCjqDKAb5NDT97RnxRdsQlEA2CnL9zsqzwpbiAQ=;
 b=CNAeKk+teapYSwQqCFbPfWFXPhqPfVL27dJr6E6q7I6VQmpvzcV35W5+9hix6YoH6uBy3+
 TBGkIgR46xq6QGiDS0/f6GZpDrCPy0xfNKMJa/wjh09OHc+udUUHTAQZVqjpvG4MHrIvT4
 lr9qDxjOWlzYNl9GHKKsnupthooheM4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-AmOPkJl3MW2DIABbqANX3Q-1; Fri, 04 Mar 2022 08:39:03 -0500
X-MC-Unique: AmOPkJl3MW2DIABbqANX3Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 h11-20020a5d430b000000b001f01a35a86fso3366577wrq.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 05:39:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xYUjGCjqDKAb5NDT97RnxRdsQlEA2CnL9zsqzwpbiAQ=;
 b=Cm5bwOWU6WxTXIr/CosAdbJYtE/MmEvoWeMX8BVew6o/bGKkO7bx68fRfBxQkbCIOW
 Hm5vtYYIDXgDJf+m/7s/zjG5UjyI6L/DhJlJzTPQvDBT6uG50zEuONmo09ghk2iEH/z7
 DATTocsHjCExt46PmGL9nAsZsjMdA85haFKVA9H8T6i4vdTN/AKBIcqP83CpSwERwqBM
 72eIAc+FJY5ioWuAK3sC9rc+WwT5zTw7WWKsVv4kQBmU7J8qUhE2QxEFSHC7noQhjzWw
 f7042Z+taiSQl1s4U3hYd3rrhxiwhnEpXenZT22+MP/HYdX3CPYwR9g2FYwwbZZqC1C4
 e/DQ==
X-Gm-Message-State: AOAM531S58VX8scoogTjOwRsTwTloi98hkHR4TH9X6nG8z3ASFmJgiwX
 AsVEGFsV+qoSWfRbFnznwk2XF6d1km/ifAgmf9HS8+B85PxhqNdH7Cnsm8/SfgToauLQ1BuUpdN
 50RJM3d4j2SzxmQZ+0cah4OzEQUu0fWnaMDHVcP7JdKejPNIR83P8+5EmufN+
X-Received: by 2002:a05:600c:4982:b0:380:e458:dbd9 with SMTP id
 h2-20020a05600c498200b00380e458dbd9mr7732761wmp.49.1646401141385; 
 Fri, 04 Mar 2022 05:39:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt+admyhqKKOBjOKp/Z0pGp+BebFUpYRYGN629SPNLs18f1lPMK/okFMOUm+hqeD4WVBRkyA==
X-Received: by 2002:a05:600c:4982:b0:380:e458:dbd9 with SMTP id
 h2-20020a05600c498200b00380e458dbd9mr7732742wmp.49.1646401141080; 
 Fri, 04 Mar 2022 05:39:01 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 a3-20020a7bc1c3000000b00380e493660esm11183768wmj.42.2022.03.04.05.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 05:38:55 -0800 (PST)
Date: Fri, 4 Mar 2022 08:38:52 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/45] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Message-ID: <20220304133556.233983-13-mst@redhat.com>
References: <20220304133556.233983-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220304133556.233983-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


