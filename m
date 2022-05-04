Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164E519C63
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:54:03 +0200 (CEST)
Received: from localhost ([::1]:57758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmBhq-0006Te-HS
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:54:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHe-0007pl-Or
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHc-00041P-Su
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:26:58 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBGV-0002VG-Sm; Wed, 04 May 2022 10:25:51 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:22 +0100
Message-Id: <20220504092600.10048-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 12/50] hppa: use new CONFIG_HPPA_B160L option instead of
 CONFIG_DINO to build hppa machine
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

DINO refers to the GSC-PCI bridge device which will soon be handled separately,
however the QEMU HPPA machine is actually based upon the HPPA B160L as indicated
by the Linux kernel dmesg output when booted in qemu-system-hppa and the QEMU
MAINTAINERS file.

Update the machine configuration to use CONFIG_HPPA_B160L instead of CONFIG_DINO
and also update the machine description accordingly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 configs/devices/hppa-softmmu/default.mak | 2 +-
 hw/hppa/Kconfig                          | 2 +-
 hw/hppa/machine.c                        | 2 +-
 hw/hppa/meson.build                      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/devices/hppa-softmmu/default.mak b/configs/devices/hppa-softmmu/default.mak
index b64c5eb3ff..b0364bb88f 100644
--- a/configs/devices/hppa-softmmu/default.mak
+++ b/configs/devices/hppa-softmmu/default.mak
@@ -6,4 +6,4 @@
 
 # Boards:
 #
-CONFIG_DINO=y
+CONFIG_HPPA_B160L=y
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 22948db025..8d64ead217 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -1,4 +1,4 @@
-config DINO
+config HPPA_B160L
     bool
     imply PCI_DEVICES
     imply E1000_PCI
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index f7595c0857..971d7ffcfe 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -366,7 +366,7 @@ static void hppa_nmi(NMIState *n, int cpu_index, Error **errp)
 
 static void machine_hppa_machine_init(MachineClass *mc)
 {
-    mc->desc = "HPPA generic machine";
+    mc->desc = "HPPA B160L machine";
     mc->default_cpu_type = TYPE_HPPA_CPU;
     mc->init = machine_hppa_init;
     mc->reset = hppa_machine_reset;
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
index 1deae83aee..32072bf204 100644
--- a/hw/hppa/meson.build
+++ b/hw/hppa/meson.build
@@ -1,4 +1,4 @@
 hppa_ss = ss.source_set()
-hppa_ss.add(when: 'CONFIG_DINO', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
+hppa_ss.add(when: 'CONFIG_HPPA_B160L', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
 
 hw_arch += {'hppa': hppa_ss}
-- 
2.20.1


