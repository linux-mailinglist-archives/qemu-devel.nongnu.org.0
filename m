Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F522F36EE
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:21:20 +0100 (CET)
Received: from localhost ([::1]:57204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNM7-0001A1-0f
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:21:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzm-0001pl-Iw
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:14 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:55963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzi-00070G-Bx
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:14 -0500
Received: by mail-wm1-x32d.google.com with SMTP id c124so2505375wma.5
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=XIToQXuXYWfGEUbgT12NG+i3OudvqvCJSkXTNgJtBfE=;
 b=VJ7eift+frZtzE3Nvrb4hNe66udIxJtiSUodx3ClckCjQvSMEKForiBygauIcZRL6W
 6+T1nF9VGDepYSy67/lsUNDAgb9/0SXaVCSlR2DCktvKUWQjgLwAZvIFGoz6qIkqlCJs
 gbEmdvfsftyo927WYSZpTqmqhazmsEEYCpiFG3/eMbjOkjs4Rj94eTW0W2PEkYSvCynM
 kZVHt9eVXAgx4jO4KgSj/zW5sfociuuaXMqo2amBw1mkzNidSezL50+u0R5yD2l/L//M
 k9SmclOMeBZJJxmCa+vscb81w3nvssbVSHWyYWIz2QWgZwzyiiL0o0vW2bBB+e8WrSx4
 Z+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XIToQXuXYWfGEUbgT12NG+i3OudvqvCJSkXTNgJtBfE=;
 b=SA9sCjmPl8e4B1fVt/St3jmoQiq5/CIfw9YfyHEjh+vtLdtAa/ZIahxHgifGxQRTfb
 N4FXqC/7DHsRBxdvy9iABZ0/qC6itsrLAl2Nbwup4rCI/nfrXLkntVuIUt46kRTuBDiy
 H5aaWr+dy3ckLik2y1y9CeXpMakrBBbwaC8ZoVlHXRk4x9wgTjdwq2EQsTkNFfGeiyWz
 +i76+nY4SD6elubWOESMyaJKNNhpSaSWem/0UBqMqFbStQt8ZsJ3Cu4+RZit3sX35gye
 iPKbvj8FCUucvslgG2QlZGt/EL2qXr2obEyrFWOmHwiWj8TDsdLI70LmM8D2Fv9u+ae0
 Q0BQ==
X-Gm-Message-State: AOAM530DBgYh5NUydWha/oQpAgORxtCCy+SZf6ZKS4Bd2hUbqJzoJLXz
 qBl4pSqqSBdbP/Ubusk9Mi83mhkt4WHV1g==
X-Google-Smtp-Source: ABdhPJzr3h0UyahZ7lL/igsYrdJeSYB0/JjSHnawwVYKxaHnh0umlRSoObjMHCcBRHUz4D+sNFHFnw==
X-Received: by 2002:a1c:4489:: with SMTP id r131mr240922wma.24.1610470688902; 
 Tue, 12 Jan 2021 08:58:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.07
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/21] hw/net/lan9118: Add symbolic constants for register
 offsets
Date: Tue, 12 Jan 2021 16:57:43 +0000
Message-Id: <20210112165750.30475-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210108180401.2263-3-peter.maydell@linaro.org
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


