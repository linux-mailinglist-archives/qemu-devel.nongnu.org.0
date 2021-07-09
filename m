Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 199503C1F28
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:58:57 +0200 (CEST)
Received: from localhost ([::1]:39488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1jXM-0005iO-5g
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m1j6k-0004qH-0Q; Fri, 09 Jul 2021 01:31:26 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1m1j6i-0008LT-6b; Fri, 09 Jul 2021 01:31:25 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 6A6325C00BA;
 Fri,  9 Jul 2021 01:31:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 09 Jul 2021 01:31:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=d17kHWoQcvTHT
 Z6cJuvQmfX6trtQiSrc6TZwqH63X4Q=; b=X1ttoa8hUoeIrsoeP85yRrbVSbhsM
 qQHou0IM6CgY86JicannZMX1opi0dDdeD4PPmKuseAIPbLTMnHIQLHtRuFr7oH8O
 40UlVuoMknI9/4V11XMHbzlmU9Vx+2fh9fsIE6JT0ZZaXJWvzRtkj/tvUzqOzysw
 DHdlm+ztQrqMGhg6KOchEbIz1kamZkwLhRbcc68UP4xMzFpSaUNmGLFhe2sOU8GE
 loqMl0gaW3U/+S4Hao4WyCXlokt421qq9IrW1mRCtTQekGJSQbcEco3+PzdS+QS4
 jFASig0HFFZFX9GIlpOyoElUW0naVtaM0Nu2+Nen335eZkUWY7KZsCekg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=d17kHWoQcvTHTZ6cJuvQmfX6trtQiSrc6TZwqH63X4Q=; b=osOEgrgT
 MdPJIl2+reO/FoU2mcBwxYhaoIDTT4CT7vp1L2dnHq/b+f/xCjLP4ryF8z2+PNFK
 d1xd+Rz+aKWoQ/ux7R8uS0cm63rlScDGHiVJ74UhmySTY3cBIxLZuyE1MB5UyXrM
 EGcND8PqQUGERZPYGNo13b32cQavt2Mc+d5Lj7JzreXfguwCnlDBSbRKPN59U85y
 OBNrv/f5al5oITd4Zkk/wcgc28K0fRTBXo8KWTjia8e2E+ffIg4x05EFovwtt6Jt
 S6zMbYXNon+hYrBCT34x0x2Y9tK8CXbJy+qvcBO9JT54hygFDok+IaCToDNzvJSK
 yVafOnIA0eN1OA==
X-ME-Sender: <xms:K9_nYBQlASbY3ZSmcGb1DSbGVxhhvlp9Gz0SZZGxUyq6wpwl-gVvhg>
 <xme:K9_nYKzdMgTHp1q0RaFjROd6ANkOD1IJX17xgmvGbUlTAtZnac0nkI8i8NqNsoOPv
 vfCgIjbX7gIN4Aang>
X-ME-Received: <xmr:K9_nYG1CwfY3jQ-tHj59B3rtnyL-BBetGZW-5VZFEns8PT_ShlbIBjSLajHerAWaXlPGuwA5uLiQScuEvnpNuu8xdlROerEvHaSIs3dBGkDYLnLCBuLOGL9h3pHSO18ulGcUUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdehgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgleette
 ejffelffdvudduveeiffegteelvefhteenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:K9_nYJCiVrnechmV29s4WV9RuiQeQS3cN--Q6wPlvoJ-HVq2lmapRQ>
 <xmx:K9_nYKhb9LjPBLwou4nSV4VfNOXqdihTEsLCOgjx9WUCe03U1mWzNQ>
 <xmx:K9_nYNqSKvpR2Nl7OKjbDM3osn3oX-dQrfEklRZwwvn3ZkTPIjSnrQ>
 <xmx:K9_nYLu53DV8QtyXraRFWInRGQshKIjRK6gppmkigT81DQHE1EEI5Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jul 2021 01:31:20 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] watchdog: aspeed: Sanitize control register values
Date: Fri,  9 Jul 2021 15:01:06 +0930
Message-Id: <20210709053107.1829304-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709053107.1829304-1-andrew@aj.id.au>
References: <20210709053107.1829304-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=andrew@aj.id.au;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, clg@kaod.org, joel@jms.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While some of the critical fields remain the same, there is variation in
the definition of the control register across the SoC generations.
Reserved regions are adjusted, while in other cases the mutability or
behaviour of fields change.

Introduce a callback to sanitize the value on writes to ensure model
behaviour reflects the hardware.

Fixes: 854123bf8d4b ("wdt: Add Aspeed watchdog device model")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 hw/watchdog/wdt_aspeed.c         | 24 ++++++++++++++++++++++--
 include/hw/watchdog/wdt_aspeed.h |  1 +
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 6352ba1b0e5b..faa3d35fdf21 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -118,13 +118,27 @@ static void aspeed_wdt_reload_1mhz(AspeedWDTState *s)
     }
 }
 
+static uint64_t aspeed_2400_sanitize_ctrl(uint64_t data)
+{
+    return data & 0xffff;
+}
+
+static uint64_t aspeed_2500_sanitize_ctrl(uint64_t data)
+{
+    return (data & ~(0xfUL << 8)) | WDT_CTRL_1MHZ_CLK;
+}
+
+static uint64_t aspeed_2600_sanitize_ctrl(uint64_t data)
+{
+    return data & ~(0x7UL << 7);
+}
 
 static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
                              unsigned size)
 {
     AspeedWDTState *s = ASPEED_WDT(opaque);
     AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
-    bool enable = data & WDT_CTRL_ENABLE;
+    bool enable;
 
     offset >>= 2;
 
@@ -144,6 +158,8 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
         }
         break;
     case WDT_CTRL:
+        data = awc->sanitize_ctrl(data);
+        enable = data & WDT_CTRL_ENABLE;
         if (enable && !aspeed_wdt_is_enabled(s)) {
             s->regs[WDT_CTRL] = data;
             awc->wdt_reload(s);
@@ -207,11 +223,12 @@ static const MemoryRegionOps aspeed_wdt_ops = {
 static void aspeed_wdt_reset(DeviceState *dev)
 {
     AspeedWDTState *s = ASPEED_WDT(dev);
+    AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
 
     s->regs[WDT_STATUS] = 0x3EF1480;
     s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
     s->regs[WDT_RESTART] = 0;
-    s->regs[WDT_CTRL] = 0;
+    s->regs[WDT_CTRL] = awc->sanitize_ctrl(0);
     s->regs[WDT_RESET_WIDTH] = 0xFF;
 
     timer_del(s->timer);
@@ -293,6 +310,7 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
     awc->ext_pulse_width_mask = 0xff;
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->wdt_reload = aspeed_wdt_reload;
+    awc->sanitize_ctrl = aspeed_2400_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2400_wdt_info = {
@@ -328,6 +346,7 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2500_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2500_wdt_info = {
@@ -348,6 +367,7 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
     awc->reset_ctrl_reg = AST2600_SCU_RESET_CONTROL1;
     awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
     awc->wdt_reload = aspeed_wdt_reload_1mhz;
+    awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
 }
 
 static const TypeInfo aspeed_2600_wdt_info = {
diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
index 80b03661e303..f945cd6c5833 100644
--- a/include/hw/watchdog/wdt_aspeed.h
+++ b/include/hw/watchdog/wdt_aspeed.h
@@ -44,6 +44,7 @@ struct AspeedWDTClass {
     uint32_t reset_ctrl_reg;
     void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
     void (*wdt_reload)(AspeedWDTState *s);
+    uint64_t (*sanitize_ctrl)(uint64_t data);
 };
 
 #endif /* WDT_ASPEED_H */
-- 
2.30.2


