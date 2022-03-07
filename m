Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3844D0084
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 14:55:49 +0100 (CET)
Received: from localhost ([::1]:33996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRDq1-0000oY-1u
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 08:55:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDf1-0004P1-Va
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:27 -0500
Received: from [2607:f8b0:4864:20::62f] (port=36597
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRDf0-0006tU-GM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 08:44:27 -0500
Received: by mail-pl1-x62f.google.com with SMTP id e13so13805028plh.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 05:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDE9Vz75Ls7oUn4Wdl9zyEDREjfA3a6GoIfStHrEoHA=;
 b=owd3kuDjidw9ALQYwFpBGLricOWZOzQ3s3tVth/KSY5ROrId2iMZNKRb/Big09i9AA
 mMjcJ/AMasXwK9+cwDkIM8nwkunldWp4ZvfNYbMhyhKc1RXStRtNwn6xmX2+hxFMAXD4
 yR3+ymliJlj0qNCjlibOxhBjuRLkteUybn0K7Iy1AdLlZAjUCoHk8eLRUmavu3eHePTn
 7tKDWjBTyBMkf779YbIA9Ye9MzTRf1omAPW4Z4wb0PVAKirFyKiTH65835QbBqxhpOUp
 c8iuxCdV4aZuMIBreJIez1FlbUovXwYVrLvi6nqnuhi9DJGm99WixM4g4r5laOie75V/
 0trA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDE9Vz75Ls7oUn4Wdl9zyEDREjfA3a6GoIfStHrEoHA=;
 b=uLVb2gyEwhQ8VOVFa65goUTyCdjSZzwQ4GbUfFmevNoQ7QzACWwkTtjT7zw7D6HiPh
 PXVVF7A7It8rMMLPZ/QaFMlZrxYsQIMV71L5F3sKsafxlHNWkoagZNgaRRJj7rP5OsYq
 yO9PfTRDbIJwHxyNpS6oVSRZbS7rv5UZYzKvyGtjl8D9Hg1sDglguQkiFH7t39dwBPM7
 UuwBNfG/0nS/g6VplvCQykAKo1ZgDaZVvPhtVkpxRMchf8PseLRVQbXMaAzYyvvveuO9
 4+t4DD7e1aQatgSbcAcfBeSaimJzRH6DaQ4+2+URpvQifoHQ/tv8gjE+NUpCh/g0PVEX
 4pew==
X-Gm-Message-State: AOAM530ykwLIwORC6BjzSvJVB1i3+PiWOgS126TjLs9W6xPMjrR1u4ct
 rMP4ZzAMiDcK1J7ktCbCqqE=
X-Google-Smtp-Source: ABdhPJxfK8f0m2A/nY+O2DBuy0BtlLVS6wuNsu37k+tzFhKvF2dfAFzdnqH6RSZS1gDYDDyKbJxItg==
X-Received: by 2002:a17:903:2442:b0:151:e3e2:cbf9 with SMTP id
 l2-20020a170903244200b00151e3e2cbf9mr6420902pls.115.1646660665278; 
 Mon, 07 Mar 2022 05:44:25 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p128-20020a622986000000b004e1366dd88esm15362900pfp.160.2022.03.07.05.44.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Mar 2022 05:44:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Bernhard Beschow <shentey@gmail.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 03/13] hw/isa/piix4: Resolve redundant i8259[] attribute
Date: Mon,  7 Mar 2022 14:43:43 +0100
Message-Id: <20220307134353.1950-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bernhard Beschow <shentey@gmail.com>

This is a follow-up on patch "malta: Move PCI interrupt handling from
gt64xxx_pci to piix4" where i8259[] was moved from MaltaState to
PIIX4State to make the code movement more obvious. However, i8259[]
seems redundant to *isa, so remove it.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220217101924.15347-4-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 196b56e69c..179968b18e 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -45,7 +45,6 @@ struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
-    qemu_irq i8259[ISA_NUM_IRQS];
 
     RTCState rtc;
     /* Reset Control Register */
@@ -320,11 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->i8259, 4);
-
-    for (int i = 0; i < ISA_NUM_IRQS; i++) {
-        s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
-    }
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s->isa, 4);
 
     return dev;
 }
-- 
2.34.1


