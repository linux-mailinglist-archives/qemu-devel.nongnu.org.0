Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB381A9A4D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 12:23:16 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOfCM-0002gG-Vx
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 06:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1jOfBT-00029o-DW
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:22:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1jOfBS-0003uZ-1e
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:22:19 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36636)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1jOfBR-0003tq-OF
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 06:22:17 -0400
Received: by mail-wr1-x432.google.com with SMTP id u13so17970485wrp.3
 for <qemu-devel@nongnu.org>; Wed, 15 Apr 2020 03:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpjAR4St2Q5BscVvzfeutaAbR2v1Dg1mbYbYbWr2/T4=;
 b=N2HgWfZ5ji0RSQvnvr4b1uD5OoWt1hWt3fycfmtKygVD8asZm1gk9XfqJy6vQPzDED
 NG7uNSy5s1MkhdhK9K1nXmc1wDjLtf6xoZYgEvCOWpKLg+iOSOmhZXjTF/oUyktXNJgD
 TWj/Bo3KQ2m7o+5FFUZi0yVP61iuJ85a6tVGD+pAD/KyTS7aGvl212CHb6uAhjVOWbM2
 PeQ7iec/DUcxaQRCJDrHJONMi96G/nraWSJ8AA6zhIcAoQoGCaenhOlIq0URI1uNHdNZ
 yOoPJruX2vMQD1lU02qkML8sNxW2CNgYdIPg+frCURUT1eVCuOq8fybgo+5eY/dCUV2E
 97nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cpjAR4St2Q5BscVvzfeutaAbR2v1Dg1mbYbYbWr2/T4=;
 b=RpoG7EVU/1zZyOM9untrkQ56zv15IEc1DhIn4PbjnQFhtVphzLoGgRtR97F4IV0/q7
 FXyka9Gf8bI3nHeqXI/X7pxpy6ckhtvmohLb2vlnK2K6pPZlaB4JRlK6vogccvJemUUu
 CVowne+CxwFunWrjY2ji4MvWKDUqFe0/8F6SY3Zn7EwFtKMSvumqfT8liwLeDqykDO8h
 x3AsNH7IgLJMN7sgz2tJdBzzeKde6n4Hj/pqgTk73fJxA0ZaMp24UBPzc8EL17/kjx9K
 iIdMNQEqhqtJJvL0nGQie4S0w1jS++6PWWibd/+qvi5ZzayFMJ1h2Kxee6ei+dZL3JIG
 hxwg==
X-Gm-Message-State: AGi0PuZHIY4wYpQ/cU6zZtU94qVQP3xR5whLr/313zmy2I9tU/A95PGI
 YvZZP7rrAFNmX98kEwJFdDk6ng==
X-Google-Smtp-Source: APiQypLaEszIHOPkv0kH8WNFym3uwxQz1iBb2XpOLTWjf9OwvPIwVmOIFSjcBmFX77nv+rlP2BsNrg==
X-Received: by 2002:adf:f98e:: with SMTP id f14mr20003434wrr.253.1586946136272; 
 Wed, 15 Apr 2020 03:22:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k9sm23726186wrd.17.2020.04.15.03.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 03:22:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B1BD1FF7E;
 Wed, 15 Apr 2020 11:22:14 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/tcg: better trap gdb failures
Date: Wed, 15 Apr 2020 11:22:08 +0100
Message-Id: <20200415102208.2885-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It seems older and non-multiarach aware GDBs might not fail gracefully
when faced with something they don't know. For example when faced with
a target XML for s390x the Ubuntu 18.04 gdb will generate an internal
fault and prompt for a core dump.

Work around this by invoking GDB in a more batch orientated way and
then trying to filter out between test failures and gdb failures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/guest-debug/run-test.py               | 19 ++++++++++++++++++-
 tests/tcg/aarch64/gdbstub/test-sve-ioctl.py |  1 -
 tests/tcg/aarch64/gdbstub/test-sve.py       |  1 -
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/tests/guest-debug/run-test.py b/tests/guest-debug/run-test.py
index 8c49ee2f225..2bbb8fbaa38 100755
--- a/tests/guest-debug/run-test.py
+++ b/tests/guest-debug/run-test.py
@@ -50,8 +50,25 @@ if __name__ == '__main__':
     inferior = subprocess.Popen(shlex.split(cmd))
 
     # Now launch gdb with our test and collect the result
-    gdb_cmd = "%s %s -ex 'target remote localhost:1234' -x %s" % (args.gdb, args.binary, args.test)
+    gdb_cmd = "%s %s" % (args.gdb, args.binary)
+    # run quietly and ignore .gdbinit
+    gdb_cmd += " -q -n -batch"
+    # disable prompts in case of crash
+    gdb_cmd += " -ex 'set confirm off'"
+    # connect to remote
+    gdb_cmd += " -ex 'target remote localhost:1234'"
+    # finally the test script itself
+    gdb_cmd += " -x %s" % (args.test)
+
+    print("GDB CMD: %s" % (gdb_cmd))
 
     result = subprocess.call(gdb_cmd, shell=True);
 
+    # A negative result is the result of an internal gdb failure like
+    # a crash. We force a return of 0 so we don't fail the test on
+    # account of broken external tools.
+    if result < 0:
+        print("GDB crashed? SKIPPING")
+        exit(0)
+
     exit(result)
diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
index 5824abe09ac..972cf73c315 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
@@ -67,7 +67,6 @@ except (gdb.error, AttributeError):
 try:
     # These are not very useful in scripts
     gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
 
     # Run the actual tests
     run_test()
diff --git a/tests/tcg/aarch64/gdbstub/test-sve.py b/tests/tcg/aarch64/gdbstub/test-sve.py
index 90201d80094..b96bdbb99af 100644
--- a/tests/tcg/aarch64/gdbstub/test-sve.py
+++ b/tests/tcg/aarch64/gdbstub/test-sve.py
@@ -68,7 +68,6 @@ except (gdb.error, AttributeError):
 try:
     # These are not very useful in scripts
     gdb.execute("set pagination off")
-    gdb.execute("set confirm off")
 
     # Run the actual tests
     run_test()
-- 
2.20.1


