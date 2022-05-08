Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EEDD51F17A
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 22:35:03 +0200 (CEST)
Received: from localhost ([::1]:40522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnncM-00086M-JG
	for lists+qemu-devel@lfdr.de; Sun, 08 May 2022 16:35:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn4u-0007iw-SZ
 for qemu-devel@nongnu.org; Sun, 08 May 2022 16:00:28 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:55488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn4r-0007OF-Cw
 for qemu-devel@nongnu.org; Sun, 08 May 2022 16:00:27 -0400
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nnn3h-0000yR-HZ; Sun, 08 May 2022 20:59:17 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org,
	deller@gmx.de,
	qemu-devel@nongnu.org
Date: Sun,  8 May 2022 20:56:44 +0100
Message-Id: <20220508195650.28590-48-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
References: <20220508195650.28590-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PULL 47/53] hppa: remove the empty hppa_sys.h file
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

This file is now just a simple wrapper that includes hppa_hardware.h so remove
the file completely, and update its single user in machine.c to include
hppa_hardware.h directly.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Acked-by: Helge Deller <deller@gmx.de>
Message-Id: <20220504092600.10048-48-mark.cave-ayland@ilande.co.uk>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 hw/hppa/hppa_sys.h | 8 --------
 hw/hppa/machine.c  | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)
 delete mode 100644 hw/hppa/hppa_sys.h

diff --git a/hw/hppa/hppa_sys.h b/hw/hppa/hppa_sys.h
deleted file mode 100644
index e7f65cad75..0000000000
--- a/hw/hppa/hppa_sys.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* HPPA cores and system support chips.  */
-
-#ifndef HW_HPPA_SYS_H
-#define HW_HPPA_SYS_H
-
-#include "hppa_hardware.h"
-
-#endif
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index e6431aa541..75820838bf 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -23,7 +23,7 @@
 #include "hw/pci/pci.h"
 #include "hw/pci-host/dino.h"
 #include "hw/misc/lasi.h"
-#include "hppa_sys.h"
+#include "hppa_hardware.h"
 #include "qemu/units.h"
 #include "qapi/error.h"
 #include "net/net.h"
-- 
2.20.1


