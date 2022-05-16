Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE41528397
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 13:56:27 +0200 (CEST)
Received: from localhost ([::1]:53618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqZKs-0007Gz-Ud
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 07:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY88-00014w-VV
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY87-0005aO-BK
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:39:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6WXp9xMmKMm1v0MT4LZmWjQcAIeqsOeuNoimR/qMv4=;
 b=QVcTwdE85ItYEi92+WWWDMjNOL4BMSKhYWvJYK0A+qqtjog7/EZ451YN/rT4EYF+T/o5JC
 SNhV+Q8A5MFNpLd6w+WHL2tQQQT+Hw7Klue0PfOZEMDRUbjxmvFcKgBss+p9xw60B4Nc9f
 1n55oNVeKed8P7EKlL48PtsIr5yU8x0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-670-_P9Q7VSrMpOe6go5Y0UL9Q-1; Mon, 16 May 2022 06:39:09 -0400
X-MC-Unique: _P9Q7VSrMpOe6go5Y0UL9Q-1
Received: by mail-wr1-f71.google.com with SMTP id
 t9-20020a5d5349000000b0020d02cd51fbso469624wrv.13
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n6WXp9xMmKMm1v0MT4LZmWjQcAIeqsOeuNoimR/qMv4=;
 b=ylml2Au4XVTGjhBjIOLHIyBA9/4O2pCxy1xHQkVk+o0p2wM5RKCVYZVVnF8m+9V2zU
 tGU31Ne1YnXL/47Xr32Zrs378O//r6A3XEKGk6SXmPKeHd9hEYLqo8kBP+L2cBfJAfJx
 XdWmleWyidt7V/xTbgmU5lfHrmA6bJ0iSLWUVqTiXr8NOhZEqlnpax9hlPPDGMvz6FRM
 llsFEJ6hWzp1+uZhmakavg5L7TnV1m2QzvZbZ9T7Zp42c60SJ3Bi2PFgd8XUIdii36Mz
 GY9371RvkddejeqGTMhga3fU9hEPCPghSzi/J2+hNEBLR1PEI/+RqUo+3HgSTiy8uZVQ
 rUZA==
X-Gm-Message-State: AOAM530zBTd+rqk3BpuQVAWuhz+6o6fgfFEARJI5XjFWPBvu16sUWDxh
 3zyq+Rhp5pvXEjipLkm3pRi4NxRklCQlBHIldt/LRnmzA3XsxotEI6D4Ab//TkLh2+pUoWi1ReF
 6h1f5uKUMJykYktkM3mN/2WfYNIUeTYzdVVUV7OB8DV4dAjL2e2kozFZnOUXt
X-Received: by 2002:a05:600c:4347:b0:393:fbae:a5da with SMTP id
 r7-20020a05600c434700b00393fbaea5damr26163745wme.205.1652697548379; 
 Mon, 16 May 2022 03:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmDZG4B/0z8IifKkoGVV5N0HGtcqlDLy9JQ03MJTdYtoA66wLZ6Q3hfMUQDtqueNyx1pB13w==
X-Received: by 2002:a05:600c:4347:b0:393:fbae:a5da with SMTP id
 r7-20020a05600c434700b00393fbaea5damr26163722wme.205.1652697548136; 
 Mon, 16 May 2022 03:39:08 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 i13-20020adfb64d000000b0020ce1c1cf31sm9147938wre.21.2022.05.16.03.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:39:07 -0700 (PDT)
Date: Mon, 16 May 2022 06:39:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL 59/91] virtio-pci: add notification trace points
Message-ID: <20220516095448.507876-60-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Alex Bennée <alex.bennee@linaro.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200925125147.26943-6-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220321153037.3622127-3-alex.bennee@linaro.org>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.c | 3 +++
 hw/virtio/trace-events | 7 ++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 602be7f83d..0566ad7d00 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -38,6 +38,7 @@
 #include "hw/virtio/virtio-bus.h"
 #include "qapi/visitor.h"
 #include "sysemu/replay.h"
+#include "trace.h"
 
 #define VIRTIO_PCI_REGION_SIZE(dev)     VIRTIO_PCI_CONFIG_OFF(msix_present(dev))
 
@@ -1380,6 +1381,7 @@ static void virtio_pci_notify_write(void *opaque, hwaddr addr,
     unsigned queue = addr / virtio_pci_queue_mem_mult(proxy);
 
     if (vdev != NULL && queue < VIRTIO_QUEUE_MAX) {
+        trace_virtio_pci_notify_write(addr, val, size);
         virtio_queue_notify(vdev, queue);
     }
 }
@@ -1393,6 +1395,7 @@ static void virtio_pci_notify_write_pio(void *opaque, hwaddr addr,
     unsigned queue = val;
 
     if (vdev != NULL && queue < VIRTIO_QUEUE_MAX) {
+        trace_virtio_pci_notify_write_pio(addr, val, size);
         virtio_queue_notify(vdev, queue);
     }
 }
diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 333348d9d5..7a6576d833 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -89,7 +89,12 @@ virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%" PRIx64 "
 virtio_mmio_queue_write(uint64_t value, int max_size) "mmio_queue write 0x%" PRIx64 " max %d"
 virtio_mmio_setting_irq(int level) "virtio_mmio setting IRQ %d"
 
-# virtio-iommu.c
+# virtio-pci.c
+virtio_pci_notify(uint16_t vector) "virtio_pci_notify vec 0x%x"
+virtio_pci_notify_write(uint64_t addr, uint64_t val, unsigned int size) "0x%" PRIx64" = 0x%" PRIx64 " (%d)"
+virtio_pci_notify_write_pio(uint64_t addr, uint64_t val, unsigned int size) "0x%" PRIx64" = 0x%" PRIx64 " (%d)"
+
+# hw/virtio/virtio-iommu.c
 virtio_iommu_device_reset(void) "reset!"
 virtio_iommu_system_reset(void) "system reset!"
 virtio_iommu_get_features(uint64_t features) "device supports features=0x%"PRIx64
-- 
MST


