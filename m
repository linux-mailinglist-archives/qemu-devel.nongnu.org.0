Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA72B364C
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Nov 2020 17:39:01 +0100 (CET)
Received: from localhost ([::1]:37600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keL3M-0004cm-QD
	for lists+qemu-devel@lfdr.de; Sun, 15 Nov 2020 11:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKri-0004vv-KO
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1keKrd-0005wi-Kc
 for qemu-devel@nongnu.org; Sun, 15 Nov 2020 11:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605457612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H/73divyY9sGI6kLCz7BedbuTJC3JyvIEaeibfFxigc=;
 b=LTmwjmuWkpxlupm6PwdCfsfEz1im5wwbh2Fl1zF1DUVhQ99jpNZzSM7g3Kl6AbuZv7vNoZ
 82HkJmjCjn8WnpYcmwpt8zgjSBtvNTSZ8MNi53fUu10Qw8gT9+dbL0jbAMzfX44wC2Iohc
 A97HDDMLLrAVadQpFZxwzU9f14nZbak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-ZPA6q2ULNhGq_upnwHb0kg-1; Sun, 15 Nov 2020 11:26:50 -0500
X-MC-Unique: ZPA6q2ULNhGq_upnwHb0kg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FFFB85C731;
 Sun, 15 Nov 2020 16:26:49 +0000 (UTC)
Received: from thuth.com (ovpn-112-23.ams2.redhat.com [10.36.112.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 521835B4BE;
 Sun, 15 Nov 2020 16:26:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] nomaintainer: Fix Lesser GPL version number
Date: Sun, 15 Nov 2020 17:26:13 +0100
Message-Id: <20201115162613.74645-27-thuth@redhat.com>
In-Reply-To: <20201115162613.74645-1-thuth@redhat.com>
References: <20201115162613.74645-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 08:01:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Chetan Pant <chetan4windows@gmail.com>

There is no "version 2" of the "Lesser" General Public License.
It is either "GPL version 2.0" or "Lesser GPL version 2.1".
This patch replaces all occurrences of "Lesser GPL version 2" with
"Lesser GPL version 2.1" in comment section.

This patch contains all the files, whose maintainer I could not get
from ‘get_maintainer.pl’ script.

Signed-off-by: Chetan Pant <chetan4windows@gmail.com>
Message-Id: <20201023124424.20177-1-chetan4windows@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
[thuth: Adapted exec.c and qdev-monitor.c to new location]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 block/crypto.c                        | 2 +-
 block/crypto.h                        | 2 +-
 disas/lm32.c                          | 2 +-
 exec-vary.c                           | 2 +-
 hw/acpi/core.c                        | 2 +-
 hw/acpi/hmat.c                        | 2 +-
 hw/acpi/hmat.h                        | 2 +-
 hw/acpi/ich9.c                        | 2 +-
 hw/acpi/pcihp.c                       | 2 +-
 hw/acpi/piix4.c                       | 2 +-
 hw/audio/milkymist-ac97.c             | 2 +-
 hw/char/lm32_juart.c                  | 2 +-
 hw/char/lm32_uart.c                   | 2 +-
 hw/char/milkymist-uart.c              | 2 +-
 hw/core/bus.c                         | 2 +-
 hw/core/platform-bus.c                | 2 +-
 hw/core/qdev.c                        | 2 +-
 hw/core/sysbus.c                      | 2 +-
 hw/display/bcm2835_fb.c               | 2 +-
 hw/display/milkymist-tmu2.c           | 2 +-
 hw/display/milkymist-vgafb.c          | 2 +-
 hw/display/milkymist-vgafb_template.h | 2 +-
 hw/gpio/mpc8xxx.c                     | 2 +-
 hw/i2c/pm_smbus.c                     | 2 +-
 hw/ide/ahci.c                         | 2 +-
 hw/ide/ahci_internal.h                | 2 +-
 hw/ide/ich.c                          | 2 +-
 hw/ide/qdev.c                         | 2 +-
 hw/input/milkymist-softusb.c          | 2 +-
 hw/intc/apic.c                        | 2 +-
 hw/intc/apic_common.c                 | 2 +-
 hw/intc/ioapic.c                      | 2 +-
 hw/intc/ioapic_common.c               | 2 +-
 hw/intc/lm32_pic.c                    | 2 +-
 hw/isa/apm.c                          | 2 +-
 hw/isa/isa-bus.c                      | 2 +-
 hw/lm32/lm32_boards.c                 | 2 +-
 hw/lm32/lm32_hwsetup.h                | 2 +-
 hw/lm32/milkymist.c                   | 2 +-
 hw/mem/nvdimm.c                       | 2 +-
 hw/mem/pc-dimm.c                      | 2 +-
 hw/misc/applesmc.c                    | 2 +-
 hw/misc/milkymist-hpdmc.c             | 2 +-
 hw/misc/milkymist-pfpu.c              | 2 +-
 hw/net/e1000.c                        | 2 +-
 hw/net/milkymist-minimac2.c           | 2 +-
 hw/pci-bridge/i82801b11.c             | 2 +-
 hw/pci-host/designware.c              | 2 +-
 hw/ppc/spapr_iommu.c                  | 2 +-
 hw/ppc/spapr_vio.c                    | 2 +-
 hw/scsi/megasas.c                     | 2 +-
 hw/scsi/mptconfig.c                   | 2 +-
 hw/scsi/mptendian.c                   | 2 +-
 hw/scsi/mptsas.c                      | 2 +-
 hw/sd/milkymist-memcard.c             | 2 +-
 hw/timer/hpet.c                       | 2 +-
 hw/timer/lm32_timer.c                 | 2 +-
 hw/timer/milkymist-sysctl.c           | 2 +-
 hw/xen/xen_pvdev.c                    | 2 +-
 include/exec/ioport.h                 | 2 +-
 include/exec/memory_ldst.h.inc        | 2 +-
 include/exec/memory_ldst_cached.h.inc | 2 +-
 include/exec/memory_ldst_phys.h.inc   | 2 +-
 include/exec/tb-context.h             | 2 +-
 include/exec/user/thunk.h             | 2 +-
 include/hw/acpi/acpi.h                | 2 +-
 include/hw/acpi/ich9.h                | 2 +-
 include/hw/acpi/pcihp.h               | 2 +-
 include/hw/display/milkymist_tmu2.h   | 2 +-
 include/hw/i386/apic_internal.h       | 2 +-
 include/hw/i386/ioapic.h              | 2 +-
 include/hw/i386/ioapic_internal.h     | 2 +-
 include/hw/ide/ahci.h                 | 2 +-
 include/hw/loader-fit.h               | 2 +-
 include/hw/pci-host/designware.h      | 2 +-
 include/hw/pci-host/spapr.h           | 2 +-
 include/hw/platform-bus.h             | 2 +-
 include/hw/ppc/spapr_vio.h            | 2 +-
 include/qemu/base64.h                 | 2 +-
 include/qemu/buffer.h                 | 2 +-
 include/qemu/filemonitor.h            | 2 +-
 memory_ldst.c.inc                     | 2 +-
 scripts/analyze-migration.py          | 2 +-
 scripts/replay-dump.py                | 2 +-
 softmmu/physmem.c                     | 2 +-
 softmmu/qdev-monitor.c                | 2 +-
 target/lm32/cpu.h                     | 2 +-
 target/lm32/gdbstub.c                 | 2 +-
 target/lm32/helper.c                  | 2 +-
 target/lm32/translate.c               | 2 +-
 target/tilegx/cpu.h                   | 2 +-
 ui/x_keymap.c                         | 2 +-
 util/base64.c                         | 2 +-
 util/buffer.c                         | 2 +-
 util/filemonitor-inotify.c            | 2 +-
 util/filemonitor-stub.c               | 2 +-
 util/log.c                            | 2 +-
 97 files changed, 97 insertions(+), 97 deletions(-)

diff --git a/block/crypto.c b/block/crypto.c
index 0807557763..aef5a5721a 100644
--- a/block/crypto.c
+++ b/block/crypto.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/block/crypto.h b/block/crypto.h
index c72c3dec61..72e792c9af 100644
--- a/block/crypto.h
+++ b/block/crypto.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/disas/lm32.c b/disas/lm32.c
index c0ef8160fe..4fbb124534 100644
--- a/disas/lm32.c
+++ b/disas/lm32.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/exec-vary.c b/exec-vary.c
index ff905f2a8f..a603b1b433 100644
--- a/exec-vary.c
+++ b/exec-vary.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index 2c0c83221f..7170bff657 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/acpi/hmat.c b/hw/acpi/hmat.c
index 7c24bb5371..37806f7a06 100644
--- a/hw/acpi/hmat.c
+++ b/hw/acpi/hmat.c
@@ -13,7 +13,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/acpi/hmat.h b/hw/acpi/hmat.h
index 437dbc6872..e9031cac01 100644
--- a/hw/acpi/hmat.h
+++ b/hw/acpi/hmat.h
@@ -13,7 +13,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
index 95cb0f935b..5ff4e01c36 100644
--- a/hw/acpi/ich9.c
+++ b/hw/acpi/ich9.c
@@ -10,7 +10,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 17c32e0ffd..9dc4d3e2db 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -10,7 +10,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 67a1ea4191..669be5bbf6 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/audio/milkymist-ac97.c b/hw/audio/milkymist-ac97.c
index 04b39f8345..7d2e057038 100644
--- a/hw/audio/milkymist-ac97.c
+++ b/hw/audio/milkymist-ac97.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/char/lm32_juart.c b/hw/char/lm32_juart.c
index b97aacba91..aced357011 100644
--- a/hw/char/lm32_juart.c
+++ b/hw/char/lm32_juart.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/char/lm32_uart.c b/hw/char/lm32_uart.c
index 0e8b4e46a3..2f58e2943b 100644
--- a/hw/char/lm32_uart.c
+++ b/hw/char/lm32_uart.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/char/milkymist-uart.c b/hw/char/milkymist-uart.c
index 1e83dbcafa..a817c51eb5 100644
--- a/hw/char/milkymist-uart.c
+++ b/hw/char/milkymist-uart.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/core/bus.c b/hw/core/bus.c
index a0483859ae..9cfbc3a687 100644
--- a/hw/core/bus.c
+++ b/hw/core/bus.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/core/platform-bus.c b/hw/core/platform-bus.c
index 5037ca265e..b8487b26b6 100644
--- a/hw/core/platform-bus.c
+++ b/hw/core/platform-bus.c
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index fc4daa36fa..262bca716f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
index 68e8dc88c5..aaae8e23cc 100644
--- a/hw/core/sysbus.c
+++ b/hw/core/sysbus.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 986c994522..2be77bdd3a 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -10,7 +10,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 64636db86f..02a28c807b 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/display/milkymist-vgafb.c b/hw/display/milkymist-vgafb.c
index 6f2b11d6c9..e2c587e2df 100644
--- a/hw/display/milkymist-vgafb.c
+++ b/hw/display/milkymist-vgafb.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/display/milkymist-vgafb_template.h b/hw/display/milkymist-vgafb_template.h
index 48837809eb..96137f9709 100644
--- a/hw/display/milkymist-vgafb_template.h
+++ b/hw/display/milkymist-vgafb_template.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/gpio/mpc8xxx.c b/hw/gpio/mpc8xxx.c
index e60c919a13..cb42acb6da 100644
--- a/hw/gpio/mpc8xxx.c
+++ b/hw/gpio/mpc8xxx.c
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
index 4728540c37..06e1e5321b 100644
--- a/hw/i2c/pm_smbus.c
+++ b/hw/i2c/pm_smbus.c
@@ -6,7 +6,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 680304a24c..4b675b9cfd 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -9,7 +9,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ide/ahci_internal.h b/hw/ide/ahci_internal.h
index ac9bdead7b..7f32e87731 100644
--- a/hw/ide/ahci_internal.h
+++ b/hw/ide/ahci_internal.h
@@ -9,7 +9,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 51cd2f38b7..1007a51fcb 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ide/qdev.c b/hw/ide/qdev.c
index 27ff1f7f66..1086b7a327 100644
--- a/hw/ide/qdev.c
+++ b/hw/ide/qdev.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 5acd7a6f7d..d885c708d7 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index b6a05e5439..1c8be40d8b 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 81addd6390..502e94effc 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index bca71b5934..a3021a4de1 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -9,7 +9,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index 5538b5b86e..3cccfc1556 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/intc/lm32_pic.c b/hw/intc/lm32_pic.c
index 0c48a9cd85..991a90bc99 100644
--- a/hw/intc/lm32_pic.c
+++ b/hw/intc/lm32_pic.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/isa/apm.c b/hw/isa/apm.c
index bce266b957..dfe9020d30 100644
--- a/hw/isa/apm.c
+++ b/hw/isa/apm.c
@@ -6,7 +6,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
index 10bb7ffa43..7820068e6e 100644
--- a/hw/isa/isa-bus.c
+++ b/hw/isa/isa-bus.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index b842f74344..b5d97dd53e 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/lm32/lm32_hwsetup.h b/hw/lm32/lm32_hwsetup.h
index de94de177a..e6cd30ad68 100644
--- a/hw/lm32/lm32_hwsetup.h
+++ b/hw/lm32/lm32_hwsetup.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index 9f8fe9fef1..9ef94883d5 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index e1574bc07c..03c2201b56 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -11,7 +11,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
index 2ffc986734..12b655eda8 100644
--- a/hw/mem/pc-dimm.c
+++ b/hw/mem/pc-dimm.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index a4deb3e7a0..1b9acaf1d3 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -9,7 +9,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/misc/milkymist-hpdmc.c b/hw/misc/milkymist-hpdmc.c
index 5e26d90ceb..09a3875f02 100644
--- a/hw/misc/milkymist-hpdmc.c
+++ b/hw/misc/milkymist-hpdmc.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/misc/milkymist-pfpu.c b/hw/misc/milkymist-pfpu.c
index 83491dbca2..e4ee209c10 100644
--- a/hw/misc/milkymist-pfpu.c
+++ b/hw/misc/milkymist-pfpu.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 83347cbd87..d7d05ae30a 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -13,7 +13,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/net/milkymist-minimac2.c b/hw/net/milkymist-minimac2.c
index 78c20c94e5..5826944fd5 100644
--- a/hw/net/milkymist-minimac2.c
+++ b/hw/net/milkymist-minimac2.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/pci-bridge/i82801b11.c b/hw/pci-bridge/i82801b11.c
index 2b3907655b..f28181e210 100644
--- a/hw/pci-bridge/i82801b11.c
+++ b/hw/pci-bridge/i82801b11.c
@@ -30,7 +30,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 8492c18991..f9fb97a3e3 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 0fecabc135..0790239ba5 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
index 44fdd64b88..5d6c56473f 100644
--- a/hw/ppc/spapr_vio.c
+++ b/hw/ppc/spapr_vio.c
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index e24c12d7ee..1a5fc5857d 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/scsi/mptconfig.c b/hw/scsi/mptconfig.c
index 3b2a857b5c..19d01f39fa 100644
--- a/hw/scsi/mptconfig.c
+++ b/hw/scsi/mptconfig.c
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/scsi/mptendian.c b/hw/scsi/mptendian.c
index 313f40edf9..0d5abb4b6c 100644
--- a/hw/scsi/mptendian.c
+++ b/hw/scsi/mptendian.c
@@ -9,7 +9,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/scsi/mptsas.c b/hw/scsi/mptsas.c
index 135e7d96e4..f86616544b 100644
--- a/hw/scsi/mptsas.c
+++ b/hw/scsi/mptsas.c
@@ -11,7 +11,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/sd/milkymist-memcard.c b/hw/sd/milkymist-memcard.c
index 8cde32049e..a1235aa46c 100644
--- a/hw/sd/milkymist-memcard.c
+++ b/hw/sd/milkymist-memcard.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 05fd86af81..9520471be2 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -9,7 +9,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/timer/lm32_timer.c b/hw/timer/lm32_timer.c
index be87c65b3e..eeaf0ada5f 100644
--- a/hw/timer/lm32_timer.c
+++ b/hw/timer/lm32_timer.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/timer/milkymist-sysctl.c b/hw/timer/milkymist-sysctl.c
index 950437b685..9ecea63861 100644
--- a/hw/timer/milkymist-sysctl.c
+++ b/hw/timer/milkymist-sysctl.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 43a336aabf..8ab458922a 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/exec/ioport.h b/include/exec/ioport.h
index 97feb296d2..e34f668998 100644
--- a/include/exec/ioport.h
+++ b/include/exec/ioport.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/exec/memory_ldst.h.inc b/include/exec/memory_ldst.h.inc
index 272c20f02e..46e6c220d3 100644
--- a/include/exec/memory_ldst.h.inc
+++ b/include/exec/memory_ldst.h.inc
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/exec/memory_ldst_cached.h.inc b/include/exec/memory_ldst_cached.h.inc
index aff574039f..01efad62de 100644
--- a/include/exec/memory_ldst_cached.h.inc
+++ b/include/exec/memory_ldst_cached.h.inc
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/exec/memory_ldst_phys.h.inc b/include/exec/memory_ldst_phys.h.inc
index 91f72973cb..b9dd53c389 100644
--- a/include/exec/memory_ldst_phys.h.inc
+++ b/include/exec/memory_ldst_phys.h.inc
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/exec/tb-context.h b/include/exec/tb-context.h
index feb585e0a7..ec4c13b455 100644
--- a/include/exec/tb-context.h
+++ b/include/exec/tb-context.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
index b281dfa30f..300a840d58 100644
--- a/include/exec/user/thunk.h
+++ b/include/exec/user/thunk.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 4bef575312..22b0b65bb2 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
index 28a53181cb..54571c77e0 100644
--- a/include/hw/acpi/ich9.h
+++ b/include/hw/acpi/ich9.h
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
index 02f4665767..dfd375820f 100644
--- a/include/hw/acpi/pcihp.h
+++ b/include/hw/acpi/pcihp.h
@@ -10,7 +10,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
- * License version 2 as published by the Free Software Foundation.
+ * License version 2.1 as published by the Free Software Foundation.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/display/milkymist_tmu2.h b/include/hw/display/milkymist_tmu2.h
index e3394ff158..fdce9535a1 100644
--- a/include/hw/display/milkymist_tmu2.h
+++ b/include/hw/display/milkymist_tmu2.h
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index da38541627..c175e7e718 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/i386/ioapic.h b/include/hw/i386/ioapic.h
index 59fcb158a7..06bfaaeac6 100644
--- a/include/hw/i386/ioapic.h
+++ b/include/hw/i386/ioapic.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/i386/ioapic_internal.h b/include/hw/i386/ioapic_internal.h
index 0ac9e2400d..0f9002a2c2 100644
--- a/include/hw/i386/ioapic_internal.h
+++ b/include/hw/i386/ioapic_internal.h
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index b1bdf648f8..210e5e734c 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -9,7 +9,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/loader-fit.h b/include/hw/loader-fit.h
index 0284c3e02c..0832e379dc 100644
--- a/include/hw/loader-fit.h
+++ b/include/hw/loader-fit.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index 79869c7066..6d9b51ae67 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/pci-host/spapr.h b/include/hw/pci-host/spapr.h
index 04917f31ef..4f58f0223b 100644
--- a/include/hw/pci-host/spapr.h
+++ b/include/hw/pci-host/spapr.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/platform-bus.h b/include/hw/platform-bus.h
index 1f3d1ce869..44f30c5353 100644
--- a/include/hw/platform-bus.h
+++ b/include/hw/platform-bus.h
@@ -11,7 +11,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 356751e2d7..4bea87f39c 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -11,7 +11,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/qemu/base64.h b/include/qemu/base64.h
index 0a3c5c9c53..46a75fbbeb 100644
--- a/include/qemu/base64.h
+++ b/include/qemu/base64.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/qemu/buffer.h b/include/qemu/buffer.h
index 3a909aeca4..d34d2c857c 100644
--- a/include/qemu/buffer.h
+++ b/include/qemu/buffer.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/include/qemu/filemonitor.h b/include/qemu/filemonitor.h
index a41ceb0244..8715d5c048 100644
--- a/include/qemu/filemonitor.h
+++ b/include/qemu/filemonitor.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/memory_ldst.c.inc b/memory_ldst.c.inc
index 8d45d2eeff..2fed2de18e 100644
--- a/memory_ldst.c.inc
+++ b/memory_ldst.c.inc
@@ -8,7 +8,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/scripts/analyze-migration.py b/scripts/analyze-migration.py
index d70ec7d33a..d7177b212c 100755
--- a/scripts/analyze-migration.py
+++ b/scripts/analyze-migration.py
@@ -7,7 +7,7 @@
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
 # License as published by the Free Software Foundation; either
-# version 2 of the License, or (at your option) any later version.
+# version 2.1 of the License, or (at your option) any later version.
 #
 # This library is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/scripts/replay-dump.py b/scripts/replay-dump.py
index 4cbc1e47c6..3ba97a6d30 100755
--- a/scripts/replay-dump.py
+++ b/scripts/replay-dump.py
@@ -8,7 +8,7 @@
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
 # License as published by the Free Software Foundation; either
-# version 2 of the License, or (at your option) any later version.
+# version 2.1 of the License, or (at your option) any later version.
 #
 # This library is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index dd60ff79e9..3027747c03 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index bcfb90a08f..bf79d0bbcd 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/lm32/cpu.h b/target/lm32/cpu.h
index 01d408eb55..ea7c01ca8b 100644
--- a/target/lm32/cpu.h
+++ b/target/lm32/cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/lm32/gdbstub.c b/target/lm32/gdbstub.c
index b6fe12e1d6..56f508a5b6 100644
--- a/target/lm32/gdbstub.c
+++ b/target/lm32/gdbstub.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/lm32/helper.c b/target/lm32/helper.c
index 1130fc8884..7c52ae76d6 100644
--- a/target/lm32/helper.c
+++ b/target/lm32/helper.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/lm32/translate.c b/target/lm32/translate.c
index e583d52d03..030b232d66 100644
--- a/target/lm32/translate.c
+++ b/target/lm32/translate.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tilegx/cpu.h b/target/tilegx/cpu.h
index c194c1a6fd..7d8e44d12e 100644
--- a/target/tilegx/cpu.h
+++ b/target/tilegx/cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/ui/x_keymap.c b/ui/x_keymap.c
index 2bc01432e5..555086fb6b 100644
--- a/ui/x_keymap.c
+++ b/ui/x_keymap.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2017 Red Hat, Inc
  *
  * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU Lesser General Public License version 2 as
+ * it under the terms of the GNU Lesser General Public License version 2.1 as
  * published by the Free Software Foundation.
  */
 
diff --git a/util/base64.c b/util/base64.c
index 9d3c46cbcc..811111ac4f 100644
--- a/util/base64.c
+++ b/util/base64.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/util/buffer.c b/util/buffer.c
index d8bb874534..743eaa930d 100644
--- a/util/buffer.c
+++ b/util/buffer.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/util/filemonitor-inotify.c b/util/filemonitor-inotify.c
index b5f4b93f3f..2c45f7f176 100644
--- a/util/filemonitor-inotify.c
+++ b/util/filemonitor-inotify.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/util/filemonitor-stub.c b/util/filemonitor-stub.c
index 2c0e97edd8..93fef65345 100644
--- a/util/filemonitor-stub.c
+++ b/util/filemonitor-stub.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/util/log.c b/util/log.c
index 4b423062aa..2ee1500bee 100644
--- a/util/log.c
+++ b/util/log.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
2.18.4


