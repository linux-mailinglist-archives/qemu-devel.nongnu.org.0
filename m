Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B3850A9CF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 22:13:38 +0200 (CEST)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhdBJ-0007NZ-Ct
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 16:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXv-0000K7-Ba
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:55 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcXt-0005ma-SB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:32:55 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWq-000Caf-Iq; Thu, 21 Apr 2022 20:31:52 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:54 +0100
Message-Id: <20220421193100.5098-45-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 44/50] hppa: remove hw/hppa/pci.c
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The functions and definitions in this file are not used anywhere within the
generic hppa machine.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/hppa_sys.h   |  6 ----
 hw/hppa/meson.build  |  2 +-
 hw/hppa/pci.c        | 65 --------------------------------------------
 hw/hppa/trace-events |  3 --
 4 files changed, 1 insertion(+), 75 deletions(-)
 delete mode 100644 hw/hppa/pci.c

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index d984b2895d..17e2c6dec1 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -3,14 +3,8 @@
 #ifndef HW_HPPA_SYS_H
 #define HW_HPPA_SYS_H
 
-#include "hw/boards.h"
-
 #include "hppa_hardware.h"
 
 #define enable_lasi_lan()       0
 
-/* hppa_pci.c.  */
-extern const MemoryRegionOps hppa_pci_conf1_ops;
-extern const MemoryRegionOps hppa_pci_iack_ops;
-
 #endif
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
index 92878d9ac1..28175d27a4 100644
--- a/hw/hppa/meson.build
+++ b/hw/hppa/meson.build
@@ -1,4 +1,4 @@
 hppa_ss = ss.source_set()
-hppa_ss.add(when: 'CONFIG_HPPA_GENERIC', if_true: files('pci.c', 'machine.c'))
+hppa_ss.add(when: 'CONFIG_HPPA_GENERIC', if_true: files('machine.c'))
 
 hw_arch += {'hppa': hppa_ss}
diff --git a/hw/hppa/pci.c b/hw/hppa/pci.c
deleted file mode 100644
index 4d62d54c22..0000000000
--- a/hw/hppa/pci.c
+++ /dev/null
@@ -1,65 +0,0 @@
-/*
- * QEMU HP-PARISC PCI support functions.
- *
- */
-
-#include "qemu/osdep.h"
-#include "hppa_sys.h"
-#include "qemu/log.h"
-#include "hw/pci/pci.h"
-#include "hw/pci/pci_host.h"
-#include "hw/intc/i8259.h"
-#include "trace.h"
-
-
-/* PCI config space reads/writes, to byte-word addressable memory.  */
-static uint64_t bw_conf1_read(void *opaque, hwaddr addr,
-                              unsigned size)
-{
-    PCIBus *b = opaque;
-    return pci_data_read(b, addr, size);
-}
-
-static void bw_conf1_write(void *opaque, hwaddr addr,
-                           uint64_t val, unsigned size)
-{
-    PCIBus *b = opaque;
-    pci_data_write(b, addr, val, size);
-}
-
-const MemoryRegionOps hppa_pci_conf1_ops = {
-    .read = bw_conf1_read,
-    .write = bw_conf1_write,
-    .endianness = DEVICE_BIG_ENDIAN,
-    .impl = {
-        .min_access_size = 1,
-        .max_access_size = 4,
-    },
-};
-
-/* PCI/EISA Interrupt Acknowledge Cycle.  */
-
-static uint64_t iack_read(void *opaque, hwaddr addr, unsigned size)
-{
-    return pic_read_irq(isa_pic);
-}
-
-static void special_write(void *opaque, hwaddr addr,
-                          uint64_t val, unsigned size)
-{
-    trace_hppa_pci_iack_write();
-}
-
-const MemoryRegionOps hppa_pci_iack_ops = {
-    .read = iack_read,
-    .write = special_write,
-    .endianness = DEVICE_BIG_ENDIAN,
-    .valid = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-    .impl = {
-        .min_access_size = 4,
-        .max_access_size = 4,
-    },
-};
diff --git a/hw/hppa/trace-events b/hw/hppa/trace-events
index 1a4fbe2fa8..23bc9b19b9 100644
--- a/hw/hppa/trace-events
+++ b/hw/hppa/trace-events
@@ -1,4 +1 @@
 # See docs/devel/tracing.rst for syntax documentation.
-
-# pci.c
-hppa_pci_iack_write(void) ""
-- 
2.20.1


