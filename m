Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CCF4CE528
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:12:59 +0100 (CET)
Received: from localhost ([::1]:48948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQV9W-00036k-P6
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:12:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV7g-0006v3-At
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:04 -0500
Received: from [2001:41c9:1:41f::167] (port=58912
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV7e-0006tQ-R8
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:11:03 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQV6z-00082l-7Q; Sat, 05 Mar 2022 14:10:25 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 14:10:34 +0000
Message-Id: <20220305141044.31911-3-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
References: <20220305141044.31911-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 02/12] mac_via: use IFR bit flag constants for VIA1 IRQs
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

This allows us to easily see how the physical control lines are mapped to the
IFR bit flags.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/misc/mac_via.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index b445565866..b0535c84da 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -18,19 +18,19 @@
 #define VIA_SIZE   0x2000
 
 /* VIA 1 */
-#define VIA1_IRQ_ONE_SECOND_BIT 0
-#define VIA1_IRQ_60HZ_BIT       1
-#define VIA1_IRQ_ADB_READY_BIT  2
-#define VIA1_IRQ_ADB_DATA_BIT   3
-#define VIA1_IRQ_ADB_CLOCK_BIT  4
+#define VIA1_IRQ_ONE_SECOND_BIT CA2_INT_BIT
+#define VIA1_IRQ_60HZ_BIT       CA1_INT_BIT
+#define VIA1_IRQ_ADB_READY_BIT  SR_INT_BIT
+#define VIA1_IRQ_ADB_DATA_BIT   CB2_INT_BIT
+#define VIA1_IRQ_ADB_CLOCK_BIT  CB1_INT_BIT
 
 #define VIA1_IRQ_NB             8
 
-#define VIA1_IRQ_ONE_SECOND     (1 << VIA1_IRQ_ONE_SECOND_BIT)
-#define VIA1_IRQ_60HZ           (1 << VIA1_IRQ_60HZ_BIT)
-#define VIA1_IRQ_ADB_READY      (1 << VIA1_IRQ_ADB_READY_BIT)
-#define VIA1_IRQ_ADB_DATA       (1 << VIA1_IRQ_ADB_DATA_BIT)
-#define VIA1_IRQ_ADB_CLOCK      (1 << VIA1_IRQ_ADB_CLOCK_BIT)
+#define VIA1_IRQ_ONE_SECOND     BIT(VIA1_IRQ_ONE_SECOND_BIT)
+#define VIA1_IRQ_60HZ           BIT(VIA1_IRQ_60HZ_BIT)
+#define VIA1_IRQ_ADB_READY      BIT(VIA1_IRQ_ADB_READY_BIT)
+#define VIA1_IRQ_ADB_DATA       BIT(VIA1_IRQ_ADB_DATA_BIT)
+#define VIA1_IRQ_ADB_CLOCK      BIT(VIA1_IRQ_ADB_CLOCK_BIT)
 
 
 #define TYPE_MOS6522_Q800_VIA1 "mos6522-q800-via1"
-- 
2.20.1


