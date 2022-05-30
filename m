Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964775379F8
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:35:21 +0200 (CEST)
Received: from localhost ([::1]:47360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdg8-0003ZS-Gp
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdYt-00006y-Le
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:55 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:43780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdYg-0001KN-MI
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:27:51 -0400
Received: by mail-pl1-x632.google.com with SMTP id b5so10049442plx.10
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4s3AwNuRr6rszDvvIyp9DCkPdUSckHh0rwFtRF3kLVg=;
 b=MyverThzPUgDt29aKnzMJ8Gq/UKB3OfFKLgzIRn00IjpK5II/ujLMNeWl7CLiGqN+T
 NHtfMR4vMH2boDjaOOOYudMfqX26I/XEZJU16MER1DSPIh1TkKGAzTjpqh4y8m+Lwq1+
 o9h+4jrawdFePMI9n7XLjNjAsIGVo4oOrxdYHL426WEwHiR8StrYwjx6J2B0K7/V9mVi
 iXeu4qats729MrBRjZZrsPMDNur+v5i16RhTIwlggf/2HxqDlPKavqZXmBJeMvvg9c49
 zEN8H2K9ZCpq24vc/9SZo3zxQ4O+JkLblMWmc4iv53vVxo1pvQ5bLviR93v8enYRnxfT
 Qz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4s3AwNuRr6rszDvvIyp9DCkPdUSckHh0rwFtRF3kLVg=;
 b=ESxrzJtgszjwCUGeMYxUw04LtOsjehp2WGmj7StNCNhqDkiRb2uYJACXpYDezBOsWc
 Pjf8ebNGAc2o6qbfnrbWBJjAtb4u4YPHXBP5t6AA+0dpS9iZ/j8ZuoLkU289n3nUgj+k
 gP6vqFXIodrhyR2KBxPzhkaSJ419jESUyq19vxvYKnOp6S5r1WmapBe1NEMws1Kj9M/2
 S1h/BNae2tyrfGNNfHDwWn3h3d7UP8ggWBisgxxspsa0D+xt7j4a8h2TUboeWh98rAjJ
 uPId7WXUjMTk9ksCmKoIhAfdC2vK8OAG7X6BsLBWmyM0wfR94MiqaVsU/KsUJsDUj1+t
 ckuA==
X-Gm-Message-State: AOAM533ntPutPRDm3bHlxt0W70ZLTad/WvB2rVVeWac609EMYx30NjEy
 BCPkQHnqdWQ24UZ0SRrgNDk=
X-Google-Smtp-Source: ABdhPJxaUYJxb0xd/snoKDj34DHYyJqTuk9JMBzP9c4EHRSAo9ZT+YakFC0T3DxfiPjRN1nidjsjvA==
X-Received: by 2002:a17:90b:4ac9:b0:1e3:1dca:d995 with SMTP id
 mh9-20020a17090b4ac900b001e31dcad995mr1354585pjb.111.1653910056694; 
 Mon, 30 May 2022 04:27:36 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa7941a000000b0050dc7628158sm8647896pfo.50.2022.05.30.04.27.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 30 May 2022 04:27:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 01/11] hw/acpi/piix4: move xen_enabled() logic from
 piix4_pm_init() to piix4_pm_realize()
Date: Mon, 30 May 2022 13:27:08 +0200
Message-Id: <20220530112718.26582-2-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
References: <20220530112718.26582-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This logic can be included as part of piix4_pm_realize() and does not need to
be handled externally.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20220528091934.15520-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/acpi/piix4.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index fe5625d07a..bf20fa139b 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -525,6 +525,10 @@ static void piix4_pm_realize(PCIDevice *dev, Error **errp)
     s->machine_ready.notify = piix4_pm_machine_ready;
     qemu_add_machine_init_done_notifier(&s->machine_ready);
 
+    if (xen_enabled()) {
+        s->use_acpi_hotplug_bridge = false;
+    }
+
     piix4_acpi_system_hot_add_init(pci_address_space_io(dev),
                                    pci_get_bus(dev), s);
     qbus_set_hotplug_handler(BUS(pci_get_bus(dev)), OBJECT(s));
@@ -551,9 +555,6 @@ I2CBus *piix4_pm_init(PCIBus *bus, int devfn, uint32_t smb_io_base,
     s->irq = sci_irq;
     s->smi_irq = smi_irq;
     s->smm_enabled = smm_enabled;
-    if (xen_enabled()) {
-        s->use_acpi_hotplug_bridge = false;
-    }
 
     pci_realize_and_unref(pci_dev, bus, &error_fatal);
 
-- 
2.36.1


