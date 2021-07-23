Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53DF3D34F6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 09:01:23 +0200 (CEST)
Received: from localhost ([::1]:52540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6pBQ-0004J1-Ms
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 03:01:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maozhongyi@cmss.chinamobile.com>)
 id 1m6p9Q-0003Ee-M1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:59:17 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:46917)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <maozhongyi@cmss.chinamobile.com>) id 1m6p9N-0001NZ-7z
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:59:16 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by
 rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee760fa688c85a-63fbd;
 Fri, 23 Jul 2021 14:58:20 +0800 (CST)
X-RM-TRANSID: 2ee760fa688c85a-63fbd
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from maozy-host.mshome.net (unknown[10.42.68.12])
 by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee160fa6883c20-527a7;
 Fri, 23 Jul 2021 14:58:20 +0800 (CST)
X-RM-TRANSID: 2ee160fa6883c20-527a7
From: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] docs: Update path that mentions deprecated.rst
Date: Fri, 23 Jul 2021 14:58:28 +0800
Message-Id: <20210723065828.1336760-1-maozhongyi@cmss.chinamobile.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=221.176.66.80;
 envelope-from=maozhongyi@cmss.chinamobile.com; helo=cmccmta2.chinamobile.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, Mao Zhongyi <maozhongyi@cmss.chinamobile.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, pbonzini@redhat.com,
 vkuznets@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missed in commit f3478392 "docs: Move deprecation, build
and license info out of system/"

Signed-off-by: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>
---
 MAINTAINERS       | 2 +-
 configure         | 2 +-
 target/i386/cpu.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4256ad1adb..701d071258 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3435,7 +3435,7 @@ F: contrib/gitdm/*
 
 Incompatible changes
 R: libvir-list@redhat.com
-F: docs/system/deprecated.rst
+F: docs/about/deprecated.rst
 
 Build System
 ------------
diff --git a/configure b/configure
index b5965b159f..dfbbfc5e94 100755
--- a/configure
+++ b/configure
@@ -5242,7 +5242,7 @@ fi
 
 if test -n "${deprecated_features}"; then
     echo "Warning, deprecated features enabled."
-    echo "Please see docs/system/deprecated.rst"
+    echo "Please see docs/about/deprecated.rst"
     echo "  features: ${deprecated_features}"
 fi
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 48b55ebd0a..129602fc97 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4110,7 +4110,7 @@ static const X86CPUDefinition builtin_x86_defs[] = {
  * none", but this is just for compatibility while libvirt isn't
  * adapted to resolve CPU model versions before creating VMs.
  * See "Runnability guarantee of CPU models" at
- * docs/system/deprecated.rst.
+ * docs/about/deprecated.rst.
  */
 X86CPUVersion default_cpu_version = 1;
 
-- 
2.31.1




