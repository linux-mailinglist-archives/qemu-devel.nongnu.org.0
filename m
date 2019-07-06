Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4328160EAD
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 06:13:49 +0200 (CEST)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjc56-0008SQ-GX
	for lists+qemu-devel@lfdr.de; Sat, 06 Jul 2019 00:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53252)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <skrtbhtngr@gmail.com>) id 1hjc1K-0006ES-CN
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:09:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <skrtbhtngr@gmail.com>) id 1hjc1I-0000kf-Ec
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:09:54 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:42977)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <skrtbhtngr@gmail.com>)
 id 1hjc1G-0000ii-Iv
 for qemu-devel@nongnu.org; Sat, 06 Jul 2019 00:09:51 -0400
Received: by mail-pg1-x541.google.com with SMTP id t132so5061031pgb.9
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YfW1aH+Wpw10vSj+L0zxMi7E9GI7IXk5GtJx8ieye+k=;
 b=W0SKeNVqym5z1mgVyAkLzSoTBlePkQ5LGRkGPvvn05zGU8qIX2hTd7bm+ZX6vYQL11
 rfvO9Ql1UybmuOs6S8GhjG0u24iP9gRpst7UBwT2UyT35yP+CncSs3EgjM1ULUkCDr7v
 +0g1aPxBvco3S6K0Aud5TwVGg3QHZf6QAIrkVGDHBVPMLEY2NgtY/RD6W3XZXIiAVSpm
 a+lV6JiqKuwNHS7HUiuEshThuBu/sb+PB4Bf9cumIM5fcnAep6Yd75Y7JHcIz5qYRhlZ
 Xg85YYu2pEtBwVCWVp4aynFIRIaAljgC9cdnXXKoejMZWk8x1CzAJ2X3TFH/aUTTIoWu
 3RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YfW1aH+Wpw10vSj+L0zxMi7E9GI7IXk5GtJx8ieye+k=;
 b=DRDJYrwRsp3czxD3oN5m1tHJhHMknwCdTT9P+qX2DswtUiRShAR5A/wRBdSKr96NrH
 EQ4W53/Yoj9O05B9P54Xxa4j+WKJhTqhyc4Rw4aUHddy59l8qxd+GJ2iPk7i2mMrsqAB
 4xVVscCSYGXbRE/+hhw1KiSxNrrBLhsqourg48RXXBEGKWslqWSyRYFkBsADiuHDTAG2
 OXpFx+8jUNVo/qPgoQda6G334A3N4p3QplKBn+xwpzbKXKx0US7fvT7pumE/WgyRu4hA
 V1FzjG0IjOAN88eT+g6KJldE5Is3XO/CFx7hfyo4Lb82rSQHI8UrFO9wBqvwjqNUBUCj
 Bpbg==
X-Gm-Message-State: APjAAAVfIvI9Zpc3IZzdWqVwMzhRtpQIVuJFa3O/AXhxRHWfV178pSwp
 xgVSnhlqXRaAPOuVdpFtyQfydPdC
X-Google-Smtp-Source: APXvYqzPAq0vMI05Jg7SnrRYwfS1j/RbNAd8wPHQFmTynqTZZO1pCZjhnCxFi/eTKQrpox3XdzHGZA==
X-Received: by 2002:a63:c20e:: with SMTP id b14mr8805376pgd.96.1562386188503; 
 Fri, 05 Jul 2019 21:09:48 -0700 (PDT)
Received: from localhost.localdomain ([2405:204:22f:6255:6f39:949d:5942:eaaf])
 by smtp.gmail.com with ESMTPSA id
 q126sm17330847pfq.123.2019.07.05.21.09.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 21:09:47 -0700 (PDT)
From: Sukrit Bhatnagar <skrtbhtngr@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat,  6 Jul 2019 09:39:39 +0530
Message-Id: <20190706040940.7884-2-skrtbhtngr@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706040940.7884-1-skrtbhtngr@gmail.com>
References: <20190706040940.7884-1-skrtbhtngr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-devel] [RFC v2 1/2] hw/pvrdma: make DSR mapping idempotent in
 load_dsr()
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


