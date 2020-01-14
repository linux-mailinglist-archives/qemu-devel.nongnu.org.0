Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE2713ADC7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 16:36:12 +0100 (CET)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irOEl-0004Qy-Ci
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 10:36:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1irNy0-0008U8-GU
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:18:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1irNxz-00089s-9l
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:18:52 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:54455)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1irNxz-00088F-2Y
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 10:18:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id b19so14212429wmj.4
 for <qemu-devel@nongnu.org>; Tue, 14 Jan 2020 07:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEKvEpKhHPViJyLx2EXDEbN/QgNSwiOpcgG9WyeULSA=;
 b=BdV2npNYgh2Or/5VOFsAlYXs1P02sIBeywwV152kmehNM/VCCXY/3EoiiFFRqs45qc
 GrfrFKNW993M6YQQ+l9xSfhoLi+Rfyx6GTuqYwT4ofm+ipetLinfI4vQo8kjoSyICyE9
 xMYUpy2ya+r4yiEjRg3PP6w94Cgv22sqGnBR86FT3WTVQvnVoDqrWhpUVN/SVFQf8rzl
 BjzzK5n9PxX4XSW2p6pLcxLlMdy5P2bVUUh0jG2dhEwgYLNHKgFK3KNgQpIg1/tLv6Ev
 DFO/teLflsBHKH5O/T2hVdB0FSjF4XjfrPaW94bhP/5f9Wc3cYswJh2Q5p7opQhBWsTi
 YecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEKvEpKhHPViJyLx2EXDEbN/QgNSwiOpcgG9WyeULSA=;
 b=nhF9hhoggA+YRAyx/4qwoM+Lh8TKvapl+k0QHlCKQbCgmhXChwAL/5Ck+C/u/s30L1
 L7yWH3M/cm7xJHjOfbBvkAfnBYYmg8XendXqcQ8CuZU0BZW6CUsP/D3xThn1zknuE/hw
 t+mdHZTEEWft8MrOj4ad2FunV8FJt56uWUJgtl9+/h6Qr5APllAm7iuTkbXzrrC2omXF
 sHAmGoCjgnDrGQkQnXHmOgLREehXA7KmwKJ4ZDB2ZUgIvbmilkrnWQy5C+x9N5DD11MS
 FaN3Mpbnrz6QErKNlg6JbAniXSBYggx/iibuubRXJ3nR8880MHMYBmhvgpUwzy8/213L
 YHBA==
X-Gm-Message-State: APjAAAV0diqvu57qB7pVvBm4OPTM3sNQTrIJOPKMecF0pTMRy0ceD9Go
 51xGkkuXkT/0YjoKbTHq+Crgiw==
X-Google-Smtp-Source: APXvYqw+8JsPmqj/MAPAobxevrEsrDxqo5az2CghVZ7uwMAbnjuJJ7eXLKM0ihZ8jaJJdJ+onpu52g==
X-Received: by 2002:a1c:66d6:: with SMTP id
 a205mr27933680wmc.171.1579015130072; 
 Tue, 14 Jan 2020 07:18:50 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z3sm19933150wrs.94.2020.01.14.07.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 07:18:46 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F41651FF8C;
 Tue, 14 Jan 2020 15:09:56 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v5 17/22] tests/guest-debug: add a simple test runner
Date: Tue, 14 Jan 2020 15:09:48 +0000
Message-Id: <20200114150953.27659-18-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200114150953.27659-1-alex.bennee@linaro.org>
References: <20200114150953.27659-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32c
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 0000000000..8c49ee2f22
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


