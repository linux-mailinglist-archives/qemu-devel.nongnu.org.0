Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CC49FE40
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:43:46 +0100 (CET)
Received: from localhost ([::1]:46920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDULh-0005bQ-JS
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDQ-0002Is-4s
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:08 -0500
Received: from [2a00:1450:4864:20::32e] (port=46977
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDTDK-0006Oj-T0
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 10:31:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c190-20020a1c9ac7000000b0035081bc722dso4289773wme.5
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 07:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=22d1fLCQU0JVKA86D7S1UjAzLt5TquBHEZrRet1dyTw=;
 b=v7YTJihv7G4TdZCXr4zrRGvnfUqLuVmJ/9hJyZCH0/sCSABkxFMFQT0SHdH9sg0ueD
 9VNuzsF6GHIc77VJP97b22GpH22Z8TcdNDEvfdvjJilF2nP7fKtrA4l75ErZPc3FUhMx
 ag5gTHQNny/5hZjSJDnAkZES33mYNzX6hH194WyomM77Y1p19kWE58T6CbciDWvlVkW2
 Aj0xqw3B593CyImhnfmYL+Qd1g1VnWI6JZrqrhxeX5zKHIQAl+6clpB1gYP7JEgXfD4q
 9fj7YlCtnWHJgRYV3L3GLuK34X353q2WqIt6fsnhZlC1wlYvtwzlLcpyiJCCpevXx1JL
 dwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=22d1fLCQU0JVKA86D7S1UjAzLt5TquBHEZrRet1dyTw=;
 b=YSyNacFF6ziCg4DhhAP1ZqDsI1ULyVTT8fPf78hBGsm3SLljZG9o7VvyQSoiulwwnT
 hLoc4W4m9/hA5iOJP8WqBFKaD67gIya6ApLnu2Z09zd58rNfXj8SscMqUXSqBX4YlK9y
 1OCJGbrBztS2q8nZFB7/t9aVfnjdeyWWIsGhTDfpEwffaFA7WMTtj48xG6d4tygj999p
 asRVvQUBcooDEUwydaPMHfIBhqW9IVe6u/hc74O9vDeq1rv98K9S2sHo6viiT6C05HsM
 2/V2fYK4ov/2edbe4mMiP1dyKjZ1LHtGNlrOCQYBmCkOIITYSH7+U8/T7VMtNg7r++Ak
 Yraw==
X-Gm-Message-State: AOAM533OHNS5EnoB4f3RtrKDKZ/qXrT8RSqn48kSM8vr9e2t3KsrwJ2B
 IwQZVa5Y2YftGMLL42awZKfVj8fcgHdYDA==
X-Google-Smtp-Source: ABdhPJzzUBjAyTIzftSqQ65DG+/5kkIpHIDZu8D8nvo4nYLsVn84ztXFoAFZ0J7mrVMb76c17x6U6Q==
X-Received: by 2002:a05:600c:17d5:: with SMTP id
 y21mr8125917wmo.102.1643383824885; 
 Fri, 28 Jan 2022 07:30:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j3sm4749485wrb.57.2022.01.28.07.30.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 07:30:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/32] hw/dma/xlnx_csu_dma: Support starting a read transfer
 through a class method
Date: Fri, 28 Jan 2022 15:29:46 +0000
Message-Id: <20220128153009.2467560-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128153009.2467560-1-peter.maydell@linaro.org>
References: <20220128153009.2467560-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Francisco Iglesias <francisco.iglesias@xilinx.com>

An option on real hardware when embedding a DMA engine into a peripheral
is to make the peripheral control the engine through a custom DMA control
(hardware) interface between the two. Software drivers in this scenario
configure and trigger DMA operations through the controlling peripheral's
register API (for example, writing a specific bit in a register could
propagate down to a transfer start signal on the DMA control interface).
At the same time the status, results and interrupts for the transfer might
still be intended to be read and caught through the DMA engine's register
API (and signals).

This patch adds a class 'read' method for allowing to start read transfers
from peripherals embedding and controlling the Xilinx CSU DMA engine as in
above scenario.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20220121161141.14389-6-francisco.iglesias@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/xlnx_csu_dma.h | 19 +++++++++++++++++--
 hw/dma/xlnx_csu_dma.c         | 17 +++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 28806628b10..922ab80eb61 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -51,7 +51,22 @@ typedef struct XlnxCSUDMA {
     RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
 } XlnxCSUDMA;
 
-#define XLNX_CSU_DMA(obj) \
-    OBJECT_CHECK(XlnxCSUDMA, (obj), TYPE_XLNX_CSU_DMA)
+OBJECT_DECLARE_TYPE(XlnxCSUDMA, XlnxCSUDMAClass, XLNX_CSU_DMA)
+
+struct XlnxCSUDMAClass {
+    SysBusDeviceClass parent_class;
+
+    /*
+     * read: Start a read transfer on a Xilinx CSU DMA engine
+     *
+     * @s: the Xilinx CSU DMA engine to start the transfer on
+     * @addr: the address to read
+     * @len: the number of bytes to read at 'addr'
+     *
+     * @return a MemTxResult indicating whether the operation succeeded ('len'
+     * bytes were read) or failed.
+     */
+    MemTxResult (*read)(XlnxCSUDMA *s, hwaddr addr, uint32_t len);
+};
 
 #endif
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 896bb3574dd..095f9544767 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -472,6 +472,20 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
     return val & R_ADDR_MSB_ADDR_MSB_MASK;
 }
 
+static MemTxResult xlnx_csu_dma_class_read(XlnxCSUDMA *s, hwaddr addr,
+                                           uint32_t len)
+{
+    RegisterInfo *reg = &s->regs_info[R_SIZE];
+    uint64_t we = MAKE_64BIT_MASK(0, 4 * 8);
+
+    s->regs[R_ADDR] = addr;
+    s->regs[R_ADDR_MSB] = (uint64_t)addr >> 32;
+
+    register_write(reg, len, we, object_get_typename(OBJECT(s)), false);
+
+    return (s->regs[R_SIZE] == 0) ? MEMTX_OK : MEMTX_ERROR;
+}
+
 static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
 #define DMACH_REGINFO(NAME, snd)                                              \
     (const RegisterAccessInfo []) {                                           \
@@ -696,6 +710,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
+    XlnxCSUDMAClass *xcdc = XLNX_CSU_DMA_CLASS(klass);
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
@@ -704,6 +719,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     ssc->push = xlnx_csu_dma_stream_push;
     ssc->can_push = xlnx_csu_dma_stream_can_push;
+
+    xcdc->read = xlnx_csu_dma_class_read;
 }
 
 static void xlnx_csu_dma_init(Object *obj)
-- 
2.25.1


