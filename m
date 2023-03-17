Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 943DE6BEAFB
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:19:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdAuV-0006Xy-Pr; Fri, 17 Mar 2023 10:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuQ-0006WP-73; Fri, 17 Mar 2023 10:18:18 -0400
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pdAuO-0004tn-CU; Fri, 17 Mar 2023 10:18:17 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1M3DFj-1peYUI3Uyb-003h35; Fri, 17
 Mar 2023 15:18:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 3/3] docs/sphinx/kerneldoc.py: Honour --enable-werror
Date: Fri, 17 Mar 2023 15:18:08 +0100
Message-Id: <20230317141808.826875-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317141808.826875-1-laurent@vivier.eu>
References: <20230317141808.826875-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:48N5l6aiuxH0hdnn0k0TIWGrUEGIgZc5NQqJg76cXXi8XEoV+6I
 jizUdQQ6quBytLAw7DXT0xR0t5++T54bdMXJ2/I1Fy00AZPJur6EDXGBJ5LTy9bbLqWQJPi
 fCu4Y7IoUmr6l5chNGVztJ1W9kLRiQpO6CC4IboZXymtTx4oDC8U9guzDfwluIf2A1QoDu6
 G1hyBDV4HTzR8MKgrxdWQ==
UI-OutboundReport: notjunk:1;M01:P0:kpVQatv5Nr0=;AieoV6LN/5SkR94CDn3ejECo2Uo
 rnmqJAJOG9glKnlYFJikYzT29ic5bTiyJJjTShlmYqca1YhGwX16dIhNRz5t27hCjwSQ9SBU7
 2FyAlJewKNtLAJC8Ao4gQErfaiyeX9P5bx8Wy4LKRuE5n4LXq810v+D4htv2j43aQfEmBUC2s
 1O0NzkSc8t761Bceg7vhneutvNcFSyWDCHezHdreQkWvWUNT4aBHPTdERlogwzDuwTs+1rGjZ
 mxqmsE825Qvn5MlkqOicn9YdCkuHvkLrvHJg8GznLiUZbB2Ing7ZdyIZ4/W2oJH7ERiSh26m6
 +Y6h7xe+Qh1dd12Qhpy2uoOZj59fHfbsPuESXdhOOYdAWiJNoHAQzzUxuyYlCZC/YKuVq9yHi
 FBvINxd62KgoXYXHg3yaJfWCpXlS844bgirA5EkWqL/mAL0dmIouvaK6ho2IgPaa048jzUZ5a
 +eBCryh5E/bFRsy4LF91NweUAuZQCKUV6WoSNsVAC4seIXxhyEPSQKwVC+/6UyGZ6G3jfvOpv
 bBXlmL2IBPi+7xzfCs8gyT4mw1N75e6r2oJ6RX7lo0qlVf8gUwjvF8P6LUTrjxcSI6LflaoHJ
 IpGLKj6UCZFB9eNkX8R07B3UaOoTsbEmqiLsYC6XOpF1cg4K7XovlqZ5oI0tmnq71tSiDoPhU
 iGUfGDHfpTDii3bguuh7Ka7moaVTmfoL4PIAMfo5cw==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

Currently, the kerneldoc Sphinx plugin doesn't honour the
--enable-werror configure option, so its warnings are never fatal.
This is because although we do pass sphinx-build the -W switch, the
warnings from kerneldoc are produced by the scripts/kernel-doc script
directly and don't go through Sphinx's "emit a warning" function.

When --enable-werror is in effect, pass sphinx-build an extra
argument -Dkerneldoc_werror=1.  The kerneldoc plugin can then use
this to determine whether it should be passing the kernel-doc script
-Werror.

We do this because there is no documented mechanism for
a Sphinx plugin to determine whether sphinx-build was
passed -W or not; if one is provided then we can switch to
that at a later date:
https://github.com/sphinx-doc/sphinx/issues/11239

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230314114431.1096972-1-peter.maydell@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 docs/meson.build         | 2 +-
 docs/sphinx/kerneldoc.py | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/meson.build b/docs/meson.build
index bb72c10ea8c5..f220800e3e59 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -7,7 +7,7 @@ if sphinx_build.found()
   SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build, '-q']
   # If we're making warnings fatal, apply this to Sphinx runs as well
   if get_option('werror')
-    SPHINX_ARGS += [ '-W' ]
+    SPHINX_ARGS += [ '-W', '-Dkerneldoc_werror=1' ]
   endif
 
   # This is a bit awkward but works: create a trivial document and
diff --git a/docs/sphinx/kerneldoc.py b/docs/sphinx/kerneldoc.py
index bf442150165f..72c403a73798 100644
--- a/docs/sphinx/kerneldoc.py
+++ b/docs/sphinx/kerneldoc.py
@@ -74,6 +74,10 @@ def run(self):
         # Sphinx versions
         cmd += ['-sphinx-version', sphinx.__version__]
 
+        # Pass through the warnings-as-errors flag
+        if env.config.kerneldoc_werror:
+            cmd += ['-Werror']
+
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []
 
@@ -167,6 +171,7 @@ def setup(app):
     app.add_config_value('kerneldoc_bin', None, 'env')
     app.add_config_value('kerneldoc_srctree', None, 'env')
     app.add_config_value('kerneldoc_verbosity', 1, 'env')
+    app.add_config_value('kerneldoc_werror', 0, 'env')
 
     app.add_directive('kernel-doc', KernelDocDirective)
 
-- 
2.39.2


