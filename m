Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504B469CC5
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 22:30:14 +0200 (CEST)
Received: from localhost ([::1]:42693 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn7bw-0003yu-Be
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 16:30:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57221)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn7bJ-0002Px-BB
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn7bI-00056K-7b
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:33 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:38309 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hn7bH-00054v-Vr
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:32 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 38F2E1A1FA0;
 Mon, 15 Jul 2019 22:29:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 158201A1FE0;
 Mon, 15 Jul 2019 22:29:28 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 22:29:21 +0200
Message-Id: <1563222562-2755-3-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563222562-2755-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1563222562-2755-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 2/3] target/mips: Add missing 'break' for
 certain cases of MFTR handling
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aleksandar Markovic <amarkovic@wavecomp.com>

This was found by GCC 8.3 static analysis.

Fixes: ead9360e2fb

Reported-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Message-Id: <1563220847-14630-4-git-send-email-aleksandar.markovic@rt-rk.=
com>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index cce1f12..b4898d5 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -9826,6 +9826,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContex=
t *ctx, int rt, int rd,
                 gen_mfc0(ctx, t0, rt, sel);
                 break;
             }
+            break;
         case 12:
             switch (sel) {
             case 0:
@@ -9835,6 +9836,7 @@ static void gen_mftr(CPUMIPSState *env, DisasContex=
t *ctx, int rt, int rd,
                 gen_mfc0(ctx, t0, rt, sel);
                 break;
             }
+            break;
         case 13:
             switch (sel) {
             case 0:
--=20
2.7.4


