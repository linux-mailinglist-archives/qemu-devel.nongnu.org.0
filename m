Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C47E750A950
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 21:36:07 +0200 (CEST)
Received: from localhost ([::1]:39452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhcb0-0006YX-Rk
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 15:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWt-0007DR-TM
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:52 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:33462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcWs-0005dM-GW
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 15:31:51 -0400
Received: from [2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nhcVo-000Caf-Lj; Thu, 21 Apr 2022 20:30:48 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Thu, 21 Apr 2022 20:30:22 +0100
Message-Id: <20220421193100.5098-13-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
References: <20220421193100.5098-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba2:c800:3cf5:fb4b:b388:106c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 12/50] hppa: use new CONFIG_HPPA_GENERIC option instead of
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
so instead use HPPA_GENERIC in reference to "HPPA generic machine" used in the
machine description.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 configs/devices/hppa-softmmu/default.mak | 2 +-
 hw/hppa/Kconfig                          | 2 +-
 hw/hppa/meson.build                      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/devices/hppa-softmmu/default.mak b/configs/devices/hppa-softmmu/default.mak
index b64c5eb3ff..03b07c29d4 100644
--- a/configs/devices/hppa-softmmu/default.mak
+++ b/configs/devices/hppa-softmmu/default.mak
@@ -6,4 +6,4 @@
 
 # Boards:
 #
-CONFIG_DINO=y
+CONFIG_HPPA_GENERIC=y
diff --git a/hw/hppa/Kconfig b/hw/hppa/Kconfig
index 22948db025..02e101f139 100644
--- a/hw/hppa/Kconfig
+++ b/hw/hppa/Kconfig
@@ -1,4 +1,4 @@
-config DINO
+config HPPA_GENERIC
     bool
     imply PCI_DEVICES
     imply E1000_PCI
diff --git a/hw/hppa/meson.build b/hw/hppa/meson.build
index 1deae83aee..af37b4469e 100644
--- a/hw/hppa/meson.build
+++ b/hw/hppa/meson.build
@@ -1,4 +1,4 @@
 hppa_ss = ss.source_set()
-hppa_ss.add(when: 'CONFIG_DINO', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
+hppa_ss.add(when: 'CONFIG_HPPA_GENERIC', if_true: files('pci.c', 'machine.c', 'dino.c', 'lasi.c'))
 
 hw_arch += {'hppa': hppa_ss}
-- 
2.20.1


