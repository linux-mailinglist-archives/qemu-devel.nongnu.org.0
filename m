Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EE3127B08
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Dec 2019 13:29:12 +0100 (CET)
Received: from localhost ([::1]:54498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiHP5-0002bq-FN
	for lists+qemu-devel@lfdr.de; Fri, 20 Dec 2019 07:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54392)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1iiH1v-00055K-Ax
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:05:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1iiH1r-0008UH-SW
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:05:14 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34209)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1iiH1q-0008Qy-1x
 for qemu-devel@nongnu.org; Fri, 20 Dec 2019 07:05:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id t2so9206000wrr.1
 for <qemu-devel@nongnu.org>; Fri, 20 Dec 2019 04:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fd9ZwTx/nGTAxWisTrByxsrJjTVOwFrJUX5QQ3jkZWE=;
 b=PnGgh0R+FuLJoLXgbUOqWoo88UXexq87sfNDL34DCTUZmg70y4egxTu3eHegGz20LV
 DdBYyM0xfslU5mbvOGCwgn7/Us1mj7ZodKEknlgvGeY9EH5/muHQ9d584zBBYpLozkT+
 03dTcXtXQvytcRaFRgad8ywVZzSoWz4MHdLbYRlvhJ9qJO2ilVc/divVDsG9qWUbc1nU
 xQdhTadQOHjXsDcdqm1R8YBQwPbGYTBMJoT1Boti1EJXjMDzll5iu0tRys5zm3SVaQhA
 yx2/zsP4BZzohxRkz/jNon4qKSYrv/nh+zhHQfvnZ9gcEiwaBpDRfC9iQTV5zvqobcDR
 PwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fd9ZwTx/nGTAxWisTrByxsrJjTVOwFrJUX5QQ3jkZWE=;
 b=CSkdT2/0HkxwhJORyHOf7XxuqtCWf4KtaiKufSVPEqxE2uOd9XNLFAk24PoV/pgoSJ
 M3FSaWi/ku+5nva7r+1lFT/IBT24o3GA9DP2sbvF+tAAK61r4npFND8DNGVGaE5CSShS
 mYelVdsXmYC12dEaP78hLZcmsI5/qQdv8FMlDhXonJuCD6PEVByCT3laUpHoJ1bkjVVm
 A+w/mqIUF91OLUl2GBJp9QKeMOWJcBB769xsBcIyjRstgduVQShKTC4JhaXGg8aDeIuy
 v6R41apMBUwFmif0V6UT5UUhdtTeTiY1kmhk+rXzzou0W/1WliESB70R+fDzuTu7TZiy
 4ffw==
X-Gm-Message-State: APjAAAWPQjByVwaMlbgo5F0PthjUsebIGXmHG9D+UPi30s8bg0nnqaft
 haeuaDIg0G0eVkqrYMhVUmFBnQ==
X-Google-Smtp-Source: APXvYqzGi3Nnh+YR3AB4Dukt69vquhS0ioJb7+ZUiMFWOTrJuFgJh1ZCMHRwl7Z2cLRWgO8JdH/M9w==
X-Received: by 2002:a5d:548e:: with SMTP id h14mr15983487wrv.380.1576843508480; 
 Fri, 20 Dec 2019 04:05:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k19sm9331183wmi.42.2019.12.20.04.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 04:04:53 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9850E1FFA3;
 Fri, 20 Dec 2019 12:04:40 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v4 16/21] tests/guest-debug: add a simple test runner
Date: Fri, 20 Dec 2019 12:04:33 +0000
Message-Id: <20191220120438.16114-17-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191220120438.16114-1-alex.bennee@linaro.org>
References: <20191220120438.16114-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
Cc: damien.hedde@greensocs.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 luis.machado@linaro.org, alan.hayward@arm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test runners job is to start QEMU with guest debug enabled and
then spawn a gdb process running a test script that exercises the
functionality it wants to test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py | 57 +++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100755 tests/guest-debug/run-test.py

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
new file mode 100755
index 00000000000..8c49ee2f225
--- /dev/null
+++ b/tests/guest-debug/run-test.py
@@ -0,0 +1,57 @@
+#!/usr/bin/env python3
+#
+# Run a gdbstub test case
+#
+# Copyright (c) 2019 Linaro
+#
+# Author: Alex Bennée <alex.bennee@linaro.org>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or later.
+# See the COPYING file in the top-level directory.
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import argparse
+import subprocess
+import shutil
+import shlex
+
+def get_args():
+    parser = argparse.ArgumentParser(description="A gdbstub test runner")
+    parser.add_argument("--qemu", help="Qemu binary for test",
+                        required=True)
+    parser.add_argument("--qargs", help="Qemu arguments for test")
+    parser.add_argument("--binary", help="Binary to debug",
+                        required=True)
+    parser.add_argument("--test", help="GDB test script",
+                        required=True)
+    parser.add_argument("--gdb", help="The gdb binary to use", default=None)
+
+    return parser.parse_args()
+
+if __name__ == '__main__':
+    args = get_args()
+
+    # Search for a gdb we can use
+    if not args.gdb:
+        args.gdb = shutil.which("gdb-multiarch")
+    if not args.gdb:
+        args.gdb = shutil.which("gdb")
+    if not args.gdb:
+        print("We need gdb to run the test")
+        exit(-1)
+
+    # Launch QEMU with binary
+    if "system" in args.qemu:
+        cmd = "%s %s %s -s -S" % (args.qemu, args.qargs, args.binary)
+    else:
+        cmd = "%s %s -g 1234 %s" % (args.qemu, args.qargs, args.binary)
+
+    inferior = subprocess.Popen(shlex.split(cmd))
+
+    # Now launch gdb with our test and collect the result
+    gdb_cmd = "%s %s -ex 'target remote localhost:1234' -x %s" % (args.gdb, args.binary, args.test)
+
+    result = subprocess.call(gdb_cmd, shell=True);
+
+    exit(result)
-- 
2.20.1


