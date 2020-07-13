Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B91D21CC85
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 02:33:52 +0200 (CEST)
Received: from localhost ([::1]:60846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jumPn-0001yc-BN
	for lists+qemu-devel@lfdr.de; Sun, 12 Jul 2020 20:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1jumMw-0005WR-NH
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 20:30:54 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:12786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wang.yi59@zte.com.cn>)
 id 1jumMu-0004eF-TY
 for qemu-devel@nongnu.org; Sun, 12 Jul 2020 20:30:54 -0400
Received: from mse-fl2.zte.com.cn (unknown [10.30.14.239])
 by Forcepoint Email with ESMTPS id 1C6357BDE411607E9D48
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 08:30:50 +0800 (CST)
Received: from notes_smtp.zte.com.cn (notessmtp.zte.com.cn [10.30.1.239])
 by mse-fl2.zte.com.cn with ESMTP id 06D0Um9v001592
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 08:30:48 +0800 (GMT-8)
 (envelope-from wang.yi59@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2020071308305086-4262428 ;
 Mon, 13 Jul 2020 08:30:50 +0800 
From: Yi Wang <wang.yi59@zte.com.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH] block/vmdk: Remove superfluous breaks
Date: Mon, 13 Jul 2020 08:34:00 +0800
Message-Id: <1594600440-23217-1-git-send-email-wang.yi59@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2020-07-13 08:30:51,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2020-07-13 08:30:49, Serialize complete at 2020-07-13 08:30:49
X-MAIL: mse-fl2.zte.com.cn 06D0Um9v001592
Received-SPF: pass client-ip=63.217.80.70; envelope-from=wang.yi59@zte.com.cn;
 helo=mxhk.zte.com.cn
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/12 20:30:38
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
---
 block/vmdk.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/block/vmdk.c b/block/vmdk.c
index 28cec50..8f222e3 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1053,14 +1053,11 @@ static int vmdk_open_sparse(BlockDriverState *bs, BdrvChild *file, int flags,
     switch (magic) {
         case VMDK3_MAGIC:
             return vmdk_open_vmfs_sparse(bs, file, flags, errp);
-            break;
         case VMDK4_MAGIC:
             return vmdk_open_vmdk4(bs, file, flags, options, errp);
-            break;
         default:
             error_setg(errp, "Image not in VMDK format");
             return -EINVAL;
-            break;
     }
 }
 
-- 
2.9.5


