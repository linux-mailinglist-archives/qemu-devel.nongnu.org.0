Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC448294184
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 19:36:02 +0200 (CEST)
Received: from localhost ([::1]:50300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUvYH-0004cR-Np
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 13:36:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUvOZ-0007iB-LL
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kUvOX-0008Fe-KS
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603214755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8oqdstf17QDkdRiVc5f+XWE4kqpKFWIiKO1K+jCCJoE=;
 b=JYKTD/tjiM9FuKFAk4HfTRtSr/7aUWUCRlQSKIOCbzX6BdfaxLGSKRAa+mrZbGy8Wyt4RR
 EVkeTKLQjBG4WACOI5tAdkCO2/LwLpaXaqC+/3HHJFToV948ItUY456b2l+QWb4lIcvaKo
 4N/gE5XUCUbxSypzLlWADp/ZjpRi4UE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-YC6a1lQfMu-Eb_Wlsz8i7w-1; Tue, 20 Oct 2020 13:25:53 -0400
X-MC-Unique: YC6a1lQfMu-Eb_Wlsz8i7w-1
Received: by mail-wm1-f69.google.com with SMTP id s12so398507wmj.0
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 10:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8oqdstf17QDkdRiVc5f+XWE4kqpKFWIiKO1K+jCCJoE=;
 b=dP3LBA4z57rmHIvY2BvMH175IywFjrUZbwV5XKETpyUGFsTXlMBn5/MhIYQScvNPag
 GHPPPYLUEvJb+4ARrqKpF+6p2l+2VyEC50v4WwGqEEZe3UtPc8/y1kvp/uRNZDzrjmXh
 jg0IwZJibyX06QxFz8s+PbZqtK8GcskXgNWjXdkMsxkVqOgihC68IGrUG5j0uUagsK/S
 AldHMNNVRa3MS4WXcIXCzELDFFbQReqh4ZGV+LErU0Y3ykeIvSZAODWxbInmiiX/6gLK
 SMcUPgtJp/g+IPHL3qxl2fp+F/Hhbp13uJhx2j2tDeaM8jdJfjhWrBM2pdk3uG2MmmA+
 GtMw==
X-Gm-Message-State: AOAM533VbH9W7oVYiui0y7wZvTjeIKZ6Vz8R8t9sytGuIgtDYVaHEtIy
 CL8RTw0BzvsANfbMUjpN+pIA5r+L4D/ldINMUu0FEeL6CCTVrkp6gwUbk4Rzq5Z3sfYAPCsOmbr
 WuCzsifQPjCfCuWY=
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr3997336wma.70.1603214751974; 
 Tue, 20 Oct 2020 10:25:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdcxOTOZoM/gU99BUW1BC35eAswqh/g0UQilPWU36+0grXfNSITkALfOWA2eGpPksUWVEXTw==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr3997314wma.70.1603214751797; 
 Tue, 20 Oct 2020 10:25:51 -0700 (PDT)
Received: from x1w.redhat.com (237.red-88-18-140.staticip.rima-tde.net.
 [88.18.140.237])
 by smtp.gmail.com with ESMTPSA id 130sm3827184wmd.18.2020.10.20.10.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:25:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/16] util/vfio-helpers: Remove now unused
 qemu_vfio_pci_init_irq()
Date: Tue, 20 Oct 2020 19:24:28 +0200
Message-Id: <20201020172428.2220726-17-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201020172428.2220726-1-philmd@redhat.com>
References: <20201020172428.2220726-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/20 01:15:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our only user, the NVMe block driver, switched to the MSIX API.
As this function is now unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/qemu/vfio-helpers.h |  2 --
 util/vfio-helpers.c         | 43 -------------------------------------
 2 files changed, 45 deletions(-)

diff --git a/include/qemu/vfio-helpers.h b/include/qemu/vfio-helpers.h
index 4c06694e03a..f42371d25d6 100644
--- a/include/qemu/vfio-helpers.h
+++ b/include/qemu/vfio-helpers.h
@@ -29,8 +29,6 @@ void *qemu_vfio_pci_map_bar(QEMUVFIOState *s, int index,
                             Error **errp);
 void qemu_vfio_pci_unmap_bar(QEMUVFIOState *s, int index, void *bar,
                              uint64_t offset, uint64_t size);
-int qemu_vfio_pci_init_irq(QEMUVFIOState *s, EventNotifier *e,
-                           int irq_type, Error **errp);
 int qemu_vfio_pci_msix_init_irqs(QEMUVFIOState *s,
                                  unsigned *irq_count, Error **errp);
 int qemu_vfio_pci_msix_set_irq(QEMUVFIOState *s, unsigned irq_index,
diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 18142e6be86..83d6eef13fb 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -189,49 +189,6 @@ void qemu_vfio_pci_unmap_bar(QEMUVFIOState *s, int index, void *bar,
     }
 }
 
-/**
- * Initialize device IRQ with @irq_type and register an event notifier.
- */
-int qemu_vfio_pci_init_irq(QEMUVFIOState *s, EventNotifier *e,
-                           int irq_type, Error **errp)
-{
-    int r;
-    struct vfio_irq_set *irq_set;
-    size_t irq_set_size;
-    struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info) };
-
-    irq_info.index = irq_type;
-    if (ioctl(s->device, VFIO_DEVICE_GET_IRQ_INFO, &irq_info)) {
-        error_setg_errno(errp, errno, "Failed to get device interrupt info");
-        return -errno;
-    }
-    if (!(irq_info.flags & VFIO_IRQ_INFO_EVENTFD)) {
-        error_setg(errp, "Device interrupt doesn't support eventfd");
-        return -EINVAL;
-    }
-
-    irq_set_size = sizeof(*irq_set) + sizeof(int);
-    irq_set = g_malloc0(irq_set_size);
-
-    /* Get to a known IRQ state */
-    *irq_set = (struct vfio_irq_set) {
-        .argsz = irq_set_size,
-        .flags = VFIO_IRQ_SET_DATA_EVENTFD | VFIO_IRQ_SET_ACTION_TRIGGER,
-        .index = irq_info.index,
-        .start = 0,
-        .count = 1,
-    };
-
-    *(int *)&irq_set->data = event_notifier_get_fd(e);
-    r = ioctl(s->device, VFIO_DEVICE_SET_IRQS, irq_set);
-    g_free(irq_set);
-    if (r) {
-        error_setg_errno(errp, errno, "Failed to setup device interrupt");
-        return -errno;
-    }
-    return 0;
-}
-
 /**
  * Initialize a MSIX IRQ and register its event notifier.
  * @irq_index: MSIX IRQ index
-- 
2.26.2


