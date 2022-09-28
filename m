Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C06E5EDFC8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 17:09:01 +0200 (CEST)
Received: from localhost ([::1]:35338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odYgF-0006ZZ-Q3
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 11:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinglimin@cmss.chinamobile.com>)
 id 1odSyk-0000xg-U0
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:03:43 -0400
Received: from cmccmta3.chinamobile.com ([221.176.66.81]:12443)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dinglimin@cmss.chinamobile.com>) id 1odSyg-0006mQ-3t
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 05:03:41 -0400
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[172.16.121.99])
 by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee963340de01e9-18a6d;
 Wed, 28 Sep 2022 17:03:28 +0800 (CST)
X-RM-TRANSID: 2ee963340de01e9-18a6d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[223.108.79.103])
 by rmsmtp-syy-appsvrnew10-12035 (RichMail) with SMTP id 2f0363340ddd970-c4418; 
 Wed, 28 Sep 2022 17:03:28 +0800 (CST)
X-RM-TRANSID: 2f0363340ddd970-c4418
From: dinglimin <dinglimin@cmss.chinamobile.com>
To: thuth@redhat.com
Cc: alex.bennee@linaro.org, jsnow@redhat.com, qemu-devel@nongnu.org,
 dinglimin <dinglimin@cmss.chinamobile.com>
Subject: [PATCH] vmstate-static-checker:remove this redundant return
Date: Wed, 28 Sep 2022 17:03:12 +0800
Message-Id: <20220928090312.2537-1-dinglimin@cmss.chinamobile.com>
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

Jump statements, such as return and continue let you
change the default flow of program execution,
but jump statements that direct the control flow to
the original direction are just a waste of keystrokes.

Signed-off-by: dinglimin <dinglimin@cmss.chinamobile.com>
---
 scripts/vmstate-static-checker.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
index b369388360..dfeee8231a 100755
--- a/scripts/vmstate-static-checker.py
+++ b/scripts/vmstate-static-checker.py
@@ -367,7 +367,6 @@ def check_machine_type(s, d):
     if s["Name"] != d["Name"]:
         print("Warning: checking incompatible machine types:", end=' ')
         print("\"" + s["Name"] + "\", \"" + d["Name"] + "\"")
-    return
 
 
 def main():
-- 
2.30.0.windows.2




