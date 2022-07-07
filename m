Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D40DD569B78
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jul 2022 09:23:30 +0200 (CEST)
Received: from localhost ([::1]:59252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9LrF-0006lI-Cs
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 03:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Lli-0005Dy-9Y; Thu, 07 Jul 2022 03:17:46 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:53939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1o9Llb-0007ja-EH; Thu, 07 Jul 2022 03:17:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BF9EC2B05862;
 Thu,  7 Jul 2022 03:17:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 07 Jul 2022 03:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657178256; x=1657181856; bh=Nu
 342n6VW8m3xOtWMDURqgPM7LsucuT9qnouFeucj38=; b=dxkbgxuhA5uQ+KO8r/
 fRRGZyyL0a9bwsd+CR2qvcn5PaGo/WZwzfkyO2m357PXuTFNV2o+4dRy/G/yTzeq
 W35hsDSozmKTgJan2sdSbcKzWUNBiM8RgS9BvRtXxICSN1Br7ldzOhtmmuyK+JnB
 Aa9siYpSSezV4aH7aISkoI5aayAEvrIB5AMSGn4fsC2HIAyosWdSm2SfwGMipZHb
 bGb+zza+N95zUSSiGBVCn0JNStXsu5IeHdJJZuB0XB2EsZJSqvDmbQKJnwrv4CFx
 DQCqdZqn6Jto0XTaEh9p4uuPAeVUOXZoKSKQNlTDDnBbiQT1pieQqYPBj5lY5n+c
 fCoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657178256; x=1657181856; bh=Nu342n6VW8m3x
 OtWMDURqgPM7LsucuT9qnouFeucj38=; b=Jd2VnMWs+iWedmR9MSSW7pY0MbIn6
 Fim0pskpmFNKzjKE/slK476HeQ3FaK3KnrICPofDoxIsZfM48tbSufqJhU1abRyQ
 MXshaedJw7S4Lka7tzp76EFcjNr3ZT6ll0lhADy/cngJEcP2hKpUr2kYAma0U7WQ
 l0R1Pdyz3rau7D0D1tk25mSWhu+xrDPxWsWpOFOWkuNWKVpRBjib0PytUvohImdN
 OnwhlxkXNTxVtOwI+3FER60dNtNSgVRksNU+Ef275dJbazKGzwlkciYqKYXfZOWZ
 AtcOS342O6iLwuWaf0y+sQZBmZyh0DzRIlI14vIJH/JLC+2ZfkY5xwTYw==
X-ME-Sender: <xms:j4jGYulDXTLHPYWjn5Gf4AEVPwXCfmsXmFVfTSl_8uTbEKPseZO8hg>
 <xme:j4jGYl1cey2RPBMEwWrSQXbADYlMfeqEllJQYqcp2pHGMcq_77hR0KbWXaTcBHBNS
 9MEl2hfUIQ4kgbFL8g>
X-ME-Received: <xmr:j4jGYso5nvUUFLqV1sgn5lxwzf_kdV6IGwWlMoWo6BHYC_RMYCEUNS8-YAWClt6TwUDsxU6aSmitBM7HmyPpQMj2O3h7Ca9J>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enmhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenogetfedtuddqtdduucdludeh
 mdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvg
 htvghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffr
 rghtthgvrhhnpeetlefgueelfeffffefkeeigffhjeeugfdtgfetieegkedvfeffveeike
 dvleetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:j4jGYimDZXMibutM16TtHVswVGOWoAuvGOBRV1fD95Woq0EnNY9bOQ>
 <xmx:j4jGYs1yHwrdb2yg0uTewxZZunq7ubL0cJPDGmqlHlLXd2qlp7bpEA>
 <xmx:j4jGYpuraqxfhY-PxbHQqziovgB27GtCck4reUeAGhFg9hoVel-zFw>
 <xmx:kIjGYg_cjjO4mhbOKtW6f1ad08lYQszEpHQxyBJxSeWy0jY444Rg30wRh5M>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 03:17:35 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: Peter Delevoryas <peter@pjd.dev>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/gpio/aspeed: Don't let guests modify input pins
Date: Thu,  7 Jul 2022 00:17:30 -0700
Message-Id: <20220707071731.34047-2-peter@pjd.dev>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707071731.34047-1-peter@pjd.dev>
References: <20220707071731.34047-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.27; envelope-from=peter@pjd.dev;
 helo=wnew2-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

It seems that aspeed_gpio_update is allowing the value for input pins to be
modified through register writes and QOM property modification.

The QOM property modification is fine, but modifying the value through
register writes from the guest OS seems wrong if the pin's direction is set
to input.

The datasheet specifies that "0" bits in the direction register select input
mode, and "1" selects output mode.

OpenBMC userspace code is accidentally writing 0's to the GPIO data
registers somewhere (or perhaps the driver is doing it through a reset or
something), and this is overwriting GPIO FRU information (board ID, slot
presence pins) that is initialized in Aspeed machine reset code (see
fby35_reset() in hw/arm/aspeed.c).

Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
---
 hw/gpio/aspeed_gpio.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index a62a673857..2eae427201 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
 }
 
 static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
-                               uint32_t value)
+                               uint32_t value, bool force)
 {
     uint32_t input_mask = regs->input_mask;
     uint32_t direction = regs->direction;
@@ -293,10 +293,12 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
             }
 
             /* ...then update the state. */
-            if (mask & new) {
-                regs->data_value |= mask;
-            } else {
-                regs->data_value &= ~mask;
+            if (direction & mask || force) {
+                if (mask & new) {
+                    regs->data_value |= mask;
+                } else {
+                    regs->data_value &= ~mask;
+                }
             }
 
             /* If the gpio is set to output... */
@@ -339,7 +341,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
         value &= ~pin_mask;
     }
 
-    aspeed_gpio_update(s, &s->sets[set_idx], value);
+    aspeed_gpio_update(s, &s->sets[set_idx], value, true);
 }
 
 /*
@@ -653,7 +655,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
         reg_value = update_value_control_source(set, set->data_value,
                                                 reg_value);
         set->data_read = reg_value;
-        aspeed_gpio_update(s, set, reg_value);
+        aspeed_gpio_update(s, set, reg_value, false);
         return;
     case gpio_reg_idx_direction:
         reg_value = set->direction;
@@ -753,7 +755,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
             __func__, offset, data, reg_idx_type);
         return;
     }
-    aspeed_gpio_update(s, set, set->data_value);
+    aspeed_gpio_update(s, set, set->data_value, false);
     return;
 }
 
@@ -799,7 +801,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
         data &= props->output;
         data = update_value_control_source(set, set->data_value, data);
         set->data_read = data;
-        aspeed_gpio_update(s, set, data);
+        aspeed_gpio_update(s, set, data, false);
         return;
     case gpio_reg_direction:
         /*
@@ -875,7 +877,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
                       PRIx64"\n", __func__, offset);
         return;
     }
-    aspeed_gpio_update(s, set, set->data_value);
+    aspeed_gpio_update(s, set, set->data_value, false);
     return;
 }
 
-- 
2.36.1


