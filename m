Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA264AC288
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:09:33 +0100 (CET)
Received: from localhost ([::1]:51558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5e0-0007Vq-7E
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:09:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5ZC-0004PN-02; Mon, 07 Feb 2022 10:04:37 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:50087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1nH5Z8-0004cA-MG; Mon, 07 Feb 2022 10:04:33 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4D8193202133;
 Mon,  7 Feb 2022 10:04:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 10:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=DdRMvPKHeZixKcamiXTuJrB5BVbNhd
 3EsmNNBzsQ7yk=; b=FimZaoYE+XltOh2eTk+KE3VxwPQmV3Oj6D0V1BHYm0AzaC
 otNPCC1ZJCnsVN2Boa1fx96XG4ErSjrFl/+wqmEDUoV9UBvb7cuSQMHrjobQwRpW
 C5ewJA5aq4E2pdGJop0N7XYlq69Q7qm9JmlQw9/7E9hYiBfudz4wFqCNuC7DhvaI
 FELDUeS9IvW2ODkzIgrJlxo/5LMZx6PS2B+afBfwU5sH0ciU0UB/q8/Bx+bDacDS
 czHR+z+u+ZmAQuSdltbHemOpLMmEYBQ1YnlgsgwvcrDUE9XYuVvQoVAX2ns7F13X
 Vxx8u3FgwBBb4xs2xhSER+STyLhVkZboAFFQV2bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DdRMvP
 KHeZixKcamiXTuJrB5BVbNhd3EsmNNBzsQ7yk=; b=NatKFMQma2JSbokelaK8Z+
 Jsdh2jz97NprGy3w4pIAOX21vpG+50qE/MziurZTGphCAaACrsyiYK2ib/WKUDAN
 RVhWGFi+Gw0DkujYFYYxHhRd+hBiq1My7ctBn8QS0GKpvj9GqYoItYPHK6sk/gkJ
 Lmo17jHCn86E9sslO2jEXttj5NUtrlMVl7bjKwOgsuiTO67IGj3nr8MOvqKPvGxU
 Y9IN0mbxAxk9nbNfT4GuzH+x6nKVikWxVpdsiIJbc1C7dDdINE8q7sD7XLdB3cN0
 cElE4lOufQN7nYV27XtAfe9Je0iOsk4j1+mdS4RV65kgFXSOx+8SazkH/pc3EsVw
 ==
X-ME-Sender: <xms:-zQBYhISHFEu6g1pbPUFnDwVwl3OXbef5HcYMv00Ywi1Q8-5NckY7A>
 <xme:-zQBYtL5vU26LidEo50Stez0XbagOiYszAYCi4E71ZwPiZ_u6Pz576S4iJpGfV3Zy
 scbGrF1gYaHujMtNg>
X-ME-Received: <xmr:-zQBYptiTimPNNDBF6n64n-MdLYWzREJ80QXYzBMNp84bt2eRUNJEe-5T-kp5UVio3DmzIc26wzHL3qh3XXjUonWHJzcBREY2j_cktgyJaOr7I_w8fsjQ1sHliWngzo3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:-zQBYiaqvphtXmcjBVAqGdfqVD_oXCkML0wnPxKG6DCaKHwG8NY3aw>
 <xmx:-zQBYoZaWGH0c7J5jRdsxYydwmvTngdmob0jmfLYmo9zLohJ9jYvtg>
 <xmx:-zQBYmCLYfyxuspsiQE7L85-eHWPHdD9Hhs16PpO-JuYSpwxzw4Nfw>
 <xmx:-zQBYvU-Cepf5gqDcWtgabEXYcq1_pduhemsVO-a_yUTafk_LBuERA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 10:04:25 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] hw: aspeed_gpio: Split GPIOSet handling from accessors
Date: Tue,  8 Feb 2022 01:34:08 +1030
Message-Id: <20220207150409.358888-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220207150409.358888-1-andrew@aj.id.au>
References: <20220207150409.358888-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=andrew@aj.id.au;
 helo=wout1-smtp.messagingengine.com
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
Cc: peter.maydell@linaro.org, openbmc@lists.ozlabs.org, qemu-arm@nongnu.org,
 clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pave the way for implementing the new register interface for GPIO
control provided by the AST2600. We need a consistent data model, so
do some work to enable use of the AspeedGPIOReg / GPIOSets data
structures for both.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/gpio/aspeed_gpio.c | 105 ++++++++++++++++++++++++------------------
 1 file changed, 60 insertions(+), 45 deletions(-)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index c63634d3d3e2..1d4d1aedc4b5 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -516,28 +516,11 @@ static const AspeedGPIOReg aspeed_1_8v_gpios[GPIO_1_8V_REG_ARRAY_SIZE] = {
     [GPIO_1_8V_E_INPUT_MASK] =     {1, gpio_reg_input_mask},
 };
 
-static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
+static uint64_t
+aspeed_gpio_set_read(const AspeedGPIOState *s, const AspeedGPIOReg *reg)
 {
-    AspeedGPIOState *s = ASPEED_GPIO(opaque);
-    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
-    uint64_t idx = -1;
-    const AspeedGPIOReg *reg;
-    GPIOSets *set;
+    const GPIOSets *set = &s->sets[reg->set_idx];
 
-    idx = offset >> 2;
-    if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
-        idx -= GPIO_DEBOUNCE_TIME_1;
-        return (uint64_t) s->debounce_regs[idx];
-    }
-
-    reg = &agc->reg_table[idx];
-    if (reg->set_idx >= agc->nr_gpio_sets) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
-                      HWADDR_PRIx"\n", __func__, offset);
-        return 0;
-    }
-
-    set = &s->sets[reg->set_idx];
     switch (reg->type) {
     case gpio_reg_data_value:
         return set->data_value;
@@ -567,37 +550,44 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
         return set->data_read;
     case gpio_reg_input_mask:
         return set->input_mask;
-    default:
+    case gpio_not_a_reg:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid register: %d\n", __func__,
+                      reg->type);
+    }
+
+    return 0;
+}
+
+static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
+{
+    AspeedGPIOState *s = ASPEED_GPIO(opaque);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    const AspeedGPIOReg *reg;
+    uint64_t idx = -1;
+
+    idx = offset >> 2;
+    if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
+        idx -= GPIO_DEBOUNCE_TIME_1;
+        return (uint64_t) s->debounce_regs[idx];
+    }
+
+    reg = &agc->reg_table[idx];
+    if (reg->set_idx >= agc->nr_gpio_sets) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
                       HWADDR_PRIx"\n", __func__, offset);
         return 0;
     }
+
+    return aspeed_gpio_set_read(s, reg);
 }
 
-static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
-                              uint32_t size)
+static void aspeed_gpio_set_write(AspeedGPIOState *s, const AspeedGPIOReg *reg,
+                                  uint32_t data)
 {
-    AspeedGPIOState *s = ASPEED_GPIO(opaque);
     AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
     const GPIOSetProperties *props;
-    uint64_t idx = -1;
-    const AspeedGPIOReg *reg;
-    GPIOSets *set;
     uint32_t cleared;
-
-    idx = offset >> 2;
-    if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
-        idx -= GPIO_DEBOUNCE_TIME_1;
-        s->debounce_regs[idx] = (uint32_t) data;
-        return;
-    }
-
-    reg = &agc->reg_table[idx];
-    if (reg->set_idx >= agc->nr_gpio_sets) {
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
-                      HWADDR_PRIx"\n", __func__, offset);
-        return;
-    }
+    GPIOSets *set;
 
     set = &s->sets[reg->set_idx];
     props = &agc->props[reg->set_idx];
@@ -678,13 +668,38 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
          */
          set->input_mask = data & props->input;
         break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
-                      HWADDR_PRIx"\n", __func__, offset);
+    case gpio_not_a_reg:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid register: %d\n", __func__,
+                      reg->type);
         return;
     }
+
     aspeed_gpio_update(s, set, set->data_value);
-    return;
+}
+
+static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
+                              uint32_t size)
+{
+    AspeedGPIOState *s = ASPEED_GPIO(opaque);
+    AspeedGPIOClass *agc = ASPEED_GPIO_GET_CLASS(s);
+    const AspeedGPIOReg *reg;
+    uint64_t idx = -1;
+
+    idx = offset >> 2;
+    if (idx >= GPIO_DEBOUNCE_TIME_1 && idx <= GPIO_DEBOUNCE_TIME_3) {
+        idx -= GPIO_DEBOUNCE_TIME_1;
+        s->debounce_regs[idx] = (uint32_t) data;
+        return;
+    }
+
+    reg = &agc->reg_table[idx];
+    if (reg->set_idx >= agc->nr_gpio_sets) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
+                      HWADDR_PRIx"\n", __func__, offset);
+        return;
+    }
+
+    aspeed_gpio_set_write(s, reg, data);
 }
 
 static int get_set_idx(AspeedGPIOState *s, const char *group, int *group_idx)
-- 
2.32.0


