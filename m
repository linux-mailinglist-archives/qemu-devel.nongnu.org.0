Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE18A48211E
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:00:37 +0100 (CET)
Received: from localhost ([::1]:59462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Hc-0008De-L2
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:00:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DJ-0000SH-FP
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DH-0003Wa-OR
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KeiKMm3CiVyYkpY8CZBmincKnDi2qBU6go149AXy5rM=;
 b=Neroi8xz6c7ibgkP0XtH/meXqrK3FDsimcjKud637kTeRVvTZmLuaZKp/Esc9WjsuBuwiD
 aXT8se7AuQ4BKHe993u9BdH8yYFNnAlQ3NuOz088Ocja2KiGSzTMtHSUmXz4a+7J4EpGgb
 +7lvXpLa47wxPAOKPGcKbIv9miUsw0Q=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-_9VmfQfoN_-8M-WnH9icbQ-1; Thu, 30 Dec 2021 19:56:05 -0500
X-MC-Unique: _9VmfQfoN_-8M-WnH9icbQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 s7-20020a056402520700b003f841380832so18007501edd.5
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KeiKMm3CiVyYkpY8CZBmincKnDi2qBU6go149AXy5rM=;
 b=qgYmykPRZZ+1kNZeYeuKYjHfkpYaYcw57CLSl5Bs6SRmUjXLtj24gK5YxZ17KEo80Y
 WVByAD1jEEeALcHQDFOOY9yWJ/GnrmxR7/JqVFroDzkcTF9jfXRAidYlZRx1Xfck6tkz
 gABbDUJwaWtH0AdtHd/4Ke3kpAqSHG+uOUl5bieFe9cUQEmkgGhM63vQOFPKV2NnKFFd
 skxlx2Rr1f8IW78+JyzI/m8xDjwTMEA9s417vgaWYTsujlVw6pgwCphGNpUl/4FX2BSq
 d+YmdCM85/S71w9ss0oLmrmGDyEGg0Cv3uFE1XxTk+Qg0PUUk1ECvH54FLRGSfNZzPKn
 gKDw==
X-Gm-Message-State: AOAM533Aw/0lANzlwYs9vTeh/W9lDSMBueuPgYzNAKFxA8KGcjdDGBqY
 7i28ws+1ZZwzDefq0TowiAcHVyZmvruOrb1yFUNf0ajEXxI5c/83Mz/AwTco5e0A73fypqS4LA9
 bN0NaFBUMPms7S24lRYtDbFPZqjFhoZol8IPHoKnEIS8nSGrtE3A/lAs2qQRk6uWy
X-Received: by 2002:a17:907:3f1e:: with SMTP id
 hq30mr26395927ejc.613.1640912163820; 
 Thu, 30 Dec 2021 16:56:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8EpB5y2+AMoaEaWfz4XYbAXOoEvLYwkRjiiX7GIsqoOr1LpK8Iery8RuK1CPuCr8UjUlmnA==
X-Received: by 2002:a17:907:3f1e:: with SMTP id
 hq30mr26395911ejc.613.1640912163521; 
 Thu, 30 Dec 2021 16:56:03 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id b7sm9978785edj.24.2021.12.30.16.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/22] dma: Let dma_memory_set() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:27 +0100
Message-Id: <20211231005546.723396-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, Li Qiang <liq3ea@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_set().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211223115554.3155328-3-philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 3 ++-
 include/sysemu/dma.h       | 3 ++-
 hw/nvram/fw_cfg.c          | 3 ++-
 softmmu/dma-helpers.c      | 5 ++---
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 4c45f1579fa..c90e74a67dd 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -111,7 +111,8 @@ static inline int spapr_vio_dma_write(SpaprVioDevice *dev, uint64_t taddr,
 static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
                                     uint8_t c, uint32_t size)
 {
-    return (dma_memory_set(&dev->as, taddr, c, size) != 0) ?
+    return (dma_memory_set(&dev->as, taddr,
+                           c, size, MEMTXATTRS_UNSPECIFIED) != 0) ?
         H_DEST_PARM : H_SUCCESS;
 }
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 296f3b57c9c..d23516f020a 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -175,9 +175,10 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
  * @addr: address within that address space
  * @c: constant byte to fill the memory
  * @len: the number of bytes to fill with the constant byte
+ * @attrs: memory transaction attributes
  */
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len);
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs);
 
 /**
  * address_space_map: Map a physical memory region into a host virtual address.
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index c06b30de112..f7803fe3c30 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -399,7 +399,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
              * tested before.
              */
             if (read) {
-                if (dma_memory_set(s->dma_as, dma.address, 0, len)) {
+                if (dma_memory_set(s->dma_as, dma.address, 0, len,
+                                   MEMTXATTRS_UNSPECIFIED)) {
                     dma.control |= FW_CFG_DMA_CTL_ERROR;
                 }
             }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7d766a5e89a..1f07217ad4a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -19,7 +19,7 @@
 /* #define DEBUG_IOMMU */
 
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len)
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs)
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
@@ -31,8 +31,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
     memset(fillbuf, c, FILLBUF_SIZE);
     while (len > 0) {
         l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
-        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                     fillbuf, l);
+        error |= address_space_write(as, addr, attrs, fillbuf, l);
         len -= l;
         addr += l;
     }
-- 
2.33.1


