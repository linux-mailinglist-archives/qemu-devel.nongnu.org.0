Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1123602C27
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:52:32 +0200 (CEST)
Received: from localhost ([::1]:44134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okm57-0007ur-Kn
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:52:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1oklgm-0003HH-MF
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:27:34 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f]:33446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chrisfriedt@gmail.com>)
 id 1oklgl-0000yK-3I
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:27:20 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id i9so9189861qvo.0
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5x4dBfAZ68fvL+9myHdMYj1PuVW+JTaBlIoAiFAXd+M=;
 b=O7iHBjf0E/ToFXpeF6tqDNu7LyphB+F8+0ZWA8v8mgKPJCQ6k7o97k6PXXy1kbPXSY
 V5jdOP3yPjCItdnKTD6Adse+pFQ/aXmjWy517C9LKnPwuw3JnsDBmH1QFjdlEioJuAiV
 qiXShXkASGK6Bz9rJbnoKvgh4xRiRcYjHJbZMRnH8mGt4XwL1PAsyfLvQ+up8i9xWOKT
 3n8YDFiFo+hkFIlwJoBsnr/xFw4JHOBNViCt5h+ou8RJEMld2iUcQf1c7XY5/eqYn1Lc
 yefwNI+LKl2mLDZltw2x1CA/4TsWX87NcjIlO4cajFmRxGvig2XIF5QxhmcnS03KgN8P
 SVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5x4dBfAZ68fvL+9myHdMYj1PuVW+JTaBlIoAiFAXd+M=;
 b=OBbdJhn78o1UC5CLqkRQvZSB6MbkywfMr4U/lBvgU8K3SH98JMtdxra8jkvQpIxl5V
 00mSrZPBbVi2an4e9/MIPjc8Jpalbb5daqY9dFvqA6JHWcJzHYTTjNCx/y13WgrR8wEB
 6KQioqIx8dfR+xXKtmfRYIhmZaqRiROAN6ttZ5LzpYFQbkEfc73l0wYcw0Rm/QoLVJDZ
 f36bimsMtG8PFnA77M9PIaIXBR7CXSOJbQUI7y5uR99mMNVupTX4Ikly4AYEzM3AknjS
 resPOI0Q7iqkGdwi50z83JAiHfv5xnCwFRX/1NHrD+qM7MhxgAJbCuqVJkA/KdU3nWcg
 aZ+g==
X-Gm-Message-State: ACrzQf1rGrCfu7RzB61fq1MP4BLXjkdqFYk4/O0+48B1xesXUA2pr19s
 lAfpODf0Bvg0wTTrC6zO7uNhhmHW1F6cEg==
X-Google-Smtp-Source: AMsMyM7Vm9kQnFBe4HzaY0Y9I4C/JL73XSKRATVS3cIanpuetPUAKO/bsbTToSjh+2uWoos3RFoN3w==
X-Received: by 2002:a05:6214:1c85:b0:4af:86a1:9983 with SMTP id
 ib5-20020a0562141c8500b004af86a19983mr1999048qvb.35.1666096037166; 
 Tue, 18 Oct 2022 05:27:17 -0700 (PDT)
Received: from localhost.localdomain ([2001:1970:50d6:9900::a196])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a05620a284700b006ecb9dfdd15sm2276248qkp.92.2022.10.18.05.27.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 18 Oct 2022 05:27:16 -0700 (PDT)
From: Chris Friedt <chrisfriedt@gmail.com>
X-Google-Original-From: Chris Friedt <cfriedt@meta.com>
To: qemu-devel@nongnu.org
Cc: cfriedt@meta.com,
	jslaby@suse.cz
Subject: [PATCH v4 2/3] hw: misc: edu: rename local vars in edu_check_range
Date: Tue, 18 Oct 2022 08:25:50 -0400
Message-Id: <20221018122551.94567-2-cfriedt@meta.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221018122551.94567-1-cfriedt@meta.com>
References: <20221018122551.94567-1-cfriedt@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=chrisfriedt@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serves to make the local variables a bit less ambiguous.

The latter two arguments are named to match DMA_START, and
DMA_SIZE.

Signed-off-by: Chris Friedt <cfriedt@meta.com>
---
 hw/misc/edu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index b3de8d206a..52afbd792a 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -103,24 +103,24 @@ static void edu_lower_irq(EduState *edu, uint32_t val)
     }
 }
 
-static void edu_check_range(uint64_t addr, uint64_t size1,
-                uint64_t start, uint64_t size2)
+static void edu_check_range(uint64_t xfer_start, uint64_t xfer_size,
+                uint64_t dma_start, uint64_t dma_size)
 {
-    uint64_t end1 = addr + size1;
-    uint64_t end2 = start + size2;
+    uint64_t xfer_end = xfer_start + xfer_size;
+    uint64_t dma_end = dma_start + dma_size;
 
     /*
      * 1. ensure we aren't overflowing
-     * 2. ensure that [addr, end1) is within [start, size2)
+     * 2. ensure that xfer is within dma address range
      */
-    if (end2 >= start && end1 >= addr &&
-        addr >= start && end1 <= end2) {
+    if (dma_end >= dma_start && xfer_end >= xfer_start &&
+        xfer_start >= dma_start && xfer_end <= dma_end) {
         return;
     }
 
     hw_error("EDU: DMA range 0x%016"PRIx64"-0x%016"PRIx64
              " out of bounds (0x%016"PRIx64"-0x%016"PRIx64")!",
-            addr, end1 - 1, start, end2 - 1);
+            xfer_start, xfer_end - 1, dma_start, dma_end - 1);
 }
 
 static dma_addr_t edu_clamp_addr(const EduState *edu, dma_addr_t addr)
-- 
2.36.1


