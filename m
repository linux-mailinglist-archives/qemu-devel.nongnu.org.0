Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4793316369
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:14:14 +0100 (CET)
Received: from localhost ([::1]:51716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mVh-000377-PQ
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:14:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSL-0000Gu-UE; Wed, 10 Feb 2021 05:10:47 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:42592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSJ-00034K-Sh; Wed, 10 Feb 2021 05:10:45 -0500
Received: by mail-ej1-x62c.google.com with SMTP id l25so3045834eja.9;
 Wed, 10 Feb 2021 02:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vlegheEyqXl7+NwMvyJSahCC2mYTto9ZEvw05hdEWZ4=;
 b=Osik7mT9ZKNDairkQpWfkPh6La1CZhGlRtjEk7qRjQ+mzdGOhGLVsi5RT4U3gFSgEb
 LjdQrDEM0oPhNli7T0IgzNYf6uIG5vbi5vjIsaR/99+mTzubSKPlQnwLdkUllsVd9nNo
 8QKHtliU4dJJ4o5VLoQ1rDo2lYnApf+vBDf9KLIPwep8FXZXg5Ugpf0MMin/hNX3x/6S
 vhgF2caiPpB0jT4fel6QraVnTv/Wd3xypYXGhV4Og157h12CYbiWartIzy8wVji0yTzz
 BK1Bk8kp9TrBhg7s8l4TgZeNrgHtbERb+hbsukIpmXkrmul/EBJ21gU7eUwazSekijH4
 erWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vlegheEyqXl7+NwMvyJSahCC2mYTto9ZEvw05hdEWZ4=;
 b=DIKilaMeEyiTfWjODvH1KAHvg1WZ1CPw36PMe/cQC9Bx1Bed5AVY16M/WvGDg9cpIX
 FTLTK+Y8GnS3zrLuvEwGSntyYu53hz+DuQXQVgA9eAyc9h0zgi1hUB+gq1iQRR/hnjok
 9xuTEShHx4ZlRRAwlYBwJJ+WkeZXjNq9MDj5MgC04wfcjtRBE1ZQoxAj+7CYGvOn6HTE
 wR2lvlS+9fx07gJGA9rvqVXY7ri9HRxRZWsmI3QPkj1MlN29huZLOk0SN81eC1jATZd9
 sZdTNRJVh7v3r9tEILqpXcCuKA6dGz8BiVPsMStkLGDNNUrv886ftn3cDXWLr5lYi5Nd
 MfZQ==
X-Gm-Message-State: AOAM5305ewUqlCeZLtAn8zq0S5U9nflIccOaosblL81EoDGTsp7jLtl9
 npoDLUf1lYEP/Lr1DXBlhlE=
X-Google-Smtp-Source: ABdhPJzatyB7ecRbeT4Gsoy/wNxa8o+0adcFrQSaBy8TLly0LMKgOnAAg/cwwz6QH70R2tMh4mbGgQ==
X-Received: by 2002:a17:906:2993:: with SMTP id
 x19mr2079622eje.409.1612951842226; 
 Wed, 10 Feb 2021 02:10:42 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y11sm785418ejd.72.2021.02.10.02.10.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:10:41 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 4/5] hw/ssi: xilinx_spips: Clean up coding convention issues
Date: Wed, 10 Feb 2021 18:10:12 +0800
Message-Id: <1612951813-50542-5-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

There are some coding convention warnings in xilinx_spips.c,
as reported by:

  $ ./scripts/checkpatch.pl hw/ssi/xilinx_spips.c

Let's clean them up.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---

(no changes since v1)

 hw/ssi/xilinx_spips.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
index a897034..8a0cc22 100644
--- a/hw/ssi/xilinx_spips.c
+++ b/hw/ssi/xilinx_spips.c
@@ -176,7 +176,8 @@
     FIELD(GQSPI_FIFO_CTRL, GENERIC_FIFO_RESET, 0, 1)
 #define R_GQSPI_GFIFO_THRESH    (0x150 / 4)
 #define R_GQSPI_DATA_STS (0x15c / 4)
-/* We use the snapshot register to hold the core state for the currently
+/*
+ * We use the snapshot register to hold the core state for the currently
  * or most recently executed command. So the generic fifo format is defined
  * for the snapshot register
  */
@@ -424,7 +425,8 @@ static void xlnx_zynqmp_qspips_reset(DeviceState *d)
     xlnx_zynqmp_qspips_update_ixr(s);
 }
 
-/* N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
+/*
+ * N way (num) in place bit striper. Lay out row wise bits (MSB to LSB)
  * column wise (from element 0 to N-1). num is the length of x, and dir
  * reverses the direction of the transform. Best illustrated by example:
  * Each digit in the below array is a single bit (num == 3):
@@ -637,8 +639,10 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
                 tx_rx[i] = tx;
             }
         } else {
-            /* Extract a dummy byte and generate dummy cycles according to the
-             * link state */
+            /*
+             * Extract a dummy byte and generate dummy cycles according to the
+             * link state
+             */
             tx = fifo8_pop(&s->tx_fifo);
             dummy_cycles = 8 / s->link_state;
         }
@@ -721,8 +725,9 @@ static void xilinx_spips_flush_txfifo(XilinxSPIPS *s)
             }
             break;
         case (SNOOP_ADDR):
-            /* Address has been transmitted, transmit dummy cycles now if
-             * needed */
+            /*
+             * Address has been transmitted, transmit dummy cycles now if needed
+             */
             if (s->cmd_dummies < 0) {
                 s->snoop_state = SNOOP_NONE;
             } else {
@@ -876,7 +881,7 @@ static void xlnx_zynqmp_qspips_notify(void *opaque)
 }
 
 static uint64_t xilinx_spips_read(void *opaque, hwaddr addr,
-                                                        unsigned size)
+                                  unsigned size)
 {
     XilinxSPIPS *s = opaque;
     uint32_t mask = ~0;
@@ -970,7 +975,7 @@ static uint64_t xlnx_zynqmp_qspips_read(void *opaque,
 }
 
 static void xilinx_spips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                               uint64_t value, unsigned size)
 {
     int mask = ~0;
     XilinxSPIPS *s = opaque;
@@ -1072,7 +1077,7 @@ static void xilinx_qspips_write(void *opaque, hwaddr addr,
 }
 
 static void xlnx_zynqmp_qspips_write(void *opaque, hwaddr addr,
-                                        uint64_t value, unsigned size)
+                                     uint64_t value, unsigned size)
 {
     XlnxZynqMPQSPIPS *s = XLNX_ZYNQMP_QSPIPS(opaque);
     uint32_t reg = addr / 4;
-- 
2.7.4


