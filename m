Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD7B59B0DB
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 00:59:22 +0200 (CEST)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPXR2-0000Y2-Rz
	for lists+qemu-devel@lfdr.de; Sat, 20 Aug 2022 18:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oPXPA-00078v-Nk; Sat, 20 Aug 2022 18:57:24 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:56041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oPXP8-0002uE-LA; Sat, 20 Aug 2022 18:57:24 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BC2545C00A0;
 Sat, 20 Aug 2022 18:57:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Sat, 20 Aug 2022 18:57:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1661036240; x=1661122640; bh=Ax
 rccG1XGIFoDprexo+qF6vYikfxABIObcQitYVPNgE=; b=jepTqJxFffGU0M+wdv
 M9nZCrHY+5GbmHaRY6hYSyoxI5bp9Txk0dwGuZDW/vm29ykecEAFBHGn5Adw+Pnp
 YguSf42Imcm0f1gH+LkldsdAiQ5O+UM+xT3EIyLL22FGuSBcUGGDkA5A0X4yPHHB
 OmU5yziyNxOVlkIu1zRe7a3Mt37ckOie9SB/afzgbPWyrNkcgxQHKj06KQj5xKL9
 vEEVksx6eDV7CFhtkQC6Q2NpbBDQbF2AuQlPF5x0OAb54ZytvaV2XaGL2KB6PlP0
 Ai8XnIacF1Gu0YGpQGKqYOUZYjk6QJGZrEcQYjLdvZrlRnW2+ScBscjVGD5QbW8X
 A/fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1661036240; x=1661122640; bh=AxrccG1XGIFoD
 prexo+qF6vYikfxABIObcQitYVPNgE=; b=MJNcHQuvMHfQGypHJiPmjCMwLN9Gn
 yEXLOd9NbTj7z845Qua9i4G93HNemhvJc6TcfVkumsJ1VteK8jAs8xNbIR8FCY1X
 0ubU04IODE9aOcyvma7wgIS+d6bxuAVaf9ihbhPcItv8DwxpjB3qLwqGKtVsMbCG
 50ntiQvoCSNjVYD/YvzfivY0zSYjrq58HE/OG5U6heXZuuDECLxQVvqjRrDIygaH
 9C8U+f2BZU6pLKgrJ+2EmudpxYCdnNOyrMoR/qMEb+ys2CtjF0Y6nONofvI7ytDL
 O44KRiuvJyB0LtYGNHK5fA/Ysowu/sGbjolIqqVN6XRWNsgjekEe+CPcA==
X-ME-Sender: <xms:0GYBYwaNSn7SMCLv3Sixx5IeSueIfD_O7h85Eh8DxLY7tsvdeaF_ig>
 <xme:0GYBY7aL7z1iKPOcItmmBlmdjdHHpW-XvqhfZvPKPXR9dd2y5l6BJmfNehKvf5AW9
 kJIes8OryRP7fhc7uI>
X-ME-Received: <xmr:0GYBY69YrC3xiM2R8eOHNW2yQdiDd3tLVqDCLx1oSm9UJYzKzdVjKeso2Bj68g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeigedgudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteegleegffehvdfhleduleefueff
 kedutddtjeehffeludelvdejveejjeejuefgnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 vghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:0GYBY6poRhI2oFOeFOApUbA882FqCiGckFaJ60FvT9x8LLGtckCnpw>
 <xmx:0GYBY7oQ_y5jjT9CLENRKky88ezAHadM4IqQOeBr9C0u-xEKFKCsGg>
 <xmx:0GYBY4TX_2O40VxftQ8iO_2JP4MqIGReBIXEzZFEP9JFHn_yh7GtTA>
 <xmx:0GYBY3Jvyxn-JvWmjKyDpr2QAErqf_Dxa0ardgX0n98JjlDwgLjOPg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 Aug 2022 18:57:20 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joel@jms.id.au, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, dz4list@gmail.com
Subject: [PATCH 1/1] hw/i2c/aspeed: Fix old reg slave receive
Date: Sat, 20 Aug 2022 15:57:12 -0700
Message-Id: <20220820225712.713209-2-peter@pjd.dev>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220820225712.713209-1-peter@pjd.dev>
References: <20220820225712.713209-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=peter@pjd.dev;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I think when Klaus ported his slave mode changes from the original patch
series to the rewritten I2C module, he changed the behavior of the first
byte that is received by the slave device.

What's supposed to happen is that the AspeedI2CBus's slave device's
i2c_event callback should run, and if the event is "send_async", then it
should populate the byte buffer with the 8-bit I2C address that is being
sent to. Since we only support "send_async", the lowest bit should
always be 0 (indicating that the master is requesting to send data).

This is the code Klaus had previously, for reference. [1]

    switch (event) {
    case I2C_START_SEND:
        bus->buf = bus->dev_addr << 1;

        bus->buf &= I2CD_BYTE_BUF_RX_MASK;
        bus->buf <<= I2CD_BYTE_BUF_RX_SHIFT;

        bus->intr_status |= (I2CD_INTR_SLAVE_ADDR_RX_MATCH | I2CD_INTR_RX_DONE);
        aspeed_i2c_set_state(bus, I2CD_STXD);

        break;

[1]: https://lore.kernel.org/qemu-devel/20220331165737.1073520-4-its@irrelevant.dk/

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Fixes: a8d48f59cd021b25 ("hw/i2c/aspeed: add slave device in old register mode")
---
 hw/i2c/aspeed_i2c.c         | 8 +++++---
 include/hw/i2c/aspeed_i2c.h | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 42c6d69b82..c166fd20fa 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -1131,7 +1131,9 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
     AspeedI2CBus *bus = ASPEED_I2C_BUS(qbus->parent);
     uint32_t reg_intr_sts = aspeed_i2c_bus_intr_sts_offset(bus);
     uint32_t reg_byte_buf = aspeed_i2c_bus_byte_buf_offset(bus);
-    uint32_t value;
+    uint32_t reg_dev_addr = aspeed_i2c_bus_dev_addr_offset(bus);
+    uint32_t dev_addr = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_dev_addr,
+                                                SLAVE_DEV_ADDR1);
 
     if (aspeed_i2c_is_new_mode(bus->controller)) {
         return aspeed_i2c_bus_new_slave_event(bus, event);
@@ -1139,8 +1141,8 @@ static int aspeed_i2c_bus_slave_event(I2CSlave *slave, enum i2c_event event)
 
     switch (event) {
     case I2C_START_SEND_ASYNC:
-        value = SHARED_ARRAY_FIELD_EX32(bus->regs, reg_byte_buf, TX_BUF);
-        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, value << 1);
+        /* Bit[0] == 0 indicates "send". */
+        SHARED_ARRAY_FIELD_DP32(bus->regs, reg_byte_buf, RX_BUF, dev_addr << 1);
 
         ARRAY_FIELD_DP32(bus->regs, I2CD_INTR_STS, SLAVE_ADDR_RX_MATCH, 1);
         SHARED_ARRAY_FIELD_DP32(bus->regs, reg_intr_sts, RX_DONE, 1);
diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 300a89b343..adc904d6c1 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -130,6 +130,7 @@ REG32(I2CD_CMD, 0x14) /* I2CD Command/Status */
     SHARED_FIELD(M_TX_CMD, 1, 1)
     SHARED_FIELD(M_START_CMD, 0, 1)
 REG32(I2CD_DEV_ADDR, 0x18) /* Slave Device Address */
+    SHARED_FIELD(SLAVE_DEV_ADDR1, 0, 7)
 REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
     SHARED_FIELD(RX_COUNT, 24, 5)
     SHARED_FIELD(RX_SIZE, 16, 5)
-- 
2.37.1


