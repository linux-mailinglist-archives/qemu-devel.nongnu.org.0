Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23CA18729A
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:44:17 +0100 (CET)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDuin-0003UB-0f
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jDtXl-0003fj-0l
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jDtXj-00024K-Kp
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:48 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:45394)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jDtXg-0001yA-6y
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 13:28:44 -0400
Received: by mail-wr1-x434.google.com with SMTP id t2so12232285wrx.12
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5dTlYsFtNp/wmtrOeuFSuNIyqa263n2dovazYjJJJU=;
 b=Py5JM8aePmg8I++6NhioriUf53N9eGZQXcXpJmnaxSYWoBvzwoQphPMQVJ48kUq3zL
 h4u9xeJEWRDlnCwGGKWZViQRhiv9QZUoT//2jWO7zI6SxgD2JkgVQ1icT02/HwhBWtZ/
 tbTK5lh8ia7NcFwTXj6tgy02Cbu8HG32bsjmiUOuf4B6ePK00KKo2V8WWmp488cBnGuM
 GPrUeFLLerY1SDE/OMy1KL9ZhrcKwehfp4LHgWyeJMlGzgFaH9/htEFpwItq9lY8GpBV
 EN7JKkYbXHpIUvZhpJzRO4ekQ54EySvszZm8r2HjloO8dgsIRdk9sglSSaRDz8vP7Hcu
 UQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5dTlYsFtNp/wmtrOeuFSuNIyqa263n2dovazYjJJJU=;
 b=HFatLPBvKEbYxXT3f1OnvAeWsVzuC7VXyb7ZBYJqu131ZM9EuDEFSZ2WVbXgQKG0KO
 pBtr6M7wIm0K8uciiLEKc7SNZ5a4XOucvQJVdgV8Ww3fZ7evxawvIs+7kz0fUef7w6yV
 GVz5h6yLAWOb2l7l5frQ27W5eBADBdSyVYtiJSB9gMBw/426Kzr5Er3nI5uJUfx5WYQK
 WeCyDN4QvXQ3wZx5Gbr1Go+Mxsu5uP3ZrelWrIZzTrqO+9Fc9Vop6qpaaUKeDe2Gfq4D
 /cI1NtZbeVOqn7mOIlpGcIO/tOHkjIFT2vLcknmpgxF9SOTrOZNxJu9465tJwStLqEHK
 sz1g==
X-Gm-Message-State: ANhLgQ1anCAGNzrDFmypbJxYWiqUzuuavr43uedrONBZTBoVwQG0lavK
 tm6cLAcLyNDn8fi2jdWyo4vduw==
X-Google-Smtp-Source: ADFU+vs0f131Tm1liahJHdO5Vf0/PT/a2k/tUY43ud9kNiyoL2usKa6JZaR8SGjt4JsCrROKiIAYRg==
X-Received: by 2002:a05:6000:41:: with SMTP id k1mr440549wrx.53.1584379719457; 
 Mon, 16 Mar 2020 10:28:39 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y12sm404883wmi.48.2020.03.16.10.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 10:28:35 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 692801FFAC;
 Mon, 16 Mar 2020 17:21:57 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 22/28] tests/guest-debug: add a simple test runner
Date: Mon, 16 Mar 2020 17:21:49 +0000
Message-Id: <20200316172155.971-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200316172155.971-1-alex.bennee@linaro.org>
References: <20200316172155.971-1-alex.bennee@linaro.org>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The test runners job is to start QEMU with guest debug enabled and
then spawn a gdb process running a test script that exercises the
functionality it wants to test.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


