Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 042365CEF7
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 13:59:43 +0200 (CEST)
Received: from localhost ([::1]:51990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiHRm-0006Oy-6Y
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 07:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35959)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiHKE-000189-5a
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hiHKC-0006pn-N0
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:54 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:41145 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hiHKC-0005M5-9f
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 07:51:52 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A6F101A22D0;
 Tue,  2 Jul 2019 13:50:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id BC4A91A2432;
 Tue,  2 Jul 2019 13:50:33 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org,
	arikalo@wavecomp.com
Date: Tue,  2 Jul 2019 13:50:11 +0200
Message-Id: <1562068213-11307-6-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562068213-11307-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1562068213-11307-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v2 5/7] target/mips: Correct comments in
 msa_helper.c
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
Cc: amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fix some errors in comments for MSA helpers.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
---
 target/mips/msa_helper.c | 58 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 41 insertions(+), 17 deletions(-)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 8bad636..5377bc1 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -72,9 +72,6 @@
  * --------
  *
  * +---------------+----------------------------------------------------------+
- * | BMNZ.V        | Vector Bit Move If Not Zero                              |
- * | BMZ.V         | Vector Bit Move If Zero                                  |
- * | BSEL.V        | Vector Bit Select                                        |
  * | BINSL.B       | Vector Bit Insert Left (byte)                            |
  * | BINSL.H       | Vector Bit Insert Left (halfword)                        |
  * | BINSL.W       | Vector Bit Insert Left (word)                            |
@@ -83,6 +80,9 @@
  * | BINSR.H       | Vector Bit Insert Right (halfword)                       |
  * | BINSR.W       | Vector Bit Insert Right (word)                           |
  * | BINSR.D       | Vector Bit Insert Right (doubleword)                     |
+ * | BMNZ.V        | Vector Bit Move If Not Zero                              |
+ * | BMZ.V         | Vector Bit Move If Zero                                  |
+ * | BSEL.V        | Vector Bit Select                                        |
  * +---------------+----------------------------------------------------------+
  */
 
@@ -179,12 +179,12 @@
  * | ADDV.H        | Vector Add (halfword)                                    |
  * | ADDV.W        | Vector Add (word)                                        |
  * | ADDV.D        | Vector Add (doubleword)                                  |
- * | HSUB_S.H      | Vector Signed Horizontal Add (halfword)                  |
- * | HSUB_S.W      | Vector Signed Horizontal Add (word)                      |
- * | HSUB_S.D      | Vector Signed Horizontal Add (doubleword)                |
- * | HSUB_U.H      | Vector Unigned Horizontal Add (halfword)                 |
- * | HSUB_U.W      | Vector Unigned Horizontal Add (word)                     |
- * | HSUB_U.D      | Vector Unigned Horizontal Add (doubleword)               |
+ * | HADD_S.H      | Vector Signed Horizontal Add (halfword)                  |
+ * | HADD_S.W      | Vector Signed Horizontal Add (word)                      |
+ * | HADD_S.D      | Vector Signed Horizontal Add (doubleword)                |
+ * | HADD_U.H      | Vector Unigned Horizontal Add (halfword)                 |
+ * | HADD_U.W      | Vector Unigned Horizontal Add (word)                     |
+ * | HADD_U.D      | Vector Unigned Horizontal Add (doubleword)               |
  * +---------------+----------------------------------------------------------+
  */
 
@@ -279,6 +279,18 @@
  * | DOTP_U.H      | Vector Unsigned Dot Product (halfword)                   |
  * | DOTP_U.W      | Vector Unsigned Dot Product (word)                       |
  * | DOTP_U.D      | Vector Unsigned Dot Product (doubleword)                 |
+ * | DPADD_S.H     | Vector Signed Dot Product (halfword)                     |
+ * | DPADD_S.W     | Vector Signed Dot Product (word)                         |
+ * | DPADD_S.D     | Vector Signed Dot Product (doubleword)                   |
+ * | DPADD_U.H     | Vector Unsigned Dot Product (halfword)                   |
+ * | DPADD_U.W     | Vector Unsigned Dot Product (word)                       |
+ * | DPADD_U.D     | Vector Unsigned Dot Product (doubleword)                 |
+ * | DPSUB_S.H     | Vector Signed Dot Product (halfword)                     |
+ * | DPSUB_S.W     | Vector Signed Dot Product (word)                         |
+ * | DPSUB_S.D     | Vector Signed Dot Product (doubleword)                   |
+ * | DPSUB_U.H     | Vector Unsigned Dot Product (halfword)                   |
+ * | DPSUB_U.W     | Vector Unsigned Dot Product (word)                       |
+ * | DPSUB_U.D     | Vector Unsigned Dot Product (doubleword)                 |
  * +---------------+----------------------------------------------------------+
  */
 
@@ -389,14 +401,14 @@
  * | SUBS_U.H      | Vector Unsigned Saturated Subtract (of Uns.) (halfword)  |
  * | SUBS_U.W      | Vector Unsigned Saturated Subtract (of Uns.) (word)      |
  * | SUBS_U.D      | Vector Unsigned Saturated Subtract (of Uns.) (doubleword)|
- * | SUBSUS_S.B    | Vector Uns. Sat. Subtract (of S. from Uns.) (byte)       |
- * | SUBSUS_S.H    | Vector Uns. Sat. Subtract (of S. from Uns.) (halfword)   |
- * | SUBSUS_S.W    | Vector Uns. Sat. Subtract (of S. from Uns.) (word)       |
- * | SUBSUS_S.D    | Vector Uns. Sat. Subtract (of S. from Uns.) (doubleword) |
- * | SUBSUU_U.B    | Vector Signed Saturated Subtract (of Uns.) (byte)        |
- * | SUBSUU_U.H    | Vector Signed Saturated Subtract (of Uns.) (halfword)    |
- * | SUBSUU_U.W    | Vector Signed Saturated Subtract (of Uns.) (word)        |
- * | SUBSUU_U.D    | Vector Signed Saturated Subtract (of Uns.) (doubleword)  |
+ * | SUBSUS_U.B    | Vector Uns. Sat. Subtract (of S. from Uns.) (byte)       |
+ * | SUBSUS_U.H    | Vector Uns. Sat. Subtract (of S. from Uns.) (halfword)   |
+ * | SUBSUS_U.W    | Vector Uns. Sat. Subtract (of S. from Uns.) (word)       |
+ * | SUBSUS_U.D    | Vector Uns. Sat. Subtract (of S. from Uns.) (doubleword) |
+ * | SUBSUU_S.B    | Vector Signed Saturated Subtract (of Uns.) (byte)        |
+ * | SUBSUU_S.H    | Vector Signed Saturated Subtract (of Uns.) (halfword)    |
+ * | SUBSUU_S.W    | Vector Signed Saturated Subtract (of Uns.) (word)        |
+ * | SUBSUU_S.D    | Vector Signed Saturated Subtract (of Uns.) (doubleword)  |
  * | SUBV.B        | Vector Subtract (byte)                                   |
  * | SUBV.H        | Vector Subtract (halfword)                               |
  * | SUBV.W        | Vector Subtract (word)                                   |
@@ -450,6 +462,18 @@
 
 
 /*
+ * Move
+ * ----
+ *
+ * +---------------+----------------------------------------------------------+
+ * | MOVE.V        | Vector Move                                              |
+ * +---------------+----------------------------------------------------------+
+ */
+
+/* TODO: insert Move group helpers here */
+
+
+/*
  * Pack
  * ----
  *
-- 
2.7.4


