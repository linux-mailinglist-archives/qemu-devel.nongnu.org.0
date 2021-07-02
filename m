Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C283B9E45
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 11:32:53 +0200 (CEST)
Received: from localhost ([::1]:39162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzFXY-0001nB-1s
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 05:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPq-0004us-7S
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lzFPn-0001bi-AX
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 05:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625217888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reU/EERyCRIMmUMeN/sG3kQwb7Xc7HiGTNBUAqpoIMw=;
 b=fYaVbKLTOBfA7PaOQ2dSOi865x4FNNQFaO6dz7Jtuiv7G1FI4BELCtzyncwjA0WzgegK7s
 4bEz6JWVjrVLK6gqHTUM6F6scjJp0tSJdWENuwnNm9VC4R184iEgTCZpO3WZpwhmC1d0y7
 2ZRo+xhigUFfy3uVAkwMyJTgR8A9bz0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-UF-m0kTINqyJqBBxHCXm4g-1; Fri, 02 Jul 2021 05:24:47 -0400
X-MC-Unique: UF-m0kTINqyJqBBxHCXm4g-1
Received: by mail-wr1-f70.google.com with SMTP id
 x8-20020a5d54c80000b029012583535285so3679668wrv.8
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 02:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=reU/EERyCRIMmUMeN/sG3kQwb7Xc7HiGTNBUAqpoIMw=;
 b=Kjq3U0EIzBYtNwxldoXQKc6L9XG1RWrEmOpMpCKNMlh4fRT7TNXR3mxH/zSVbwnTd1
 Kq80EhHsHoYQb1kv3iowpOfzGcewHGhWRfVzyrJjrTl/MRfZImW2FOHUD348eLew4Ur2
 j5E82K2xrGilH8EEAuArK+Wml4ADvZMrmbymi3qbE3wvQAp0c0quVpbUF7Ow9qyHJQKK
 OyK/AdN9JEFJLv1vqwIDLqW2Cq7/12md1h5SxLm0ZAUWaMc6tGK0MS1vTFYieQHtKeL/
 LvknYiWc0eLUjEnZeQVNkBTh3Hf+AYm5cIUW8nHNvHb/l5h04jSFQviQe2RC8KN993c1
 5LgQ==
X-Gm-Message-State: AOAM5339gdoVrxR2+hgcaFrXK7b96Gz2OVv+kx8sqweQxcB6eadwL3fr
 GduxOkmsKaQz54h1dVKWAQrrm+GDDFrDkcMIaikg1oHpVE+e+Yn6bfM5RgLBdI+O64Xd4icEsSt
 6sWJGqD28GTOl6Kzc3QGjrkYf69peqX3mG4MTLZkYbFVMeS8gUs07Gv9tnR7V95UG
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr4656647wrw.155.1625217885959; 
 Fri, 02 Jul 2021 02:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkRXpd/GmlSQr2jKtQ3FFI68N74LgRgjTIGiy8yU/dKA9gljxIfL90OWvrEh4QoePpu3yRxA==
X-Received: by 2002:a5d:69c9:: with SMTP id s9mr4656616wrw.155.1625217885754; 
 Fri, 02 Jul 2021 02:24:45 -0700 (PDT)
Received: from x1w.Ascou-CH1 (pop.92-184-108-94.mobile.abo.orange.fr.
 [92.184.108.94])
 by smtp.gmail.com with ESMTPSA id g7sm2311001wmq.27.2021.07.02.02.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 02:24:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] dma: Let dma_memory_valid() take MemTxAttrs argument
Date: Fri,  2 Jul 2021 11:24:34 +0200
Message-Id: <20210702092439.989969-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210702092439.989969-1-philmd@redhat.com>
References: <20210702092439.989969-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.402,
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_valid().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 2 +-
 include/sysemu/dma.h       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 4bea87f39cc..4c45f1579fa 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -91,7 +91,7 @@ static inline void spapr_vio_irq_pulse(SpaprVioDevice *dev)
 static inline bool spapr_vio_dma_valid(SpaprVioDevice *dev, uint64_t taddr,
                                        uint32_t size, DMADirection dir)
 {
-    return dma_memory_valid(&dev->as, taddr, size, dir);
+    return dma_memory_valid(&dev->as, taddr, size, dir, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline int spapr_vio_dma_read(SpaprVioDevice *dev, uint64_t taddr,
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 3201e7901db..296f3b57c9c 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -73,11 +73,11 @@ static inline void dma_barrier(AddressSpace *as, DMADirection dir)
  * dma_memory_{read,write}() and check for errors */
 static inline bool dma_memory_valid(AddressSpace *as,
                                     dma_addr_t addr, dma_addr_t len,
-                                    DMADirection dir)
+                                    DMADirection dir, MemTxAttrs attrs)
 {
     return address_space_access_valid(as, addr, len,
                                       dir == DMA_DIRECTION_FROM_DEVICE,
-                                      MEMTXATTRS_UNSPECIFIED);
+                                      attrs);
 }
 
 static inline MemTxResult dma_memory_rw_relaxed(AddressSpace *as,
-- 
2.31.1


