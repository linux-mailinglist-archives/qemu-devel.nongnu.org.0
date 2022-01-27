Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7E249ECEC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 22:00:08 +0100 (CET)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDBsF-0002lA-3a
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 16:00:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmo-0007dh-G6
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:30 -0500
Received: from [2001:41c9:1:41f::167] (port=36814
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmn-0004vl-41
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 15:54:30 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe] (helo=kentang.home)
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nDBmI-000BHM-9I; Thu, 27 Jan 2022 20:54:02 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: laurent@vivier.eu,
	qemu-devel@nongnu.org
Date: Thu, 27 Jan 2022 20:53:57 +0000
Message-Id: <20220127205405.23499-4-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
References: <20220127205405.23499-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH 03/11] mac_via: use IFR bit flag constants for VIA2 IRQs
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
---
 include/hw/misc/mac_via.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/include/hw/misc/mac_via.h b/include/hw/misc/mac_via.h
index b0c3825c9b..2df1ab01b6 100644
--- a/include/hw/misc/mac_via.h
+++ b/include/hw/misc/mac_via.h
@@ -80,11 +80,10 @@ struct MOS6522Q800VIA1State {
 
 
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
 
-- 
2.20.1


