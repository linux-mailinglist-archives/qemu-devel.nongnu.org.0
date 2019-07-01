Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C612B379B9
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 18:32:37 +0200 (CEST)
Received: from localhost ([127.0.0.1]:34995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYvJc-0007Bi-U7
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 12:32:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYvEt-0003TL-Uz
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 12:27:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aleksandar.markovic@rt-rk.com>) id 1hYvEs-0003UC-1t
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 12:27:43 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:43415 helo=mail.rt-rk.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
	id 1hYvEr-0003RW-9o
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 12:27:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.rt-rk.com (Postfix) with ESMTP id 1B81B1A211E;
	Thu,  6 Jun 2019 18:27:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
	[10.10.13.43])
	by mail.rt-rk.com (Postfix) with ESMTPSA id DE6B81A1F8A;
	Thu,  6 Jun 2019 18:27:38 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:27:13 +0200
Message-Id: <1559838440-9866-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559838440-9866-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1559838440-9866-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH v4 03/10] target/mips: Outline places for
 future MSA helpers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Outline places for future MSA helpers to follow the same organization
as in MSA tests.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Message-Id: <1559745316-1454-7-git-send-email-aleksandar.markovic@rt-rk.com>
---
 target/mips/msa_helper.c | 138 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index 851450c..7b73e22 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -42,6 +42,144 @@
 /* Element-by-element access macros */
 #define DF_ELEMENTS(df) (MSA_WRLEN / DF_BITS(df))
 
+
+
+/*
+ * Bit Count
+ * ---------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Bit move
+ * --------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Bit Set
+ * -------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Fixed Multiply
+ * --------------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Add
+ * -------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Average
+ * -----------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Compare
+ * -----------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Divide
+ * ----------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Dot Product
+ * ---------------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Max Min
+ * -----------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Modulo
+ * ----------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Multiply
+ * ------------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Int Subtract
+ * ------------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Interleave
+ * ----------
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Logic
+ * -----
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Pack
+ * ----
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
+/*
+ * Shift
+ * -----
+ */
+
+/* TODO: insert appropriate helpers here */
+
+
 static inline void msa_move_v(wr_t *pwd, wr_t *pws)
 {
     uint32_t i;
-- 
2.7.4


