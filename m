Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992E85EE072
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:29:45 +0200 (CEST)
Received: from localhost ([::1]:44088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odZ0K-00076g-67
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:29:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinglimin@cmss.chinamobile.com>)
 id 1odS5U-0002p3-Fr
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:06:37 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:4368)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dinglimin@cmss.chinamobile.com>) id 1odS5P-000766-Ic
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 04:06:35 -0400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.3])
 by rmmx-syy-dmz-app10-12010 (RichMail) with SMTP id 2eea6334007c02b-16d82;
 Wed, 28 Sep 2022 16:06:20 +0800 (CST)
X-RM-TRANSID: 2eea6334007c02b-16d82
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
 by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee2633400790a6-c2973;
 Wed, 28 Sep 2022 16:06:20 +0800 (CST)
X-RM-TRANSID: 2ee2633400790a6-c2973
From: dinglimin <dinglimin@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
 "dinglimin@cmss.chinamobile.com" <dinglimin@cmss.chinamobile.com>
Subject: [PATCH] tests/migration: remove the unused local variable
Date: Wed, 28 Sep 2022 16:05:55 +0800
Message-Id: <20220928080555.2263-1-dinglimin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.30.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=221.176.66.81;
 envelope-from=dinglimin@cmss.chinamobile.com; helo=cmccmta3.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Sep 2022 09:54:58 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "dinglimin@cmss.chinamobile.com" <dinglimin@cmss.chinamobile.com>

Remove the unused local variable "records".

Signed-off-by: dinglimin <dinglimin@cmss.chinamobile.com>
---
 tests/migration/guestperf/engine.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
index 87a6ab2009..59fca2c70b 100644
--- a/tests/migration/guestperf/engine.py
+++ b/tests/migration/guestperf/engine.py
@@ -65,7 +65,6 @@ def _vcpu_timing(self, pid, tid_list):
         return records
 
     def _cpu_timing(self, pid):
-        records = []
         now = time.time()
 
         jiffies_per_sec = os.sysconf(os.sysconf_names['SC_CLK_TCK'])
-- 
2.30.0.windows.2




