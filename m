Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9984654DDDC
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:08:00 +0200 (CEST)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lTr-0008Dl-3S
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvm-0001oh-6h
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvk-0002tU-DX
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4D8ygp9nA66nbZVz6nMpDbUKSxH50YOaceSJW/1gvAw=;
 b=XC2xbJ8mjjKcANRid/vArN8czH1oqwET3C8ZgUT8N+RY8nKHZHH1EHdwVKt3CH5WUQnuEK
 ApFZj86OtgirOwdgtkwsSmuQKeg47WKqeUiMFeT3aSKt+PJdZGT2tHKp1oyNQkV8tOEALw
 mSJTM/P5g45Fb97OZRXEEkzoI6YxIaY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-TaULx0lJNIqHPS3s69S-Sw-1; Thu, 16 Jun 2022 04:32:42 -0400
X-MC-Unique: TaULx0lJNIqHPS3s69S-Sw-1
Received: by mail-ed1-f69.google.com with SMTP id
 s15-20020a056402520f00b004327f126170so775775edd.7
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4D8ygp9nA66nbZVz6nMpDbUKSxH50YOaceSJW/1gvAw=;
 b=b4B5SgkwF1t8npATpP4GzRNDqZWPq7D6wcUaLAcVr8cNipW5gm+dO4NknCqhFYG0O1
 yChyV7tZ3diPmi41b5LQWRJWc6bTa36lmVSQBfewmxHBbwzweJEMLxxGy4pWAgiTW18H
 L1HrS7C38EyQeNIZup8rw9lv6zrOKrf6ALEErtrdOrymGiDHDrfLcP2LTX5gfvu2bWOc
 lO264J1noQQRXs+OIksN0+5VvjPGKI9JX4nrstgN9e/fzYFUOWAkLemppclfgiiPPayy
 6s8gosl00/L2j/NomlUo5CJf8NmDK9OxNSrqef44dLGnRzPK+8jPyIP4SSYhLHNWwNW4
 rJSw==
X-Gm-Message-State: AJIora9/gM68zyX63t4ILomz8fBE1dmfUq4m91Fn4902398bWGGaEK3d
 pWMjwgjdXFqpuyP5coLbHiiPm2gM0raIYqtR1AhA6JUGGQyUHu6B9jcQse8Z/PtK3J7nt8EpV2w
 zap718euKI5DpP9y5TYw9174IF1XLuUglYX+C5N/NNqBQWz+Dd3GJNakatruGWt4YW54=
X-Received: by 2002:aa7:ce84:0:b0:42d:ce51:8c6e with SMTP id
 y4-20020aa7ce84000000b0042dce518c6emr5086201edv.10.1655368361294; 
 Thu, 16 Jun 2022 01:32:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uIVhXqg/CjMVZXxTCIJ9Yg0+salf0TkKduzQ6/R4JgKktKtWa0b9ATh64wy0XG5wSqlfN36A==
X-Received: by 2002:aa7:ce84:0:b0:42d:ce51:8c6e with SMTP id
 y4-20020aa7ce84000000b0042dce518c6emr5086174edv.10.1655368361010; 
 Thu, 16 Jun 2022 01:32:41 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a50fe89000000b0042e09f44f81sm1280820edt.38.2022.06.16.01.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>
Subject: [PULL 13/21] virtio: stop ioeventfd on reset
Date: Thu, 16 Jun 2022 10:32:01 +0200
Message-Id: <20220616083209.117397-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
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

All calls to virtio_bus_reset are preceded by virtio_bus_stop_ioeventfd,
move the call in virtio_bus_reset: that makes sense and clarifies
that the vdc->reset function is called with ioeventfd already stopped.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/s390x/virtio-ccw.c   | 1 -
 hw/virtio/virtio-bus.c  | 1 +
 hw/virtio/virtio-mmio.c | 4 +---
 hw/virtio/virtio-pci.c  | 1 -
 4 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 066a387802..e33e5207ab 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -253,7 +253,6 @@ static void virtio_ccw_reset_virtio(VirtioCcwDevice *dev)
 {
     CcwDevice *ccw_dev = CCW_DEVICE(dev);
 
-    virtio_ccw_stop_ioeventfd(dev);
     virtio_bus_reset(&dev->bus);
     if (dev->indicators) {
         release_indicator(&dev->routes.adapter, dev->indicators);
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d7ec023adf..896feb37a1 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -104,6 +104,7 @@ void virtio_bus_reset(VirtioBusState *bus)
     VirtIODevice *vdev = virtio_bus_get_device(bus);
 
     DPRINTF("%s: reset device.\n", BUS(bus)->name);
+    virtio_bus_stop_ioeventfd(bus);
     if (vdev != NULL) {
         virtio_reset(vdev);
     }
diff --git a/hw/virtio/virtio-mmio.c b/hw/virtio/virtio-mmio.c
index 41a35d31c8..6d81a26473 100644
--- a/hw/virtio/virtio-mmio.c
+++ b/hw/virtio/virtio-mmio.c
@@ -376,8 +376,7 @@ static void virtio_mmio_write(void *opaque, hwaddr offset, uint64_t value,
             return;
         }
         if (value == 0) {
-            virtio_mmio_stop_ioeventfd(proxy);
-            virtio_reset(vdev);
+            virtio_bus_reset(&vdev->bus);
         } else {
             virtio_queue_set_addr(vdev, vdev->queue_sel,
                                   value << proxy->guest_page_shift);
@@ -628,7 +627,6 @@ static void virtio_mmio_reset(DeviceState *d)
     VirtIOMMIOProxy *proxy = VIRTIO_MMIO(d);
     int i;
 
-    virtio_mmio_stop_ioeventfd(proxy);
     virtio_bus_reset(&proxy->bus);
     proxy->host_features_sel = 0;
     proxy->guest_features_sel = 0;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 0566ad7d00..45327f0b31 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1945,7 +1945,6 @@ static void virtio_pci_reset(DeviceState *qdev)
     PCIDevice *dev = PCI_DEVICE(qdev);
     int i;
 
-    virtio_pci_stop_ioeventfd(proxy);
     virtio_bus_reset(bus);
     msix_unuse_all_vectors(&proxy->pci_dev);
 
-- 
2.36.1



