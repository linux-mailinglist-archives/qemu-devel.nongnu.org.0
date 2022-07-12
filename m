Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E0357106B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:42:59 +0200 (CEST)
Received: from localhost ([::1]:57698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5rW-000199-LZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hS-0007sm-Jy; Mon, 11 Jul 2022 22:32:34 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:38681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hQ-0006YK-LM; Mon, 11 Jul 2022 22:32:34 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id D13ED580A0C;
 Mon, 11 Jul 2022 22:32:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 22:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657593151; x=1657596751; bh=lZ
 0HvsZ9FnoYrEYLIINLY/xwbc82MeQ14CYmLwhYr/g=; b=E7FaEnf5V1Irnxm4z4
 iewagBcVob2zdOjQJQMmNOG+y1EwDyHhhGiJfhd2Rl6UgUPRjTfdhLHbzW01eQ7k
 9auTkklEIMoUt1zPcM3JeN0cJdENeT1DgYrUWzauwH+g4xG+KCjyafdPvoMhZIYN
 4mSGpl+z+A+bOFF0StXR4017GnXHDEWuJ1rrPVu3pj5N+VkcAxeU5rF5yU3EJDef
 azx+EpKGmsmQhekBMYPEfoMyeRcWqVvFV79y+2fbHeOEgLyoHmx2MXXWXUWQwa9N
 ei8xN2Q2YuyozNzBvrVZPNc9QMxhtg2JZINVqfqx9U7Vfq/8HPz5Nj7nj+wmdgT7
 Z6Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657593151; x=1657596751; bh=lZ0HvsZ9FnoYr
 EYLIINLY/xwbc82MeQ14CYmLwhYr/g=; b=fWXLlPIxLvvpWZVUacRJlWEUMuRPM
 zF+Fh8KUDDUB6F7aY3U4v0QYSWTXXYEBwguWl6mR2U9AGh/s5pkKhs1t9y5P8sUI
 sL7Vna6IYvMljG+qfjkJsE8f/rUnhX3Rfaufu0Bv5IGypm2q+43omdN7aMuwxo2f
 zv6neNSKZutxFBl73HIJK48aU36VREu9XoS30zPWxNIxSvrp5hH4i9tRNYC3+EDa
 nGF+wm7an+fysMXFoxel8UgqmxenUnNSV6TeKong5CzLZNQJexJgw0yPV+1NPMzX
 oF1ciDpX/HSH1wj4R5Fr9jZtdb8CwHgkWpQA7m6IcXjfPn+4vGrTJzsmw==
X-ME-Sender: <xms:P93MYtoDkfaIlLgt_JjveGb-cp6FW7OsZr68q9xpaU6fQTU2s_RLOQ>
 <xme:P93MYvqbIiYQawKza5lG3IAjTDjZE3pO_sevlj_rMT__GKwpeQmFYBstv1vq2ZE9h
 pVu8piwJ6TJ43ZoHeQ>
X-ME-Received: <xmr:P93MYqNdt-IMVKak9p0TusLbsnWGPJjvNqL-4RuCAXXO1JTTYtub4ogb69nOmQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteegleegffehvdfhleduleefueff
 kedutddtjeehffeludelvdejveejjeejuefgnecuffhomhgrihhnpehkvghrnhgvlhdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 vghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:P93MYo68WjfjzvMcDk4CYM4cmrnwK-O7DDEBS4LbBlU3om9mfWpUvQ>
 <xmx:P93MYs6gNUo7HqQClBbwb8ox7KH-aiuR1GLblKtILGQcAy61MkEEtA>
 <xmx:P93MYggoHSo0xlvg5kVav1t2FmRsNAlp1I4f3OxT98OMz-4c41KiJA>
 <xmx:P93MYuv01MRY4CiEISuhhRQBn2PUTogBEzf156z9aVWKwXfHpcanYA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 22:32:31 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/gpio/aspeed: Don't let guests modify input pins
Date: Mon, 11 Jul 2022 19:32:18 -0700
Message-Id: <20220712023219.41065-3-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712023219.41065-1-peter@pjd.dev>
References: <20220712023219.41065-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
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

Up until now, guests could modify input pins by overwriting the data
value register. The guest OS should only be allowed to modify output pin
values, and the QOM property setter should only be permitted to modify
input pins.

This change also updates the gpio input pin test to match this
expectation.

Andrew suggested this particularly refactoring here:

    https://lore.kernel.org/qemu-devel/23523aa1-ba81-412b-92cc-8174faba3612@www.fastmail.com/

Suggested-by: Andrew Jeffery <andrew@aj.id.au>
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500")
---
 hw/gpio/aspeed_gpio.c          | 15 ++++++++-------
 tests/qtest/aspeed_gpio-test.c |  2 +-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index a62a673857..1e267dd482 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -268,7 +268,7 @@ static ptrdiff_t aspeed_gpio_set_idx(AspeedGPIOState *s, GPIOSets *regs)
 }
 
 static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
-                               uint32_t value)
+                               uint32_t value, uint32_t mode_mask)
 {
     uint32_t input_mask = regs->input_mask;
     uint32_t direction = regs->direction;
@@ -277,7 +277,8 @@ static void aspeed_gpio_update(AspeedGPIOState *s, GPIOSets *regs,
     uint32_t diff;
     int gpio;
 
-    diff = old ^ new;
+    diff = (old ^ new);
+    diff &= mode_mask;
     if (diff) {
         for (gpio = 0; gpio < ASPEED_GPIOS_PER_SET; gpio++) {
             uint32_t mask = 1 << gpio;
@@ -339,7 +340,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *s, uint32_t set_idx,
         value &= ~pin_mask;
     }
 
-    aspeed_gpio_update(s, &s->sets[set_idx], value);
+    aspeed_gpio_update(s, &s->sets[set_idx], value, ~s->sets[set_idx].direction);
 }
 
 /*
@@ -653,7 +654,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
         reg_value = update_value_control_source(set, set->data_value,
                                                 reg_value);
         set->data_read = reg_value;
-        aspeed_gpio_update(s, set, reg_value);
+        aspeed_gpio_update(s, set, reg_value, set->direction);
         return;
     case gpio_reg_idx_direction:
         reg_value = set->direction;
@@ -753,7 +754,7 @@ static void aspeed_gpio_write_index_mode(void *opaque, hwaddr offset,
             __func__, offset, data, reg_idx_type);
         return;
     }
-    aspeed_gpio_update(s, set, set->data_value);
+    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
     return;
 }
 
@@ -799,7 +800,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
         data &= props->output;
         data = update_value_control_source(set, set->data_value, data);
         set->data_read = data;
-        aspeed_gpio_update(s, set, data);
+        aspeed_gpio_update(s, set, data, set->direction);
         return;
     case gpio_reg_direction:
         /*
@@ -875,7 +876,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
                       PRIx64"\n", __func__, offset);
         return;
     }
-    aspeed_gpio_update(s, set, set->data_value);
+    aspeed_gpio_update(s, set, set->data_value, UINT32_MAX);
     return;
 }
 
diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
index 8f52454099..d38f51d719 100644
--- a/tests/qtest/aspeed_gpio-test.c
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -69,7 +69,7 @@ static void test_set_input_pins(const void *data)
 
     qtest_writel(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE, 0x00000000);
     value = qtest_readl(s, AST2600_GPIO_BASE + GPIO_ABCD_DATA_VALUE);
-    g_assert_cmphex(value, ==, 0x00000000);
+    g_assert_cmphex(value, ==, 0xffffffff);
 }
 
 int main(int argc, char **argv)
-- 
2.37.0


