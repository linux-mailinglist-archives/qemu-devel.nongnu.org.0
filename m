Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BF17E0A5
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Aug 2019 18:58:01 +0200 (CEST)
Received: from localhost ([::1]:57768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1htEOu-00089E-RA
	for lists+qemu-devel@lfdr.de; Thu, 01 Aug 2019 12:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57699)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htEFa-0004vX-8q
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1htEFY-0006BV-4X
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:22 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:35921 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1htEFX-00067q-1P
 for qemu-devel@nongnu.org; Thu, 01 Aug 2019 12:48:20 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 45D141A2276;
 Thu,  1 Aug 2019 18:48:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 238A91A2279;
 Thu,  1 Aug 2019 18:48:15 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Thu,  1 Aug 2019 18:45:21 +0200
Message-Id: <1564677923-23173-11-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564677923-23173-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1564677923-23173-1-git-send-email-aleksandar.markovic@rt-rk.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PATCH for 4.2 v5 10/12] target/mips: Style
 improvements in machine.c
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
Cc: arikalo@wavecomp.com, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

Fixes mostly errors and warings reported by 'checkpatch.pl -f'.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 target/mips/machine.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/mips/machine.c b/target/mips/machine.c
index e23b767..06887d8 100644
--- a/target/mips/machine.c
+++ b/target/mips/machine.c
@@ -25,7 +25,7 @@ static int get_fpr(QEMUFile *f, void *pv, size_t size,
     int i;
     fpr_t *v = pv;
     /* Restore entire MSA vector register */
-    for (i = 0; i < MSA_WRLEN/64; i++) {
+    for (i = 0; i < MSA_WRLEN / 64; i++) {
         qemu_get_sbe64s(f, &v->wr.d[i]);
     }
     return 0;
@@ -37,7 +37,7 @@ static int put_fpr(QEMUFile *f, void *pv, size_t size,
     int i;
     fpr_t *v = pv;
     /* Save entire MSA vector register */
-    for (i = 0; i < MSA_WRLEN/64; i++) {
+    for (i = 0; i < MSA_WRLEN / 64; i++) {
         qemu_put_sbe64s(f, &v->wr.d[i]);
     }
 
-- 
2.7.4


