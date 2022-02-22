Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 492E54C00B7
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:58:34 +0100 (CET)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZQn-0003BW-Cq
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:58:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7j-0004Hj-5X
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:51 -0500
Received: from [2a00:1450:4864:20::532] (port=40918
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nMZ7h-0002sG-A9
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 12:38:50 -0500
Received: by mail-ed1-x532.google.com with SMTP id h15so21730103edv.7
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 09:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0PkugM/nmdz5ZSPWNwtFAXt+z4ki/4C47OuH3ieIYfs=;
 b=FyX/NSXb7OgA4e9NHpjG/9z0neWBqkzoInDMZDCt13mZYjqjwlK/wQwfsM5w7dOYKb
 5VOkbowWizl6f1sJtYXTcaW92PlK5lGfNKKPtJ30cjZ4GLaqnCxmngwIjKnxd5nd6a4f
 MQXsJ9Gd/SFafKzZo2HP/4YNCC8nUwdop4wNqJ2djkP9W7Yof3RlrZXYoGgg6DrJSvlf
 JaKyQNdMSRV6Y2cx7adwUkYnw1zIMQzprEV5jGC5v//qtj+M5XkkdPHRtqsQd/0rfvFn
 EdI0zbL9nHIDrtkUJ0voTWNdOl+rI/fXweuTDNf502LA+BzTkt9yvhzoesuhoZJ2na7d
 H0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0PkugM/nmdz5ZSPWNwtFAXt+z4ki/4C47OuH3ieIYfs=;
 b=tKfJCuJKoISpR3g23mSbh90IBY2erPzqMa4k6cZVWQMwxj0fyFtcDndf+ato5xn6YZ
 wYxBo+v7EgOBSfhS+Hp5iVpz9kUBm57+VwAApNFngbektJeSXJ806QDS1RMZjxkRpoux
 n7wQS1tLlr/iVmgBZ2s+4NHx1EzNO0FCV523dEkXw1Gn6aeU9OrUvHdy7ZV1lxGLh8dl
 IB2qTVNghiQe5x8MP0sQMHc7q7dLLrqmYBLlzuDxi7Xy+i4AFnQDC1vCA5kE8lHE4Wxp
 I6jjPiLkQaARa30Yi6T+HoUqNOQhi/S9aLLW7debmxWybzPuncc85VBNhVG4UUkjN4MH
 0c6A==
X-Gm-Message-State: AOAM532B6/gikEmKy4aZEZ972vXwOwcUF68saEzDjWwXEQWpbAD5FNZi
 yosTyRct1YXPf0jsMcQVeNZbd/nLoV4=
X-Google-Smtp-Source: ABdhPJySzGxA1lyI95ZT7CMP7nA95Eo06WL91c0B71j9U8At+WaO0bKGnAAiCPN+mXhOcfZ3eOd6+w==
X-Received: by 2002:aa7:ce08:0:b0:410:a996:d6a5 with SMTP id
 d8-20020aa7ce08000000b00410a996d6a5mr26547341edv.303.1645551527962; 
 Tue, 22 Feb 2022 09:38:47 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-089-012-227-088.89.12.pool.telefonica.de. [89.12.227.88])
 by smtp.gmail.com with ESMTPSA id et2sm6449382ejc.101.2022.02.22.09.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 09:38:47 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 22/22] isa: Remove unused isa_init_irq()
Date: Tue, 22 Feb 2022 18:38:19 +0100
Message-Id: <20220222173819.76568-23-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222173819.76568-1-shentey@gmail.com>
References: <20220222173819.76568-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_init_irq() had become a trivial one-line wrapper for isa_get_irq().
The previous commits resolved all usages in favor of isa_get_irq().
isa_init_irq() can therefore be removed.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/isa-bus.c     | 5 -----
 include/hw/isa/isa.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 1e8c102177..0ad1c5fd65 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -85,11 +85,6 @@ qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq)
     return isabus->irqs[isairq];
 }
 
-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq)
-{
-    *p = isa_get_irq(dev, isairq);
-}
-
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq)
 {
     qemu_irq irq = isa_get_irq(isadev, isairq);
diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index d80cab5b79..034d706ba1 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -90,7 +90,6 @@ ISABus *isa_bus_new(DeviceState *dev, MemoryRegion *address_space,
                     MemoryRegion *address_space_io, Error **errp);
 void isa_bus_irqs(ISABus *bus, qemu_irq *irqs);
 qemu_irq isa_get_irq(ISADevice *dev, unsigned isairq);
-void isa_init_irq(ISADevice *dev, qemu_irq *p, unsigned isairq);
 void isa_connect_gpio_out(ISADevice *isadev, int gpioirq, unsigned isairq);
 void isa_bus_dma(ISABus *bus, IsaDma *dma8, IsaDma *dma16);
 IsaDma *isa_get_dma(ISABus *bus, int nchan);
-- 
2.35.1


