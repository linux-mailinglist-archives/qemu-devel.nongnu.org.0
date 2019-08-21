Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5797E52
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 17:14:08 +0200 (CEST)
Received: from localhost ([::1]:49338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0SJK-0006sV-Ge
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 11:14:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44925)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen.git@gmail.com>) id 1i0SFK-0001ps-Rp
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:09:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen.git@gmail.com>) id 1i0SFJ-0002P0-J8
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:09:58 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tony.nguyen.git@gmail.com>)
 id 1i0SFJ-0002Nr-DO; Wed, 21 Aug 2019 11:09:57 -0400
Received: by mail-pf1-x444.google.com with SMTP id o70so1621498pfg.5;
 Wed, 21 Aug 2019 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f0x3e7GMMpiso6K6CGS6kNz9AsRvhQApmKNwlZl47D0=;
 b=ZQexT5/Od9wawLaf5cXC4tRi+/frza1XiZFuERt0oZv/xlWkFbVAZiTegQMIaZ5Csd
 dUI0aO8kWgGkT5V99bAq+EEoJEmpee6L2OnR53tvFintH71R89Og1f89j4/axQC4G6D2
 SJ29CKWeW5Hk+QfwyIT+ApiITUXDwIwKC5fNxVqv6+nuMKixWJ0wK6tsZ1YrRea/Vh+e
 cBRaR4HoJ3iZrxBvwJz/JGGCoZef3W7XqSJ9RtdtrnxfFZLicHNsWRtjI/xrmtfwGvla
 4iVyObGbPmUVS/thn9Dxk2M/cb20v7nNanl+FTS7ZgDmRMZ0ionOTyBU+C8rAEikLWwr
 xq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f0x3e7GMMpiso6K6CGS6kNz9AsRvhQApmKNwlZl47D0=;
 b=sSozYCIgx9mpmpOvBdFO1+hyvwLAZBAZRdH2dy0dDCIKOdD+pqYr9bLDB30bFsSenE
 Pvkp15wITyLoUZJmGcdmzD57ZUu15sEg6qi43+5awapO2qSHMd5sUofpx/DZD5zQf9uW
 0mVxLA9F9/hJ3yCRKWAJhGQnLlEfPs1GAsliAZH2/0v1rxRcR7ThRRuV0tx3Lx2MJ34G
 6JWktlO7sRm6N+oqNO1QD3z2McFB94NNA1Pv6F4+WAiwVBUAmYYPV2H0GJFH8Jgw/8Wk
 Tdvw3nMP8JAdL+ZVhnzyz4ETaNKF9Pbv2U0CzYN6Y1+8UgZogYi7LvpBIeaDOwSNtmi/
 H4YQ==
X-Gm-Message-State: APjAAAWQ/d5XTX4z5aNOMGOqJm07eVo4lGeWCRUrrb28i4CXj+ZFGq6T
 lGDG8vSun/MFjUID3BkMiDi6JNYZD2Y=
X-Google-Smtp-Source: APXvYqxs1abTmzKRmFvCVF0yFLd3g/Mcjrz1He/uHS7WTfMH641pa4AnqK5ahVNzVTrUd2Ay4XNBAg==
X-Received: by 2002:a17:90a:bc4b:: with SMTP id
 t11mr454672pjv.87.1566400196071; 
 Wed, 21 Aug 2019 08:09:56 -0700 (PDT)
Received: from localhost.localdomain ([58.173.98.68])
 by smtp.gmail.com with ESMTPSA id e19sm5887633pfh.114.2019.08.21.08.09.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 21 Aug 2019 08:09:55 -0700 (PDT)
From: Tony Nguyen <tony.nguyen.git@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 01:08:59 +1000
Message-Id: <500caaa5821fd752a13e2893f8c166f0e085e151.1566397711.git.tony.nguyen.git@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566397711.git.tony.nguyen.git@gmail.com>
References: <cover.1566397711.git.tony.nguyen.git@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-devel] [PATCH v8 05/21] hw/s390x: Access MemoryRegion with
 MemOp
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
Cc: Tony Nguyen <tony.nguyen@bt.com>, Collin Walling <walling@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Tony Nguyen <tony.nguyen.git@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/s390x/s390-pci-inst.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 00235148be..0c958fc391 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -15,6 +15,7 @@
 #include "cpu.h"
 #include "s390-pci-inst.h"
 #include "s390-pci-bus.h"
+#include "exec/memop.h"
 #include "exec/memory-internal.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
@@ -372,7 +373,7 @@ static MemTxResult zpci_read_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
     mr = pbdev->pdev->io_regions[pcias].memory;
     mr = s390_get_subregion(mr, offset, len);
     offset -= mr->addr;
-    return memory_region_dispatch_read(mr, offset, data, len,
+    return memory_region_dispatch_read(mr, offset, data, size_memop(len),
                                        MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -471,7 +472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbdev, uint8_t pcias,
     mr = pbdev->pdev->io_regions[pcias].memory;
     mr = s390_get_subregion(mr, offset, len);
     offset -= mr->addr;
-    return memory_region_dispatch_write(mr, offset, data, len,
+    return memory_region_dispatch_write(mr, offset, data, size_memop(len),
                                         MEMTXATTRS_UNSPECIFIED);
 }
 
@@ -780,7 +781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8_t r3, uint64_t gaddr,
 
     for (i = 0; i < len / 8; i++) {
         result = memory_region_dispatch_write(mr, offset + i * 8,
-                                              ldq_p(buffer + i * 8), 8,
+                                              ldq_p(buffer + i * 8),
+                                              size_memop(8),
                                               MEMTXATTRS_UNSPECIFIED);
         if (result != MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
-- 
2.23.0


