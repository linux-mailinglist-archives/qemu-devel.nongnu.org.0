Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF64836068D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:07:30 +0200 (CEST)
Received: from localhost ([::1]:48496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWyuH-0004Bj-RQ
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWyrG-0001vR-Jl
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:04:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lWyrE-000506-Jv
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618481059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xMCoBlScEBzYBsarVCZrwNR5sWCvV8ZrzKqBfidkwh8=;
 b=fJhTI2/xiJJkeLJMj8HNGtia6vE4P4U9xJrZrgk7nk3uD/aLfldRdDZxA8AxThG1D4vQTp
 QruU0Bi2W5rTb9s7JVs+Z1Yr49fp0zIAe9dfha+s1LWkZZqYNFtDH4hLoY/WgAxGPanUIN
 pR6zhUqFp3c7Q2CKHPkkOzO4dCtIjfo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-PFYtZdYYMOOJAWsLkCQQ-Q-1; Thu, 15 Apr 2021 06:04:18 -0400
X-MC-Unique: PFYtZdYYMOOJAWsLkCQQ-Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c3792b0290128219cbc7bso2713041wmr.4
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 03:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xMCoBlScEBzYBsarVCZrwNR5sWCvV8ZrzKqBfidkwh8=;
 b=jT18zpggw/xYOTFpGPe3JMElzYE0RVJm1SgLT4cfp60X/Njw7LXfO5U9TmENKR5acp
 zLidQY4YjG8orVhSi3DcIoZcYNslhwij9cxh0dqL3BYLHx3UGpOwJHIP1KcDVSkqvYQe
 Y4Uoze2MP9s2+455Lre2vW+5ssbYHjIGE30+dFGllG9em+2051Hq9mxgkjuvMU6/Og+K
 13RN0eqf9BN8sb5kQcyhKY4NWbDPi+svD++9yygioZPu+jGwL401nwjLs/esXLiu5b+E
 IRb/ljl7+TAnj8PGvbD9eMno6AJ2Akjkt1g/YIEvaqkXq98Fg3y0f8SrHhAPx6ck1kJy
 4APA==
X-Gm-Message-State: AOAM532DEJ0qs6tujGRH3RkOcSkWWkXbDB1d6kSzilkhnD/kJHThdHRa
 6qDmPhzLwXksZHCwqd5CO1B34W96wPWVfNFLrrWnN0rdCePE74HwxJru5+cTxnjtMMwb+fnczVZ
 3cdkq3Mi/elGhGXQ=
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr2562269wrs.350.1618481057272; 
 Thu, 15 Apr 2021 03:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxjBu6B+uS0BdYeredB28yoTL2k9Xydm6zXE/MxD6jA0tOwiz+IXRGgb5MOd6vBS2joTNGg/A==
X-Received: by 2002:adf:fdc7:: with SMTP id i7mr2562247wrs.350.1618481057071; 
 Thu, 15 Apr 2021 03:04:17 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id g13sm2597085wrr.9.2021.04.15.03.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 03:04:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] exec/memory: Extract address_space_set() from
 dma_memory_set()
Date: Thu, 15 Apr 2021 12:04:08 +0200
Message-Id: <20210415100409.3977971-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210415100409.3977971-1-philmd@redhat.com>
References: <20210415100409.3977971-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_set() does a DMA barrier, set the address space with
a constant value. The constant value filling code is not specific
to DMA and can be used for AddressSpace. Extract it as a new
helper: address_space_set().

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memory.h | 16 ++++++++++++++++
 softmmu/dma-helpers.c | 16 +---------------
 softmmu/physmem.c     | 19 +++++++++++++++++++
 3 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 5728a681b27..192139af58e 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -2568,6 +2568,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
     }
 }
 
+/**
+ * address_space_set: Fill address space with a constant byte.
+ *
+ * Return a MemTxResult indicating whether the operation succeeded
+ * or failed (eg unassigned memory, device rejected the transaction,
+ * IOMMU fault).
+ *
+ * @as: #AddressSpace to be accessed
+ * @addr: address within that address space
+ * @c: constant byte to fill the memory
+ * @len: the number of bytes to fill with the constant byte
+ * @attrs: memory transaction attributes
+ */
+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
+                              uint8_t c, hwaddr len, MemTxAttrs attrs);
+
 #ifdef NEED_CPU_H
 /* enum device_endian to MemOp.  */
 static inline MemOp devend_memop(enum device_endian end)
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7d766a5e89a..8e1e7ad5320 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -23,21 +23,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
-#define FILLBUF_SIZE 512
-    uint8_t fillbuf[FILLBUF_SIZE];
-    int l;
-    MemTxResult error = MEMTX_OK;
-
-    memset(fillbuf, c, FILLBUF_SIZE);
-    while (len > 0) {
-        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
-        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                     fillbuf, l);
-        len -= l;
-        addr += l;
-    }
-
-    return error;
+    return address_space_set(as, addr, c, len, MEMTXATTRS_UNSPECIFIED);
 }
 
 void qemu_sglist_init(QEMUSGList *qsg, DeviceState *dev, int alloc_hint,
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 85034d9c11e..c9117527ae7 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2891,6 +2891,25 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
     }
 }
 
+MemTxResult address_space_set(AddressSpace *as, hwaddr addr,
+                              uint8_t c, hwaddr len, MemTxAttrs attrs)
+{
+#define FILLBUF_SIZE 512
+    uint8_t fillbuf[FILLBUF_SIZE];
+    int l;
+    MemTxResult error = MEMTX_OK;
+
+    memset(fillbuf, c, FILLBUF_SIZE);
+    while (len > 0) {
+        l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
+        error |= address_space_write(as, addr, attrs, fillbuf, l);
+        len -= l;
+        addr += l;
+    }
+
+    return error;
+}
+
 void cpu_physical_memory_rw(hwaddr addr, void *buf,
                             hwaddr len, bool is_write)
 {
-- 
2.26.3


