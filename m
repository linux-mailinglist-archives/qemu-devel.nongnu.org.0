Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6A487655
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 12:18:43 +0100 (CET)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5nGc-0005g2-68
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 06:18:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2V-0008EA-3U
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5n2T-0001rC-Gb
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 06:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641553445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z6+ogC/x1lapccbXRX0wQz+1ayPjtYGNbtjSlz3Drok=;
 b=gQ2bkGnFHAEflEdVkHt5+4z2rduXn8fnsPVq5wPRcgqvuZnRvNxTkPWm/3VACNTAGExiVJ
 Rlgh+PVf7UlLVM/aK/u/a0vmCnMkH5fagF9lymTNAxk5nA892Hj1wDXZH/YpwfD1/HEv2x
 +b+8RXl9SrXvsSAhtuVq/kK9oQZDBfg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-BTDcjSEAMiGpGLXBQdhLig-1; Fri, 07 Jan 2022 06:04:04 -0500
X-MC-Unique: BTDcjSEAMiGpGLXBQdhLig-1
Received: by mail-wr1-f69.google.com with SMTP id
 r10-20020adfa14a000000b001a375e65e60so2118557wrr.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 03:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z6+ogC/x1lapccbXRX0wQz+1ayPjtYGNbtjSlz3Drok=;
 b=C7d/sGNajw28oKsMCxWb2Uki3rGRe7H19Fy1eJhnuHUWc2Dl4jnX7102WoohxGkE3G
 XkzI0jH4vsX/cvf/AIlQ2gjJHwc+YW3kZ6bqkXRse3U2/P0q8kyF6jNJ25vtdxh/N8fq
 UWQleSKfWfAYsIHWa+B/+gQUsNArmEnnNXsLqWmlLxUDNmKXrFIi5SstZtNBD1uG8kgg
 WQQoEVEzIepUzBNEjNvWWbQhZI0udfgKGEs0tRBVyPvgUMDf71s8fsawU3J9i1W9m2Sh
 JmuoITOA/cwxZQGZjJIaffzsk25qlze/jNjzNCqbovmvj4xhhmavW7d65LTD7TzH7KhQ
 wUFg==
X-Gm-Message-State: AOAM533GXTL5kxwWaLoe/F/cOgPjPK2IIUCtLaf8wWP3yMLyv1gWwvRj
 nqt3kSKqJVXAJcxQA010eXQEdrQ5sB43ruSxLyprgiJhWMFBxD6exRMg3mO5gQ/NO/f+DFmFPWL
 UCj5BYxhLH1g+EGtyMu+2/1ddo9qIz9wolD+9mYKJb6Jvwr7MRCN9o5SM0xjZ
X-Received: by 2002:a05:600c:3508:: with SMTP id
 h8mr10536100wmq.143.1641553442508; 
 Fri, 07 Jan 2022 03:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxfzodPm7kfsdwy8gpqkUbuS3HWi+Zy8LEGFS3zonSwkvqiR5bYF0sQTNwn9S7vSQkXh8z1Tg==
X-Received: by 2002:a05:600c:3508:: with SMTP id
 h8mr10536076wmq.143.1641553442276; 
 Fri, 07 Jan 2022 03:04:02 -0800 (PST)
Received: from redhat.com ([2.55.16.192])
 by smtp.gmail.com with ESMTPSA id m10sm4108364wms.25.2022.01.07.03.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 03:04:01 -0800 (PST)
Date: Fri, 7 Jan 2022 06:04:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 19/55] vhost-vdpa: stick to -errno error return convention
Message-ID: <20220107102526.39238-20-mst@redhat.com>
References: <20220107102526.39238-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220107102526.39238-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

Almost all VhostOps methods in vdpa_ops follow the convention of
returning negated errno on error.

Adjust the few that don't.  To that end, rework vhost_vdpa_add_status to
check if setting of the requested status bits has succeeded and return
the respective error code it hasn't, and propagate the error codes
wherever it's appropriate.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Message-Id: <20211111153354.18807-8-rvkagan@yandex-team.ru>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 0a4a83713c..ac0cb575fb 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -292,18 +292,34 @@ static int vhost_vdpa_call(struct vhost_dev *dev, unsigned long int request,
     return ret < 0 ? -errno : ret;
 }
 
-static void vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
+static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
 {
     uint8_t s;
+    int ret;
 
     trace_vhost_vdpa_add_status(dev, status);
-    if (vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s)) {
-        return;
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
     }
 
     s |= status;
 
-    vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (!(s & status)) {
+        return -EIO;
+    }
+
+    return 0;
 }
 
 static void vhost_vdpa_get_iova_range(struct vhost_vdpa *v)
@@ -484,7 +500,7 @@ static int vhost_vdpa_set_mem_table(struct vhost_dev *dev,
         }
     }
     if (mem->padding) {
-        return -1;
+        return -EINVAL;
     }
 
     return 0;
@@ -501,14 +517,11 @@ static int vhost_vdpa_set_features(struct vhost_dev *dev,
 
     trace_vhost_vdpa_set_features(dev, features);
     ret = vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
-    uint8_t status = 0;
     if (ret) {
         return ret;
     }
-    vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
-    vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
 
-    return !(status & VIRTIO_CONFIG_S_FEATURES_OK);
+    return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_FEATURES_OK);
 }
 
 static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
@@ -650,12 +663,8 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
     }
 
     if (started) {
-        uint8_t status = 0;
         memory_listener_register(&v->listener, &address_space_memory);
-        vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
-        vhost_vdpa_call(dev, VHOST_VDPA_GET_STATUS, &status);
-
-        return !(status & VIRTIO_CONFIG_S_DRIVER_OK);
+        return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
     } else {
         vhost_vdpa_reset_device(dev);
         vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
-- 
MST


