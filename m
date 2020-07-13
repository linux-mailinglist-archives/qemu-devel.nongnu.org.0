Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8150621D262
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 11:02:50 +0200 (CEST)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juuMJ-0000tq-T5
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 05:02:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1juuL1-0007hF-LW
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:01:27 -0400
Received: from out1.zte.com.cn ([202.103.147.172]:61896 helo=mxct.zte.com.cn)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1juuKz-00032Y-Au
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 05:01:27 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 66925C4B44793CF18D8F
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 17:01:20 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notes_smtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id 06D91JEO035966
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 17:01:19 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020071317012427-4267726 ;
 Mon, 13 Jul 2020 17:01:24 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/12] virtfs-proxy-helper: Remove the superfluous break
Date: Mon, 13 Jul 2020 17:04:30 +0800
Message-Id: <1594631070-36397-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-07-13 17:01:24,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-13 17:01:20
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse-fl2.zte.com.cn 06D91JEO035966
Received-SPF: pass client-ip=202.103.147.172;
 envelope-from=wang.yi59@zte.com.cn; helo=mxct.zte.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 05:01:20
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Remove the superfluous break, as there is a "return" before it.

Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=20
---
 fsdev/virtfs-proxy-helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index de061a8..e68acc1 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -825,7 +825,6 @@ static int process=5Freply(int sock, int type,
         break;
     default:
         return -1;
-        break;
     }
     return 0;
 }
--=20
2.9.5


