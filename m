Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF05948211A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:57:57 +0100 (CET)
Received: from localhost ([::1]:51326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36F3-0002p3-0T
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:57:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DE-0000EH-2a
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36DC-0003TO-C1
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uy66yOKuirQhWV608pFhVD3cE7bRMCKIXJgxDkyzKSE=;
 b=WKa7uKSMg9XgHHpTY+ukQVBpGFMOOSy8iAKLwaX/t7BchwT+oawLFsQhjHv5xOjra4idcg
 yRvtTNNlexdOMi1T/MBSpvUhowX4eWI5VLB0im1pMg4cxF9nNcg9t4Er+rfOrvIL+AW95G
 pcxfbmTdqn5iZm8q0E0YBGZeGIuxPnM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-9zH_oyvtMaSpq5wRybqaRw-1; Thu, 30 Dec 2021 19:56:00 -0500
X-MC-Unique: 9zH_oyvtMaSpq5wRybqaRw-1
Received: by mail-ed1-f72.google.com with SMTP id
 w10-20020a50d78a000000b003f82342a95aso18010064edi.22
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uy66yOKuirQhWV608pFhVD3cE7bRMCKIXJgxDkyzKSE=;
 b=YNnZz2JZpahLWfEil4nXjmG8GiaSp1JzuqWFDwfUF3V+xe8g1Y+3Ka/lReex4dlsrn
 jcjFwsEPKrPo1Mgo7urwildlF387X8EdSzK2WEgap3UNn2S7Dz/+EkEhriPAHK7VWZqb
 nSg/r9rwoMTivswO1TUTuxF/zkl+9filjuHhmJ8os5d/z78ugzQmfAR7zEbi0Pn29DVB
 qfW1RG68Mg2WHsb09ObSSI38El/u2P9F+lav6GXJTUlulLHvAj+nSfm1DXaDGOFMWZIa
 MMVYTE0/sD2qarM6Nhtgt2kaD2ebA+R77DEjVwBww3bDQmXgvOyvT2+jL/VPzIw9cTtw
 dyNA==
X-Gm-Message-State: AOAM5319SdOSDbppK865/aW40JrfBlKQdHGzCC6MiHE/v6uegY3rUsIA
 RB0zPRuhoa3Kmpkk4vaiaewaKuSLJcxpyDHmwjY3ODU7hQPzY3abV5DrxsvGyFkw8K1PH7QFf+X
 HFf9haa+jIRg6Nh5Omn8oRHQ+N0c0nCxhhWsFZkl/03tD21jgJ3Kq+9xHAJifCedN
X-Received: by 2002:a17:907:6291:: with SMTP id
 nd17mr27508360ejc.194.1640912158908; 
 Thu, 30 Dec 2021 16:55:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI+GJ4PwEgTyOFvi3A2nlMq/uUlGx0+QlsmykwqgsEfKS1giVY8J+QNyin6Odu4eSAR35GRg==
X-Received: by 2002:a17:907:6291:: with SMTP id
 nd17mr27508338ejc.194.1640912158703; 
 Thu, 30 Dec 2021 16:55:58 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id w11sm6836119edd.21.2021.12.30.16.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:55:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/22] dma: Let dma_memory_valid() take MemTxAttrs argument
Date: Fri, 31 Dec 2021 01:55:26 +0100
Message-Id: <20211231005546.723396-3-philmd@redhat.com>
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
dma_memory_valid().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20211223115554.3155328-2-philmd@redhat.com>
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
2.33.1


