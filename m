Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260DBDE59
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Sep 2019 14:54:36 +0200 (CEST)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iD6oV-00079m-1U
	for lists+qemu-devel@lfdr.de; Wed, 25 Sep 2019 08:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gd-0001G9-JE
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1iD6gb-0002ET-Ua
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:27 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:56097 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1iD6gb-0002DP-If
 for qemu-devel@nongnu.org; Wed, 25 Sep 2019 08:46:25 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id A06B51A228A;
 Wed, 25 Sep 2019 14:46:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 6DE911A23A5;
 Wed, 25 Sep 2019 14:46:21 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/20] target/mips: Clean up mips-defs.h
Date: Wed, 25 Sep 2019 14:45:56 +0200
Message-Id: <1569415572-19635-5-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1569415572-19635-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 89.216.37.149
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
Cc: arikalo@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Mostly fix errors and warnings reported by 'checkpatch.pl -f'.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/mips-defs.h | 53 ++++++++++++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 25 deletions(-)

diff --git a/target/mips/mips-defs.h b/target/mips/mips-defs.h
index bbf056a..938c0de 100644
--- a/target/mips/mips-defs.h
+++ b/target/mips/mips-defs.h
@@ -2,7 +2,7 @@
 #define QEMU_MIPS_DEFS_H
 
 /* If we want to use host float regs... */
-//#define USE_HOST_FLOAT_REGS
+/* #define USE_HOST_FLOAT_REGS */
 
 /* Real pages are variable size... */
 #define MIPS_TLB_MAX 128
@@ -57,43 +57,46 @@
 #define ASE_MXU           0x0200000000000000ULL
 
 /* MIPS CPU defines. */
-#define		CPU_MIPS1	(ISA_MIPS1)
-#define		CPU_MIPS2	(CPU_MIPS1 | ISA_MIPS2)
-#define		CPU_MIPS3	(CPU_MIPS2 | ISA_MIPS3)
-#define		CPU_MIPS4	(CPU_MIPS3 | ISA_MIPS4)
-#define		CPU_VR54XX	(CPU_MIPS4 | INSN_VR54XX)
-#define         CPU_R5900       (CPU_MIPS3 | INSN_R5900)
-#define		CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
-#define		CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F)
+#define CPU_MIPS1       (ISA_MIPS1)
+#define CPU_MIPS2       (CPU_MIPS1 | ISA_MIPS2)
+#define CPU_MIPS3       (CPU_MIPS2 | ISA_MIPS3)
+#define CPU_MIPS4       (CPU_MIPS3 | ISA_MIPS4)
+#define CPU_VR54XX      (CPU_MIPS4 | INSN_VR54XX)
+#define CPU_R5900       (CPU_MIPS3 | INSN_R5900)
+#define CPU_LOONGSON2E  (CPU_MIPS3 | INSN_LOONGSON2E)
+#define CPU_LOONGSON2F  (CPU_MIPS3 | INSN_LOONGSON2F)
 
-#define		CPU_MIPS5	(CPU_MIPS4 | ISA_MIPS5)
+#define CPU_MIPS5       (CPU_MIPS4 | ISA_MIPS5)
 
 /* MIPS Technologies "Release 1" */
-#define		CPU_MIPS32	(CPU_MIPS2 | ISA_MIPS32)
-#define		CPU_MIPS64	(CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
+#define CPU_MIPS32      (CPU_MIPS2 | ISA_MIPS32)
+#define CPU_MIPS64      (CPU_MIPS5 | CPU_MIPS32 | ISA_MIPS64)
 
 /* MIPS Technologies "Release 2" */
-#define		CPU_MIPS32R2	(CPU_MIPS32 | ISA_MIPS32R2)
-#define		CPU_MIPS64R2	(CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
+#define CPU_MIPS32R2    (CPU_MIPS32 | ISA_MIPS32R2)
+#define CPU_MIPS64R2    (CPU_MIPS64 | CPU_MIPS32R2 | ISA_MIPS64R2)
 
 /* MIPS Technologies "Release 3" */
-#define CPU_MIPS32R3 (CPU_MIPS32R2 | ISA_MIPS32R3)
-#define CPU_MIPS64R3 (CPU_MIPS64R2 | CPU_MIPS32R3 | ISA_MIPS64R3)
+#define CPU_MIPS32R3    (CPU_MIPS32R2 | ISA_MIPS32R3)
+#define CPU_MIPS64R3    (CPU_MIPS64R2 | CPU_MIPS32R3 | ISA_MIPS64R3)
 
 /* MIPS Technologies "Release 5" */
-#define CPU_MIPS32R5 (CPU_MIPS32R3 | ISA_MIPS32R5)
-#define CPU_MIPS64R5 (CPU_MIPS64R3 | CPU_MIPS32R5 | ISA_MIPS64R5)
+#define CPU_MIPS32R5    (CPU_MIPS32R3 | ISA_MIPS32R5)
+#define CPU_MIPS64R5    (CPU_MIPS64R3 | CPU_MIPS32R5 | ISA_MIPS64R5)
 
 /* MIPS Technologies "Release 6" */
-#define CPU_MIPS32R6 (CPU_MIPS32R5 | ISA_MIPS32R6)
-#define CPU_MIPS64R6 (CPU_MIPS64R5 | CPU_MIPS32R6 | ISA_MIPS64R6)
+#define CPU_MIPS32R6    (CPU_MIPS32R5 | ISA_MIPS32R6)
+#define CPU_MIPS64R6    (CPU_MIPS64R5 | CPU_MIPS32R6 | ISA_MIPS64R6)
 
 /* Wave Computing: "nanoMIPS" */
-#define CPU_NANOMIPS32 (CPU_MIPS32R6 | ISA_NANOMIPS32)
+#define CPU_NANOMIPS32  (CPU_MIPS32R6 | ISA_NANOMIPS32)
 
-/* Strictly follow the architecture standard:
-   - Disallow "special" instruction handling for PMON/SPIM.
-   Note that we still maintain Count/Compare to match the host clock. */
-//#define MIPS_STRICT_STANDARD 1
+/*
+ * Strictly follow the architecture standard:
+ * - Disallow "special" instruction handling for PMON/SPIM.
+ * Note that we still maintain Count/Compare to match the host clock.
+ *
+ * #define MIPS_STRICT_STANDARD 1
+ */
 
 #endif /* QEMU_MIPS_DEFS_H */
-- 
2.7.4


