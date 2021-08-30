Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A633FB3F4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 12:35:54 +0200 (CEST)
Received: from localhost ([::1]:44846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKedt-0006Al-Gq
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 06:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeUE-00066r-HA
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:53346
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeUB-0007iS-RN
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 06:25:54 -0400
Received: from host86-179-186-93.range86-179.btcentralplus.com
 ([86.179.186.93] helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mKeTm-0003D2-0t; Mon, 30 Aug 2021 11:25:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org,
	laurent@vivier.eu
Date: Mon, 30 Aug 2021 11:24:46 +0100
Message-Id: <20210830102447.10806-12-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.179.186.93
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 11/12] mac_via: rename VIA2_IRQ_SLOT_BIT to VIA2_IRQ_NUBUS_BIT
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Also improve the alignment of the shifted constants.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
 include/hw/misc/mac_via.h | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index 9a8bca056e..5168e3ce66 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -26,11 +26,11 @@
 
 #define VIA1_IRQ_NB             8
 
-#define VIA1_IRQ_ONE_SECOND (1 << VIA1_IRQ_ONE_SECOND_BIT)
-#define VIA1_IRQ_60HZ       (1 << VIA1_IRQ_60HZ_BIT)
-#define VIA1_IRQ_ADB_READY  (1 << VIA1_IRQ_ADB_READY_BIT)
-#define VIA1_IRQ_ADB_DATA   (1 << VIA1_IRQ_ADB_DATA_BIT)
-#define VIA1_IRQ_ADB_CLOCK  (1 << VIA1_IRQ_ADB_CLOCK_BIT)
+#define VIA1_IRQ_ONE_SECOND     (1 << VIA1_IRQ_ONE_SECOND_BIT)
+#define VIA1_IRQ_60HZ           (1 << VIA1_IRQ_60HZ_BIT)
+#define VIA1_IRQ_ADB_READY      (1 << VIA1_IRQ_ADB_READY_BIT)
+#define VIA1_IRQ_ADB_DATA       (1 << VIA1_IRQ_ADB_DATA_BIT)
+#define VIA1_IRQ_ADB_CLOCK      (1 << VIA1_IRQ_ADB_CLOCK_BIT)
 
 
 #define TYPE_MOS6522_Q800_VIA1 "mos6522-q800-via1"
@@ -80,18 +80,18 @@ struct MOS6522Q800VIA1State {
 
 /* VIA 2 */
 #define VIA2_IRQ_SCSI_DATA_BIT  0
-#define VIA2_IRQ_SLOT_BIT       1
+#define VIA2_IRQ_NUBUS_BIT      1
 #define VIA2_IRQ_UNUSED_BIT     2
 #define VIA2_IRQ_SCSI_BIT       3
 #define VIA2_IRQ_ASC_BIT        4
 
 #define VIA2_IRQ_NB             8
 
-#define VIA2_IRQ_SCSI_DATA  (1 << VIA2_IRQ_SCSI_DATA_BIT)
-#define VIA2_IRQ_SLOT       (1 << VIA2_IRQ_SLOT_BIT)
-#define VIA2_IRQ_UNUSED     (1 << VIA2_IRQ_SCSI_BIT)
-#define VIA2_IRQ_SCSI       (1 << VIA2_IRQ_UNUSED_BIT)
-#define VIA2_IRQ_ASC        (1 << VIA2_IRQ_ASC_BIT)
+#define VIA2_IRQ_SCSI_DATA      (1 << VIA2_IRQ_SCSI_DATA_BIT)
+#define VIA2_IRQ_NUBUS          (1 << VIA2_IRQ_NUBUS_BIT)
+#define VIA2_IRQ_UNUSED         (1 << VIA2_IRQ_SCSI_BIT)
+#define VIA2_IRQ_SCSI           (1 << VIA2_IRQ_UNUSED_BIT)
+#define VIA2_IRQ_ASC            (1 << VIA2_IRQ_ASC_BIT)
 
 #define TYPE_MOS6522_Q800_VIA2 "mos6522-q800-via2"
 OBJECT_DECLARE_SIMPLE_TYPE(MOS6522Q800VIA2State, MOS6522_Q800_VIA2)
-- 
2.20.1


