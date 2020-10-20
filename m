Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A97A28689B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 21:52:02 +0200 (CEST)
Received: from localhost ([::1]:57610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQFTl-000391-D5
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 15:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQFSl-0002D0-Jx; Wed, 07 Oct 2020 15:50:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:35561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kQFSj-0002YF-89; Wed, 07 Oct 2020 15:50:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k8so1999908pfk.2;
 Wed, 07 Oct 2020 12:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YYyNUTrs8LpEP4iBDXNDMxJb6UWYAD/KDaE5MUPJZw=;
 b=IpTz36upedFkt5KT5PKxM98CEnCkW7Wp0xFqsr5n12rLDEDxYqqWAfaWsZRYUbfhF1
 /zb5YOmarZcJWGo4ilM7R6CehJX4g2ijtxQtd/ACd0wzoPF5dpOqvyQ4WDckbkW3W1e2
 Sv6EXK7hhW58XoZQ9/A/xqK/n0x5bvmz2f00gOXthJgSpKXJDfA4/7GDbT8sCua+BBdO
 dBHIx7vcGowLvi/nLXvgDSGfsm9uHBIdhVBQNXOHNmPRM1RfvHVw+FmU177zt4es81YV
 fQh2kChBWUVFFj6cOMd1s15nmWeEKocPa5kyf4D9Zo5eAEw2MZecGMczDVDI7V3MRYO9
 OKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YYyNUTrs8LpEP4iBDXNDMxJb6UWYAD/KDaE5MUPJZw=;
 b=phob5T9u7dmbwLlgFrOiIc5DgqoG9OCWxwqn2//w8IXep5FBQToHk2Di5IzEwO9b8R
 IrzJtcKQpVbe3ubPMg/EjADsYfGAtDq1/ivg5PdUI9wYg7A+RyRqSOms9bf19mskhwoi
 WpjEhA+CAUzqQpejsjbWeLIcrIIDD8s+hX080sD/TDOqw1nOBZRIFpsofpby+5U4NNQM
 a4RqTZvjl5jHAvMzeIXi7XT7AQVUQLTrk05HVz2oWfsTIAE7pesvkNzC8+u2T3oQt5TR
 XbbSDDfIo1O8qxO8d9B2vQvOS6gUG4ErD8y+UO5z2Io3fnvdiBiI+rgBxHnneoCNpgUf
 +eLA==
X-Gm-Message-State: AOAM530JDhXUzisIcbxhsPzT2q1vhG8ie5w3QdxMnEv2AYS7W1WEhutc
 1ztvBrG4vX19rOXWiRDX/k4592sGHCJ9pA==
X-Google-Smtp-Source: ABdhPJxFOWK6IQ+T8mIXPzDhYfnts6HsMzIHq4gbwkWkgWhh/q8XtopCMtr1Px/gZbXpXvXk9rOZcg==
X-Received: by 2002:a17:90a:64ce:: with SMTP id
 i14mr2879009pjm.97.1602100254788; 
 Wed, 07 Oct 2020 12:50:54 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id 9sm4105141pfx.138.2020.10.07.12.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 12:50:53 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9] scripts: Convert qemu-version.sh to qemu-version.py
Date: Thu,  8 Oct 2020 03:50:35 +0800
Message-Id: <20201007195035.2006-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x42e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=E8=8C=85?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sh script are harder to maintain for compatible different
xsh environment so convert it to python script
Also incorporate the fixes in
https://patchew.org/QEMU/20200929143654.518157-1-marcandre.lureau@redhat.com/
Using --match=v* instead of --match 'v*' for speed up the git version
And using --match=v\\* to resolve wildcard problem on windows.
Tested under Ubuntu/msys2/mingw.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20201006112139.700-1-luoyonggang@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build             |  2 +-
 scripts/qemu-version.py | 35 +++++++++++++++++++++++++++++++++++
 scripts/qemu-version.sh | 25 -------------------------
 3 files changed, 36 insertions(+), 26 deletions(-)
 create mode 100644 scripts/qemu-version.py
 delete mode 100755 scripts/qemu-version.sh

diff --git a/meson.build b/meson.build
index 26230614ba..1d3bb25bc6 100644
--- a/meson.build
+++ b/meson.build
@@ -1132,7 +1132,7 @@ tracetool = [
    '--backend=' + config_host['TRACE_BACKENDS']
 ]
 
-qemu_version_cmd = [find_program('scripts/qemu-version.sh'),
+qemu_version_cmd = [find_program('scripts/qemu-version.py'),
                     meson.current_source_dir(),
                     config_host['PKGVERSION'], meson.project_version()]
 qemu_version = custom_target('qemu-version.h',
diff --git a/scripts/qemu-version.py b/scripts/qemu-version.py
new file mode 100644
index 0000000000..c633cb1e54
--- /dev/null
+++ b/scripts/qemu-version.py
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+
+#
+# Script for retrieve qemu git version information
+#
+# Authors:
+#  Yonggang Luo <luoyonggang@gmail.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or, at your option, any later version.  See the COPYING file in
+# the top-level directory.
+
+import sys
+import subprocess
+import os, os.path
+import platform
+
+def main(_program, dir, pkgversion, version, *unused):
+    os.chdir(dir)
+    if not pkgversion and os.path.exists('.git'):
+        match_expression = '--match=v\\*' if platform.system() == 'Windows' else '--match=v*'
+        pc = subprocess.run(['git', 'describe', match_expression, '--dirty', '--always'],
+                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL, encoding='utf8', shell=False)
+        if pc.returncode == 0:
+            pkgversion = pc.stdout.strip()
+
+    fullversion = version
+    if pkgversion:
+        fullversion = "{} ({})".format(version, pkgversion)
+
+    print('#define QEMU_PKGVERSION "%s"' % pkgversion)
+    print('#define QEMU_FULL_VERSION "%s"' % fullversion)
+
+if __name__ == "__main__":
+    main(*sys.argv)
diff --git a/scripts/qemu-version.sh b/scripts/qemu-version.sh
deleted file mode 100755
index 03128c56a2..0000000000
--- a/scripts/qemu-version.sh
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-set -eu
-
-dir="$1"
-pkgversion="$2"
-version="$3"
-
-if [ -z "$pkgversion" ]; then
-    cd "$dir"
-    if [ -e .git ]; then
-        pkgversion=$(git describe --match 'v*' --dirty | echo "")
-    fi
-fi
-
-if [ -n "$pkgversion" ]; then
-    fullversion="$version ($pkgversion)"
-else
-    fullversion="$version"
-fi
-
-cat <<EOF
-#define QEMU_PKGVERSION "$pkgversion"
-#define QEMU_FULL_VERSION "$fullversion"
-EOF
-- 
2.28.0.windows.1


