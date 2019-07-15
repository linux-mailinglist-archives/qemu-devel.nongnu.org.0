Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90B869CC6
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jul 2019 22:30:14 +0200 (CEST)
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hn7bx-0003pj-03
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 16:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57218)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn7bJ-0002Pu-49
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hn7bI-000562-2I
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:33 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:38306 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hn7bH-00054s-RL
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 16:29:31 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 3D8FD1A1FDC;
 Mon, 15 Jul 2019 22:29:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id 1E66E1A1FED;
 Mon, 15 Jul 2019 22:29:28 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2019 22:29:22 +0200
Message-Id: <1563222562-2755-4-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563222562-2755-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1563222562-2755-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 3/3] target/mips: Add missing 'break' for
 certain cases of MTTR handling
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
Message-Id: <1563220847-14630-5-git-send-email-aleksandar.markovic@rt-rk.=
com>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index b4898d5..3575eff 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -10055,6 +10055,7 @@ static void gen_mttr(CPUMIPSState *env, DisasCont=
ext *ctx, int rd, int rt,
                 gen_mtc0(ctx, t0, rd, sel);
                 break;
             }
+            break;
         case 12:
             switch (sel) {
             case 0:
@@ -10064,6 +10065,7 @@ static void gen_mttr(CPUMIPSState *env, DisasCont=
ext *ctx, int rd, int rt,
                 gen_mtc0(ctx, t0, rd, sel);
                 break;
             }
+            break;
         case 13:
             switch (sel) {
             case 0:
--=20
2.7.4


