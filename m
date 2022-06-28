Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0BE55BE78
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:41:05 +0200 (CEST)
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63y6-00005t-FM
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:41:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o634D-0000NF-Jv
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o634C-0006tY-1a
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656391391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mn/g7m0RmM5cceBjPMwfMkeTDlaWZwcXKTll3LlqMLQ=;
 b=N90Ej6LPlPewDm/o07wgXGkw6l9omowsS31ACDq7OZbyUiKO6VMaIEax2GARAUWCJo8s8Q
 EQWZcU/QNdFbfsBbOJ6K0Yb034tF2LCr/Gi9inho2sbYS4pEUCW9lbxJl92heE+cPS/sJf
 NFL6BDAvvpi36OO7Skr0dl87EZ+dfIY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-m4bKAoQ-OyCNv69Ot8YPZA-1; Tue, 28 Jun 2022 00:43:08 -0400
X-MC-Unique: m4bKAoQ-OyCNv69Ot8YPZA-1
Received: by mail-wm1-f69.google.com with SMTP id
 z11-20020a05600c0a0b00b003a043991610so4282223wmp.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Mn/g7m0RmM5cceBjPMwfMkeTDlaWZwcXKTll3LlqMLQ=;
 b=kIQoQcvlHHPsF2+cJ6WmZbKv5IS7lbRj1iEMcHIELNVLZxWvEm+3D5Fr/bf95QjMpB
 zksYuJf0b8VmlDv/3NIgKKIC0J3FZIsy4FqsZWqCYzHs9Vcelv54jIq+qravJRI9DQl+
 aZE59w76ImlwM/Q0WUbhN4goUjbPwL4ZuOSHnhf0R9Jja27k6CA41NOXndqns60qGFgX
 VAD2D2fif3JRakjoN8JsSZFNPcVWycwZVnFpMQ3KFLFeVKS6qATUWDt5RmkklT9ntPFQ
 Xl9Hk1ey4lxEeHi2SpPfBRyWWbOx4QI7s8JyeoIyRMKrYJx3I3YHRSxUkeQhIkIKpr0O
 Jmmw==
X-Gm-Message-State: AJIora+UIa0hksoSAQ13fQEi8CC6lNVJQsBia4A9qs0vn+Fyekk48mwl
 1UkXgIg4rMK9ItHR2Pv+Snr3mhWwVNg+LPANJ49mw28p3M7DScRL+XR74geUvksXGNoa17fQtwS
 0JNt8+rCCKkKD1bhIRpQcpzj9ksU02sk7VjVJPNFvTHw+BZRsfvVug7uJmy5U
X-Received: by 2002:a05:6000:911:b0:21d:2100:b97b with SMTP id
 bz17-20020a056000091100b0021d2100b97bmr274225wrb.649.1656391387402; 
 Mon, 27 Jun 2022 21:43:07 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uK/vJbCO7r6NO0Sxj35m9uOgC2de0/4dOqiJVgJdT6jA+3FVCc9igC4VbvmRliQ75a4K4ydA==
X-Received: by 2002:a05:6000:911:b0:21d:2100:b97b with SMTP id
 bz17-20020a056000091100b0021d2100b97bmr274209wrb.649.1656391387143; 
 Mon, 27 Jun 2022 21:43:07 -0700 (PDT)
Received: from redhat.com ([2.52.23.204]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d6b8c000000b0020c5253d8fcsm14641936wrx.72.2022.06.27.21.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:43:06 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:43:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 12/12] include/hw/virtio: document vhost_ack_features
Message-ID: <20220628044201.217173-13-mst@redhat.com>
References: <20220628044201.217173-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220628044201.217173-1-mst@redhat.com>
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220524154056.2896913-5-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/hw/virtio/vhost.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index bfc71b7c50..a346f23d13 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -260,6 +260,16 @@ void vhost_virtqueue_mask(struct vhost_dev *hdev, VirtIODevice *vdev, int n,
  */
 uint64_t vhost_get_features(struct vhost_dev *hdev, const int *feature_bits,
                             uint64_t features);
+
+/**
+ * vhost_ack_features() - set vhost acked_features
+ * @hdev: common vhost_dev structure
+ * @feature_bits: pointer to terminated table of feature bits
+ * @features: requested feature set
+ *
+ * This sets the internal hdev->acked_features to the intersection of
+ * the backends advertised features and the supported feature_bits.
+ */
 void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
                         uint64_t features);
 bool vhost_has_free_slot(void);
-- 
MST


