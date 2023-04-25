Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4829F6EDD1C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:49:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDOU-0002O7-Ih; Tue, 25 Apr 2023 03:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNf-000115-0h
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDNd-0006rl-Dy
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:46:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HdiQFYvQ7qjd5XHe+MOZ4snXbsF1M5K1kc94Srzr2lU=;
 b=QpfzXhun1q2COhjxXVnc6zE8iJN5Xu6HaVupRcQCRhfM+v1/b/e22WXeWWIg2/3GznmxIM
 HlBJNG3vU8xrrB2/5BvkhnvTVX5h9tjfeDvTaHLgdWLJ/SON/cEPWVmvKnqC4oW//3A02f
 WWsTPxIhU3iP9Q4MuImn9Pcp+GgJIZQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-_kZn5AyRNdmYuGOqJvbcAw-1; Tue, 25 Apr 2023 03:46:26 -0400
X-MC-Unique: _kZn5AyRNdmYuGOqJvbcAw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f065208a64so31227295e9.3
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408784; x=1685000784;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HdiQFYvQ7qjd5XHe+MOZ4snXbsF1M5K1kc94Srzr2lU=;
 b=QizEtDREDANTtIQYrt0QMAY3VyOWZpd0UwMafc2LcPUO1M3GPYr/VNX8+G46WLSeiw
 gfEXQ2g7BCJcBt9LiCNEwDm9KpRGqCfK5HAwU71fYkbSp9fD7RgFPgD3KghgCxtFpoil
 Igz3XPQ10Gnp2bh5L9c34dLNe9dMSYKLv6gdWfzDrfJRjTbS0eIr/iwmQ+1utt26jA4j
 ty3eHul4wrzH5mOcD9SSs6xZXxP8BprvMWU+TfuiptGT2Ygg5HLIT3DpSgZOj3jH5AjL
 5OqB6KSMQpkyeIExmjiU97AqQWecrXD6RAvt4Q0U2HFXbdtPZ0Etcy4gCvG1Fv1bkFlj
 Cz6g==
X-Gm-Message-State: AC+VfDwZeBr+2Zqtd4z9LA98yyNrbB/fuXa3pz1l8YDLeOF0B5fYO3Cu
 pAiazKOL9dxUJ567QPR6JsGgvAbgF7B0gKY61CApj/KNMcdcG6WGtv3SAILe1REbvkppSo0IR6z
 +cJezC+bpMOTVpm22NgDj1swndtE4B+usmQF7Wn5Q7bTn8+Ccge5MU7hlqndsAEdAR3Ae
X-Received: by 2002:a1c:f613:0:b0:3f2:5a60:d629 with SMTP id
 w19-20020a1cf613000000b003f25a60d629mr255223wmc.24.1682408784612; 
 Tue, 25 Apr 2023 00:46:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7YIvE3oaWLi3SHpFicGyrxoGUU/yz5Hce5XkFNhQHz76NTkvNjopWL4uYl8qshmuYxTE/f6A==
X-Received: by 2002:a1c:f613:0:b0:3f2:5a60:d629 with SMTP id
 w19-20020a1cf613000000b003f25a60d629mr255201wmc.24.1682408784292; 
 Tue, 25 Apr 2023 00:46:24 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 iz14-20020a05600c554e00b003f175954e71sm17567293wmb.32.2023.04.25.00.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:46:23 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:46:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PULL 25/31] virtio: i2c: Check notifier helpers for
 VIRTIO_CONFIG_IRQ_IDX
Message-ID: <91208dd297f2686b778210ffda49acbfe36bd3b6.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Viresh Kumar <viresh.kumar@linaro.org>

Since the driver doesn't support interrupts, we must return early when
index is set to VIRTIO_CONFIG_IRQ_IDX.

Fixes: 544f0278afca ("virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX")
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
Message-Id: <d53ec8bc002001eafac597f6bd9a8812df989257.1681790067.git.viresh.kumar@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-user-i2c.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/virtio/vhost-user-i2c.c b/hw/virtio/vhost-user-i2c.c
index 60eaf0d95b..4eef3f0633 100644
--- a/hw/virtio/vhost-user-i2c.c
+++ b/hw/virtio/vhost-user-i2c.c
@@ -128,6 +128,14 @@ static void vu_i2c_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
 
+    /*
+     * We don't support interrupts, return early if index is set to
+     * VIRTIO_CONFIG_IRQ_IDX.
+     */
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return;
+    }
+
     vhost_virtqueue_mask(&i2c->vhost_dev, vdev, idx, mask);
 }
 
@@ -135,6 +143,14 @@ static bool vu_i2c_guest_notifier_pending(VirtIODevice *vdev, int idx)
 {
     VHostUserI2C *i2c = VHOST_USER_I2C(vdev);
 
+    /*
+     * We don't support interrupts, return early if index is set to
+     * VIRTIO_CONFIG_IRQ_IDX.
+     */
+    if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        return false;
+    }
+
     return vhost_virtqueue_pending(&i2c->vhost_dev, idx);
 }
 
-- 
MST


