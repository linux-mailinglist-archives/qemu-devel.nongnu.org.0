Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8364254742E
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 13:19:49 +0200 (CEST)
Received: from localhost ([::1]:41710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzz9g-0005wU-Jr
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 07:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySk-0004tv-3l
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:26 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzySg-0006WG-KC
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 06:35:24 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 m32-20020a05600c3b2000b0039756bb41f2so763728wms.3
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 03:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ubn8eHKOsbB27CggmjSzSBpH+DzKEWOoBQO+Gv9mZ/g=;
 b=Vjuj+MhiMeZ35ZdK9/F+yI8A7v02KLtCohopl53LttvYdtvLcJnNTQw0ubmhAgUviU
 2P272dW1prlCYM8lFjshUalH3SKI0KjpoF/udyKtfPtGpjb+gwTPD6pUNvR5kICnpo88
 OK8UOXUGdSQ0Kd/S+IPpS7j4wtScIG6QYw1x9p6Qz8E0UQ4JtmNQE+rmXfewnW36uwa6
 4ofyR1k/PtFm66aYbThxYaUZxXS0BMsD64lTYMfoePwDN6YWstuExVCJvODaKcQI01xz
 rGWsdods2QJVXZyRCIAmywES81rMMVUKE2G+yFGdliJdTf3zgkBZ04gyD3Vka2KfZ7sk
 QlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ubn8eHKOsbB27CggmjSzSBpH+DzKEWOoBQO+Gv9mZ/g=;
 b=qMGtqHsmD6ekUgC7jfSVfr3AP0GQByyJDGMBunUIOHsv3pxsuE95MuhHG0+iXfGbDe
 xr7eX6t/uMAaRANUAEqyFBZNhsYU514Jetx6q5GIj01705p906aPyJ1JB1S4vFew5/+9
 JMPUI4nylgWU8ojCWg7C5uTtmDVh+Lm9v/FBFSHxnPxEqJCbYCVZalzhwGhkVDWMOFBd
 d05cingUHjJDLdDSFzkw+OTmW7K9P/x1dDBr+Zm5Q4zO4poNH7v4hMtw5+qe22kyqLCe
 uSlNlpPnzli2vKkFD0CDI+yxJfk5SGkVuxdWKylQCtksU0O2eUMn1zBL+tzsuur2nn9D
 H7HA==
X-Gm-Message-State: AOAM532TWzJ387Blflp9JQI+8vLKWybWH4j9sgwPH1FGM8hx2u7IuU6x
 lgPEw8MdoKNxhkVoJUWoG4+/Qwhm8qE=
X-Google-Smtp-Source: ABdhPJx4CuFyleKovbKl9l8eKUSlWU7Lp81r1vqFGIZac74mRQE+75IPNJNFG036vOSmDOS3xZsN2Q==
X-Received: by 2002:a05:600c:6003:b0:39c:50ef:eff with SMTP id
 az3-20020a05600c600300b0039c50ef0effmr4156756wmb.122.1654943718509; 
 Sat, 11 Jun 2022 03:35:18 -0700 (PDT)
Received: from localhost.localdomain (124.net-94.228.4.isbl.embou.net.
 [94.228.4.124]) by smtp.gmail.com with ESMTPSA id
 u9-20020a7bc049000000b00397243d3dbcsm1962668wmc.31.2022.06.11.03.35.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 Jun 2022 03:35:18 -0700 (PDT)
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
Subject: [PULL 24/49] hw/i386/pc_piix: create PIIX4_PM device directly instead
 of using piix4_pm_initfn()
Date: Sat, 11 Jun 2022 12:32:47 +0200
Message-Id: <20220611103312.67773-25-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
References: <20220611103312.67773-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Now that all external logic has been removed from piix4_pm_initfn() the PIIX4_PM
device can be instantiated directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220528091934.15520-11-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/pc_piix.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 89c4f07c9f..7d5546600b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -47,6 +47,7 @@
 #include "hw/xen/xen-x86.h"
 #include "exec/memory.h"
 #include "hw/acpi/acpi.h"
+#include "hw/acpi/piix4.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "sysemu/xen.h"
@@ -280,11 +281,15 @@ static void pc_init1(MachineState *machine,
     }
 
     if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
-        PIIX4PMState *piix4_pm;
+        PCIDevice *piix4_pm;
 
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
-        piix4_pm = piix4_pm_initfn(pci_bus, piix3_devfn + 3, 0xb100,
-                                   x86_machine_is_smm_enabled(x86ms));
+        piix4_pm = pci_new(piix3_devfn + 3, TYPE_PIIX4_PM);
+        qdev_prop_set_uint32(DEVICE(piix4_pm), "smb_io_base", 0xb100);
+        qdev_prop_set_bit(DEVICE(piix4_pm), "smm-enabled",
+                          x86_machine_is_smm_enabled(x86ms));
+        pci_realize_and_unref(piix4_pm, pci_bus, &error_fatal);
+
         qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
-- 
2.36.1


