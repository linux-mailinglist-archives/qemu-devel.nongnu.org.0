Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978A631E81C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 10:50:13 +0100 (CET)
Received: from localhost ([::1]:33516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCfwq-0008Kl-EE
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 04:50:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCfu3-0006fl-Jp
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:19 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lCftu-0007BB-PP
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 04:47:19 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o82so2315983wme.1
 for <qemu-devel@nongnu.org>; Thu, 18 Feb 2021 01:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t/CPTE/CDznZTD1WlBNg2STeH1CsnSCKnog1Lk63Lyg=;
 b=pCIRah91814QnDanVJeQlwWs77okqTntoCd9ZPyAedo4pkoESiHHTqf6ubHJUBkw7H
 ef3e310DFf7zwG/lGeqPHSn+GfFOke36U3pjDppNsfT3BiyIh8k9AK/oYMwC3o0Knkka
 iFqkyqxhx7S+BVuMZRg89FQLxlrVWR5ALEu3CqAsegczjjjhSC2InuPULK7Khc4Sfn9l
 iVqBFBd8Fe/02h/2wj5eoHDKezlFPhsY9q+K13m1xhSO5iGi/Xj5KovRgi3e29U3VzK3
 mpZVpTGhoK1NIOTT1pOoAbQbv77WPGy+vzx04im12GY0fd8KPgLwBSJaBt9UslTZlMjj
 c66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t/CPTE/CDznZTD1WlBNg2STeH1CsnSCKnog1Lk63Lyg=;
 b=D947eQ6II2c6Ozozz8UOXtJ0SKXfpG1YsFd3npKsj6mf+pwSR34IwSNPYWrYOmWjg6
 k+/2Jn7vAXiDWhSeImtMdzy/5V0kfIOR6gD18r35Yck276cwLCE6PzuZ5CDAWOAZJ5wg
 uXbKd6Ir3CoYklfuWsrMNiWfN5bUgS1IIzBCm62OsrmzlwWbDQ6NBZjnWkxQFNU+bBB9
 m0WsXOvyS37TsSRtkDvWNmH5BpdERj6kc3+ruzpFd6sg3hUK/cUpeoG4vNhnQ3ryPdgS
 EpmtEjU2Yv+wHZoXHXj/FwoB7K4QxrJESvCLS/H04SHqR7zT1fGvM2P1bHY01cvza+Ap
 AtGQ==
X-Gm-Message-State: AOAM530IJVVtVZn2OumuBX6ncYdQ73P0i3dKv1DqsUxSwC/Nk/ercFxJ
 xrMDHlfLO6VgnL91jYJuuFeUzw==
X-Google-Smtp-Source: ABdhPJyHkpkWjwhScTRQU3rCIuDhDWtznZuJv8GyPDMYubeggvWBbD6A1FasF6xNLVERQnyLFmdQuw==
X-Received: by 2002:a05:600c:204e:: with SMTP id
 p14mr2783475wmg.157.1613641629179; 
 Thu, 18 Feb 2021 01:47:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y15sm8004938wrm.93.2021.02.18.01.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 01:47:07 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 02F661FF87;
 Thu, 18 Feb 2021 09:47:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/23] hw/virtio/pci: include vdev name in registered PCI
 sections
Date: Thu, 18 Feb 2021 09:46:44 +0000
Message-Id: <20210218094706.23038-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210218094706.23038-1-alex.bennee@linaro.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When viewing/debugging memory regions it is sometimes hard to figure
out which PCI device something belongs to. Make the names unique by
including the vdev name in the name string.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20210213130325.14781-2-alex.bennee@linaro.org>

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 094c36aa3e..883045a223 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1423,7 +1423,8 @@ static void virtio_pci_device_write(void *opaque, hwaddr addr,
     }
 }
 
-static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
+static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy,
+                                           const char *vdev_name)
 {
     static const MemoryRegionOps common_ops = {
         .read = virtio_pci_common_read,
@@ -1470,36 +1471,41 @@ static void virtio_pci_modern_regions_init(VirtIOPCIProxy *proxy)
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
                           proxy,
-                          "virtio-pci-device",
+                          name->str,
                           proxy->device.size);
 
+    g_string_printf(name, "virtio-pci-notify-%s", vdev_name);
     memory_region_init_io(&proxy->notify.mr, OBJECT(proxy),
                           &notify_ops,
                           proxy,
-                          "virtio-pci-notify",
+                          name->str,
                           proxy->notify.size);
 
+    g_string_printf(name, "virtio-pci-notify-pio-%s", vdev_name);
     memory_region_init_io(&proxy->notify_pio.mr, OBJECT(proxy),
                           &notify_pio_ops,
                           proxy,
-                          "virtio-pci-notify-pio",
+                          name->str,
                           proxy->notify_pio.size);
 }
 
@@ -1654,7 +1660,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
 
         struct virtio_pci_cfg_cap *cfg_mask;
 
-        virtio_pci_modern_regions_init(proxy);
+        virtio_pci_modern_regions_init(proxy, vdev->name);
 
         virtio_pci_modern_mem_region_map(proxy, &proxy->common, &cap);
         virtio_pci_modern_mem_region_map(proxy, &proxy->isr, &cap);
-- 
2.20.1


