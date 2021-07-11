Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C69893C3F64
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:05:05 +0200 (CEST)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gdM-0002oa-QV
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZ5-0006QX-BG
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:45618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZ2-0000Ty-TU
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:00:39 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso10011015wmj.4
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fEfjSQddq0TrVwbGQ3ccMh+OvT1Jy1LGnQdM/7SCR9Y=;
 b=Rz4wfyg38TGS203+CwcF6V5EpU/k9B6cVDyBjaVSoXNHmL0xwZ3bo5ldwM1zxxcpPD
 9qYGKk3o8S4tlv5Mbceej6SQKXmikkwg/brUR/2IokR7evHlvMKCUrSZMTdsJslElmPB
 0+juz6AG5PfAoT0rmycyUVpW2+Ke2ViSEJ0ytWo7X1zXTwWeOmsxE1/WY86TQoegG4XC
 NniQ/tEq1seo347O7FMK7x8jpuiae2eLMFVzbBVneiduTKYuL1LioZJiINy8H6Xw3A2O
 34QpOYfzs2X8CuyYoyXMFYoaMsAKXxcNnFOvVyOTwLr+5wN+n18np3tSHYdRjJf7lNjZ
 mieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fEfjSQddq0TrVwbGQ3ccMh+OvT1Jy1LGnQdM/7SCR9Y=;
 b=Bt/+dLc7Jnhm73riJhW7N0FA/3Fwkf5VL/bVatOZdB4xgaSGcBQ8MCDIFQUv/qYrsL
 YR6EReFcqFBLWrXoIyOPFl3fG0tszF9P8T0YG00Lhta9a4dbzGkYEhBekB1o/5JKXiKu
 C8wySgRtREfskeQ1jaV2BxbmDDuq6aNklgafjmhYlNE8M59ygDBFpr2QCVyu6SX64jgT
 dJvw0V2/kDHIOyUmc1VTrGVU1x26ZiJpq6oRjKtNd6mV5a+410SHMxw7+JaCN5BdYyu0
 09SWIdFcfERMj9AkETr3GLz96rahq1cpkStBxqd6ud2e/Ar4SFKeZy0daS/vx81kV4gN
 tkNQ==
X-Gm-Message-State: AOAM530yXz+HJu0ffSZrYaKbhC80yq1v/M5+MJrQzG+snDM88dRYX/2c
 KucTBbv1vhNpv8750KXfCNTcWlCAkUYD8xEd
X-Google-Smtp-Source: ABdhPJzsi7u3mSvjZ1+qbVmuyDpTa9itimdchm0DrTjEt+L0vFgXj0XBLnZVJTCAM2eyRXF5zIExSQ==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr10848572wmq.179.1626037235269; 
 Sun, 11 Jul 2021 14:00:35 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id p2sm7130595wmg.6.2021.07.11.14.00.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:00:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 02/19] hw/pci-host/raven: Add PCI_IO_BASE_ADDR definition
Date: Sun, 11 Jul 2021 22:59:59 +0200
Message-Id: <20210711210016.2710100-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than using the magic 0x80000000 number for the PCI I/O BAR
physical address on the main system bus, use a definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20210417103028.601124-6-f4bug@amsat.org>
---
 hw/pci-host/raven.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/pci-host/raven.c b/hw/pci-host/raven.c
index 9fef74fc56c..3be27f0a14d 100644
--- a/hw/pci-host/raven.c
+++ b/hw/pci-host/raven.c
@@ -81,6 +81,8 @@ struct PRePPCIState {
 
 #define BIOS_SIZE (1 * MiB)
 
+#define PCI_IO_BASE_ADDR    0x80000000  /* Physical address on main bus */
+
 static inline uint32_t raven_pci_io_config(hwaddr addr)
 {
     int i;
@@ -158,7 +160,7 @@ static uint64_t raven_io_read(void *opaque, hwaddr addr,
     uint8_t buf[4];
 
     addr = raven_io_address(s, addr);
-    address_space_read(&s->pci_io_as, addr + 0x80000000,
+    address_space_read(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
                        MEMTXATTRS_UNSPECIFIED, buf, size);
 
     if (size == 1) {
@@ -190,7 +192,7 @@ static void raven_io_write(void *opaque, hwaddr addr,
         g_assert_not_reached();
     }
 
-    address_space_write(&s->pci_io_as, addr + 0x80000000,
+    address_space_write(&s->pci_io_as, addr + PCI_IO_BASE_ADDR,
                         MEMTXATTRS_UNSPECIFIED, buf, size);
 }
 
@@ -293,8 +295,9 @@ static void raven_pcihost_initfn(Object *obj)
     address_space_init(&s->pci_io_as, &s->pci_io, "raven-io");
 
     /* CPU address space */
-    memory_region_add_subregion(address_space_mem, 0x80000000, &s->pci_io);
-    memory_region_add_subregion_overlap(address_space_mem, 0x80000000,
+    memory_region_add_subregion(address_space_mem, PCI_IO_BASE_ADDR,
+                                &s->pci_io);
+    memory_region_add_subregion_overlap(address_space_mem, PCI_IO_BASE_ADDR,
                                         &s->pci_io_non_contiguous, 1);
     memory_region_add_subregion(address_space_mem, 0xc0000000, &s->pci_memory);
     pci_root_bus_new_inplace(&s->pci_bus, sizeof(s->pci_bus), DEVICE(obj), NULL,
-- 
2.31.1


