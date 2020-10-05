Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C7F283D34
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 19:20:37 +0200 (CEST)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPUA8-0001yC-Jm
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 13:20:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPU8k-0001QS-7x; Mon, 05 Oct 2020 13:19:10 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:44788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kPU8i-0004rj-Jq; Mon, 05 Oct 2020 13:19:09 -0400
Received: by mail-pg1-x52f.google.com with SMTP id 7so6396053pgm.11;
 Mon, 05 Oct 2020 10:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1n7yoh194VsIktlaK98v5s1SkKLZM6bZi9j9NHh4uU=;
 b=VEI51qpBNX0M8d9JwpZRSurDXddZqZIQm4TsThM9hKgv7NygJPJCwTXoHDIbVSt2JN
 grw9twX+6oLvZaB0emFnEvoXGNmoAnn9apeN2N3oaCnx4jVjJSMHGmmcbgPb1CMK+cX4
 /dhAl5OOqP2h5hrng6hQi1adox9FZNJuzBdGq1O1m6k5mb+24cvhBpNIIrzMz6tbMdQ2
 baIJPkxWIx82EAQp+tAM9WMvSZ7mJOdy/uhxntPjhqQv8+kGZjryXSQz8G2eFc5MHQfg
 BSP8aGuDdCJn5d3Z1C4e9O+fzawmiuraZuZTEIm56o98jmB+JkQYylxh+gtJqeAN/VSg
 Kp5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c1n7yoh194VsIktlaK98v5s1SkKLZM6bZi9j9NHh4uU=;
 b=Qk8WG97fu5wADY0QVtZgJ1U3wbm9XcQb8LAEwSBENcypbAtrqGgD7mgyAmQIwh3PCQ
 CMuk48fzc8FjjJH/XR1CqDyPttio/winmzoNSQQb+CWOwzDB9e11E//QC8dUQXcUyY0V
 5rMc1awJLS/MN8cS0JBIeM4kqJ6QUNK0ZHvDPvR3+f9Cvn0cvgqWwDRPjUcGEuzoPt0E
 uhARokEkvH+fpTTjvNlkCu+9DSMjRaE71lo2iyXt3ozf+/1npmB3j/q+viHs9etvWHY3
 ViQD1xmv1AWxzBI9IJu8SKNFfJyej29B0u7ZIvJ4wXzN/ZBRCGYgoSzVgY5Uo/3kAgTG
 7QKw==
X-Gm-Message-State: AOAM532gm4kB22jnmKC+SFQaMVOjj2rMLf5WbRy2ST7pOKVHO4XHMB/g
 sI1Ght/CvSCbdgsMDkFMy5PsuTFhEEGHqQ==
X-Google-Smtp-Source: ABdhPJxpOL7Ol0v2vVTd7nQcrcEUq19UiziN/7aawdM9H77bQLKHVKxhNMpo2O9UW0DxlJQVaWetxg==
X-Received: by 2002:a63:5d58:: with SMTP id o24mr488249pgm.115.1601918346117; 
 Mon, 05 Oct 2020 10:19:06 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id y7sm189305pgk.73.2020.10.05.10.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 10:19:05 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts: Convert qemu-version.sh to qemu-version.py
Date: Tue,  6 Oct 2020 01:18:50 +0800
Message-Id: <20201005171850.678-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x52f.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The sh script are harder to maintain for compatible different
xsh environment

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build             |  2 +-
 scripts/qemu-version.py | 29 +++++++++++++++++++++++++++++
 scripts/qemu-version.sh | 25 -------------------------
 3 files changed, 30 insertions(+), 26 deletions(-)
 create mode 100644 scripts/qemu-version.py
 delete mode 100755 scripts/qemu-version.sh

diff --git a/meson.build b/meson.build
index 95a532bd29..20f653b6eb 100644
--- a/meson.build
+++ b/meson.build
@@ -1072,7 +1072,7 @@ tracetool = [
    '--backend=' + config_host['TRACE_BACKENDS']
 ]
 
-qemu_version_cmd = [find_program('scripts/qemu-version.sh'),
+qemu_version_cmd = [find_program('scripts/qemu-version.py'),
                     meson.current_source_dir(),
                     config_host['PKGVERSION'], meson.project_version()]
 qemu_version = custom_target('qemu-version.h',
diff --git a/scripts/qemu-version.py b/scripts/qemu-version.py
new file mode 100644
index 0000000000..12e8c0164a
--- /dev/null
+++ b/scripts/qemu-version.py
@@ -0,0 +1,29 @@
+#!/usr/bin/env python3
+
+# Script for retrieve qemu git version information
+# and output to stdout as QEMU_PKGVERSION and QEMU_FULL_VERSION header
+# Author: Yonggang Luo <luoyonggang@gmail.com>
+
+import sys
+import subprocess
+
+def main(args):
+    if len(args) <= 3:
+        sys.exit(0)
+
+    dir = args[1]
+    pkgversion = args[2]
+    version = args[3]
+    pc = subprocess.run(['git', 'describe', '--match', "'v*'", '--dirty', '--always'], stdout=subprocess.PIPE, cwd=dir)
+    if pc.returncode == 0:
+        pkgversion = pc.stdout.decode('utf8').strip()
+    fullversion = version
+    if len(pkgversion) > 0:
+        fullversion = "{} ({})".format(version, pkgversion)
+
+    version_header = '''#define QEMU_PKGVERSION "{}"
+#define QEMU_FULL_VERSION "{}"'''.format(pkgversion, fullversion)
+    sys.stdout.buffer.write(version_header.encode('utf8'))
+
+if __name__ == "__main__":
+    main(sys.argv)
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


