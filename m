Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2986D519CC8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 12:17:41 +0200 (CEST)
Received: from localhost ([::1]:40446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmC4i-0008QD-7n
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 06:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIz-0000nF-23
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:21 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:49280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBIx-0004Ca-IM
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:28:20 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nmBHt-0002VG-T4; Wed, 04 May 2022 10:27:14 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Wed,  4 May 2022 10:25:51 +0100
Message-Id: <20220504092600.10048-42-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 41/50] hppa: move device headers from hppa_sys.h into
 individual .c files
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

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
---
 hw/hppa/hppa_sys.h | 3 ---
 hw/hppa/lasi.h     | 4 ++++
 hw/hppa/machine.c  | 2 ++
 hw/hppa/pci.c      | 3 +++
 4 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
index f7a127be19..9964d4a7a7 100644
--- a/hw/hppa/hppa_sys.h
+++ b/hw/hppa/hppa_sys.h
@@ -3,10 +3,7 @@
 #ifndef HW_HPPA_SYS_H
 #define HW_HPPA_SYS_H
 
-#include "hw/pci/pci.h"
-#include "hw/pci/pci_host.h"
 #include "hw/boards.h"
-#include "hw/intc/i8259.h"
 
 #include "hppa_hardware.h"
 
diff --git a/hw/hppa/lasi.h b/hw/hppa/lasi.h
index 11cf7d6b0b..ecc7065ce8 100644
--- a/hw/hppa/lasi.h
+++ b/hw/hppa/lasi.h
@@ -12,6 +12,10 @@
 #ifndef LASI_H
 #define LASI_H
 
+#include "exec/address-spaces.h"
+#include "hw/pci/pci_host.h"
+#include "hw/boards.h"
+
 #define TYPE_LASI_CHIP "lasi-chip"
 OBJECT_DECLARE_SIMPLE_TYPE(LasiState, LASI_CHIP)
 
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 58b25ca5bc..9d904b7a60 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -16,9 +16,11 @@
 #include "hw/timer/i8254.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
+#include "hw/intc/i8259.h"
 #include "hw/input/lasips2.h"
 #include "hw/net/lasi_82596.h"
 #include "hw/nmi.h"
+#include "hw/pci/pci.h"
 #include "hw/pci-host/dino.h"
 #include "lasi.h"
 #include "hppa_sys.h"
diff --git a/hw/hppa/pci.c b/hw/hppa/pci.c
index 32609aba63..a92dcb6b9e 100644
--- a/hw/hppa/pci.c
+++ b/hw/hppa/pci.c
@@ -6,6 +6,9 @@
 #include "qemu/osdep.h"
 #include "hppa_sys.h"
 #include "qemu/log.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/pci_host.h"
+#include "hw/intc/i8259.h"
 #include "trace.h"
 
 
-- 
2.20.1


