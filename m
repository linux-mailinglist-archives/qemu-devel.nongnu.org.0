Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54002EF6F8
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:06:54 +0100 (CET)
Received: from localhost ([::1]:47398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwA1-0002CA-Rv
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:06:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7O-0000K4-LX
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:10 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:46196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxw7L-0000pk-KI
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:04:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id d13so9796112wrc.13
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Cltfwd92MkrmvHsb6h8wjp9eDpmVWfQV41adHitKqbs=;
 b=WWDNZg4XlRJ2pRMkulGUta0K4mI0jBtVsFYEQ6LH0w4kzci3R8+KHuWq0EFKgTCcAh
 Riaf9sXFozKBE0WusjFJq6QpnHbA+EP0XF8PZI4Yhdak5AOk/cqyAcDTY3qQhcbLpOyl
 tdUNEEpYcTjL6HYYs3KEqmVnK6CwL0a08o+bwMQSj26rnSNSx0e0w6efMBQ6BSEU4U9I
 b/kVt/Dxf1QOiEgzBjTjK5NUnTmWCH2bH4+ZWylIu1fNJsyLHcY+uaSR1ABGZMtqp6hs
 u48Ljkdb0nWSNHGyQ6LGJwgGFjj02C3pxY32oi/888GXDri46n35GLFZ2DDn778Ghq2g
 TC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cltfwd92MkrmvHsb6h8wjp9eDpmVWfQV41adHitKqbs=;
 b=NuV38r393OTU93kt8gn8N9wA84+ID+JhpZYK+SfbpnoTyx2e02gM/WVjyYTO9+9cwS
 6U9LqOqzrRZlJ3ekbN7QOvsUFOc6dmc8OzhoA9EUkdQXTkX/345EBUIptC9dbkmABn0c
 FVrnLp8JDQLcepiBd2+qXC65BSgkZgN9URMO4d0WoPBCMU1nKhSsu7t/aldNy7ZdV6UB
 DGq5iECyRRyPsx/HRCgDKWMu/DElsxKk6WAdjto6TXlsKDRCQxGOoYPggplIF9o79ote
 uYu3E7BsDshETIw6nNb6axiwzpIRE/akFE3OiZ72tBNw2xVt6Mzny6grn7c+q+mZ6VlX
 3nUA==
X-Gm-Message-State: AOAM530/y57k0jbO874nx5wNIShmdlFo4+IKXvuVLpGatqtt3oxXt5pH
 1Tmy2KizbDEdhE9PgGSSk4g6ow==
X-Google-Smtp-Source: ABdhPJxPo1Z8Pih0fRnNAlF7tiD6eiEb4oHHwQo7MQPX6KqzOSbfR6dOQJeqbsbj1Y35iJcROiEelw==
X-Received: by 2002:a5d:55c6:: with SMTP id i6mr4767784wrw.137.1610129046389; 
 Fri, 08 Jan 2021 10:04:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s1sm13423029wrv.97.2021.01.08.10.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:04:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/net/lan9118: Add symbolic constants for register
 offsets
Date: Fri,  8 Jan 2021 18:04:01 +0000
Message-Id: <20210108180401.2263-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108180401.2263-1-peter.maydell@linaro.org>
References: <20210108180401.2263-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

The lan9118 code mostly uses symbolic constants for register offsets;
the exceptions are those which the datasheet doesn't give an official
symbolic name to.

Add some names for the registers which don't already have them, based
on the longer names they are given in the memory map.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/net/lan9118.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 13d469fe24f..abc796285ab 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -40,6 +40,17 @@ do { hw_error("lan9118: error: " fmt , ## __VA_ARGS__);} while (0)
 do { fprintf(stderr, "lan9118: error: " fmt , ## __VA_ARGS__);} while (0)
 #endif
 
+/* The tx and rx fifo ports are a range of aliased 32-bit registers */
+#define RX_DATA_FIFO_PORT_FIRST 0x00
+#define RX_DATA_FIFO_PORT_LAST 0x1f
+#define TX_DATA_FIFO_PORT_FIRST 0x20
+#define TX_DATA_FIFO_PORT_LAST 0x3f
+
+#define RX_STATUS_FIFO_PORT 0x40
+#define RX_STATUS_FIFO_PEEK 0x44
+#define TX_STATUS_FIFO_PORT 0x48
+#define TX_STATUS_FIFO_PEEK 0x4c
+
 #define CSR_ID_REV      0x50
 #define CSR_IRQ_CFG     0x54
 #define CSR_INT_STS     0x58
@@ -1020,7 +1031,8 @@ static void lan9118_writel(void *opaque, hwaddr offset,
     offset &= 0xff;
 
     //DPRINTF("Write reg 0x%02x = 0x%08x\n", (int)offset, val);
-    if (offset >= 0x20 && offset < 0x40) {
+    if (offset >= TX_DATA_FIFO_PORT_FIRST &&
+        offset <= TX_DATA_FIFO_PORT_LAST) {
         /* TX FIFO */
         tx_fifo_push(s, val);
         return;
@@ -1198,18 +1210,18 @@ static uint64_t lan9118_readl(void *opaque, hwaddr offset,
     lan9118_state *s = (lan9118_state *)opaque;
 
     //DPRINTF("Read reg 0x%02x\n", (int)offset);
-    if (offset < 0x20) {
+    if (offset <= RX_DATA_FIFO_PORT_LAST) {
         /* RX FIFO */
         return rx_fifo_pop(s);
     }
     switch (offset) {
-    case 0x40:
+    case RX_STATUS_FIFO_PORT:
         return rx_status_fifo_pop(s);
-    case 0x44:
+    case RX_STATUS_FIFO_PEEK:
         return s->rx_status_fifo[s->rx_status_fifo_head];
-    case 0x48:
+    case TX_STATUS_FIFO_PORT:
         return tx_status_fifo_pop(s);
-    case 0x4c:
+    case TX_STATUS_FIFO_PEEK:
         return s->tx_status_fifo[s->tx_status_fifo_head];
     case CSR_ID_REV:
         return 0x01180001;
-- 
2.20.1


