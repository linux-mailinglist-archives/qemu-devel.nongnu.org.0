Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748004767B3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 03:05:50 +0100 (CET)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxg9V-000374-Kp
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 21:05:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Upy6YQcKCokx1zy1qvt11tyr.p1z3rz7-qr8ry010t07.14t@flex--komlodi.bounces.google.com>)
 id 1mxg4v-0005NX-M0
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:01:06 -0500
Received: from [2607:f8b0:4864:20::64a] (port=53160
 helo=mail-pl1-x64a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Upy6YQcKCokx1zy1qvt11tyr.p1z3rz7-qr8ry010t07.14t@flex--komlodi.bounces.google.com>)
 id 1mxg4s-0007bd-Gy
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 21:01:04 -0500
Received: by mail-pl1-x64a.google.com with SMTP id
 m15-20020a170902bb8f00b0014382b67873so7261762pls.19
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 18:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=37v2VvpScxCBaS0yW36wU3F/iIJvmW0p9+Vo6UzvkpM=;
 b=jvHxr9MSxqEC89mZYCXp4kDoB1cM1hHHK38nzV3szzRqUHBiBa5IprPD7WEwEonhFF
 nB4SfkY50LeYiuGMi33pZYKuRyFq6pN0rMko634gSEBNzF439qP2EqNdBDZAgUW4xfpU
 A6jYA8sykWkj7OY75G5VLEpGqrpOYozVXUtAKdyV3RJN43dsBFLrMdexEzpeQCdeUVTr
 33v0EtSRn95S4QY7XABfS28yHLd4Gp4rm/8Qg2FWqxesgDuChorGoFmjjd6T/hWgrm/f
 2EUkQ/WaamtxuB2kicis0KVjsDueVFEmFXvjjumrWsyZabS2eclh96LgT48qgi0RtPRd
 z63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=37v2VvpScxCBaS0yW36wU3F/iIJvmW0p9+Vo6UzvkpM=;
 b=iyxGuboufIrOowd0zkYPAp4op8afa42acKh2J/DNOnPd7Dam8gN/Es4UGXv0Txie/H
 GPYzOG49qJZVYs+mOEhl9BgNxxYlg4fQhfCykymYbJ7g9wmqvR6HnDfao+RvV0qoy3DF
 taQeuT4BFXOAxuzbpcVE/1DD1M0CO6WCvYWx8Nn1rZr7dz7fOY02S7TM4His+SQ47ZZ+
 VoiqsSSZ/n5J25x08OX/BICoeSkHMqVFPYVz1GaTdmhnaT/SkP//rFFPjcgYODEBYbW3
 ydL47FaiFOXIxjsBwFP08kt1D/j8nM/fv2lohKcKo+h0Mvtgxf/XwuF/BlPYcGF9G2CM
 K01w==
X-Gm-Message-State: AOAM531LXoDNQsQKdvXk73O8WGzZlzpa3EqhIjEby+69kEE4mVPAYTeC
 pRfbrEx4hnb7IXYMOBjDUK+lRRIlQv/6BaIiLkHQhFewGfmgppYjmNrvSk1R3QfRceX68w95HPc
 wzNBzMTlYicSgjiwwXwxLGosjRST1ilgmpZgri7ni1/KGCMe0bRsSAT8YTH57PRU=
X-Google-Smtp-Source: ABdhPJznhZrrt3HH0xbjBe/6rR50dzZa2K4WdZBFtzEufuHLtAkpvjr6AkhUaHVD4RqCTfjcl15J4BJxxXrB
X-Received: from komlodi.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:35ee])
 (user=komlodi job=sendgmr) by 2002:a05:6a00:1945:b0:44c:a955:35ea with SMTP
 id s5-20020a056a00194500b0044ca95535eamr11358119pfk.85.1639619666320; Wed, 15
 Dec 2021 17:54:26 -0800 (PST)
Date: Thu, 16 Dec 2021 01:54:16 +0000
In-Reply-To: <20211216015417.1234812-1-komlodi@google.com>
Message-Id: <20211216015417.1234812-6-komlodi@google.com>
Mime-Version: 1.0
References: <20211216015417.1234812-1-komlodi@google.com>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [RFC PATCH 5/6] hw/gpio/npcm7xx: init GPIO transmitter allowlist
From: Joe Komlodi <komlodi@google.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com, 
 kfting@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::64a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3Upy6YQcKCokx1zy1qvt11tyr.p1z3rz7-qr8ry010t07.14t@flex--komlodi.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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

For the GPIO transmitter to properly transmit on pin changes, it must
know the initial state of the GPIO pins on the controller.

Signed-off-by: Joe Komlodi <komlodi@google.com>
---
 hw/gpio/npcm7xx_gpio.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/gpio/npcm7xx_gpio.c b/hw/gpio/npcm7xx_gpio.c
index 0d683903a2..64a74c87a5 100644
--- a/hw/gpio/npcm7xx_gpio.c
+++ b/hw/gpio/npcm7xx_gpio.c
@@ -370,6 +370,14 @@ static void npcm7xx_gpio_hold_reset(Object *obj)
     npcm7xx_gpio_update_pins(s, -1);
 }
 
+static void npcm7xx_gpio_realize(DeviceState *dev, Error **errp)
+{
+    NPCM7xxGPIOState *s = NPCM7XX_GPIO(dev);
+    uint32_t state = s->regs[NPCM7XX_GPIO_DOUT] | s->regs[NPCM7XX_GPIO_DIN];
+
+    google_gpio_tx_state_init(s->txs, s->controller_num, state);
+}
+
 static void npcm7xx_gpio_init(Object *obj)
 {
     NPCM7xxGPIOState *s = NPCM7XX_GPIO(obj);
@@ -423,6 +431,7 @@ static void npcm7xx_gpio_class_init(ObjectClass *klass, void *data)
 
     dc->desc = "NPCM7xx GPIO Controller";
     dc->vmsd = &vmstate_npcm7xx_gpio;
+    dc->realize = npcm7xx_gpio_realize;
     reset->phases.enter = npcm7xx_gpio_enter_reset;
     reset->phases.hold = npcm7xx_gpio_hold_reset;
     device_class_set_props(dc, npcm7xx_gpio_properties);
-- 
2.34.1.173.g76aa8bc2d0-goog


