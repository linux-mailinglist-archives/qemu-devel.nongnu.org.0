Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AABC24EE3EF
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:21:10 +0200 (CEST)
Received: from localhost ([::1]:45120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na3AD-0008PK-NV
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:21:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38O-0005jP-Sz; Thu, 31 Mar 2022 18:19:17 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38N-00019W-Ah; Thu, 31 Mar 2022 18:19:16 -0400
Received: from quad ([82.142.13.234]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MIdW7-1nmPbP11HR-00Ecx1; Fri, 01
 Apr 2022 00:19:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] tests/lcitool: Do not use a hard-coded /usr/bin/python3 as
 python interpreter
Date: Fri,  1 Apr 2022 00:18:57 +0200
Message-Id: <20220331221857.433867-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331221857.433867-1-laurent@vivier.eu>
References: <20220331221857.433867-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qpxTbYOVp2KVYXMAV9/hvcc3WGbZhNAQpd1zjP+BYsTTip83A9b
 OH7kD1EjD4ZkZXotNd+upyTHp7dysx/i8qWok3Pl6dQgaV532oGRHRtaq30p5urr0/bF/AW
 d40BuJchjomeNGh6z1Ud8rZW2lAWMMXj6Gzj3z/V1pHxKTIjg6iZJszMoLqnWx6ZhAv10+h
 AmtNGxuO7ID1GLBSFrMuA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:83GrVj4BnbQ=:yCgduO7WA7H+UAnEu81oAb
 ehaTMNnhFguzhrqfO3fuKtCZXEL2JGM+ExXWio9PeGEzjA10BtUD2MHfQOlHe6LB3keOpxwj+
 LOQK5/bCeSQ4VDot3whEdq7XMyus6v2fPrwYMWlQmLB3wI/p0bMAyiCg0fXnm5UYfv4NaZkkC
 YR6L58gDi4Bg4qLCuKxJ/MRBuWfS1wjCGQTrLA/j1fl1aVvf7GcAROFivdhyAdxJC+COE3VO8
 88pmEz8zwaai6VkgmiTUSBzZRWhXTmlQXkvXJi636HGCOChteXuUcCUEL6aUTimW823uJ0Zzk
 DBbmnWrfbkx3SXA36RSnQZzfYSk6TTMo8pwRmAo8L6RmWdxnvT+KErBOH0fTIAYLIyXB2br/t
 HitOvwD0souUrMYFSWOElMuSq7ZIiUZ9F/NZogr78oX/lSmxv7DF4s+PznWXVt6tnuiYLoYHi
 MsQaH7mugzxDotNMq3Kw7alSrb9n2Ab/62OmqVZmiKJhWfC6uHXESCFNZ62uccI5BneiQhvMn
 zQYaT+yf/vgO7ny8hiOox5zaLraFUTl+/93swC2FTC9JeJyIh8W4AHuJCp+MivuZtE9VMerIV
 jZ8Cp1lWdik+8QzAb12WBJWMsrHJpSuMvuRKkZLuCcHw2RUnL6ReRaAU0Z9vrnqYAGsHAF3ta
 i3Hspd3/1asvFsXKe6mdkbqnERusBSe5YdDybGOY0CcN97iyBAfbV0t9cql+4H9mtRls=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

When running "make lcitool-refresh", this currently uses the hard-coded
/usr/bin/python3 from the script's shebang line for running Python.
That's bad, since neither /usr/bin/python3 is guaranteed to exist, nor
does it honor the python interpreter that the user might have chosen
while running the "configure" script. Thus let's rather use $(PYTHON)
in the Makefile, and improve the shebang line in the script in case
someone runs this directly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220329063958.262669-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/lcitool/Makefile.include | 2 +-
 tests/lcitool/refresh          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
index 6b215adcd1e0..3780185c7c45 100644
--- a/tests/lcitool/Makefile.include
+++ b/tests/lcitool/Makefile.include
@@ -14,4 +14,4 @@ lcitool-help: lcitool
 
 lcitool-refresh:
 	$(call quiet-command, cd $(SRC_PATH) && git submodule update --init tests/lcitool/libvirt-ci)
-	$(call quiet-command, $(LCITOOL_REFRESH))
+	$(call quiet-command, $(PYTHON) $(LCITOOL_REFRESH))
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 1f00281b443d..2d198ad281a0 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Re-generate container recipes
 #
-- 
2.35.1


