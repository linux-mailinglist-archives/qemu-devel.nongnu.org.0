Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A905134B44E
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Mar 2021 06:03:53 +0100 (CET)
Received: from localhost ([::1]:53886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQ172-0005uk-B6
	for lists+qemu-devel@lfdr.de; Sat, 27 Mar 2021 01:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQ160-0005NP-GU
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 01:02:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQ15w-0005JW-PV
 for qemu-devel@nongnu.org; Sat, 27 Mar 2021 01:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616821362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qwQ0DuTYqBQQQBfH/kcFPl+oEInmcqITU34UhDGr0h0=;
 b=dinuWZF2a2VbUagkjTioCBwq9rHvpw4CPHmnK7KxkOk4HNUHYARQnI4zCI744sJjI1kKcx
 aswjEYmLvlmV82qXEtGzEj1tg7YyWOEoHQ/QW+4KixFye+F5/Wahl6m/r//T54AmlYRKDU
 +US3i0Yc6/JFDoZG8xQ5LTXLlqgHjSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-1gxD1KUwOJSehLbyG72MHg-1; Sat, 27 Mar 2021 01:02:40 -0400
X-MC-Unique: 1gxD1KUwOJSehLbyG72MHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8542180FCA0;
 Sat, 27 Mar 2021 05:02:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-12.ams2.redhat.com [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 11ABD61F59;
 Sat, 27 Mar 2021 05:02:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw: Do not include hw/irq.h if it is not necessary
Date: Sat, 27 Mar 2021 06:02:36 +0100
Message-Id: <20210327050236.2232347-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Many files include hw/irq.h without needing it. Remove the superfluous
include statements.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/msf2-soc.c           | 1 -
 hw/i386/kvm/ioapic.c        | 1 -
 hw/i386/xen/xen_platform.c  | 1 -
 hw/m68k/q800.c              | 1 -
 hw/m68k/virt.c              | 1 -
 hw/misc/led.c               | 1 -
 hw/misc/virt_ctrl.c         | 1 -
 hw/ppc/prep.c               | 1 -
 hw/riscv/microchip_pfsoc.c  | 1 -
 hw/sd/cadence_sdhci.c       | 1 -
 hw/timer/sse-counter.c      | 1 -
 hw/usb/xlnx-usb-subsystem.c | 1 -
 12 files changed, 12 deletions(-)

diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index d2c29e82d1..5cfe7caf83 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -27,7 +27,6 @@
 #include "qapi/error.h"
 #include "exec/address-spaces.h"
 #include "hw/char/serial.h"
-#include "hw/irq.h"
 #include "hw/arm/msf2-soc.h"
 #include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index dfc3c98005..71a563181e 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -13,7 +13,6 @@
 #include "qemu/osdep.h"
 #include "monitor/monitor.h"
 #include "hw/i386/x86.h"
-#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/ioapic_internal.h"
 #include "hw/i386/apic_internal.h"
diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
index 01ae1fb161..bf4f20e92b 100644
--- a/hw/i386/xen/xen_platform.c
+++ b/hw/i386/xen/xen_platform.c
@@ -27,7 +27,6 @@
 #include "qapi/error.h"
 #include "hw/ide.h"
 #include "hw/pci/pci.h"
-#include "hw/irq.h"
 #include "hw/xen/xen_common.h"
 #include "migration/vmstate.h"
 #include "hw/xen/xen-legacy-backend.h"
diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index 1c7f7aa07f..d1ab1ff77d 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -27,7 +27,6 @@
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "elf.h"
 #include "hw/loader.h"
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 18e6f11041..9469f82800 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -13,7 +13,6 @@
 #include "sysemu/sysemu.h"
 #include "cpu.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "elf.h"
 #include "hw/loader.h"
diff --git a/hw/misc/led.c b/hw/misc/led.c
index f552b8b648..f6d6d68bce 100644
--- a/hw/misc/led.c
+++ b/hw/misc/led.c
@@ -10,7 +10,6 @@
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
 #include "hw/misc/led.h"
-#include "hw/irq.h"
 #include "trace.h"
 
 #define LED_INTENSITY_PERCENT_MAX   100
diff --git a/hw/misc/virt_ctrl.c b/hw/misc/virt_ctrl.c
index 2ea01bd7a1..3552d7a09a 100644
--- a/hw/misc/virt_ctrl.c
+++ b/hw/misc/virt_ctrl.c
@@ -5,7 +5,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index f1b1efdcef..af4ccb9f43 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -38,7 +38,6 @@
 #include "qapi/error.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/rtc/mc146818rtc.h"
 #include "hw/isa/pc87312.h"
diff --git a/hw/riscv/microchip_pfsoc.c b/hw/riscv/microchip_pfsoc.c
index c4146b7a6b..01537b30eb 100644
--- a/hw/riscv/microchip_pfsoc.c
+++ b/hw/riscv/microchip_pfsoc.c
@@ -41,7 +41,6 @@
 #include "qemu/cutils.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
-#include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "chardev/char.h"
diff --git a/hw/sd/cadence_sdhci.c b/hw/sd/cadence_sdhci.c
index 0b371c843d..c89538b491 100644
--- a/hw/sd/cadence_sdhci.c
+++ b/hw/sd/cadence_sdhci.c
@@ -26,7 +26,6 @@
 #include "qemu/log.h"
 #include "qapi/error.h"
 #include "migration/vmstate.h"
-#include "hw/irq.h"
 #include "hw/sd/cadence_sdhci.h"
 #include "sdhci-internal.h"
 
diff --git a/hw/timer/sse-counter.c b/hw/timer/sse-counter.c
index 0384051f15..16c0e8ad15 100644
--- a/hw/timer/sse-counter.c
+++ b/hw/timer/sse-counter.c
@@ -33,7 +33,6 @@
 #include "trace.h"
 #include "hw/timer/sse-counter.h"
 #include "hw/sysbus.h"
-#include "hw/irq.h"
 #include "hw/registerfields.h"
 #include "hw/clock.h"
 #include "hw/qdev-clock.h"
diff --git a/hw/usb/xlnx-usb-subsystem.c b/hw/usb/xlnx-usb-subsystem.c
index 568257370c..c760c3058a 100644
--- a/hw/usb/xlnx-usb-subsystem.c
+++ b/hw/usb/xlnx-usb-subsystem.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
-#include "hw/irq.h"
 #include "hw/register.h"
 #include "qemu/bitops.h"
 #include "qemu/log.h"
-- 
2.27.0


