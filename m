Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B28633161D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 19:31:13 +0100 (CET)
Received: from localhost ([::1]:56018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJKeu-0006B3-G2
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 13:31:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlI-0007Ta-Dr
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:44 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:44553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJkx-0007Bt-V2
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:44 -0500
Received: by mail-wr1-x444.google.com with SMTP id h98so12288574wrh.11
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=eUOy10h6l9Mh1ugCMsrFlHQrTvRYewnaf11aD1mGqGY=;
 b=B7Eg0C+UzR70IIwH2YLxIyYHWKkx1JpNntxisZIbi7YdSyuRvrSvh5zCgBZ6IQHjGp
 mtKmVhSJHSEXbCqCEli6rptrJUQlNssTLeNuBB3BB1n1XBGe48E7ELY2SSUA9JWE+lwL
 G2sPWuxe04fSro1tChdplBKt3bHr1TSbkle6bUCZ48mYEPmjWzpls7QU6yyqx02rXWoD
 nLJUwwQnYV2SGJ7cmxX2MepRT+HZnHp0y21JDFICmze8Ksan3/7HGyYXl0Uf6qY2d6vE
 Qj+I3oK1sYXTtyiRoifaRWWnNXezeLDlWVDjH0YQK6JBESgyW0q7RBFE0IMwO7ujCiwb
 /LQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUOy10h6l9Mh1ugCMsrFlHQrTvRYewnaf11aD1mGqGY=;
 b=CLlYf2lCb0bpPMrZ6QYyRFHKlG2ElfFpXrbhKLAnN5GVBmqbGSR1YrmbJqd73By5+r
 G8zfEyF2/qTEgRUnkdhHiYqbLK7l1q8jKaUL/hMM171DZ4PhEke+FUgvhCRdduCs2bag
 7/6lIAWQ0ESnL/tIyTiEwfarYF3cWcEg6cE77T9g4WwgJUw9dKui3gM61MJGQMcHIUcS
 hvk4bsRUnjcvE2E/J22Ixq6Wq+9jZycoa/jnq7FhsV4tzv1/IKhrXWFRwndD77bfMXFc
 YJliUZQ6o+fG94K8qLpnl/k/f1qzAoviKk7hbzgw1Cn/OqtLvxfuiOS6MxU++WtNvO2M
 pxSg==
X-Gm-Message-State: AOAM531UtGmWBTNEPqlhdft5fWYBGo+Q1T1IS4KF/qiR81YEN+nZw85l
 CJMnCR3ZW5MMc3u+6O37CNQv3k0utnFFeA==
X-Google-Smtp-Source: ABdhPJwpSYyxX2C8W43HefxrNLEYwJHSbBXm+rbL/V1DxQ1AgBfkrCaeAjGztBxD8sldTMJaqJBxlQ==
X-Received: by 2002:adf:eb8e:: with SMTP id t14mr23922761wrn.20.1615224802614; 
 Mon, 08 Mar 2021 09:33:22 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/54] hw/arm: xlnx-zynqmp: Clean up coding convention issues
Date: Mon,  8 Mar 2021 17:32:39 +0000
Message-Id: <20210308173244.20710-50-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xlnx-zynqmp.c and
xlnx-zynqmp.h, as reported by:

  $ ./scripts/checkpatch.pl include/hw/arm/xlnx-zynqmp.h
  $ ./scripts/checkpatch.pl hw/arm/xlnx-zynqmp.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20210303135254.3970-3-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h | 3 ++-
 hw/arm/xlnx-zynqmp.c         | 9 ++++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 0678b419a23..c83ef23e92d 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -60,7 +60,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 
 #define XLNX_ZYNQMP_GIC_REGIONS 6
 
-/* ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
+/*
+ * ZynqMP maps the ARM GIC regions (GICC, GICD ...) at consecutive 64k offsets
  * and under-decodes the 64k region. This mirrors the 4k regions to every 4k
  * aligned address in the 64k region. To implement each GIC region needs a
  * number of memory region aliases.
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 46030c1ef81..e2056a764e2 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -301,11 +301,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     ram_size = memory_region_size(s->ddr_ram);
 
-    /* Create the DDR Memory Regions. User friendly checks should happen at
+    /*
+     * Create the DDR Memory Regions. User friendly checks should happen at
      * the board level
      */
     if (ram_size > XLNX_ZYNQMP_MAX_LOW_RAM_SIZE) {
-        /* The RAM size is above the maximum available for the low DDR.
+        /*
+         * The RAM size is above the maximum available for the low DDR.
          * Create the high DDR memory region as well.
          */
         assert(ram_size <= XLNX_ZYNQMP_MAX_RAM_SIZE);
@@ -521,7 +523,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         SysBusDevice *sbd = SYS_BUS_DEVICE(&s->sdhci[i]);
         Object *sdhci = OBJECT(&s->sdhci[i]);
 
-        /* Compatible with:
+        /*
+         * Compatible with:
          * - SD Host Controller Specification Version 3.00
          * - SDIO Specification Version 3.0
          * - eMMC Specification Version 4.51
-- 
2.20.1


