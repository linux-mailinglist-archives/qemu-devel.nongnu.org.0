Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D49E48211F
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:01:00 +0100 (CET)
Received: from localhost ([::1]:60014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36Hz-00009Z-Ja
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:00:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DM-0000cX-Td
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DL-0003X5-Bj
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ys/cNV69q3G25W9D3DPfAUUoPaKwIaNZm6mQ9dXuTPg=;
 b=HO3IQ1bEm7xSX0Im3MSzgDbLvdMWeYYRHc1bIgkf5JjHj1971T0UXDMRdDMKlEbAwnMYRw
 lm2tWTDjNR/es2tTatITdsFASh+2yXqFLW3BepXhU/9AnAgd0RsEDk8iy1uJo2vadWR10M
 xFt/JnDKRKg1eeGM3wGQU+MWNfzdLfM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-1lY4RVdnPOmpUKGkqslICg-1; Thu, 30 Dec 2021 19:56:09 -0500
X-MC-Unique: 1lY4RVdnPOmpUKGkqslICg-1
Received: by mail-ed1-f71.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso10808013edd.16
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ys/cNV69q3G25W9D3DPfAUUoPaKwIaNZm6mQ9dXuTPg=;
 b=YbSs7qyDkGg0zQFPSNBuZZGQAo9tKfg1bFu/IedLhO3+TnyHVqxZEO97SatK+mTetF
 OiHKKGmBoPr5w/aCDrDwcLssTks7Y0oMoCoRl+BYNBM8ZC/eaYXMv3dkiV4LXes9Hhw7
 3Ds7mNzdz3/foKUwf8ZGBc5C/qJihhMtKypoGmeQm5HKlZ9r2NaGGSIDr0w8jIb9JK5h
 fIErOBGrngivhErcHiivRwsnHFunb7mVViFyh53BCSRxrmAPkqcw8OnGtICUy71Xc1jF
 ub7++yyd7Cj0vZVhyXmvLBJHlNXLDIAXJlN/nkGETLhXtrn8V89GVDHmNLaA13xFaofH
 blvw==
X-Gm-Message-State: AOAM532xAF5E1xY6W/Yz0D95bxnkcIsG2Rd5DT4S/vbdwQFI6EYfHyAS
 6b57EJ3NcmUJYAwNO4N37d0d+N8UuMdq05s/5mLHwAzxiYg53RBU8KOExo0DbQneSQe0AaGXXdo
 Rb+khWVfjf0ejC9N0BUBiTEalJYU2HKx5zSbVrDu8dSTnOMJF2zg/rOLbKBBK+E3p
X-Received: by 2002:a05:6402:490:: with SMTP id
 k16mr32975131edv.99.1640912168446; 
 Thu, 30 Dec 2021 16:56:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwH2NrNYbQq8rHB//OHaJPXNXkMFA8bfIJstnVpnHvpRPLaKE8W+DBKEsyDhYpkM/XYVmQ8BQ==
X-Received: by 2002:a05:6402:490:: with SMTP id
 k16mr32975110edv.99.1640912168251; 
 Thu, 30 Dec 2021 16:56:08 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id s13sm9991317edd.15.2021.12.30.16.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/22] dma: Let dma_memory_rw_relaxed() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:28 +0100
Message-Id: <20211231005546.723396-5-philmd@redhat.com>
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

We will add the MemTxAttrs argument to dma_memory_rw() in
the next commit. Since dma_memory_rw_relaxed() is only used
by dma_memory_rw(), modify it first in a separate commit to
keep the next commit easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211223115554.3155328-4-philmd@redhat.com>
---
 include/sysemu/dma.h | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index d23516f020a..3be803cf3ff 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -83,9 +83,10 @@ static inline bool dma_memory_valid(AddressSpace *as,
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
                                                 dma_addr_t addr,
                                                 void *buf, dma_addr_t len,
-                                                DMADirection dir)
+                                                DMADirection dir,
+                                                MemTxAttrs attrs)
 {
-    return address_space_rw(as, addr, MEMTXATTRS_UNSPECIFIED,
+    return address_space_rw(as, addr, attrs,
                             buf, len, dir == DMA_DIRECTION_FROM_DEVICE);
 }
 
@@ -93,7 +94,9 @@ static inline MemTxResult dma_memory_read_relaxed(AddressSpace *as,
                                                   dma_addr_t addr,
                                                   void *buf, dma_addr_t len)
 {
-    return dma_memory_rw_relaxed(as, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return dma_memory_rw_relaxed(as, addr, buf, len,
+                                 DMA_DIRECTION_TO_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
@@ -102,7 +105,8 @@ static inline MemTxResult dma_memory_write_relaxed(AddressSpace *as,
                                                    dma_addr_t len)
 {
     return dma_memory_rw_relaxed(as, addr, (void *)buf, len,
-                                 DMA_DIRECTION_FROM_DEVICE);
+                                 DMA_DIRECTION_FROM_DEVICE,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -124,7 +128,8 @@ static inline MemTxResult dma_memory_rw(AddressSpace *as, dma_addr_t addr,
 {
     dma_barrier(as, dir);
 
-    return dma_memory_rw_relaxed(as, addr, buf, len, dir);
+    return dma_memory_rw_relaxed(as, addr, buf, len, dir,
+                                 MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
-- 
2.33.1


