Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EDD2FB67B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:49:49 +0100 (CET)
Received: from localhost ([::1]:54370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rOG-0003TY-S6
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:49:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rF5-0002gN-7J; Tue, 19 Jan 2021 08:40:19 -0500
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:43474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l1rF3-0003Su-JL; Tue, 19 Jan 2021 08:40:18 -0500
Received: by mail-io1-xd2c.google.com with SMTP id x21so21350905iog.10;
 Tue, 19 Jan 2021 05:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G3I8+jePmJbFvmYMVYrWYUHgNMI7m5yuQVcYxqGZCyU=;
 b=HnS4XdwrzV4g53pMU850oQhmX3spg+kN7aJ2YbaZ0wwAgogbdZxDd86iGLFHSMWiq2
 jIYzS0e9y048z7Of7Fp+yVezpQabm10ban2pBaKYg7umGaQv473x2m39fQioRlyCEIhe
 W5f75innhHlfRZbL7BWyZvEVsIaTsbOxp+h2d8k+JKixBtiZjxaoQk9Yh2WX+aHND8p0
 eTYMlAmOlvqQciTQPIHWAiQgmH0Ja3hh19hS4wRqovhBVdLgR1QkT4QR7qtUkqvfirKw
 KcaNH3twFDJ3SJ/2jtfpV86xDV4WOBqB4U0/2MFdUjQvch2VrxKDUMulNQnEwJWaXsyQ
 SKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G3I8+jePmJbFvmYMVYrWYUHgNMI7m5yuQVcYxqGZCyU=;
 b=VDI3U7X/xq/Z+Na5FaNtIXO6qcY1ksVOv1Hs6TjYnBSMpxHHMdbOgROa9+r6TmZwuZ
 8AG4JJ2HKBcVUYztlvYuzKHPkGVESeVSoy8sS+ZIah4UVFMLMe6O0XkijcMEA23IXXo0
 8QbIO5guzjRSeABoIeaJncMtlPbXKLgrIa9jOfe4afsBvuX90s0QdoCluyWldMmh3UgB
 Ymb+M+ZBe57GVGDl+717M2N4fSV3YSdKxZbTXuOwHQADT16QcV3yido6KQ1HNVy3Upax
 fhL0cKpRbzPtHuFPFU1dyxr0Stthatad/6Qf/ZkYjDv2dauKtG8ZqRdaSDfYMYFZoFAe
 3S6g==
X-Gm-Message-State: AOAM530rQKkAYrZrimRahlr8woOF1wg7+hdGi3S+lN00R/PveDFwSWwf
 6Hlr5uE1vpfypZ4XnV8pAloKoS+Xl2E=
X-Google-Smtp-Source: ABdhPJyoFEgoBH4UhLmH97vpcQIXS80OA+fsxfLeutpZp7z5NM916/cKdBXS77qtcTDKjfiv10bj0A==
X-Received: by 2002:a05:6e02:cb:: with SMTP id
 r11mr3500211ilq.116.1611063616267; 
 Tue, 19 Jan 2021 05:40:16 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com (unknown-124-94.windriver.com.
 [147.11.124.94])
 by smtp.gmail.com with ESMTPSA id s6sm11089546ild.45.2021.01.19.05.40.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Jan 2021 05:40:15 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v8 01/10] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
Date: Tue, 19 Jan 2021 21:38:57 +0800
Message-Id: <1611063546-20278-2-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
References: <1611063546-20278-1-git-send-email-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-io1-xd2c.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Avoid using a magic number (4) everywhere for the number of chip
selects supported.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---

(no changes since v1)

 include/hw/ssi/imx_spi.h | 5 ++++-
 hw/ssi/imx_spi.c         | 4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/hw/ssi/imx_spi.h b/include/hw/ssi/imx_spi.h
index b82b17f..eeaf49b 100644
--- a/include/hw/ssi/imx_spi.h
+++ b/include/hw/ssi/imx_spi.h
@@ -77,6 +77,9 @@
 
 #define EXTRACT(value, name) extract32(value, name##_SHIFT, name##_LENGTH)
 
+/* number of chip selects supported */
+#define ECSPI_NUM_CS 4
+
 #define TYPE_IMX_SPI "imx.spi"
 OBJECT_DECLARE_SIMPLE_TYPE(IMXSPIState, IMX_SPI)
 
@@ -89,7 +92,7 @@ struct IMXSPIState {
 
     qemu_irq irq;
 
-    qemu_irq cs_lines[4];
+    qemu_irq cs_lines[ECSPI_NUM_CS];
 
     SSIBus *bus;
 
diff --git a/hw/ssi/imx_spi.c b/hw/ssi/imx_spi.c
index d8885ae..e605049 100644
--- a/hw/ssi/imx_spi.c
+++ b/hw/ssi/imx_spi.c
@@ -361,7 +361,7 @@ static void imx_spi_write(void *opaque, hwaddr offset, uint64_t value,
 
             /* We are in master mode */
 
-            for (i = 0; i < 4; i++) {
+            for (i = 0; i < ECSPI_NUM_CS; i++) {
                 qemu_set_irq(s->cs_lines[i],
                              i == imx_spi_selected_channel(s) ? 0 : 1);
             }
@@ -424,7 +424,7 @@ static void imx_spi_realize(DeviceState *dev, Error **errp)
     sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
     sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    for (i = 0; i < 4; ++i) {
+    for (i = 0; i < ECSPI_NUM_CS; ++i) {
         sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->cs_lines[i]);
     }
 
-- 
2.7.4


