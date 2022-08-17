Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F63659775D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 22:10:51 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOPNK-00017L-Ce
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 16:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIi-0002tG-Jm
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oOPIf-0000E6-Vu
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 16:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660766761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DV2CGvKwhVU6MHqdfffqDvMvVM56xezMHq/D8UxHfEk=;
 b=bd9lb73+sWzYFP92gYK4P74XVsqYYSAo6h+ZB4SH0rugJsdou++oFmO/dRB9/ZHD8sNkX5
 vMfurZm3hBBba0LrZJdxbbJVHjmcay5x5AanwY4znaLgztVSY1QXkcZHqJG9LwHCedrGBs
 aJiX329LQY5wM8zr9d+IjC1wmbmo7b0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-286-JDqFfRhWPVeeLT6RoARiwQ-1; Wed, 17 Aug 2022 16:05:59 -0400
X-MC-Unique: JDqFfRhWPVeeLT6RoARiwQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j22-20020a05600c485600b003a5e4420552so1533567wmo.8
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 13:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=DV2CGvKwhVU6MHqdfffqDvMvVM56xezMHq/D8UxHfEk=;
 b=ozctaTGrGQ5LQRIWk0B/C1392INCQSMAXN2eILD1/6hGbeTWAGTMBKF8qepaOea02L
 HqLBv2QrSm5fTOVfsQjPEjtEtJOS0ctJ4PFFg+oUFy28AbkaMr3CaqOr4ETExPd1BsP2
 w1+1JFkjFkV0ygtLAUAKWwMQgUxB53SznSEmVq9MHP1HvMOxN+/SviE/eXTKedOtXIk8
 +5OIY8Ax8DS4PBX893jLPr9W7+6VWqNtjze/nPrJnOsLokiZJpEU9v3UcThQ6+1VaeIp
 /yEv8Lsz7I6usWN+b/oesSr6cOdtOvAAbr/+kRZFe6zOxATr7HSi6BN9g0IvHs+HKoe8
 u96g==
X-Gm-Message-State: ACgBeo0gvgfGFHnCm/FYpBZCo4iE1D1SULwyMGdWX4Hfvnf/La1B6IBy
 GZHaxOrAXTd11xMERBm7shS1818A4xwrLbuJ6dL/5RXveKGCW4SkHjK+C6FNLW1oYBul7VLt8Tp
 o27I13dnme1csNL5Wh3Ir1Wa4phTfxX34AHB9B+o6DBecKQM7TQuZ4fPkol9j
X-Received: by 2002:adf:ecce:0:b0:225:2c58:246f with SMTP id
 s14-20020adfecce000000b002252c58246fmr660139wro.460.1660766758201; 
 Wed, 17 Aug 2022 13:05:58 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6dGCuTb0RrUT48xfiv48zL+V1X06tcqTxoRQUxC5CMSdJeyBR/zinRb/nT120qUKbZX4+g0A==
X-Received: by 2002:adf:ecce:0:b0:225:2c58:246f with SMTP id
 s14-20020adfecce000000b002252c58246fmr660133wro.460.1660766757923; 
 Wed, 17 Aug 2022 13:05:57 -0700 (PDT)
Received: from redhat.com ([2.55.4.37]) by smtp.gmail.com with ESMTPSA id
 u26-20020a05600c00da00b003a4f1385f0asm3061151wmm.24.2022.08.17.13.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Aug 2022 13:05:57 -0700 (PDT)
Date: Wed, 17 Aug 2022 16:05:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 02/12] hw/virtio: gracefully handle unset vhost_dev vdev
Message-ID: <20220817200536.350795-3-mst@redhat.com>
References: <20220817200536.350795-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817200536.350795-1-mst@redhat.com>
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


