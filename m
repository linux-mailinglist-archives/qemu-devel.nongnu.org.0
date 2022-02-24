Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529344C2B69
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:07:51 +0100 (CET)
Received: from localhost ([::1]:41362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCuU-00048a-8l
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNCn6-00010Z-LN
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:00:12 -0500
Received: from [2001:41c9:1:41f::167] (port=45454
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNCn3-0008Rz-PE
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:00:12 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nNCmQ-0003GS-Ai; Thu, 24 Feb 2022 11:59:34 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 24 Feb 2022 11:59:45 +0000
Message-Id: <20220224115956.29997-2-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 01/12] mos6522: add defines for IFR bit flags
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

These are intended to make it easier to see how the physical control lines
are wired for each instance.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/misc/mos6522.h | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/hw/misc/mos6522.h b/include/hw/misc/mos6522.h
index fc95d22b0f..be5c90d24d 100644
--- a/include/hw/misc/mos6522.h
+++ b/include/hw/misc/mos6522.h
@@ -41,13 +41,21 @@
 #define IER_SET            0x80    /* set bits in IER */
 #define IER_CLR            0       /* clear bits in IER */
 
-#define CA2_INT            0x01
-#define CA1_INT            0x02
-#define SR_INT             0x04    /* Shift register full/empty */
-#define CB2_INT            0x08
-#define CB1_INT            0x10
-#define T2_INT             0x20    /* Timer 2 interrupt */
-#define T1_INT             0x40    /* Timer 1 interrupt */
+#define CA2_INT_BIT        0
+#define CA1_INT_BIT        1
+#define SR_INT_BIT         2       /* Shift register full/empty */
+#define CB2_INT_BIT        3
+#define CB1_INT_BIT        4
+#define T2_INT_BIT         5       /* Timer 2 interrupt */
+#define T1_INT_BIT         6       /* Timer 1 interrupt */
+
+#define CA2_INT            BIT(CA2_INT_BIT)
+#define CA1_INT            BIT(CA1_INT_BIT)
+#define SR_INT             BIT(SR_INT_BIT)
+#define CB2_INT            BIT(CB2_INT_BIT)
+#define CB1_INT            BIT(CB1_INT_BIT)
+#define T2_INT             BIT(T2_INT_BIT)
+#define T1_INT             BIT(T1_INT_BIT)
 
 /* Bits in ACR */
 #define T1MODE             0xc0    /* Timer 1 mode */
-- 
2.20.1


