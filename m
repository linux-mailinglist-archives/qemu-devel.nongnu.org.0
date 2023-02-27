Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F46A43FB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:15:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeF3-0000WG-Ex; Mon, 27 Feb 2023 09:12:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDC-0007HG-MZ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:47 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDB-000109-25
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:10:42 -0500
Received: by mail-wr1-x430.google.com with SMTP id bv17so6373855wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ep/ieGMZNayE9X06ftc5taHWHa+LemsYZU+KXdgMGEE=;
 b=Ih+a+h8fLWTAN6IN4/2iwsseG5+VzD6WON0t7YEExdFgR+2/4VRfmJr2nGtWb3zOQd
 CgFlwis06U5KyATf/notj7jeGftnoF/+nW02d/w2WxANXRIjAe8RjgfTvkQsTzfWDqka
 O6h+a8cYT7ze0IaVoa+n2h2FzwSihxuwjkM1RBL4evVUvw/uY5MzczwVZC8EqbqM4laC
 xt5lXvYud5LYPfwFjTyZwviBghvQ5oHFH+zLhzhL3dW/9GOPb7IZR5RRra+98epI2Pj3
 pq+7tAfJ9d5M4ZXOzb/kT47SuIHCz+AO5sHHtnPH+cELWowkqqIU2buiUX3A8K9pPP7X
 3rNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ep/ieGMZNayE9X06ftc5taHWHa+LemsYZU+KXdgMGEE=;
 b=KQ9MAyz/vjNg+ueYmtg7f1XP0KmR8IUOFqtRm9Y+K/tRqgGD7f394xMZUC0xvYI26K
 RLQsvv/hGrsL24BqAcah61Acq31J+9mYXV7ftOVpBwS+nH3PEpni9HU1lNxGqDpKHQQM
 iuq+Q9alsSIQI9P4e2TngnA9sPayLiZGS1J5lUvzEAQFD3W2VbMN5xITrq+Lt7f9a3Pm
 Zm78XBAPPpDTMCwj7j8i78Cwdn/er+dQ7Fvocxrxaoq0aWyWx4mRax/ufUHZbnZOdGve
 0SEutJ2n8XL0yyDPMIiChVn5stP2lXSVdg9ldWaPV522cwHBiGmO6xuglzwEbuYRuMlY
 Fupg==
X-Gm-Message-State: AO0yUKV6J7+E+5CL/abmFlnkNqlWpYjpE7C3HAhQMvW5St0ov0mA1C3G
 Ieeh41XWrdPiCkFjK0tdk4Imh5DB1btdpokJ
X-Google-Smtp-Source: AK7set/IkIlLZ+hmLnc+CdoCLAaGH1Y4RoJbwL8t8VnrXIHCtejBZolPvKy0xIxdZInhtJVKl0bnqg==
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id
 a14-20020a5d570e000000b002bfd94029b6mr21816092wrv.54.1677507039186; 
 Mon, 27 Feb 2023 06:10:39 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a05600c224100b003e118684d56sm13065046wmm.45.2023.02.27.06.10.38
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:10:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 102/126] hw/ide/isa: Remove intermediate ISAIDEState::irq
 variable
Date: Mon, 27 Feb 2023 15:01:49 +0100
Message-Id: <20230227140213.35084-93-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

The intermediate ISAIDEState::irq variable just add noise, remove it.

Message-Id: <20230215112712.23110-6-philmd@linaro.org>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/isa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 5c3e83a0fc..ad47e0899e 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -45,7 +45,6 @@ struct ISAIDEState {
     uint32_t  iobase;
     uint32_t  iobase2;
     uint32_t  irqnum;
-    qemu_irq  irq;
 };
 
 static void isa_ide_reset(DeviceState *d)
@@ -73,8 +72,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    s->irq = isa_get_irq(isadev, s->irqnum);
-    ide_init2(&s->bus, s->irq);
+    ide_init2(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
 }
-- 
2.38.1


