Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 269294CF9AD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 11:13:51 +0100 (CET)
Received: from localhost ([::1]:51356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRANC-0003x1-73
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 05:13:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABs-0000UD-D2
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRABn-0002hT-AI
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:02:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646647322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xYUjGCjqDKAb5NDT97RnxRdsQlEA2CnL9zsqzwpbiAQ=;
 b=eoPD3Ro9b7e/OA2V/jBSK3E9cMcgKWOh20hzU8RyKvQFB8k7iNSDguKI4F0o9nLRjrkUXa
 QwptJfxYu/JsPfF4v1Il3zD6WQwlYnq8CLZ0P0MEI1SFQw+lMBxBw4hykUgL4/gLynNYls
 04z6I7TUvkKT7GCISGEmEI/Cg6rKSHk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-184-8LRMnF3TMMa8IFvh4cubZQ-1; Mon, 07 Mar 2022 05:02:01 -0500
X-MC-Unique: 8LRMnF3TMMa8IFvh4cubZQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 le4-20020a170907170400b006dab546bc40so3492319ejc.15
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xYUjGCjqDKAb5NDT97RnxRdsQlEA2CnL9zsqzwpbiAQ=;
 b=kYrs23zC9N9pJK2p51C3pZw5sxhTe9ffTNLYv0ngyGZ63RC7QD5a+KWZF+0K6gXsjQ
 nwgTGD2UZl3qqIfTCCy3o1jdquj2ZYIQcNfNJWXzmD2FyuIQ9YAm9OF+/BGff38QmBMt
 JkDj4hp7ApRezFxn1EBZVOdN23V24ZlZz1WHJJrVpKsw5Yo6WM4wuE1qmbSY3SgMaevt
 06+VGgjjkR98wXS20IS1hrnMYdTHoHJhYzmmCpOjtX4j9CihwljXtlXUf9fdFYrIRG9a
 I5h07BV/lk2Rd/nc4kjhaDcAWXFbagmPqE85eG1pKcoA/C8EmsvBZiZSdwCg2UkYGk4Z
 IB+g==
X-Gm-Message-State: AOAM530IYg43XPOh1gwuPaRQ+NR/tkQ8qSUOgIhwraWM82GF3+gGuNdP
 0ML9D5FFrJJ0gELZ7iLHngiZVT2mwz6uhhOl2+AEdNM9wA8tijxFmup8KlQd9oADbjg5dA4qiFg
 qHx4mT+YMHbX1CRUG93EempcqpE54XXYmTuEILqFtjgpvwF5SHUQPNmz7+4V5
X-Received: by 2002:a17:907:7d94:b0:6db:207:c0cd with SMTP id
 oz20-20020a1709077d9400b006db0207c0cdmr8218415ejc.362.1646647320114; 
 Mon, 07 Mar 2022 02:02:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC8Zg6VoOxBScylGaqQxjlF6IgAcGpvmaRmbRLiEqVpcxpXp+7JxkitQvgcRIsp2InfoLgHQ==
X-Received: by 2002:a17:907:7d94:b0:6db:207:c0cd with SMTP id
 oz20-20020a1709077d9400b006db0207c0cdmr8218395ejc.362.1646647319880; 
 Mon, 07 Mar 2022 02:01:59 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 y18-20020a170906471200b006da8a883b5fsm4528304ejq.54.2022.03.07.02.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 02:01:59 -0800 (PST)
Date: Mon, 7 Mar 2022 05:01:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/47] hw/vhost-user-i2c: Add support for
 VIRTIO_I2C_F_ZERO_LENGTH_REQUEST
Message-ID: <20220307100058.449628-13-mst@redhat.com>
References: <20220307100058.449628-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220307100058.449628-1-mst@redhat.com>
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


