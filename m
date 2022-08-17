Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884FE597449
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:41:00 +0200 (CEST)
Received: from localhost ([::1]:38436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOM6E-00078M-G8
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgt-0007sB-Pl
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOLgr-0001QO-D3
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 12:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660752884;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DV2CGvKwhVU6MHqdfffqDvMvVM56xezMHq/D8UxHfEk=;
 b=WwzOgjNhrosGvTZz5DdpAYvxvWa11FYTMMjdM2T4E0ewn7fou8ELwLVmwFgvhtBhSFzZ9j
 CURb+XRqTVeeCElg2MILvu3HfLq7auku849WipHm+lIx3EPH91V4MUegVyuaISWyJu7Rhx
 cFTBzhyNHR0r3g36ppbWKNgm9yrZVIU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-446-B27zF3UkNxeGpoxaOGaKLg-1; Wed, 17 Aug 2022 12:14:41 -0400
X-MC-Unique: B27zF3UkNxeGpoxaOGaKLg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r67-20020a1c4446000000b003a5fa79008bso1268540wma.5
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 09:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=DV2CGvKwhVU6MHqdfffqDvMvVM56xezMHq/D8UxHfEk=;
 b=IXtQd27a8fErJuf1EJNHZj33FOWek34l3/4yFg+T+gIXxt6asI8apLCk7hVqc3R3HH
 4J2HPvqFkswy4jG4qBwS6FZuoiwJNA/L9/6skL5ondmswzsq0EkO5Q+u57bWLS0ftIPN
 29hgH75kaNzcWjb6PkGnyhKh4cRl4Ic65RRf7w6etvh3yd1ufhrvw5sQ0E94OyGoK8Fe
 17uIHjWdBVQA7OCMtOlbU3sYBiRhj4l3suoz0GPIb4bjyJpr+TNb8/lltRF9YvioZK5m
 GuJnt8k31Hso0EoHP/lLGbDxfPfejdpeQu3++9MG6T9V5AenPYygm/V/8IbWG0zmnIH7
 Djow==
X-Gm-Message-State: ACgBeo2iGfmjrIPzckZXmzMLtmN3Z3F1aijKX24iKOduGdhBWkbEvMAT
 egCdIqX/Mx3Xul+AU5vbRjR8VFv+dKVEeY9V72Ih5WpTtOCOMnVTglIrk2f4JoOjj0J5DSQ8JH7
 jhhmZgEF5TLFO9Cn67KA+JNuoQwq4yYtNW2tdA3diznVNJlqAp/MgBnWQs7Ky
X-Received: by 2002:a05:600c:5022:b0:3a6:ad4:1c6 with SMTP id
 n34-20020a05600c502200b003a60ad401c6mr2617282wmr.177.1660752879692; 
 Wed, 17 Aug 2022 09:14:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77rB/xpdrJ8XduCTKKzxFBltKSaoRyt5HEEidQLtubQHzqYtnsIkFgqMPV4w8MaMtLtSuPPg==
X-Received: by 2002:a05:600c:5022:b0:3a6:ad4:1c6 with SMTP id
 n34-20020a05600c502200b003a60ad401c6mr2617270wmr.177.1660752879332; 
 Wed, 17 Aug 2022 09:14:39 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 bt22-20020a056000081600b002251e86241csm4079931wrb.48.2022.08.17.09.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 09:14:38 -0700 (PDT)
Date: Wed, 17 Aug 2022 12:14:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 02/10] hw/virtio: gracefully handle unset vhost_dev vdev
Message-ID: <20220817161342.240674-3-mst@redhat.com>
References: <20220817161342.240674-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817161342.240674-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

I've noticed asserts firing because we query the status of vdev after
a vhost connection is closed down. Rather than faulting on the NULL
indirect just quietly reply false.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220728135503.1060062-3-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 0827d631c0..f758f177bb 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -306,7 +306,7 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
     dev->log_size = size;
 }
 
-static int vhost_dev_has_iommu(struct vhost_dev *dev)
+static bool vhost_dev_has_iommu(struct vhost_dev *dev)
 {
     VirtIODevice *vdev = dev->vdev;
 
@@ -316,8 +316,12 @@ static int vhost_dev_has_iommu(struct vhost_dev *dev)
      * does not have IOMMU, there's no need to enable this feature
      * which may cause unnecessary IOTLB miss/update transactions.
      */
-    return virtio_bus_device_iommu_enabled(vdev) &&
-           virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    if (vdev) {
+        return virtio_bus_device_iommu_enabled(vdev) &&
+            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
+    } else {
+        return false;
+    }
 }
 
 static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
-- 
MST


