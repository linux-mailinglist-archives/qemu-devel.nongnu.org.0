Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 841025449CF
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 13:16:58 +0200 (CEST)
Received: from localhost ([::1]:39796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzG9p-0005gx-8f
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 07:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGb-0006Li-AN
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nzEGZ-0007OO-DV
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:15:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654766146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tjGLYUErTNz1MM7O5eV2IFFELJREBPkgmtjcjCmnkhk=;
 b=SAo/r/W/Q0zepk0wxP84u84waNFk0w80vCnDGWtRcEhTiFpjRr1/w74UkTJ99y0KvGG+Fq
 amhd80fjsbI4HhiN6yWIsmeIUomGZRPD4AfklzZyjQ5w4mKIwPYuGM5UdoHtV6pyiaqw6b
 huzPmyjIymtbXdokrD7IiXGmSF1OajY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-Qz6F3tIeNKOLXCpN_Ofkiw-1; Thu, 09 Jun 2022 05:15:45 -0400
X-MC-Unique: Qz6F3tIeNKOLXCpN_Ofkiw-1
Received: by mail-ej1-f69.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso10715206ejj.11
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:15:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tjGLYUErTNz1MM7O5eV2IFFELJREBPkgmtjcjCmnkhk=;
 b=VeOr+MnTFXMeBDYxHYwxetug0GYAt9ljyYBUDfG2j9Cf3zOd+elO33tW0d9kGawofT
 tftnQm5U4ksbZsYckYlTB+ORL0fElmDcyyvXWOaDAQWaKm+bH0Ff4soz+9s0MgAXp0Ha
 KybdAD2oqKf/O6ipozB+8cNV/qKf3K9BcHdTkysSuwbWvl6WqLSFtAQqqGtAYL7NtuJS
 AEn/vtes0IEodf4oOBrbz5MZL92dFPPndGXKvGyaD6nFkavUf76i6m70Lr2W6+w6KUTH
 DZDK1wPKHIbxV1JF+4eVK+wvjtW4Cib6eeBzTtV/gTyS9nI9ajV8qwJUNLVXtusjFViw
 ugGQ==
X-Gm-Message-State: AOAM530yfc+dUOZpzE7BLBfX/PQLkiLUmmJPxRuk6Pcq9sgiJ+ivBzDx
 xHwScUFiDkSNWir2UtRdmomJsESmPcSQigq8ceUDmMwZMKN3NmNAc0D8FbSCwPBJh1q0UlivpbS
 FUOxDP+cpyQke+8pDrhpsd4f5XtNN1rXV9jytJa6jZLI/rgJltNfJrt8lfu2yi1DP9g8=
X-Received: by 2002:a05:6402:4246:b0:42f:3a4b:cc71 with SMTP id
 g6-20020a056402424600b0042f3a4bcc71mr34782545edb.107.1654766144359; 
 Thu, 09 Jun 2022 02:15:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7Kiu+0D60H4FFXSn8A+tPzBpzAI/lJaoMtx5MkncFl9kthJbR45SeYIGorRqaBhbiteSqjg==
X-Received: by 2002:a05:6402:4246:b0:42f:3a4b:cc71 with SMTP id
 g6-20020a056402424600b0042f3a4bcc71mr34782522edb.107.1654766144075; 
 Thu, 09 Jun 2022 02:15:44 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 gj12-20020a170906e10c00b006fed8dfcf78sm10283173ejb.225.2022.06.09.02.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:15:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	thuth@redhat.com
Subject: [PATCH 3/4] virtio: stop ioeventfd on reset
Date: Thu,  9 Jun 2022 11:15:33 +0200
Message-Id: <20220609091534.1416909-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220609091534.1416909-1-pbonzini@redhat.com>
References: <20220609091534.1416909-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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



