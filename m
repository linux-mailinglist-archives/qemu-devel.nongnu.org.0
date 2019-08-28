Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBEA04D9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 16:26:35 +0200 (CEST)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2yuA-0003e8-7J
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 10:26:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54594)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <skrtbhtngr@gmail.com>) id 1i2yrl-0002CH-RR
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <skrtbhtngr@gmail.com>) id 1i2yrk-0000Wq-RH
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:05 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37383)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <skrtbhtngr@gmail.com>)
 id 1i2yrk-0000WN-M3
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 10:24:04 -0400
Received: by mail-pl1-x643.google.com with SMTP id bj8so66669plb.4
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 07:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfW1aH+Wpw10vSj+L0zxMi7E9GI7IXk5GtJx8ieye+k=;
 b=SZoiTlBsARlRkWmePEB0YRUZKHm8vQQDlmJH5gHYiu/sdu+hv6jlgDj1r8+DNQoi/c
 4M1tl4yh/xQzT5Sz/flSgtUX0wHF+ybmR3UkQ+lVINVGr/xSyG1EfuBuajblNNaWnxfK
 qnCukfXupBGasrzzGg16pa49yWEB7wQrutNrtgeR86J5BwfNRXBnb0vVcBpe5ouH69zj
 9eih51sjy+z80+9J0jMbjEwEUoUbDZ/cd9lQenymiY+7jdudm4sGHQ7pfBUS5dQYetRb
 0txZNfSvFLtGwaSahPd+ThILckkDodegm6NnoSkQ8Xy6QtcdQagwr0khGB7Z6ebnJwlF
 afvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfW1aH+Wpw10vSj+L0zxMi7E9GI7IXk5GtJx8ieye+k=;
 b=VPrOxIUjQljh8XSMjwqs8zZAppXoP0IN3jfdF2+O0v76bZVXrJFtt7zRsFIOXAV/3R
 +gAzXqC35eSUIH+Ap1mDsQrPrV1urrBq63JzHygrDgRi/RpbQSwQzLqs14ew3Y/2x0aI
 ikrpoCQ8U7kVpZfCcuxP8OHqVEwCbUodXZYuJFdo8lzqsCbb84h6TJ8hF6XIldpZT01S
 DHgxjKKbhQIERDC/qmQBs1RVgBqsb1lcT6b8KyFrMCvPGNs8yDeWJz5H6l2gEP8SX/TW
 vwdCCJmEI4Xc31QxdrLVGEWvlS9t4W0f4dQMHwlvsY74g+pWM+sc9hbxkEexN297Osw2
 En+w==
X-Gm-Message-State: APjAAAVg4Cj4UiebYtMLVIlwGfavN6O+/Z3sQdIrMKO0kgnEBFlfIZuc
 Gd3neSXQ2hbG3JqL2AkVDeXaug0C
X-Google-Smtp-Source: APXvYqy4OM4urpTGoQsfnlcBTVXhIO7v1ed9lwhWvJlBxFRMq0FJOx2RQAQQCN7yUSlpSxyZemLBeA==
X-Received: by 2002:a17:902:1e8:: with SMTP id
 b95mr4658930plb.28.1567002243174; 
 Wed, 28 Aug 2019 07:24:03 -0700 (PDT)
Received: from beta.it.iitb.ac.in ([2405:204:2200:9180:9ba0:a3d7:637f:11ad])
 by smtp.gmail.com with ESMTPSA id g1sm3180742pgg.27.2019.08.28.07.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 07:24:02 -0700 (PDT)
From: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 19:53:27 +0530
Message-Id: <20190828142328.24561-2-skrtbhtngr@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828142328.24561-1-skrtbhtngr@gmail.com>
References: <20190828142328.24561-1-skrtbhtngr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-devel] [PATCH v1 1/2] hw/pvrdma: make DSR mapping idempotent
 in load_dsr()
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
Cc: Yuval Shaia <yuval.shaia@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Map to DSR only when there is no mapping done already i.e., when
dev->dsr_info.dsr is NULL. This allows the rest of mappings and
ring inits to be done by calling load_dsr() when DSR has already
been mapped to, somewhere else.

Move free_dsr() out of load_dsr() and call it before the latter
as and when needed. This aids the case where load_dsr() is called
having DSR mapping already done, but the rest of map and init
operations are pending, and prevents an unmap of the DSR.

Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Yuval Shaia <yuval.shaia@oracle.com>
Signed-off-by: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
---
 hw/rdma/vmw/pvrdma_main.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/rdma/vmw/pvrdma_main.c b/hw/rdma/vmw/pvrdma_main.c
index adcf79cd63..6c90db96f9 100644
--- a/hw/rdma/vmw/pvrdma_main.c
+++ b/hw/rdma/vmw/pvrdma_main.c
@@ -172,15 +172,15 @@ static int load_dsr(PVRDMADev *dev)
     DSRInfo *dsr_info;
     struct pvrdma_device_shared_region *dsr;
 
-    free_dsr(dev);
-
-    /* Map to DSR */
-    dev->dsr_info.dsr = rdma_pci_dma_map(pci_dev, dev->dsr_info.dma,
-                              sizeof(struct pvrdma_device_shared_region));
     if (!dev->dsr_info.dsr) {
-        rdma_error_report("Failed to map to DSR");
-        rc = -ENOMEM;
-        goto out;
+        /* Map to DSR */
+        dev->dsr_info.dsr = rdma_pci_dma_map(pci_dev, dev->dsr_info.dma,
+                                  sizeof(struct pvrdma_device_shared_region));
+        if (!dev->dsr_info.dsr) {
+            rdma_error_report("Failed to map to DSR");
+            rc = -ENOMEM;
+            goto out;
+        }
     }
 
     /* Shortcuts */
@@ -402,6 +402,7 @@ static void pvrdma_regs_write(void *opaque, hwaddr addr, uint64_t val,
     case PVRDMA_REG_DSRHIGH:
         trace_pvrdma_regs_write(addr, val, "DSRHIGH", "");
         dev->dsr_info.dma |= val << 32;
+        free_dsr(dev);
         load_dsr(dev);
         init_dsr_dev_caps(dev);
         break;
-- 
2.21.0


