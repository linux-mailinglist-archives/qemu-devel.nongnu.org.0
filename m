Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79BB4CFC31
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:03:31 +0100 (CET)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB9G-0005w6-LG
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:03:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAM5-0003bE-9N
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:41 -0500
Received: from [2a00:1450:4864:20::432] (port=35502
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAM3-0004Kr-FK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 05:12:40 -0500
Received: by mail-wr1-x432.google.com with SMTP id b5so22397265wrr.2
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 02:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5vQfnGNW4YGHzEz5RbgJRcPJf9BCYtMfRnHfC+25hVw=;
 b=F8oXBnjjnpCfG+n5+zCjeaAxHWkZtvovnzyual5KmpHx66kQ3nlexPmDnGJxcZcDxw
 th9R/sUo2uJnBYJDpDkdeJT/qbXmqL8CIdiK/de5fm9LTipJXFGZ7uhcNVG603g36Cmb
 zn0bJn+NI7vWYlb/I1KIkJcx3hPtdQn6VyRmxb03Cqu1qJuU0ijbN2tMZXkbpxgcQ2RJ
 8N0ocewQnEWyyt/vcYWuer9EeIQCn80KO1y989FOtcImEbrFoDTJAjod+TVsN2ujE+l9
 V9TXoqPmrImS1a5+pugEIRDF9V9uNVcG6qdsor+tC7y/xyXidg4kU9P5RwfHZNy6a7lb
 tWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5vQfnGNW4YGHzEz5RbgJRcPJf9BCYtMfRnHfC+25hVw=;
 b=D71fbPHCYdxhtzz5E8AwjPaweORliMkbZpNMKUZMg8z5wrrnvaBmaOEpqnldf+5f2S
 6PZo7oIzeIMs9sSKEQIDDV/C5uu7dH1h8txR43ndaMJhtBQ5tz6uTcyFuwDTCyFzUr+q
 FYlPYwHHCnrIUZt5hUZa+B4FjqKNK5MevsOBmr+EL8hKa/Kw8pUOyn8rDzn+ZRiaWocN
 Th6ngiIbCMAn8+wOB35oaq677k28MyamYY1BSVxTgH8PUgIVKkFdZJzngOc2eCinPnsK
 6K/83CYh0fSCaZvDXwJ4vruxKnKhDltM/Q/5MMpCRb8Z+G7O4kjF4H3ZgHMmKHm+ua+K
 UPpQ==
X-Gm-Message-State: AOAM530lsZnfa/4uDky2IdRpumYC4F/BmMjhHAyf3zu6BnX3aySv1ts0
 9u3syeW2VkxaadlCGmizs8O0hnoZXtY=
X-Google-Smtp-Source: ABdhPJyBgD0ECA1v2J5ho8/9N4m9oY9Mctm3y6xLW4mb3lKRy6ZpVb9mP3CbuCgTMJrpP/U1zp7Uzw==
X-Received: by 2002:adf:e751:0:b0:1f0:2139:2489 with SMTP id
 c17-20020adfe751000000b001f021392489mr7504817wrn.319.1646647958005; 
 Mon, 07 Mar 2022 02:12:38 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m13-20020a05600c4f4d00b00386744cb31bsm14868336wmq.35.2022.03.07.02.12.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 02:12:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/16] hw/isa/piix4: Pass PIIX4State as opaque parameter for
 piix4_set_irq()
Date: Mon,  7 Mar 2022 11:11:57 +0100
Message-Id: <20220307101207.90369-7-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
References: <20220307101207.90369-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

Passing PIIX4State rather than just the qemu_irq allows for resolving
the global piix4_dev variable.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220217101924.15347-5-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 179968b18e..caa2002e2c 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -57,7 +57,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
-    qemu_irq *pic = opaque;
+    PIIX4State *s = opaque;
     PCIBus *bus = pci_get_bus(piix4_dev);
 
     /* now we change the pic irq level according to the piix irq mappings */
@@ -71,7 +71,7 @@ static void piix4_set_irq(void *opaque, int irq_num, int level)
                 pic_level |= pci_bus_get_irq_level(bus, i);
             }
         }
-        qemu_set_irq(pic[pic_irq], pic_level);
+        qemu_set_irq(s->isa[pic_irq], pic_level);
     }
 }
 
@@ -319,7 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
 
     return dev;
 }
-- 
2.34.1


