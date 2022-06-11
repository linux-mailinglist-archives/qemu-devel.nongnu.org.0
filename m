Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 565FC5473FD
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 12:55:12 +0200 (CEST)
Received: from localhost ([::1]:50032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzylr-0007LA-48
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 06:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySp-00059H-K5
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:31 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySo-0006dE-3V
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:31 -0400
Received: by mail-wr1-x435.google.com with SMTP id h5so1539023wrb.0
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vxDpqHE64xiU7PBULWpDhZ2W7hpLNLw7sgQpjiAuru0=;
 b=jMN5kWIAJ4gFXemJhoGelZmZqdmTNwygKdGel9OSO/UyvY2V3UFlPIxs48LRid6r49
 KyBtJj7b46W2CyuT6BhJTaJCqZ0aMhhU86PSZdvlRKeJ9OAWQ1CAeTFRp2wnnNdTRbTX
 uig3eEhAbyrLaPKCHM+kPf+qkKLparcUbJ9ta3RTDvBaPKdVIEK5nY9EWxKMdKg85H4g
 6S6IrOS5HZsx2vlWVPWUp3nGUh3aU/Q10zCkx0Bh/sgzo/RDkq7QxLrWaLcAHOGAZMLK
 UO1kdgX7ylaKWbUSA1IUx3IuPWQakBhcnHABf0BH6jdEK3TwviGo1p70AWfB5p7Cgqbv
 4F2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vxDpqHE64xiU7PBULWpDhZ2W7hpLNLw7sgQpjiAuru0=;
 b=qd3QTssPS7lM0Qn5hQ6nipORwdJqhPXZdRzvdfKeQZYGZMEuSqjYqDk686g71oofM7
 c/UsZxbXSLzWpNtQ9EYsEN+I6MeAay8LbxLX20OnC3jhJFgFINPMGG37ZYE6XacF8tb1
 IAlNvQonPO2PyQ940ITfExqZoOlu3reeNoZo6LGz2A3qIKKUMUYqmzHuhoWfGOMsmWgy
 byBHSzstgo14uKgirlPIYOvAlFUCLL+AJaC6aEzhdDi2PxDQZJjONH68KrCXF/WqXuL3
 joxzJfxqIK4KyjUuB3AIaYBuDTAtdOrEkrDc6qYOudzYy+6y7HxQTUJxc0cCqOtWpQRw
 aeNA==
X-Gm-Message-State: AOAM5300LzrCcQJhlDDOOE8OxpdF4Ka0/oPTuUKRtV71IJ9C3vypJ1HA
 EAWK9U702L1fJl3l1f2J7RULcie+9Uo=
X-Google-Smtp-Source: ABdhPJxpy/wNfISiQxqZZvIk4hjpYDrc27zf6gDfhtZzA5ROD1fhY/zq01B5agnuHYkSdLdXLfotKA==
X-Received: by 2002:a5d:47a7:0:b0:218:5a5d:6c55 with SMTP id
 7-20020a5d47a7000000b002185a5d6c55mr19925010wrb.192.1654943728648; 
 Sat, 11 Jun 2022 03:35:28 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 az21-20020a05600c601500b0039c871d3191sm1103006wmb.3.2022.06.11.03.35.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PULL 26/49] hw/acpi/piix4: remove unused piix4_pm_initfn() function
Date: Sat, 11 Jun 2022 12:32:49 +0200
Message-Id: <20220611103312.67773-27-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

This function is now unused and so can be completely removed.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-13-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c               | 19 -------------------
 include/hw/southbridge/piix.h |  4 ----
 2 files changed, 23 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 32033bc9d7..0a81f1ad93 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -505,25 +505,6 @@ static void piix4_pm_init(Object *obj)
     qdev_init_gpio_out_named(DEVICE(obj), &s->smi_irq, "smi-irq", 1);
 }
 
-PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              bool smm_enabled)
-{
-    PCIDevice *pci_dev;
-    DeviceState *dev;
-    PIIX4PMState *s;
-
-    pci_dev = pci_new(devfn, TYPE_PIIX4_PM);
-    dev = DEVICE(pci_dev);
-    qdev_prop_set_uint32(dev, "smb_io_base", smb_io_base);
-    qdev_prop_set_bit(dev, "smm-enabled", smm_enabled);
-
-    s = PIIX4_PM(dev);
-
-    pci_realize_and_unref(pci_dev, bus, &error_fatal);
-
-    return s;
-}
-
 static uint64_t gpe_readb(void *opaque, hwaddr addr, unsigned width)
 {
     PIIX4PMState *s = opaque;
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index b69e0dfb04..976b4da582 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -14,10 +14,6 @@
 
 #include "hw/pci/pci.h"
 #include "qom/object.h"
-#include "hw/acpi/piix4.h"
-
-PIIX4PMState *piix4_pm_initfn(PCIBus *bus, int devfn, uint32_t smb_io_base,
-                              bool smm_enabled);
 
 /* PIRQRC[A:D]: PIRQx Route Control Registers */
 #define PIIX_PIRQCA 0x60
-- 
2.36.1


