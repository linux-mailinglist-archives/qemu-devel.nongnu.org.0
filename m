Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2603ADAA8
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 17:43:53 +0200 (CEST)
Received: from localhost ([::1]:59738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lud8R-0001fc-UH
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 11:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1lud7d-0000zp-PT
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:43:01 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:45088
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1lud7a-0004xT-8b
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 11:43:01 -0400
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id F09FFDA0773;
 Sat, 19 Jun 2021 17:42:54 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id 56C7A460131; Sat, 19 Jun 2021 17:42:54 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH] Update documentation to refer to new location for issues
Date: Sat, 19 Jun 2021 17:42:53 +0200
Message-Id: <20210619154253.553446-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Another update is needed for scripts/show-fixed-bugs.sh.

Stefan

 .github/lockdown.yml | 6 +++---
 README.rst           | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/.github/lockdown.yml b/.github/lockdown.yml
index 07fc2f31ee..d3546bd2bc 100644
--- a/.github/lockdown.yml
+++ b/.github/lockdown.yml
@@ -14,11 +14,11 @@ issues:
     at https://gitlab.com/qemu-project/qemu.git.
     The project does not process issues filed on GitHub.
 
-    The project issues are tracked on Launchpad:
-    https://bugs.launchpad.net/qemu
+    The project issues are tracked on GitLab:
+    https://gitlab.com/qemu-project/qemu/-/issues
 
     QEMU welcomes bug report contributions. You can file new ones on:
-    https://bugs.launchpad.net/qemu/+filebug
+    https://gitlab.com/qemu-project/qemu/-/issues/new
 
 pulls:
   comment: |
diff --git a/README.rst b/README.rst
index a92c7394b7..79b19f1481 100644
--- a/README.rst
+++ b/README.rst
@@ -131,16 +131,16 @@ will be tagged as my-feature-v2.
 Bug reporting
 =============
 
-The QEMU project uses Launchpad as its primary upstream bug tracker. Bugs
+The QEMU project uses GitLab issues to track bugs. Bugs
 found when running code built from QEMU git or upstream released sources
 should be reported via:
 
-* `<https://bugs.launchpad.net/qemu/>`_
+* `<https://gitlab.com/qemu-project/qemu/-/issues>`_
 
 If using QEMU via an operating system vendor pre-built binary package, it
 is preferable to report bugs to the vendor's own bug tracker first. If
 the bug is also known to affect latest upstream code, it can also be
-reported via launchpad.
+reported via GitLab.
 
 For additional information on bug reporting consult:
 
-- 
2.30.2


