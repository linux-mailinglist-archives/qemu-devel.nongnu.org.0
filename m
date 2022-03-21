Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC954E2C6D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:37:35 +0100 (CET)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWK68-0008HE-KK
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:37:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzd-0005D9-J6
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:49 -0400
Received: from [2a00:1450:4864:20::530] (port=34775
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nWJzX-0004q3-Rw
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 11:30:45 -0400
Received: by mail-ed1-x530.google.com with SMTP id h1so18285446edj.1
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9pU9lugev25loCcBaQ+leP28nVZHOndDdSOSortC2o=;
 b=sYoMHTK1qkaPi/iFRpPuO750BwHx4MtheMZ1ACT8hF55lmeryQlSwRdbmKCreTViZX
 6wrPsT5aAUu2hBnMswzWFafxSJYm+AXXc/P/T00SXksy4ZrRxIPdOrop28iajv5pbyCM
 IaANDw/tlCtRUiPXzOR2dYE74ZeBrjZK6BCOOg4IqciV0rTPkZuO71kt8jRs7SKpN0PA
 eFjnrrXHaYhqTG1SFMtgqhaudWKe/8yc5haWDaUv/eqhov3VPewBNUvireeOyc6O6aYV
 X3+mal/qLHlihQ6vzgt8RGXW/G/DCRXJg3XpHeJn1m3JfdetUO/gHCH3s/Jn0fXX3GsS
 oazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D9pU9lugev25loCcBaQ+leP28nVZHOndDdSOSortC2o=;
 b=pbMmsIQiYbuj/TEPPY9kNE74bbSxdeAQj6/JLjSfmVNcqpgMaPXlFfkdZ74lddNEX1
 U8ZDPmAEtUTf2s9I6az5o2TRaNKcrdkIIonuKs7w3bXdhIN+jCSge/gQqqE5SrsVYMup
 BviQZmIBdsm18iuXFl776rtL4Ls4KxzbhtX0psT/uHw6GRlMNtZ2yO4EPOTicASJRd6V
 WH1yo14iWtcoa+PX5xr+da0CefY2twg0RcgOBpAVC09uuv6U071Lbta01VgMj9mzrU9Q
 iXw+I3oE5RXCFdSX5Sm7vVVhmH5XlgcNRSmPDJxqBzseS13/QZRc1GUAJGDo/M+WIMzk
 4wrA==
X-Gm-Message-State: AOAM532sUNfxtwDbWbfscieo3EfvSuzkcozRWph1FFGpbQdQzw0tBbcF
 AmObRCj3btDd2LJOoDzx6SUkPw==
X-Google-Smtp-Source: ABdhPJwjtjMVWkQ84mzgY6m6UBm24HHZN6Ek4/QMoV+3i9Tsea0ZxH6UnsEq9/rkNtX23lg2wDAkBg==
X-Received: by 2002:a05:6402:909:b0:415:cdbf:4748 with SMTP id
 g9-20020a056402090900b00415cdbf4748mr23364771edz.395.1647876642527; 
 Mon, 21 Mar 2022 08:30:42 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a170906608e00b006d1455acc62sm7126220ejj.74.2022.03.21.08.30.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 08:30:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D58CE1FFBA;
 Mon, 21 Mar 2022 15:30:37 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 02/13] virtio-pci: add notification trace points
Date: Mon, 21 Mar 2022 15:30:26 +0000
Message-Id: <20220321153037.3622127-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220321153037.3622127-1-alex.bennee@linaro.org>
References: <20220321153037.3622127-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: slp@redhat.com, mathieu.poirier@linaro.org, mst@redhat.com,
 viresh.kumar@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 stefanha@redhat.com, marcandre.lureau@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200925125147.26943-6-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
index a5102eac9e..46851a7cd1 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -87,7 +87,12 @@ virtio_mmio_guest_page(uint64_t size, int shift) "guest page size 0x%" PRIx64 "
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
2.30.2


