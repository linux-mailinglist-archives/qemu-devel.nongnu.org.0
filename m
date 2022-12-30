Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545BE6597BE
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 12:36:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBDg0-0006TN-T7; Fri, 30 Dec 2022 06:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfw-0006T5-1l
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:48 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pBDfu-0003rB-AB
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 06:35:47 -0500
Received: by mail-wr1-x42b.google.com with SMTP id z10so19656984wrh.10
 for <qemu-devel@nongnu.org>; Fri, 30 Dec 2022 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Iifc+3Al9YvWG0jFTBhIrUW5hx3TJ+e3zFqcRSlUTYY=;
 b=WTu8RSafQqQCY9Q/UPq9gMnF+NNq8FiSNMn8VRjrGre5cQeuBBt0586qY2wc9ffIIs
 7+tAuxCNSq3bnrLKy0tAyqDbupdNZoJ2CFWOKTmFlR0bJO7/fCyQdKfmpzsBSrEoSfeP
 k5sZSUuIf0a9D8trQMuj1Wr+6DGJcCEeZkLVX/Z+oEBd/ZpZrmb+HCSBIiCgBV3SzX/o
 Xzph9xsRHbYz8pArxABJQg6P801Km48+My/9UnzPL3ByvXHQLG8eMsz5OXunui2WwbGb
 8rAnGQpuUUdC3oB5D5zzEO7k4S+l5d3L3iSyyyiuw0dE2KOfad4KgujeotFCPOu6yzkm
 PaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Iifc+3Al9YvWG0jFTBhIrUW5hx3TJ+e3zFqcRSlUTYY=;
 b=5zrj5oZdrVPNBD4v7QqwMVGI+WoNwIS9JhEQkC8Ehy+l2W3dACDAu9afu3/qDKLz34
 uAIJqINCFIGCPSuVFwnhPROc6dXx1SroRa0uITzOSBaJqHWD8DGkPYso0IzK2hfUrA6D
 PSvvKcDiEiJJIG6gZTeSovRZqhPZkkpCge7dPSXNXXKBJ1Q+pwC0cjDU4W7EK6gDIiak
 NTNqHp/HOVOPSedViSMoHmK0L16bVGNZmMS7I/4gGp5JPdipO4oKUm2hKHLnN+yR6/ui
 sRUqcxgFeH2WAT6VCNoA0lPoiSjU+5wvsvvES58M29QQajF0DjoQGrDr3o0QnseKfU4V
 oEIg==
X-Gm-Message-State: AFqh2konnpiLXHt+AD04XQhAjXPzTCaN/GGRGR1xoKutTfWrR0MIRJJU
 IdNIh4hmsEgE/K5hd2X3GkJN5NAH33Ml7ey2
X-Google-Smtp-Source: AMrXdXt0p2otaDvubRfc7tbsoaSDU/jMUOfMBsX55W9m8HoHDmfhvsX8yyWfYMNp91vzqDT9xv3gCA==
X-Received: by 2002:a5d:6545:0:b0:27f:4a7e:fc47 with SMTP id
 z5-20020a5d6545000000b0027f4a7efc47mr9588985wrv.67.1672400145411; 
 Fri, 30 Dec 2022 03:35:45 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020adfc585000000b00236488f62d6sm20838038wrg.79.2022.12.30.03.35.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 30 Dec 2022 03:35:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 Peter Delevoryas <peter@pjd.dev>, Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Peter Delevoryas <pdel@fb.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 07/11] hw/arm/aspeed_ast10x0: Map I3C peripheral
Date: Fri, 30 Dec 2022 12:35:00 +0100
Message-Id: <20221230113504.37032-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221230113504.37032-1-philmd@linaro.org>
References: <20221230113504.37032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Reviewed-by: Peter Delevoryas <peter@pjd.dev>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index d7dbc1a801..6c6d33d4a0 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -54,6 +54,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_WDT]       = 0x7E785000,
     [ASPEED_DEV_LPC]       = 0x7E789000,
     [ASPEED_DEV_PECI]      = 0x7E78B000,
+    [ASPEED_DEV_I3C]       = 0x7E7A0000,
     [ASPEED_DEV_I2C]       = 0x7E7B0000,
 };
 
@@ -89,6 +90,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
+    [ASPEED_DEV_I3C]       = 102, /* 102 -> 105 */
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
     [ASPEED_DEV_UDC]       = 9,
@@ -130,6 +132,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
+
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
@@ -240,6 +244,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                        sc->irqmap[ASPEED_DEV_I3C] + i);
+        /* The AST1030 I3C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
+
     /* PECI */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
         return;
-- 
2.38.1


