Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C8421D26A
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 11:03:32 +0200 (CEST)
Received: from localhost ([::1]:52174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juuN1-0002iI-72
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 05:03:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1juuKV-00078W-TV
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:00:55 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:6852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1juuKU-0002yv-2G
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:00:55 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id C5957DC9731B8C955124
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 17:00:49 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id 06D90YPu091483
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 17:00:34 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020071317003980-4267709 ;
 Mon, 13 Jul 2020 17:00:39 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/12] target/ppc: Remove superfluous breaks
Date: Mon, 13 Jul 2020 17:03:45 +0800
Message-Id: <1594631025-36219-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-07-13 17:00:39,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-13 17:00:36
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse-fl1.zte.com.cn 06D90YPu091483
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
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=20
---
 target/ppc/misc=5Fhelper.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/target/ppc/misc=5Fhelper.c b/target/ppc/misc=5Fhelper.c
index 55b68d1..e43a3b4 100644
--- a/target/ppc/misc=5Fhelper.c
+++ b/target/ppc/misc=5Fhelper.c
@@ -234,25 +234,20 @@ target=5Fulong helper=5Fclcs(CPUPPCState *env, uint32=
=5Ft arg)
     case 0x0CUL:
         /* Instruction cache line size */
         return env->icache=5Fline=5Fsize;
-        break;
     case 0x0DUL:
         /* Data cache line size */
         return env->dcache=5Fline=5Fsize;
-        break;
     case 0x0EUL:
         /* Minimum cache line size */
         return (env->icache=5Fline=5Fsize < env->dcache=5Fline=5Fsize) ?
             env->icache=5Fline=5Fsize : env->dcache=5Fline=5Fsize;
-        break;
     case 0x0FUL:
         /* Maximum cache line size */
         return (env->icache=5Fline=5Fsize > env->dcache=5Fline=5Fsize) ?
             env->icache=5Fline=5Fsize : env->dcache=5Fline=5Fsize;
-        break;
     default:
         /* Undefined */
         return 0;
-        break;
     }
 }
=20
--=20
2.9.5


