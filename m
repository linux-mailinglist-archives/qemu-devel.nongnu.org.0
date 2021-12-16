Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4014767A9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:03:25 +0100 (CET)
Received: from localhost ([::1]:33854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxg7A-0000Cg-CT
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:03:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3T5y6YQcKCoYuywvynsqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--komlodi.bounces.google.com>)
 id 1mxg5t-0006F3-Pj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:02:06 -0500
Received: from [2607:f8b0:4864:20::249] (port=36588
 helo=mail-oi1-x249.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3T5y6YQcKCoYuywvynsqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--komlodi.bounces.google.com>)
 id 1mxg5r-0007rY-PD
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:02:05 -0500
Received: by mail-oi1-x249.google.com with SMTP id
 e3-20020aca3703000000b002c1f9ecb392so8870452oia.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 18:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=6qi5FujVcKqpsTRdgntkPSLgLU+R3PZ9Af/Wfz1k8V4=;
 b=icTy68oIXhSUnegyqXN5M0qvdWpmUiqAXps6OzNYKHTYEKsrFnd2hLJCl+u2bBTwvj
 nE21B3k9sTHxsUuc85xgehYkmONnHBaFdkQcrKUcGMZXbJOub4I3Xqzf7pm+AmSpHZtc
 kwx148jjjLb3lCFW9KVOCwg9yUy7ddM0L1AkJWtxGQikF/wA6Cb48U8SzVd4dzVvZMsY
 flcLxkhQzKuCmWzjeZFkVPIyBVbZhQ6MLKFrQt++S8Bp473Ojj5ctMViz1ll2G29QR4Y
 4PK2EOwCaYFA9+Nup9s6FXzgjOIuWUhonXcr2danxHgVi0ZPkpZU14FI6Vi40GsZui7B
 4GiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=6qi5FujVcKqpsTRdgntkPSLgLU+R3PZ9Af/Wfz1k8V4=;
 b=1Sp074zwfT/fNvjLoYHp5OqpboIfYgmF20TuoO9FLwbWIk13YviqVWMwTIqeFY1iTM
 ZGq5vmYwDNPj2TvCZCi8HOrsnzSMgnBaVydMwyWiqx9lxhpLA7i6tZCYbjHqahso5sth
 LQPXv5ydG7i478RAH6x92c2x+qW9zjMdCqDZ095KpnUtDO4OIDniPBme83rSvLGMk4Ti
 zJPMA49qBFibwl6h10PJRePJceJkWLS2dHSWMc2hc0t4w3oTDd5qTEiqHM4wEl8qW40g
 4UhT0KZ/pYKNI2Jc4Ov0BxfAA9uSNQg48xjQJwHZMAp73pjlAj/gA3/IZu91ksMezi0a
 hMLQ==
X-Gm-Message-State: AOAM531hHVZZthjvTFIAp+RpXCOvFwgPn3Doqws+eQkV1+7uz8Tfb0EO
 uq9XCCDXBtHXSs+QZq9zEe3W6GqpadJVGXw/P3GrlQFSYxIYQtnsbRllAMXo15EObriUeaym+bC
 S4jw0AvL7X27RaCdrFCN9HWUhEOsLVp1MyJBk5+V22A6h65ZE5cFzENqRY+KY1a0=
X-Google-Smtp-Source: ABdhPJxrTHsG5+2c+sQSlHFBBnUm8KLUXsPGSsDXbA7TYndLV52eCGbryefwyD1JyF6VC3iqLm9TzO67HfTO
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a17:90b:4c44:: with SMTP id
 np4mr3215030pjb.195.1639619663012; Wed, 15 Dec 2021 17:54:23 -0800 (PST)
Date: Thu, 16 Dec 2021 01:54:14 +0000
In-Reply-To: <20211216015417.1234812-1-komlodi@google.com>
Message-Id: <20211216015417.1234812-4-komlodi@google.com>
Mime-Version: 1.0
References: <20211216015417.1234812-1-komlodi@google.com>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH 3/6] hw/gpio/npcm7xx: Number controllers
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com, 
 kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::249
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::249;
 envelope-from=3T5y6YQcKCoYuywvynsqyyqvo.myw0ow4-no5ovxyxqx4.y1q@flex--komlodi.bounces.google.com;
 helo=mail-oi1-x249.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

For transmitting the GPIO state to the outside world, the GPIO transmitter will
need to know which controller's state has been updated.

To do this, we'll just number each controller at initialization.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/arm/npcm7xx.c               | 1 +
 hw/gpio/npcm7xx_gpio.c         | 2 ++
 include/hw/gpio/npcm7xx_gpio.h | 1 +
 3 files changed, 4 insertions(+)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index ace21d8943..6a48a9a6d4 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -595,6 +595,7 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     for (i = 0; i < ARRAY_SIZE(s->gpio); i++) {
         Object *obj = OBJECT(&s->gpio[i]);
 
+        object_property_set_uint(obj, "controller-num", i, &error_abort);
         object_property_set_uint(obj, "reset-pullup",
                                  npcm7xx_gpio[i].reset_pu, &error_abort);
         object_property_set_uint(obj, "reset-pulldown",
diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
index 3376901ab1..5075f61b3b 100644
--- a/hw/gpio/npcm7xx_gpio.c
+++ b/hw/gpio/npcm7xx_gpio.c
@@ -387,6 +387,8 @@ static const VMStateDescription vmstate_npcm7xx_gpio = {
 };
 
 static Property npcm7xx_gpio_properties[] = {
+    /* The GPIO controller number (out of 8) */
+    DEFINE_PROP_UINT8("controller-num", NPCM7xxGPIOState, controller_num, 0),
     /* Bit n set => pin n has pullup enabled by default. */
     DEFINE_PROP_UINT32("reset-pullup", NPCM7xxGPIOState, reset_pu, 0),
     /* Bit n set => pin n has pulldown enabled by default. */
diff --git a/include/hw/gpio/npcm7xx_gpio.h b/include/hw/gpio/npcm7xx_gpio.h
index b1d771bd77..b065bba1c5 100644
--- a/include/hw/gpio/npcm7xx_gpio.h
+++ b/include/hw/gpio/npcm7xx_gpio.h
@@ -35,6 +35,7 @@ typedef struct NPCM7xxGPIOState {
     uint32_t reset_pd;
     uint32_t reset_osrc;
     uint32_t reset_odsc;
+    uint8_t  controller_num;
 
     MemoryRegion mmio;
 
-- 
2.34.1.173.g76aa8bc2d0-goog


