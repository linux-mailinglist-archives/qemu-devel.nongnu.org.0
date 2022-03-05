Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5688D4CE581
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 16:16:31 +0100 (CET)
Received: from localhost ([::1]:56496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQW90-0002jc-EV
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 10:16:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW31-0000ms-UT
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:10:23 -0500
Received: from [2001:41c9:1:41f::167] (port=59104
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW30-0006qj-Kj
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 10:10:19 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nQW2K-0008Q9-TE; Sat, 05 Mar 2022 15:09:41 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Sat,  5 Mar 2022 15:09:48 +0000
Message-Id: <20220305150957.5053-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220305150957.5053-1-mark.cave-ayland@ilande.co.uk>
References: <20220305150957.5053-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v4 03/12] mac_via: use IFR bit flag constants for VIA2 IRQs
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/mac_via.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index b0535c84da..0af346366e 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -80,19 +80,18 @@ struct MOS6522Q800VIA1State {
 
 
 /* VIA 2 */
-#define VIA2_IRQ_SCSI_DATA_BIT  0
-#define VIA2_IRQ_NUBUS_BIT      1
-#define VIA2_IRQ_UNUSED_BIT     2
-#define VIA2_IRQ_SCSI_BIT       3
-#define VIA2_IRQ_ASC_BIT        4
+#define VIA2_IRQ_SCSI_DATA_BIT  CA2_INT_BIT
+#define VIA2_IRQ_NUBUS_BIT      CA1_INT_BIT
+#define VIA2_IRQ_SCSI_BIT       CB2_INT_BIT
+#define VIA2_IRQ_ASC_BIT        CB1_INT_BIT
 
 #define VIA2_IRQ_NB             8
 
-#define VIA2_IRQ_SCSI_DATA      (1 << VIA2_IRQ_SCSI_DATA_BIT)
-#define VIA2_IRQ_NUBUS          (1 << VIA2_IRQ_NUBUS_BIT)
-#define VIA2_IRQ_UNUSED         (1 << VIA2_IRQ_SCSI_BIT)
-#define VIA2_IRQ_SCSI           (1 << VIA2_IRQ_UNUSED_BIT)
-#define VIA2_IRQ_ASC            (1 << VIA2_IRQ_ASC_BIT)
+#define VIA2_IRQ_SCSI_DATA      BIT(VIA2_IRQ_SCSI_DATA_BIT)
+#define VIA2_IRQ_NUBUS          BIT(VIA2_IRQ_NUBUS_BIT)
+#define VIA2_IRQ_UNUSED         BIT(VIA2_IRQ_SCSI_BIT)
+#define VIA2_IRQ_SCSI           BIT(VIA2_IRQ_UNUSED_BIT)
+#define VIA2_IRQ_ASC            BIT(VIA2_IRQ_ASC_BIT)
 
 #define VIA2_NUBUS_IRQ_NB       7
 
-- 
2.20.1


