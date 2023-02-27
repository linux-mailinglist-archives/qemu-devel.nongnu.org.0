Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1A36A445F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:28:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe8w-0005RJ-I7; Mon, 27 Feb 2023 09:06:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8o-00058W-FQ
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:10 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe8k-0008V9-Tg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:06:08 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso2605890wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3VVgDConF7QXTpND7x8W2tL9LlzCr7EZmnqokR1ktl8=;
 b=mqgyXFUkrpj1zlTVtF6K7P2rTyFI7pJK2JTDaC6WzndlnkmwH2ehNmJ41sILZv87mT
 +mKYFzAOTf9Iv13RlTjMCSpCLz7pdTWqWuK4+EMcfTseTyq46KPs/mPMZFpidOxYtqRm
 SYTry6RZtTBSgLqlZnZmOzV8oVWLVtbYWiCC8+v/C9y29zaWSDVwhoe7xbq9hlZz1V12
 r999NQ2GhbJA2jNfkN9NCeH1sv5q4up8FUn3NhXwb0PLi44mc9EUiPiok6P9PPg3xyMQ
 EeE4GMOXcRW03et0MUz/ZXivEbca3l5xg2Gf+5zCR38HJvQeY7KIu/fn/iVVgJ1A9DTE
 72MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3VVgDConF7QXTpND7x8W2tL9LlzCr7EZmnqokR1ktl8=;
 b=F6rw+V6Lp/gseskcndXGlGlknvGirBNR3PbCfawy3ulSH1Djo+r8Vpw78NHGHaYhjA
 M961uWLFeDnerbAtNTmxiJ1JtD4CcgoQHeofMNma1nGBUNPHnZPltygRk2DRIOlkScsa
 fJO6wTjOM3dfjliZlh2TrEc35R+jFbNUWfzRmKqBzAvqezV3+R6DQonzIZpLEfuL/gui
 izvUzG2TH9kfnSwd54VemvRc2QxkeNFjcuRIj+GuZGJpT0LuvEA8Vw0eK6kNqzRLNKif
 n8BVsFYdpkQpwJSGkDaIeIjoVvV5yjPPW9KMG3/e60n0nNHzC5V0esNtnjO9EPGsAeDE
 aZGA==
X-Gm-Message-State: AO0yUKUujZtPEeVynEUr/+6JNSUckRiXIFQ7YmQ/U5NagBr7GYGEl9N6
 6uutEEnYg00a4FgAI1OqQ+DkB1vxn3QaL6ss
X-Google-Smtp-Source: AK7set+a0zeQqPpa+UPoKUPrTOYiRbfa15erDKXstwXsd+5eg12LH33TPBOuNtMkPWniW3UhBMkTyg==
X-Received: by 2002:a05:600c:160a:b0:3eb:3945:d405 with SMTP id
 m10-20020a05600c160a00b003eb3945d405mr5026509wmn.38.1677506762508; 
 Mon, 27 Feb 2023 06:06:02 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003eb192787bfsm9506783wmq.25.2023.02.27.06.06.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:06:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 051/126] hw: Move ich9.h to southbridge/
Date: Mon, 27 Feb 2023 15:00:58 +0100
Message-Id: <20230227140213.35084-42-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

From: Bernhard Beschow <shentey@gmail.com>

ICH9 is a south bridge which doesn't necessarily depend on x86, so move
it into the southbridge folder, analoguous to PIIX.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230213173033.98762-13-shentey@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS                             | 1 +
 hw/acpi/ich9.c                          | 2 +-
 hw/acpi/ich9_tco.c                      | 2 +-
 hw/i2c/smbus_ich9.c                     | 2 +-
 hw/i386/acpi-build.c                    | 2 +-
 hw/i386/pc_q35.c                        | 2 +-
 hw/isa/lpc_ich9.c                       | 2 +-
 hw/pci-bridge/i82801b11.c               | 2 +-
 include/hw/{i386 => southbridge}/ich9.h | 6 +++---
 tests/qtest/tco-test.c                  | 2 +-
 10 files changed, 12 insertions(+), 11 deletions(-)
 rename include/hw/{i386 => southbridge}/ich9.h (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c7731aeb7..d54e5c4fb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1679,6 +1679,7 @@ F: hw/i2c/smbus_ich9.c
 F: hw/acpi/piix4.c
 F: hw/acpi/ich9*.c
 F: include/hw/acpi/ich9*.h
+F: include/hw/southbridge/ich9.h
 F: include/hw/southbridge/piix.h
 F: hw/isa/apm.c
 F: include/hw/isa/apm.h
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 54bb3d83b3..d23bfcaa6b 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -36,7 +36,7 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9_tco.h"
 
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
 
diff --git a/hw/acpi/ich9_tco.c b/hw/acpi/ich9_tco.c
index fbf97f81f4..1540f4fd46 100644
--- a/hw/acpi/ich9_tco.c
+++ b/hw/acpi/ich9_tco.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "sysemu/watchdog.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "migration/vmstate.h"
 
 #include "hw/acpi/ich9_tco.h"
diff --git a/hw/i2c/smbus_ich9.c b/hw/i2c/smbus_ich9.c
index f0dd3cb147..18d40e93c1 100644
--- a/hw/i2c/smbus_ich9.c
+++ b/hw/i2c/smbus_ich9.c
@@ -27,7 +27,7 @@
 #include "migration/vmstate.h"
 #include "qemu/module.h"
 
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "qom/object.h"
 #include "hw/acpi/acpi_aml_interface.h"
 
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 1bb73c3e9a..d27921fd8f 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -55,10 +55,10 @@
 #include "hw/hyperv/vmbus-bridge.h"
 
 /* Supported chipsets: */
+#include "hw/southbridge/ich9.h"
 #include "hw/southbridge/piix.h"
 #include "hw/acpi/pcihp.h"
 #include "hw/i386/fw_cfg.h"
-#include "hw/i386/ich9.h"
 #include "hw/i386/pc.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/i440fx.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 0afea6705c..09004f3f1f 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -40,7 +40,6 @@
 #include "hw/qdev-properties.h"
 #include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
-#include "hw/i386/ich9.h"
 #include "hw/i386/amd_iommu.h"
 #include "hw/i386/intel_iommu.h"
 #include "hw/display/ramfb.h"
@@ -48,6 +47,7 @@
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci.h"
 #include "hw/intc/ioapic.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/usb.h"
 #include "hw/usb/hcd-uhci.h"
 #include "qapi/error.h"
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index ce946760bb..96fd500502 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -40,7 +40,7 @@
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/i386/pc.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index f3b4a14611..0e83cd11b2 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -45,7 +45,7 @@
 #include "hw/pci/pci_bridge.h"
 #include "migration/vmstate.h"
 #include "qemu/module.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 
 /*****************************************************************************/
 /* ICH9 DMI-to-PCI bridge */
diff --git a/include/hw/i386/ich9.h b/include/hw/southbridge/ich9.h
similarity index 99%
rename from include/hw/i386/ich9.h
rename to include/hw/southbridge/ich9.h
index 3125863049..7004eecbf9 100644
--- a/include/hw/i386/ich9.h
+++ b/include/hw/southbridge/ich9.h
@@ -1,5 +1,5 @@
-#ifndef HW_ICH9_H
-#define HW_ICH9_H
+#ifndef HW_SOUTHBRIDGE_ICH9_H
+#define HW_SOUTHBRIDGE_ICH9_H
 
 #include "hw/isa/apm.h"
 #include "hw/acpi/ich9.h"
@@ -242,4 +242,4 @@ struct ICH9LPCState {
 #define ICH9_LPC_SMI_F_CPU_HOTPLUG_BIT          1
 #define ICH9_LPC_SMI_F_CPU_HOT_UNPLUG_BIT       2
 
-#endif /* HW_ICH9_H */
+#endif /* HW_SOUTHBRIDGE_ICH9_H */
diff --git a/tests/qtest/tco-test.c b/tests/qtest/tco-test.c
index d865e95dfc..0547d41173 100644
--- a/tests/qtest/tco-test.c
+++ b/tests/qtest/tco-test.c
@@ -14,7 +14,7 @@
 #include "libqos/pci-pc.h"
 #include "qapi/qmp/qdict.h"
 #include "hw/pci/pci_regs.h"
-#include "hw/i386/ich9.h"
+#include "hw/southbridge/ich9.h"
 #include "hw/acpi/ich9.h"
 #include "hw/acpi/ich9_tco.h"
 
-- 
2.38.1


