Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636C4544A3A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:31:51 +0200 (CEST)
Received: from localhost ([::1]:48404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzGOE-0003bo-41
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGe-0006Qm-Sh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGd-0007Op-5p
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhU5hIpnBhngBCDdQdspoAO2R7ca5GkL0HNZN9gkK3Q=;
 b=f1X8ihw8GUwWWLLtWvzHEkwVv+nex6tohGvLyoVBgHMvy0Supjmhzeay0mVW+1s4aun2Y6
 u4MYoW+1SzVM7qX6Wk9rZmgfocGlJWJUaKYkDBXUO9LeZC7KTzH3LgwotvSuSDJkKulTT7
 9PZHnjYflOd5F1DwfxYKCSh/feTkVnM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-Fw6QhQTHM8SNdBYdTYO-mA-1; Thu, 09 Jun 2022 05:15:49 -0400
X-MC-Unique: Fw6QhQTHM8SNdBYdTYO-mA-1
Received: by mail-ej1-f70.google.com with SMTP id
 mb1-20020a170906eb0100b00710c3b46a9aso6080392ejb.22
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhU5hIpnBhngBCDdQdspoAO2R7ca5GkL0HNZN9gkK3Q=;
 b=0F5mhwQQV4JDEQQ3WMz0ubPSMWXJ5B0uc52kKFb4R9RhbEuy3JZ+IotlYakJnuvH7Q
 5audH59+9KocfQGCQnO1BjJ0MABCSV84iAupbN3Ejr4WM2Ju4KVxiQwTyhg2RVnyFUla
 NFYzaJ8QE7K6UaPJPXULBe+ku8K0hpqDTSqtZtxfmkdene/Zj3jVvh4COckbJxglQ7bk
 GCBJb10Nfjwe+AWcljTlamWznrla4dgSKWWKOiyhx4QCuUvrZZrOCvGd2zYJvuCW1Ihi
 91XcL53aeLwCIxRNgnQV0mz/F8esi9/VPNtOHbZcsAewLxDmutIpewFGApBeTKrrmCcB
 Kp3A==
X-Gm-Message-State: AOAM530mUhbH/Q3n+bVKFR+I/Zxcdoto/JZdQIqqDYefGrAhv3kztV5D
 BiA8eZVa70/fS15HGzYH++LN4c2gFMGqzfhsie/WBskLskQtOvOWgUCZ4BtY+BNTCzDx9Qgdj+4
 YhPzsasv8GSEhNqA6er1hOqOmXf/hZT1oIN1ZhMiLpF9dZDDn14AZd/3/7NIMb8r7Z9w=
X-Received: by 2002:aa7:d052:0:b0:42d:d114:43f7 with SMTP id
 n18-20020aa7d052000000b0042dd11443f7mr43039891edo.320.1654766147593; 
 Thu, 09 Jun 2022 02:15:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzhQuKSreGYv6KIB82qXVJMF3aB2ilOx1meG0B6RYHi5p8rNxRS1kT/+Tc8Puwzy0jg0WEZg==
X-Received: by 2002:aa7:d052:0:b0:42d:d114:43f7 with SMTP id
 n18-20020aa7d052000000b0042dd11443f7mr43039866edo.320.1654766147324; 
 Thu, 09 Jun 2022 02:15:47 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 t20-20020a1709066bd400b006fea3702e56sm10354475ejs.79.2022.06.09.02.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:15:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	thuth@redhat.com
Subject: [PATCH 4/4] virtio-mmio: cleanup reset
Date: Thu,  9 Jun 2022 11:15:34 +0200
Message-Id: <20220609091534.1416909-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609091534.1416909-1-pbonzini@redhat.com>
References: <20220609091534.1416909-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

Make virtio_mmio_soft_reset reset the virtio device, which is performed by
both the "soft" and the "hard" reset; and then call virtio_mmio_soft_reset
from virtio_mmio_reset to emphasize that the latter is a superset of the
former.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/virtio/virtio-mmio.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 6d81a26473..d240efef97 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -72,12 +72,12 @@ static void virtio_mmio_soft_reset(VirtIOMMIOProxy *proxy)
 {
     int i;
 
-    if (proxy->legacy) {
-        return;
-    }
+    virtio_bus_reset(&proxy->bus);
 
-    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-        proxy->vqs[i].enabled = 0;
+    if (!proxy->legacy) {
+        for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
+            proxy->vqs[i].enabled = 0;
+        }
     }
 }
 
@@ -376,7 +376,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         if (value == 0) {
-            virtio_bus_reset(&vdev->bus);
+            virtio_mmio_soft_reset(proxy);
         } else {
             virtio_queue_set_addr(vdev, vdev->queue_sel,
                                   value << proxy->guest_page_shift);
@@ -432,7 +432,6 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
         }
 
         if (vdev->status == 0) {
-            virtio_reset(vdev);
             virtio_mmio_soft_reset(proxy);
         }
         break;
@@ -627,7 +626,8 @@ static void virtio_mmio_reset(DeviceState *d)
     VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
     int i;
 
-    virtio_bus_reset(&proxy->bus);
+    virtio_mmio_soft_reset(proxy);
+
     proxy->host_features_sel = 0;
     proxy->guest_features_sel = 0;
     proxy->guest_page_shift = 0;
@@ -636,7 +636,6 @@ static void virtio_mmio_reset(DeviceState *d)
         proxy->guest_features[0] = proxy->guest_features[1] = 0;
 
         for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
-            proxy->vqs[i].enabled = 0;
             proxy->vqs[i].num = 0;
             proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
             proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
-- 
2.36.1


