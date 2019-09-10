Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA0AEA17
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Sep 2019 14:16:10 +0200 (CEST)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7f45-0001Jc-TA
	for lists+qemu-devel@lfdr.de; Tue, 10 Sep 2019 08:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyQ-0006F3-Vp
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyM-0006Kf-64
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:18 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:8683)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1i7eyL-0006Ht-Ef
 for qemu-devel@nongnu.org; Tue, 10 Sep 2019 08:10:14 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.5]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75d7792958aa-e2062;
 Tue, 10 Sep 2019 20:10:00 +0800 (CST)
X-RM-TRANSID: 2ee75d7792958aa-e2062
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.148])
 by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee35d7792822a8-7d815;
 Tue, 10 Sep 2019 20:10:00 +0800 (CST)
X-RM-TRANSID: 2ee35d7792822a8-7d815
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Date: Tue, 10 Sep 2019 20:09:26 +0800
Message-Id: <20190910120927.1669283-3-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
References: <20190910120927.1669283-1-maozhongyi@cmss.chinamobile.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 221.176.66.80
Subject: [Qemu-devel] [PATCH 2/3] tests/migration: fix a typo in comment
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
Cc: tony.nguyen@bt.com, armbru@redhat.com,
 Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: armbru@redhat.com
Cc: laurent@vivier.eu
Cc: tony.nguyen@bt.com

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 tests/migration/stress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/migration/stress.c b/tests/migration/stress.c
index e6c9a6b243..4bc3a249e6 100644
--- a/tests/migration/stress.c
+++ b/tests/migration/stress.c
@@ -194,7 +194,7 @@ static int stressone(unsigned long long ramsizeMB)
 
     /* We don't care about initial state, but we do want
      * to fault it all into RAM, otherwise the first iter
-     * of the loop below will be quite slow. We cna't use
+     * of the loop below will be quite slow. We can't use
      * 0x0 as the byte as gcc optimizes that away into a
      * calloc instead :-) */
     memset(ram, 0xfe, ramsizeMB * 1024 * 1024);
-- 
2.17.1




