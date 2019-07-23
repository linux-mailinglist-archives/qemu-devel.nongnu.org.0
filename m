Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B6A715E4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 12:18:54 +0200 (CEST)
Received: from localhost ([::1]:40852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hprsj-0005e2-NN
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 06:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59706)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hprsU-0005Eo-Rc
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:18:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.markovic@rt-rk.com>) id 1hprsT-0000u1-Ds
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:18:38 -0400
Received: from mx2.rt-rk.com ([89.216.37.149]:50204 helo=mail.rt-rk.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aleksandar.markovic@rt-rk.com>)
 id 1hprsT-0000sT-6I
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 06:18:37 -0400
Received: from localhost (localhost [127.0.0.1])
 by mail.rt-rk.com (Postfix) with ESMTP id 111871A20DA;
 Tue, 23 Jul 2019 12:18:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
Received: from rtrkw774-lin.domain.local (rtrkw774-lin.domain.local
 [10.10.13.43])
 by mail.rt-rk.com (Postfix) with ESMTPSA id E53DD1A20F3;
 Tue, 23 Jul 2019 12:18:32 +0200 (CEST)
From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 12:18:26 +0200
Message-Id: <1563877107-5486-2-git-send-email-aleksandar.markovic@rt-rk.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563877107-5486-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1563877107-5486-1-git-send-email-aleksandar.markovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 89.216.37.149
Subject: [Qemu-devel] [PULL 1/2] target/mips: Add 'fall through' comments
 for handling nanoMips' SHXS, SWXS
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

Missed in commit fb32f8c8560.

Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <1563812573-30309-2-git-send-email-aleksandar.markovic@rt-rk.=
com>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 3575eff..ca62800 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -20141,12 +20141,14 @@ static void gen_p_lsx(DisasContext *ctx, int rd=
, int rs, int rt)
         switch (extract32(ctx->opcode, 7, 4)) {
         case NM_SHXS:
             check_nms(ctx);
+            /* fall through */
         case NM_LHXS:
         case NM_LHUXS:
             tcg_gen_shli_tl(t0, t0, 1);
             break;
         case NM_SWXS:
             check_nms(ctx);
+            /* fall through */
         case NM_LWXS:
         case NM_LWC1XS:
         case NM_SWC1XS:
--=20
2.7.4


