Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B81529334
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 23:56:33 +0200 (CEST)
Received: from localhost ([::1]:52360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqihb-0001jh-Tv
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 17:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjS-00019V-Ij
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhjQ-0006kL-V7
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6WXp9xMmKMm1v0MT4LZmWjQcAIeqsOeuNoimR/qMv4=;
 b=TKwDyJbJvGvnYvoWjz70xWK6WTsF2A8+2RxbqHnZdkQHpVJF1l19KkmaWK2u1zovyi5jjE
 d1olM8uCTJEeerY5f8V1Enof0OZ+NeSTvc9ge/IIiQU5Mln4FibgfzEnCn4lND8rCPZtEY
 JZWLywCM4tFN82J3EPOqCmeeYmNwkVU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-5919fSliM3aCN7LMqn5kUg-1; Mon, 16 May 2022 16:54:18 -0400
X-MC-Unique: 5919fSliM3aCN7LMqn5kUg-1
Received: by mail-ej1-f70.google.com with SMTP id
 sc20-20020a1709078a1400b006f4a358c817so6339354ejc.16
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:54:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=n6WXp9xMmKMm1v0MT4LZmWjQcAIeqsOeuNoimR/qMv4=;
 b=Tb3UWhUfkdw0Ya4Knpws2ehEFVic41daVBD6JgtRFqOO94gGPMLNYN4C8rRSZaxbHB
 HJdQ6DPi8Ptv8lbm0PqVqcimyJzTLhWmdx/2yNFWSECcrSd647+/MFSWaS1tkAPW9Rrb
 +7dyhcQoxxjvFVm12JBZ7HUcjLzj+jTbUUeB2uv4HCRyUUoIyUUc7hn8/mfyYociTizK
 P+NmP+m/JqxKh398IzVMfHJ63sZl4P/lkOIR7Rm4MPzvRao9qazATiumPOv0H0FuLnDK
 lgVkNK5rSzYf6Oxhv4PkhrZTuzkv8xpzpftllPeWLxpDs5RdvViRmkvS4L0rteXm9UF4
 knfQ==
X-Gm-Message-State: AOAM531sCyh/BtJ29pz8l8Wr7zxtslEmqYeHNgD8/M31m5mE1HA6JYa7
 WPTEU0k+ph79ioJMycDEnUp/e0d1kvjKfPr5pb++NyyOnwUW+q5YmOjW0BDwOd8BpW5yPn+Mv2B
 jfCG8TawxI5uZNFy9ekx9w5XJO3UedCXzmKLsFCWc5eXQlSp7BKLQ3VAFevhL
X-Received: by 2002:a05:6402:294e:b0:425:f016:24e7 with SMTP id
 ed14-20020a056402294e00b00425f01624e7mr15343419edb.111.1652734457310; 
 Mon, 16 May 2022 13:54:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFVGRfkOIk2ntCbAZvsDUYpnrMnjjbO2li4j16mdG/fyISUS5w1EyLQGb5WZGtTrd5KSZWrg==
X-Received: by 2002:a05:6402:294e:b0:425:f016:24e7 with SMTP id
 ed14-20020a056402294e00b00425f01624e7mr15343395edb.111.1652734457048; 
 Mon, 16 May 2022 13:54:17 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 h16-20020a056402095000b0042ac43be19dsm156054edz.3.2022.05.16.13.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:54:16 -0700 (PDT)
Date: Mon, 16 May 2022 16:54:13 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PULL v2 59/86] virtio-pci: add notification trace points
Message-ID: <20220516204913.542894-60-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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


