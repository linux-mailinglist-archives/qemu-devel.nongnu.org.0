Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0D421D274
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 11:05:25 +0200 (CEST)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juuOp-0006BU-Sd
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 05:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1juuMA-0001xi-QG
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:02:38 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:27338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1juuM9-00039O-2i
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:02:38 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 691DC9685850706B6BA7
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 17:02:34 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id 06D92XIT037891
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 17:02:33 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020071317023844-4267747 ;
 Mon, 13 Jul 2020 17:02:38 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/12] target/sh4: Remove superfluous breaks
Date: Mon, 13 Jul 2020 17:05:42 +0800
Message-Id: <1594631142-36745-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-07-13 17:02:38,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-13 17:02:34
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse-fl2.zte.com.cn 06D92XIT037891
Received-SPF: pass client-ip=63.217.80.70; envelope-from=wang.yi59@zte.com.cn;
 helo=mxhk.zte.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 04:59:57
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: wang.yi59@zte.com.cn, Liao Pingfang <liao.pingfang@zte.com.cn>,
 wang.liang82@zte.com.cn, xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liao Pingfang <liao.pingfang@zte.com.cn>

Remove superfluous breaks, as there is a "return" before them.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 target/sh4/translate.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 6192d83..60c863d 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1542,7 +1542,6 @@ static void =5Fdecode=5Fopc(DisasContext * ctx)
         tcg=5Fgen=5Fqemu=5Fld=5Fi32(REG(0), REG(B11=5F8), ctx->memidx,
                             MO=5FTEUL | MO=5FUNALN);
         return;
-        break;
     case 0x40e9:                /* movua.l @Rm+,R0 */
         CHECK=5FSH4A
         /* Load non-boundary-aligned data */
@@ -1550,7 +1549,6 @@ static void =5Fdecode=5Fopc(DisasContext * ctx)
                             MO=5FTEUL | MO=5FUNALN);
         tcg=5Fgen=5Faddi=5Fi32(REG(B11=5F8), REG(B11=5F8), 4);
         return;
-        break;
     case 0x0029:		/* movt Rn */
         tcg=5Fgen=5Fmov=5Fi32(REG(B11=5F8), cpu=5Fsr=5Ft);
 	return;
@@ -1638,7 +1636,6 @@ static void =5Fdecode=5Fopc(DisasContext * ctx)
         CHECK=5FSH4A
         tcg=5Fgen=5Fmb(TCG=5FMO=5FALL | TCG=5FBAR=5FSC);
         return;
-        break;
     case 0x4024:		/* rotcl Rn */
 	{
 	    TCGv tmp =3D tcg=5Ftemp=5Fnew();
--=20
2.9.5


