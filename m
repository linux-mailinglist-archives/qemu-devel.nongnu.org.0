Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC51483E99
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 09:59:46 +0100 (CET)
Received: from localhost ([::1]:45334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4ffV-0007HO-7a
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 03:59:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fav-0008CJ-1Y; Tue, 04 Jan 2022 03:55:01 -0500
Received: from [2a00:1450:4864:20::32f] (port=42660
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n4fat-0007rD-JX; Tue, 04 Jan 2022 03:55:00 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 a83-20020a1c9856000000b00344731e044bso1048638wme.1; 
 Tue, 04 Jan 2022 00:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2os9m/hAMb49KMmbUKW6kq47tz90uuYsWaU1wqS4b0M=;
 b=eon27ZHzE6kVFkSCXuB/vHROaK+pZR1+V5NgCie8h8mqyCmVDASbv396vFz5ZYuzUA
 SSe1m2CTefwVKcHBuKGdYUt7D7Exo6Tr/iSD6SCvhSxx0ocCli+u/mPpxlHKDnlWE0B4
 Fxk91EG9WjP2bbNua77T9SxaCXuB8lPdLK/HqbNpQu/6pmrc1olRYquxhs6dkH4N5jp1
 H0dLyZnqeNXhumRlQPKqovZJGudH1GecDZLUthdr4ocVQ8Scsz6N0GxQdD9sC86rpPJE
 rgD64yyPRWQ0aWnvlIa71H9eHmJCD2wgjdioWkYz0LcaxtBdZ1KKHGyZ7Js81TiVj4yh
 c7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2os9m/hAMb49KMmbUKW6kq47tz90uuYsWaU1wqS4b0M=;
 b=lNDRWq9olLvbRVMdxTx7AQtGfE02VacjHozO069wlpjiDQELaPsEsniIiM0rRczt1L
 /rUqDpq5T2/tz+b+Kcjtia0Ly60zDO6zclVXtZWL6iUjcpbdxrTDiHgUM5Tk2Lvh+Mkb
 mWCP2+puvUbQdou4lwiM9toFQ/pf+xyauLdnzpx7WIO3kERI5nBEANKxfjT+qnAP9t/7
 V14q+KwTiZeM1nhmkIz3Y6pt3AtZRLYCKdpz7p8http+SJ1mflqi7R18FvWqIYPbn4AS
 lI7Tm+J8g7HBzzTnm+E1RjpgMhomtHwVnRhfyTe7QC7PD3SOkKpDyNZ+F2m+fY/p+iNH
 t4OQ==
X-Gm-Message-State: AOAM532XDM1M79iQy0bsmMcpn0pukvydyFvhJMq/dG12jo3Fj5IoovYw
 w3EwqFf3sY9zx0uBabh6SI5uzH2B8rxHvA==
X-Google-Smtp-Source: ABdhPJwMSfoSzPN+Qcf+zke1q+FXyOMvCyCA4iHoLM90L1ANOxvEcfWAY73Zvd9FPY7OYTOGn3359A==
X-Received: by 2002:a05:600c:1c18:: with SMTP id
 j24mr41927620wms.189.1641286497911; 
 Tue, 04 Jan 2022 00:54:57 -0800 (PST)
Received: from x1w.. (26.red-83-50-86.dynamicip.rima-tde.net. [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id 1sm30724345wrb.13.2022.01.04.00.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 00:54:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/9] hw/rdma/rdma_utils: Rename rdma_pci_dma_map 'len'
 argument
Date: Tue,  4 Jan 2022 09:54:27 +0100
Message-Id: <20220104085431.2122999-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220104085431.2122999-1-f4bug@amsat.org>
References: <20220104085431.2122999-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Various APIs use 'pval' naming for 'pointer to val'.
rdma_pci_dma_map() uses 'plen' for 'PCI length', but since
'PCI' is already explicit in the function name, simplify
and rename the argument 'len'. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/rdma/rdma_utils.h |  2 +-
 hw/rdma/rdma_utils.c | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/rdma/rdma_utils.h b/hw/rdma/rdma_utils.h
index 9fd0efd940b..0c6414e7e0a 100644
--- a/hw/rdma/rdma_utils.h
+++ b/hw/rdma/rdma_utils.h
@@ -38,7 +38,7 @@ typedef struct RdmaProtectedGSList {
     GSList *list;
 } RdmaProtectedGSList;
 
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen);
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len);
 void rdma_pci_dma_unmap(PCIDevice *dev, void *buffer, dma_addr_t len);
 void rdma_protected_gqueue_init(RdmaProtectedGQueue *list);
 void rdma_protected_gqueue_destroy(RdmaProtectedGQueue *list);
diff --git a/hw/rdma/rdma_utils.c b/hw/rdma/rdma_utils.c
index 98df58f6897..61cb8ede0fd 100644
--- a/hw/rdma/rdma_utils.c
+++ b/hw/rdma/rdma_utils.c
@@ -17,29 +17,29 @@
 #include "trace.h"
 #include "rdma_utils.h"
 
-void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t plen)
+void *rdma_pci_dma_map(PCIDevice *dev, dma_addr_t addr, dma_addr_t len)
 {
     void *p;
-    hwaddr len = plen;
+    hwaddr pci_len = len;
 
     if (!addr) {
         rdma_error_report("addr is NULL");
         return NULL;
     }
 
-    p = pci_dma_map(dev, addr, &len, DMA_DIRECTION_TO_DEVICE);
+    p = pci_dma_map(dev, addr, &pci_len, DMA_DIRECTION_TO_DEVICE);
     if (!p) {
         rdma_error_report("pci_dma_map fail, addr=0x%"PRIx64", len=%"PRId64,
-                          addr, len);
+                          addr, pci_len);
         return NULL;
     }
 
-    if (len != plen) {
-        rdma_pci_dma_unmap(dev, p, len);
+    if (pci_len != len) {
+        rdma_pci_dma_unmap(dev, p, pci_len);
         return NULL;
     }
 
-    trace_rdma_pci_dma_map(addr, p, len);
+    trace_rdma_pci_dma_map(addr, p, pci_len);
 
     return p;
 }
-- 
2.33.1


