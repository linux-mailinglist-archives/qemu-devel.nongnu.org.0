Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C91488059
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 02:13:23 +0100 (CET)
Received: from localhost ([::1]:55110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n60IM-0003dn-48
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 20:13:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609D-0002xH-SO
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n609C-0002In-0z
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 20:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641603833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ClYbQ4kuyaz5beNK9wuLMbdICDpNeUV54F3CfDPsyqg=;
 b=eVVYE+H5p0Bf1M3F8UwazjtYfaIgJXZaBVLuztFULgHPO6FEBOIT5AEpVDn0v/Dk5ir4Ek
 GjMB5DqPyayHTs4GvDq1Lanm9kk08j7Bya6XbTO6yUF0uI8KhKHpgiBWT4sBHjRVKgWWIr
 lfg5P5VXwdIwyGbmeKSnCKD2wPAgGDk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-9itnuNlUOzCeW5slDU1bpg-1; Fri, 07 Jan 2022 20:03:52 -0500
X-MC-Unique: 9itnuNlUOzCeW5slDU1bpg-1
Received: by mail-wm1-f72.google.com with SMTP id
 r65-20020a1c4444000000b003478a458f01so2179045wma.4
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 17:03:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ClYbQ4kuyaz5beNK9wuLMbdICDpNeUV54F3CfDPsyqg=;
 b=zewIkDB/jw+YyaJpCV49MuWY3fZEIcWNfXMebhPzmS8YMRgqFwLwKMyZZKM/Wo/tRm
 BGUslHwzUdCeuX2BqZCh1b6ONx5mSlZb2Gwq090R9NQk/O4zwigBjobGe26EKX6O27LP
 0C6FkKr/zpcF27IhEqpXkg+JByNN5gOLVSxXMyHu01ROIg7UTRcMP/LWwwrRZb3c4iYA
 QIMUbM6IwVsRWq7jCUiYog0OLB11Kev/TnfEtHNxbQG8vPe7wlp3CFPVMldH5cel+jbu
 oyvrpXcRcaw/o0iigju+j5m1DUoCcCacIONwEkL/K2LKSCEkBMkL80+TQny1ck3iI2fp
 J0cg==
X-Gm-Message-State: AOAM533HtHYfmDTsFJ/SRq/Y4QZGK+CwsLRCigRRkT3ugwp7kV4qjj46
 ecNkAGSyM+tAJk/XBQe9Ek5LGdy0YYx2OD+ytJ03rR1gLJjcabTnbdsM9AOh+cWwlHP/0/CKJEF
 MGip4JrxRJoSPUybhNfjXx0NSgO6PMAWKqd5tNczux6v/j2Dov2Wo5C0V/kVi
X-Received: by 2002:a05:600c:34c4:: with SMTP id
 d4mr13089829wmq.53.1641603830786; 
 Fri, 07 Jan 2022 17:03:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxR3xVGkjAMuPaFjO4R9Zs2tqakAqC7D0kXa3DiIyEY8UgD02WLW2L4d2lfh3BZTX/nX0aFwQ==
X-Received: by 2002:a05:600c:34c4:: with SMTP id
 d4mr13089815wmq.53.1641603830457; 
 Fri, 07 Jan 2022 17:03:50 -0800 (PST)
Received: from redhat.com ([147.161.13.99])
 by smtp.gmail.com with ESMTPSA id o15sm217796wri.106.2022.01.07.17.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 17:03:50 -0800 (PST)
Date: Fri, 7 Jan 2022 20:03:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 05/55] virtio-pci: decouple the single vector from the
 interrupt process
Message-ID: <20220108003423.15830-6-mst@redhat.com>
References: <20220108003423.15830-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220108003423.15830-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cindy Lu <lulu@redhat.com>

To reuse the interrupt process in configure interrupt
Need to decouple the single vector from the interrupt process. Add new function
kvm_virtio_pci_vector_use_one and _release_one. These functions are use
for the single vector, the whole process will finish in a loop for the vq number.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20211104164827.21911-4-lulu@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 131 +++++++++++++++++++++++------------------
 1 file changed, 73 insertions(+), 58 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 4bdb6e5694..7201cf3dc1 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -677,7 +677,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_dev,
 }
 
 static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
-                                        unsigned int queue_no,
                                         unsigned int vector)
 {
     VirtIOIRQFD *irqfd = &proxy->vector_irqfd[vector];
@@ -740,87 +739,103 @@ static int virtio_pci_get_notifier(VirtIOPCIProxy *proxy, int queue_no,
     return 0;
 }
 
-static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+static int kvm_virtio_pci_vector_use_one(VirtIOPCIProxy *proxy, int queue_no)
 {
+    unsigned int vector;
+    int ret;
+    EventNotifier *n;
     PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
-    unsigned int vector;
-    int ret, queue_no;
-    EventNotifier *n;
-    for (queue_no = 0; queue_no < nvqs; queue_no++) {
-        if (!virtio_queue_get_num(vdev, queue_no)) {
-            break;
-        }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        ret = kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
+
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return ret;
+    }
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return 0;
+    }
+    ret = kvm_virtio_pci_vq_vector_use(proxy, vector);
+    if (ret < 0) {
+        goto undo;
+    }
+    /*
+     * If guest supports masking, set up irqfd now.
+     * Otherwise, delay until unmasked in the frontend.
+     */
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
         if (ret < 0) {
+            kvm_virtio_pci_vq_vector_release(proxy, vector);
             goto undo;
         }
-        /* If guest supports masking, set up irqfd now.
-         * Otherwise, delay until unmasked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = kvm_virtio_pci_irqfd_use(proxy, n, vector);
-            if (ret < 0) {
-                kvm_virtio_pci_vq_vector_release(proxy, vector);
-                goto undo;
-            }
-        }
     }
-    return 0;
 
+    return 0;
 undo:
-    while (--queue_no >= 0) {
-        vector = virtio_queue_vector(vdev, queue_no);
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
+
+    vector = virtio_queue_vector(vdev, queue_no);
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return ret;
+    }
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+        if (ret < 0) {
+            return ret;
         }
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-            if (ret < 0) {
-                break;
-            }
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    }
+    return ret;
+}
+static int kvm_virtio_pci_vector_use(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+    int ret = 0;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
+    for (queue_no = 0; queue_no < nvqs; queue_no++) {
+        if (!virtio_queue_get_num(vdev, queue_no)) {
+            return -1;
         }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+        ret = kvm_virtio_pci_vector_use_one(proxy, queue_no);
     }
     return ret;
 }
 
-static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+
+static void kvm_virtio_pci_vector_release_one(VirtIOPCIProxy *proxy,
+                                              int queue_no)
 {
-    PCIDevice *dev = &proxy->pci_dev;
     VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
     unsigned int vector;
-    int queue_no;
-    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
     EventNotifier *n;
-    int ret ;
+    int ret;
+    VirtioDeviceClass *k = VIRTIO_DEVICE_GET_CLASS(vdev);
+    PCIDevice *dev = &proxy->pci_dev;
+
+    ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
+    if (ret < 0) {
+        return;
+    }
+    if (vector >= msix_nr_vectors_allocated(dev)) {
+        return;
+    }
+    if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
+        kvm_virtio_pci_irqfd_release(proxy, n, vector);
+    }
+    kvm_virtio_pci_vq_vector_release(proxy, vector);
+}
+
+static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int nvqs)
+{
+    int queue_no;
+    VirtIODevice *vdev = virtio_bus_get_device(&proxy->bus);
+
     for (queue_no = 0; queue_no < nvqs; queue_no++) {
         if (!virtio_queue_get_num(vdev, queue_no)) {
             break;
         }
-        ret = virtio_pci_get_notifier(proxy, queue_no, &n, &vector);
-        if (ret < 0) {
-            break;
-        }
-        if (vector >= msix_nr_vectors_allocated(dev)) {
-            continue;
-        }
-        /* If guest supports masking, clean up irqfd now.
-         * Otherwise, it was cleaned when masked in the frontend.
-         */
-        if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
-            kvm_virtio_pci_irqfd_release(proxy, n, vector);
-        }
-        kvm_virtio_pci_vq_vector_release(proxy, vector);
+        kvm_virtio_pci_vector_release_one(proxy, queue_no);
     }
 }
 
-- 
MST


