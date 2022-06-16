Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122854DD5D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 10:49:20 +0200 (CEST)
Received: from localhost ([::1]:47380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lBn-0002c3-1D
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 04:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvo-0001q7-FZ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvm-0002tm-EA
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UhU5hIpnBhngBCDdQdspoAO2R7ca5GkL0HNZN9gkK3Q=;
 b=aESSVmxPFU6sOWN8ZMBYzvFoRBCrOzP3npay+aDU5GclUjfmWt9THdq70mIVjT+BwMprBT
 Euy7kYEV9FZ9j7RFXibyrcKqtynpPMkcvf4jNxfUt9e3Hx9+GKglrQ1Vm7c/Gzkc7c8wHu
 5tl9mzrFE8Cv8HKwMYIIynYCarIlr9Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-kfnJdMFGPSq1HzdBzMMtDw-1; Thu, 16 Jun 2022 04:32:44 -0400
X-MC-Unique: kfnJdMFGPSq1HzdBzMMtDw-1
Received: by mail-ed1-f70.google.com with SMTP id
 a4-20020a056402168400b0042dc5b94da6so767130edv.10
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UhU5hIpnBhngBCDdQdspoAO2R7ca5GkL0HNZN9gkK3Q=;
 b=G6wAKqWz2JIn+tlh9j1vT4gggSUDyT9PN7jn/kT1qEkwE3igI+ZoTgVjvpfhuOKp9n
 OKz6f3mKEVhjKeG5L7yVkvVtpAS1vzoXyfX9ueQlziiC8fDpl+kq313hPccvy00jpe3/
 lSsf/C+ksjX1tAO3bsUNY0HXC4Szywrx2A8ozVSdz0XlsZo23US9AGMYex3yUpThsFZz
 mVwj49X376JR7vvAD5xK+YrcjALih9FO5x8TFitQX1ZVLkxeQhIg6ZityxZ2J40FzC1/
 RaHWAVen7+Hze1WEbsdXGQuxksACFAwz7lPFC4IWRQmr9Px5PtN5tXnbS40FzlETJkp+
 hudA==
X-Gm-Message-State: AJIora8FkzbhbLfFD7PoBFgIXkbM+1FNYiEJSFXkauHpZLyXml5B2YjW
 KKh/3uoNVpoSLaj1yoxuxtiaBiWRktCcm2nWLnfccEwkDaFWc5X5TbRwAOJCL+Wkfll5fvr9CYE
 LHOMa139c6CWhJyuAsFdz75ndSiwYnyY6DvaVbHzygrsIxROGEa0N2ttER4dpxxbo4Ng=
X-Received: by 2002:a05:6402:24a4:b0:434:e43e:2462 with SMTP id
 q36-20020a05640224a400b00434e43e2462mr4957199eda.312.1655368362983; 
 Thu, 16 Jun 2022 01:32:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uyvpTfJA3nq7ylZ8SlcJpBxFrFoOdoKeNzn39/4fOxYAH6/YoM07I6uxGqj1CX//ztQkeAgg==
X-Received: by 2002:a05:6402:24a4:b0:434:e43e:2462 with SMTP id
 q36-20020a05640224a400b00434e43e2462mr4957176eda.312.1655368362641; 
 Thu, 16 Jun 2022 01:32:42 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a056402358300b0042dc25fdf5bsm1331136edc.29.2022.06.16.01.32.41
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:41 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] virtio-mmio: cleanup reset
Date: Thu, 16 Jun 2022 10:32:02 +0200
Message-Id: <20220616083209.117397-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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



