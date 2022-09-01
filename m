Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E631B5A9DC9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 19:09:45 +0200 (CEST)
Received: from localhost ([::1]:58758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnhJ-0002UN-5V
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 13:09:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2P-0002Nd-LZ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:30 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:47069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn2C-0001Wt-BY
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:27 -0400
Received: by mail-ed1-x534.google.com with SMTP id s11so23250080edd.13
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=uB/A2AcNgLaibHCVY7qxQ6GQG2qlNpyMMr8R/rV08D4=;
 b=Gl5fWumj589GH+l+zGnEMGVYegRiS5LQ6QX15Mrxkn28TaGXiqRtyIyINZ7AJjJbpi
 mufmVgtJKpqM8mLjaSto7b+CgGQojHZD7CjkPo8TOzLaUS1ktGQN1CmGOj5vlN5aolNi
 fSGe5zlOor0E9aXHJc8PCC81nGz2YFtrXHHzWeLYyOb+mbBYBhzl0GavZ35VXAOb+eUI
 yxedSU0U0cqA1+2c3aMw3ao778YLAMN29bV3q+9cjk9jOSOFi66B21hEQz1apufNvGqH
 oxJRmzfL4QgGG4DzveCtWMGIwQjm1Rz9sCBkFsEJkP/D+woT7+9mw88hshPg/wyAaELE
 ZcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=uB/A2AcNgLaibHCVY7qxQ6GQG2qlNpyMMr8R/rV08D4=;
 b=Cu5JZnpKxuLTo+hLqPcC/mEuJiz/gjga//iyChuMTJFpImrPiSudv3/hpFLs39NYoh
 s8gcmr1G1BDWSiykbre7vj8dzvbdw5n5qJ7R4RhprcFs+7Na7hHOpKk0kKq8CNrgNHB2
 FHc/JxV1BwaaCoV6BHZQyBYjV0/VE5lUjEE3ddH3FD/jAVDzfl3wBFXmk3omeRntn1FX
 IFjByBRa83I0xaRFyiGW3Rls7jSAF7r42iDBnikd6R9ueQ8sjxPGIupUVn48nRH22Txj
 CNtRIbpEkSOPCj6WssCjSawJiSZyDMDNlhY1F6AO/Ch+7H5UEWO3rDOxR9miRNTTkTRR
 kg7A==
X-Gm-Message-State: ACgBeo2FA53+CDzq92iKvo8YgpX65sRQmRr4eAwhsD12GkvFm9yZiybP
 cLaDLjIie/SuAgSb9vH+RQnHv5s/rOg=
X-Google-Smtp-Source: AA6agR6WO6gEz/UjHHtyzKqxHxFlCyznVEGcpz91IHnRBYFgUfgD7IR/lkyZgdUM97dgF/4MIZ4Ufw==
X-Received: by 2002:aa7:d78b:0:b0:447:d501:14c8 with SMTP id
 s11-20020aa7d78b000000b00447d50114c8mr25198384edq.82.1662049631439; 
 Thu, 01 Sep 2022 09:27:11 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:27:11 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 25/42] hw/isa/piix4: Move pci_ide_create_devs() call to board
 code
Date: Thu,  1 Sep 2022 18:25:56 +0200
Message-Id: <20220901162613.6939-26-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x534.google.com
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

For the VIA south bridges there was a comment to have the call in board code.
Move it there for PIIX4 as well for consistency.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/piix4.c  |  1 -
 hw/mips/malta.c | 10 ++++++----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 9e2f7b9b71..67881e3a75 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -256,7 +256,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
         return;
     }
-    pci_ide_create_devs(PCI_DEVICE(&s->ide));
 
     /* USB */
     qdev_prop_set_int32(DEVICE(&s->uhci), "addr", dev->devfn + 2);
diff --git a/hw/mips/malta.c b/hw/mips/malta.c
index 0ec2ac2eaf..a4b866a2cf 100644
--- a/hw/mips/malta.c
+++ b/hw/mips/malta.c
@@ -39,7 +39,7 @@
 #include "hw/pci/pci.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
-#include "hw/ide.h"
+#include "hw/ide/pci.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "elf.h"
@@ -1402,11 +1402,13 @@ void mips_malta_init(MachineState *machine)
     /* Southbridge */
     piix4 = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(10, 0), true,
                                             TYPE_PIIX4_PCI_DEVICE);
-    dev = DEVICE(piix4);
-    isa_bus = ISA_BUS(qdev_get_child_bus(dev, "isa.0"));
+    isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix4), "isa.0"));
+
+    dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "ide"));
+    pci_ide_create_devs(PCI_DEVICE(dev));
 
     /* Interrupt controller */
-    qdev_connect_gpio_out_named(dev, "intr", 0, i8259_irq);
+    qdev_connect_gpio_out_named(DEVICE(piix4), "intr", 0, i8259_irq);
 
     /* generate SPD EEPROM data */
     dev = DEVICE(object_resolve_path_component(OBJECT(piix4), "pm"));
-- 
2.37.3


