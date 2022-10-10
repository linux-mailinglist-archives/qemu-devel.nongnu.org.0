Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE61C5FA2F6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 19:52:58 +0200 (CEST)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohwxW-0002wL-02
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 13:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaT-0008CO-Eb
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwaP-0006SB-AE
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665422944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nvGXlozHC+df8Bjp/q5u04uDCnJ0h7GQtmXnBTatQbk=;
 b=YDGNasLZjUH9sRfUCqUmv19Q4HdV6p/JJauseK6kW2FbRb6MdexVKMB/shYLgwwlfAWgKx
 a/xVTOkCvxOMcaBLHX9zI0bQvNZ7K2giz7gYGlZaGbt6YMFY/xuR/RV1KcufKO4x8v26u3
 Md0YYKWd1qsDDIA7FG0GYixVCeO0ofw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-408-YvHTMqN6M6uINC-rPaBPAA-1; Mon, 10 Oct 2022 13:29:03 -0400
X-MC-Unique: YvHTMqN6M6uINC-rPaBPAA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u20-20020adfc654000000b0022cc05e9119so2950737wrg.16
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nvGXlozHC+df8Bjp/q5u04uDCnJ0h7GQtmXnBTatQbk=;
 b=4zQQY6SEWKgB2Nkf1tDLSnqOSmu0LfAQlbKJ+RxEC5egKetR/u7CjjCODNsk/5mh+J
 Wzuvz9MlDgETrC2SWYVsigv3jP5StD9IBsuDrONJMMdxlNUEVcQaPjNxFVYsQkFWXjOj
 lD8IQK78ZoxtvxHHgZUfGXvVKut5TJb9yVBjWju2DadpM/sizn3uEzB2T5WogwvgAOya
 jXaQUY1Dei15RsOFgMBmFYfhsuZULCrnXHJLQQwnqItfSQzSguVsi6R/++qcP3Z8I4L7
 14Iv7Xjl39EBbNKBz8o6L9DA65xHNRIX4GoQ/P/TvKYPTc7GNqpJQYsqYD06GCVnSm61
 PlLA==
X-Gm-Message-State: ACrzQf0IENGjv19yLH7XKve0NVZ83GhIlksZ0pWxN2RTJQpAO4ycfoq0
 AjH8NIIei8xnazTEJydz5hJXt83rQ/w0slV9VOXi1xklrDE6F1uMjvaXki4bBxt5AAlKXK+oJ4T
 p280Sau/aizjBzMrGlfsCUc/LdgIrqtGfOR+w6I8U09VuBwGPr76EbaxVi0EG
X-Received: by 2002:a05:6000:1885:b0:22e:7851:b257 with SMTP id
 a5-20020a056000188500b0022e7851b257mr12127296wri.418.1665422942159; 
 Mon, 10 Oct 2022 10:29:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rN232I1sxE53ZMJfjzA7yOYL0lpqi0UTFuSy5memIv55IbfmoAejglhy67jcawMCZ7zbRiw==
X-Received: by 2002:a05:6000:1885:b0:22e:7851:b257 with SMTP id
 a5-20020a056000188500b0022e7851b257mr12127279wri.418.1665422941861; 
 Mon, 10 Oct 2022 10:29:01 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 u9-20020a5d4349000000b0022cdb687bf9sm12062396wrr.0.2022.10.10.10.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:29:01 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:28:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 05/55] hw/virtio: log potentially buggy guest drivers
Message-ID: <20221010172813.204597-6-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

If the guest driver attempts to use the UNUSED(30) bit it is
potentially buggy as 6.3 Legacy Interface: Reserved Feature Bits
states it "SHOULD NOT be negotiated". For now just log this guest
error.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220802095010.3330793-9-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 5d607aeaa0..97a6307c0f 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2980,6 +2980,13 @@ int virtio_set_features(VirtIODevice *vdev, uint64_t val)
     if (vdev->status & VIRTIO_CONFIG_S_FEATURES_OK) {
         return -EINVAL;
     }
+
+    if (val & (1ull << VIRTIO_F_BAD_FEATURE)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: guest driver for %s has enabled UNUSED(30) feature bit!\n",
+                      __func__, vdev->name);
+    }
+
     ret = virtio_set_features_nocheck(vdev, val);
     if (virtio_vdev_has_feature(vdev, VIRTIO_RING_F_EVENT_IDX)) {
         /* VIRTIO_RING_F_EVENT_IDX changes the size of the caches.  */
-- 
MST


