Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1CF6D1496
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 03:02:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi39S-0003G0-D2; Thu, 30 Mar 2023 21:01:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ATEmZAcKCiQKOMLODIGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--komlodi.bounces.google.com>)
 id 1pi39Q-0003FY-Sm
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:56 -0400
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ATEmZAcKCiQKOMLODIGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--komlodi.bounces.google.com>)
 id 1pi39P-0006cB-50
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 21:01:56 -0400
Received: by mail-pf1-x449.google.com with SMTP id
 y15-20020a62f24f000000b00627dd180a30so9525328pfl.6
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680224513;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xxmkfnav+C8zEtIsn1y237i6/yeHQ5Aob1crdW87PWU=;
 b=b4G2rzgA5Erkrvl/gkIl6GWrBcrb9+RGJhdAZVn3WWMai15SN85W3i8e6Ddh21BkUc
 b3ifrpC5nayi0YtRsdHBadpGsSaB08ZV6heZAggxIYORoe2FjL5k5Geq7WGUw+vhsXLK
 EglxpBtFvBIvONfu8IW6S5Ru0SWZD/rzIs9jJ2YZwvWxSUlPMkZ+v3QbAsR7AdT0PPGx
 tcaSaa+gR0qqla9S5fuqsDDgNlHHv/vHOkDfnTiC9WV6BpnNEYciCHwk2sVsQKCcLdxg
 yJSLRCu028muQuVeFN1MyIk1gXMgOWUTjl7IKBLcCl3Lzy5WtL3EWLfTiCrHI2WirNRs
 sf6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680224513;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xxmkfnav+C8zEtIsn1y237i6/yeHQ5Aob1crdW87PWU=;
 b=wl6ERerhAqa+4rkJ5TxEVqFggImG36rAlDP8G0PALwq9yGIXWnhZowoKmLtqXYkgWO
 WJ+SFixUc5WnKPJry+HBUT14+EnQfwCcBGDyB95AO3fFKYBazVXql+kvkmevsS1HwvPU
 ZXNx7ANSHPa1bTlMKIUmWV2qx5zF9Gl3LnhOmVBv/DJOgr7trBeCNwb3lUgGg79M0oGL
 dJAucbXrNFvrpQVC1aCpo1FoB5uGRrW1qvb/CwD3iW1VnLIuNLYOEIvD2stiUHew/INv
 6sHm0cryOmvsP9kGze7W8JDWzqq4jUOrMK1q8hc/WVXdeq+t/HXVfzqRhipSM4OI2KlQ
 h3nQ==
X-Gm-Message-State: AAQBX9c0UJ86Na3UX9/Nva4U0h5XkFRTNwObELLp0KWIhE6K/u64e7LP
 qA64ACn9GOJi3PiKOWeCzCDMHbK3pGJncF3XNsgdUUcAgtupVfl9Jq4zKxy4veB/gX9TAQrklXw
 dLQgG1i7dWV5VW0TCT7taMS340z5it2zzE+o8te6lMOWQ5vIxDPCSwelUPaILshU=
X-Google-Smtp-Source: AKy350Zbgjru9zzZPZQ6RSAF+4Pu+S6WgUAAV1gWezGRr0qbIAFqWApQuu1oVFvcNQjOXYyj+HdE32Qeqi1k
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:90a:c095:b0:234:acfd:c8da with SMTP id
 o21-20020a17090ac09500b00234acfdc8damr7919148pjs.2.1680224513354; Thu, 30 Mar
 2023 18:01:53 -0700 (PDT)
Date: Fri, 31 Mar 2023 01:01:27 +0000
In-Reply-To: <20230331010131.1412571-1-komlodi@google.com>
Mime-Version: 1.0
References: <20230331010131.1412571-1-komlodi@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230331010131.1412571-13-komlodi@google.com>
Subject: [PATCH 12/16] hw/i3c/aspeed_i3c: Add controller resets
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, komlodi@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::449;
 envelope-from=3ATEmZAcKCiQKOMLODIGOOGLE.COMQEMU-DEVELNONGNU.ORG@flex--komlodi.bounces.google.com;
 helo=mail-pf1-x449.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Adds behavior to the device reset register.

Signed-off-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Stephen Longfield <slongfield@google.com>
---
 hw/i3c/aspeed_i3c.c | 110 +++++++++++++++++++++++++++++++++++++++++---
 hw/i3c/trace-events |   1 +
 2 files changed, 104 insertions(+), 7 deletions(-)

diff --git a/hw/i3c/aspeed_i3c.c b/hw/i3c/aspeed_i3c.c
index 4c0c074012..19d766f074 100644
--- a/hw/i3c/aspeed_i3c.c
+++ b/hw/i3c/aspeed_i3c.c
@@ -938,6 +938,108 @@ static void aspeed_i3c_device_intr_force_w(AspeedI3CDevice *s, uint32_t val)
     aspeed_i3c_device_update_irq(s);
 }
 
+static void aspeed_i3c_device_cmd_queue_reset(AspeedI3CDevice *s)
+{
+    fifo32_reset(&s->cmd_queue);
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, CMD_QUEUE_EMPTY_LOC,
+                     fifo32_num_free(&s->cmd_queue));
+    uint8_t empty_threshold = ARRAY_FIELD_EX32(s->regs, QUEUE_THLD_CTRL,
+                                               CMD_BUF_EMPTY_THLD);
+    if (fifo32_num_free(&s->cmd_queue) >= empty_threshold) {
+        ARRAY_FIELD_DP32(s->regs, INTR_STATUS, CMD_QUEUE_RDY, 1);
+        aspeed_i3c_device_update_irq(s);
+    };
+}
+
+static void aspeed_i3c_device_resp_queue_reset(AspeedI3CDevice *s)
+{
+    fifo32_reset(&s->resp_queue);
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, RESP_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+    /*
+     * This interrupt will always be cleared because the threshold is a minimum
+     * of 1 and the queue size is 0.
+     */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RESP_RDY, 0);
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_ibi_queue_reset(AspeedI3CDevice *s)
+{
+    fifo32_reset(&s->ibi_queue);
+
+    ARRAY_FIELD_DP32(s->regs, QUEUE_STATUS_LEVEL, IBI_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+    /*
+     * This interrupt will always be cleared because the threshold is a minimum
+     * of 1 and the queue size is 0.
+     */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, IBI_THLD, 0);
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_tx_queue_reset(AspeedI3CDevice *s)
+{
+    fifo32_reset(&s->tx_queue);
+
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, TX_BUF_EMPTY_LOC,
+                     fifo32_num_free(&s->tx_queue));
+    /* TX buf is empty, so this interrupt will always be set. */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, TX_THLD, 1);
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_rx_queue_reset(AspeedI3CDevice *s)
+{
+    fifo32_reset(&s->rx_queue);
+
+    ARRAY_FIELD_DP32(s->regs, DATA_BUFFER_STATUS_LEVEL, RX_BUF_BLR,
+                     fifo32_num_used(&s->resp_queue));
+    /*
+     * This interrupt will always be cleared because the threshold is a minimum
+     * of 1 and the queue size is 0.
+     */
+    ARRAY_FIELD_DP32(s->regs, INTR_STATUS, RX_THLD, 0);
+    aspeed_i3c_device_update_irq(s);
+}
+
+static void aspeed_i3c_device_reset(DeviceState *dev)
+{
+    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(dev);
+    trace_aspeed_i3c_device_reset(s->id);
+
+    memcpy(s->regs, ast2600_i3c_device_resets, sizeof(s->regs));
+    aspeed_i3c_device_cmd_queue_reset(s);
+    aspeed_i3c_device_resp_queue_reset(s);
+    aspeed_i3c_device_ibi_queue_reset(s);
+    aspeed_i3c_device_tx_queue_reset(s);
+    aspeed_i3c_device_rx_queue_reset(s);
+}
+
+static void aspeed_i3c_device_reset_ctrl_w(AspeedI3CDevice *s, uint32_t val)
+{
+    if (FIELD_EX32(val, RESET_CTRL, CORE_RESET)) {
+        aspeed_i3c_device_reset(DEVICE(s));
+    }
+    if (FIELD_EX32(val, RESET_CTRL, CMD_QUEUE_RESET)) {
+        aspeed_i3c_device_cmd_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, RESP_QUEUE_RESET)) {
+        aspeed_i3c_device_resp_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, TX_BUF_RESET)) {
+        aspeed_i3c_device_tx_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, RX_BUF_RESET)) {
+        aspeed_i3c_device_rx_queue_reset(s);
+    }
+    if (FIELD_EX32(val, RESET_CTRL, IBI_QUEUE_RESET)) {
+        aspeed_i3c_device_ibi_queue_reset(s);
+    }
+}
+
 static uint32_t aspeed_i3c_device_pop_rx(AspeedI3CDevice *s)
 {
     if (fifo32_is_empty(&s->rx_queue)) {
@@ -1693,6 +1795,7 @@ static void aspeed_i3c_device_write(void *opaque, hwaddr offset,
         aspeed_i3c_device_cmd_queue_port_w(s, val32);
         break;
     case R_RESET_CTRL:
+        aspeed_i3c_device_reset_ctrl_w(s, val32);
         break;
     case R_INTR_STATUS:
         aspeed_i3c_device_intr_status_w(s, val32);
@@ -1728,13 +1831,6 @@ static const MemoryRegionOps aspeed_i3c_device_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static void aspeed_i3c_device_reset(DeviceState *dev)
-{
-    AspeedI3CDevice *s = ASPEED_I3C_DEVICE(dev);
-
-    memcpy(s->regs, ast2600_i3c_device_resets, sizeof(s->regs));
-}
-
 static void aspeed_i3c_device_realize(DeviceState *dev, Error **errp)
 {
     AspeedI3CDevice *s = ASPEED_I3C_DEVICE(dev);
diff --git a/hw/i3c/trace-events b/hw/i3c/trace-events
index 7a202b28c9..71e3059f8d 100644
--- a/hw/i3c/trace-events
+++ b/hw/i3c/trace-events
@@ -9,6 +9,7 @@ aspeed_i3c_device_send(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] send
 aspeed_i3c_device_recv_data(uint32_t deviceid, uint32_t num_bytes) "I3C Dev[%u] recv %" PRId32 " bytes from bus"
 aspeed_i3c_device_ibi_recv(uint32_t deviceid, uint8_t ibi_byte) "I3C Dev[%u] recv IBI byte 0x%" PRIx8
 aspeed_i3c_device_ibi_handle(uint32_t deviceid, uint8_t addr, bool rnw) "I3C Dev[%u] handle IBI from address 0x%" PRIx8 " RnW=%d"
+aspeed_i3c_device_reset(uint32_t deviceid) "I3C Dev[%u] reset"
 aspeed_i3c_device_pop_rx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] pop 0x%" PRIx32 " from RX FIFO"
 aspeed_i3c_device_resp_queue_push(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to response queue"
 aspeed_i3c_device_push_tx(uint32_t deviceid, uint32_t data) "I3C Dev[%u] push 0x%" PRIx32 " to TX FIFO"
-- 
2.40.0.348.gf938b09366-goog


