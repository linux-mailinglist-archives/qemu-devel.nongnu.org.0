Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CD1AF4AF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 05:33:29 +0200 (CEST)
Received: from localhost ([::1]:46264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7tNn-0008Js-DS
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 23:33:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLx-00077K-1X
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLv-0003gW-QR
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:32 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:2079)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7tLv-0003ZP-7H
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 23:31:31 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee35d786a82010-eb73f;
 Wed, 11 Sep 2019 11:31:15 +0800 (CST)
X-RM-TRANSID: 2ee35d786a82010-eb73f
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15d786a7b269-ac9b4;
 Wed, 11 Sep 2019 11:31:15 +0800 (CST)
X-RM-TRANSID: 2ee15d786a7b269-ac9b4
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 11:31:03 +0800
Message-Id: <c60e8741dec930089b42ebb83b0ff15f2270078a.1568170994.git.maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
MIME-Version: 1.0
In-Reply-To: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
References: <cover.1568170994.git.maozhongyi@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.79
Subject: [Qemu-devel] [PATCH v2 2/3] tests/migration: fix a typo in comment
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
Cc: tony.nguyen@bt.com, alex.bennee@linaro.org, armbru@redhat.com,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: armbru@redhat.com
Cc: laurent@vivier.eu
Cc: tony.nguyen@bt.com

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/migration/stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index 6cbb2d49d3..19a6eff5fd 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -191,7 +191,7 @@ static int stressone(unsigned long long ramsizeMB)
 
     /* We don't care about initial state, but we do want
      * to fault it all into RAM, otherwise the first iter
-     * of the loop below will be quite slow. We cna't use
+     * of the loop below will be quite slow. We can't use
      * 0x0 as the byte as gcc optimizes that away into a
      * calloc instead :-) */
     memset(ram, 0xfe, ramsizeMB * 1024 * 1024);
-- 
2.17.1




