Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E325759D3
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 05:09:00 +0200 (CEST)
Received: from localhost ([::1]:41572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCBhL-0001mj-9X
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 23:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oCBfL-0008Ta-6R; Thu, 14 Jul 2022 23:06:55 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:44529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oCBfI-0000IQ-QX; Thu, 14 Jul 2022 23:06:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 985335808CB;
 Thu, 14 Jul 2022 23:06:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 14 Jul 2022 23:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to; s=fm1; t=
 1657854409; x=1657858009; bh=5hfEvE4pxMUvkKhajdweOdfmlKF2YC1bi0W
 T31yxkc4=; b=M7lLBhQo+74mJZ+YDjhL2hxSftFQkHij4eF//J9gMROKHVjtTBc
 WaLruCpuHYUHxJ0aLoXJq2ZIeXc4ix8jT/wyOfZGwJKwn+nUNTSwjCZZ/IFAai1j
 IXYIvVCsjzmLndrFxh/MZQq5DJl4o7FWofoki3mHaDi2YdsjFFqioD2NswvPDQz7
 kaA0VTxhrKm0tq3c9SRVX4JaxXb8i2VWnEqjTLXd1xxkz1IbyMBk7JWyvoqOJedo
 ij22pEEYBFT2BxkB4WOYdeEZdpmBFdmt/jChsiT0cq+6KMuYZxZF1vX7slUjHnPQ
 yzFUhXc5AIkCtlThem094CwHjyq88rjOMVA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1657854409; x=
 1657858009; bh=5hfEvE4pxMUvkKhajdweOdfmlKF2YC1bi0WT31yxkc4=; b=N
 vLx0Z6tPfc0QdFAeqrjtLXBkj6T97aDzNlP5kVej4HKMAwUkJAEjeSX0rE9wop/M
 MTWSfQ1Q9rgSPtgv25N3ZsvYkqRjiowyIsAnK2BNPf+LPAci/fG0GRBroeLj78Rw
 uEgIOcM08v1yxgsCS+I5k5ev2kSWhejb+i+OKA8mhfvNzzlRtw9M67c3k3KomY1/
 ASeiUiPHixeFHXg4lieD+vTjOLal+kzDWxyjs9+wo6REFzWeeMJb9R8GpmdWbdF2
 EDIvSVXQXcTtUbx+nxDa5NdIr3CtpxDnd9X6YSNScXN6uKs94ymoqGmUzMrTs/Bs
 1ths0GJynafPXK+eQW1iA==
X-ME-Sender: <xms:yNnQYi2cE20RiHZWxY1dW9iMDS-glx3gxFcHUm9k3FmiIVDW7aNBtA>
 <xme:yNnQYlEJHFdW56ZEKC3ii0LRYWDq7vIarzDemLLFfe3pkRrK30IScD5-xGEsuHE2-
 8aCKMsrn4TWb-8lpmM>
X-ME-Received: <xmr:yNnQYq4VWxM8s0KNYA63lYedLO7sQ0B20V2vmOgl8VHr7A62GJpdZMFQo-cufSfhL7kPKbSIs8s42lwdFvPZrcH2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudektddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhepfffhvefukfggtggusehttdertddttddvnecuhfhrohhmpefrvghtvghr
 ucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeduvdfggeegtdffjeffteekjeduhfeugfejvdduieehiedvfffhjeeifefhffeg
 heenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvg
 htvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:yNnQYj37jTguWQV6WK67Bjx8p8bRtAaRGSLG2PqzjbAVORlCQMqQNg>
 <xmx:yNnQYlGLrGKdwReOu_kjRaW7gh_hu_WvMgSVOCKXLwWkKD6558aquw>
 <xmx:yNnQYs-zNDY2aNU7m-vYL7zYjnG_VvTHag4a_hRcYQgq3YJXcyZ-dg>
 <xmx:ydnQYlAkDCyImFj4z-TxggIonPfu2mL_nOHzz3Azawhs-eoBtaRbSQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Jul 2022 23:06:47 -0400 (EDT)
Date: Thu, 14 Jul 2022 20:06:45 -0700
From: Peter Delevoryas <peter@pjd.dev>
Cc: clg@kaod.org, k.jensen@samsung.com, cminyard@mvista.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [RFC] aspeed/i2c: multi-master between SoC's
Message-ID: <YtDZxbUWbqO9zIKk@pdel-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=66.111.4.230; envelope-from=peter@pjd.dev;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM28=0.798, MISSING_HEADERS=1.021, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Hey Cedric, Klaus, and Corey,

So I realized something about the current state of multi-master i2c:

We can't do transfers between two Aspeed I2C controllers, e.g.  AST1030 <->
AST2600. I'm looking into this case in the new fby35 machine (which isn't even
merged yet, just in Cedric's pull request)

This is because the AspeedI2CBusSlave is only designed to receive through
i2c_send_async(). But the AspeedI2CBus master-mode transfers use i2c_send().

So, the AST2600 can't send data to the AST1030. And the AST1030 can't reply to
the AST2600.

(By the way, another small issue: AspeedI2CBusSlave expects the parent of its
parent to be its AspeedI2CBus, but that's not true if multiple SoC's are sharing
an I2CBus. But that's easy to resolve, I'll send a patch for that soon).

I'm wondering how best to resolve the multi-SoC send-async issue, while
retaining the ability to send synchronously to non-SoC slave devices.

I think there's only one way, as far as I can see:

- Force the Aspeed I2C Controller to master the I2C bus before starting a master
  transfer. Even for synchronous transfers.

This shouldn't be a big problem, we can still do synchronous transfers, we just
have to wait for the bus to be free before starting the transfer.

- If the I2C slave targets for a master2slave transfer support async_send, then
  use async_send. This requires refactoring aspeed_i2c_bus_send into a state
  machine to send data asynchronously.

In other words, don't try to do a synchronous transfer to an SoC.

But, of course, we can keep doing synchronous transfers from SoC -> sensor or
sensor -> SoC.

I see the code in aspeed_i2c_bus_send turning into something like this:

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 42c6d69b82..1ea530a77e 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -226,10 +226,17 @@ static int aspeed_i2c_dma_read(AspeedI2CBus *bus, uint8_t *data)
     return 0;
 }
 
-static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
+typedef enum AsyncResult AsyncResult;
+enum AsyncResult {
+    DONE,
+    YIELD,
+    ERROR,
+};
+
+static AsyncResult aspeed_i2c_bus_send(AspeedI2CBus *bus)
 {
     AspeedI2CClass *aic = ASPEED_I2C_GET_CLASS(bus->controller);
-    int ret = -1;
+    AsyncResult ret = DONE;
     int i;
     uint32_t reg_cmd = aspeed_i2c_bus_cmd_offset(bus);
     uint32_t reg_pool_ctrl = aspeed_i2c_bus_pool_ctrl_offset(bus);
@@ -239,41 +246,49 @@ static int aspeed_i2c_bus_send(AspeedI2CBus *bus, uint8_t pool_start)
                                                 TX_COUNT);
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_BUFF_EN)) {
-        for (i = pool_start; i < pool_tx_count; i++) {
+        while (bus->pool_pos < pool_tx_count) {
             uint8_t *pool_base = aic->bus_pool_base(bus);
 
-            trace_aspeed_i2c_bus_send("BUF", i + 1, pool_tx_count,
+            trace_aspeed_i2c_bus_send("BUF", bus->pool_pos + 1, pool_tx_count,
                                       pool_base[i]);
-            ret = i2c_send(bus->bus, pool_base[i]);
-            if (ret) {
+            ret = i2c_send_async(bus->bus, pool_base[bus->pool_pos]);
+            if (ret == ERROR) {
                 break;
             }
+            bus->pool_pos++;
+            if (ret == YIELD) {
+                return YIELD;
+            }
         }
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, TX_BUFF_EN, 0);
     } else if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, TX_DMA_EN)) {
         /* In new mode, clear how many bytes we TXed */
-        if (aspeed_i2c_is_new_mode(bus->controller)) {
+        if (aspeed_i2c_is_new_mode(bus->controller) && bus->pool_pos == 0) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, TX_LEN, 0);
         }
         while (bus->regs[reg_dma_len]) {
             uint8_t data;
             aspeed_i2c_dma_read(bus, &data);
-            trace_aspeed_i2c_bus_send("DMA", bus->regs[reg_dma_len],
+            trace_aspeed_i2c_bus_send("DMA", bus->regs[bus->pool_pos],
                                       bus->regs[reg_dma_len], data);
-            ret = i2c_send(bus->bus, data);
-            if (ret) {
+            ret = i2c_send_async(bus->bus, data);
+            if (ret == ERROR) {
                 break;
             }
+            bus->pool_pos++;
             /* In new mode, keep track of how many bytes we TXed */
             if (aspeed_i2c_is_new_mode(bus->controller)) {
                 ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN_STS, TX_LEN,
                                  ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN_STS,
                                                   TX_LEN) + 1);
             }
+            if (ret == YIELD) {
+                return YIELD;
+            }
         }
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_cmd, TX_DMA_EN, 0);
     } else {
-        trace_aspeed_i2c_bus_send("BYTE", pool_start, 1,
+        trace_aspeed_i2c_bus_send("BYTE", 1, 1,
                                   bus->regs[reg_byte_buf]);
         ret = i2c_send(bus->bus, bus->regs[reg_byte_buf]);
     }

Anyways, curious to get your guys' thoughts on this. Thanks!

Peter

