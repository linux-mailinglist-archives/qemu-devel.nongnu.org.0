Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EB21F587A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:59:24 +0200 (CEST)
Received: from localhost ([::1]:44116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj38N-00015e-M3
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:59:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jj34a-0003gQ-2J
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:55:28 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46903)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jj34Y-0005Bd-Sg
 for qemu-devel@nongnu.org; Wed, 10 Jun 2020 11:55:27 -0400
Received: by mail-wr1-x441.google.com with SMTP id x6so2827827wrm.13
 for <qemu-devel@nongnu.org>; Wed, 10 Jun 2020 08:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8k3vUvil4yeFEKEfxW7+SynAd8ccYx17gBmoCdQYV0E=;
 b=BtEjoK65Y6qRjtdjZrvvJHACecKeP8hvyuOX4TEr+Iodlocidgsxd3UjNoRuahYMbY
 0Jv0jG3PlFUHNMxqJg05byDlVjTC5VGlqR+KlfKXtCWo8VBbILMCbnVOY73cGTzwncE1
 0r+T7aoGVx+oPq1GowNCUFNTXiuP2ClgFSos3Cne8gOI66XmSC0PCnYGzNhI6uyqgTS1
 kCc6Jfraljn/MnPS5HldS3buvt6evoDWVtJxB254UehfjE4LE7qKYZVfb4GFkvmjTnd1
 yCYyRMZYmaZ0U8Jy6prrTLcsDIBqU8cyBMiQhvCuFzy/YrVafukKKEqpPAZWsIiPzJbb
 FbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8k3vUvil4yeFEKEfxW7+SynAd8ccYx17gBmoCdQYV0E=;
 b=pog3/8J+Qd3OthcjJgnEkVFp5tX/qhEAs5Fwvza9sIsoRkjgSbEeA+jXE74QxL2Zqx
 UDVvEvjyUI/3ly8m4OpACQY2OzDlGgYPO05RxC6OU8Ew4/dnLlPivMJxAy/sfEOhixwo
 TCFK7ZQDp6W+3WRYkbmC6+gTRn1EFnfX4RWhzU08to9j3Bb5Hv8rf2+2Q5fdgY13l7jU
 rGouswoEYB5YgLDsHQ2OoeT0SjsOyBip/r4IMhSJ2MhKb7EdVroe/M4lpcOtTlnE/tIF
 bbj4x3C/DyslgebGGL5MeapSsQbUM+BN3JtNfG2MlvUu3I1Etg2NgV8uXazOtq7OSorL
 aFsg==
X-Gm-Message-State: AOAM533/aqKTUqXkmqFHBysGumOztWwgMPQOv3wnvGH4uvpmW65m4FE3
 wjYVfziKoPYJsyFK0FGYpCyysw==
X-Google-Smtp-Source: ABdhPJxcxv4LZBu8h1sw2awG7E/3QOasCYNVRoESTXFUgKybSynCL/2H+ZYymYqlKzOtv1fwLjy0yg==
X-Received: by 2002:a5d:6586:: with SMTP id q6mr4398832wru.319.1591804516736; 
 Wed, 10 Jun 2020 08:55:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q128sm147184wma.38.2020.06.10.08.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 08:55:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4B20B1FF90;
 Wed, 10 Jun 2020 16:55:10 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] hw/virtio/pci: include vdev name in registered PCI
 sections
Date: Wed, 10 Jun 2020 16:55:07 +0100
Message-Id: <20200610155509.12850-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200610155509.12850-1-alex.bennee@linaro.org>
References: <20200610155509.12850-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: robert.foley@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 robhenry@microsoft.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com, peter.puhov@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When viewing/debugging memory regions it is sometimes hard to figure
out which PCI device something belongs to. Make the names unique by
including the vdev name in the name string.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

---
v2
  - swap ()'s for an extra -
---
 hw/virtio/virtio-pci.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index d028c17c240..51ab67304bc 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1390,7 +1390,8 @@ static void virtio_pci_device_write(void *opaque, hwaddr addr,
     }
 }
 
-static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
+static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy,
+                                           const char *vdev_name)
 {
     static const MemoryRegionOps common_ops = {
         .read = virtio_pci_common_read,
@@ -1437,36 +1438,41 @@ static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
         },
         .endianness = DEVICE_LITTLE_ENDIAN,
     };
+    g_autoptr(GString) name = g_string_new(NULL);
 
-
+    g_string_printf(name, "virtio-pci-common-%s", vdev_name);
     memory_region_init_io(&proxy->common.mr, OBJECT(proxy),
                           &common_ops,
                           proxy,
-                          "virtio-pci-common",
+                          name->str,
                           proxy->common.size);
 
+    g_string_printf(name, "virtio-pci-isr-%s", vdev_name);
     memory_region_init_io(&proxy->isr.mr, OBJECT(proxy),
                           &isr_ops,
                           proxy,
-                          "virtio-pci-isr",
+                          name->str,
                           proxy->isr.size);
 
+    g_string_printf(name, "virtio-pci-device-%s", vdev_name);
     memory_region_init_io(&proxy->device.mr, OBJECT(proxy),
                           &device_ops,
                           virtio_bus_get_device(&proxy->bus),
-                          "virtio-pci-device",
+                          name->str,
                           proxy->device.size);
 
+    g_string_printf(name, "virtio-pci-notify-%s", vdev_name);
     memory_region_init_io(&proxy->notify.mr, OBJECT(proxy),
                           &notify_ops,
                           virtio_bus_get_device(&proxy->bus),
-                          "virtio-pci-notify",
+                          name->str,
                           proxy->notify.size);
 
+    g_string_printf(name, "virtio-pci-notify-pio-%s", vdev_name);
     memory_region_init_io(&proxy->notify_pio.mr, OBJECT(proxy),
                           &notify_pio_ops,
                           virtio_bus_get_device(&proxy->bus),
-                          "virtio-pci-notify-pio",
+                          name->str,
                           proxy->notify_pio.size);
 }
 
@@ -1607,7 +1613,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
 
         struct virtio_pci_cfg_cap *cfg_mask;
 
-        virtio_pci_modern_regions_init(proxy);
+        virtio_pci_modern_regions_init(proxy, vdev->name);
 
         virtio_pci_modern_mem_region_map(proxy, &proxy->common, &cap);
         virtio_pci_modern_mem_region_map(proxy, &proxy->isr, &cap);
-- 
2.20.1


