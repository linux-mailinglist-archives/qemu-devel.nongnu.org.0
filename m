Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FEC2B1BF1
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 14:35:45 +0100 (CET)
Received: from localhost ([::1]:47108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdZEt-0001r3-Rv
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 08:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdZDq-0001Qf-DY
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:34:38 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdZDo-0007x3-4S
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 08:34:38 -0500
Received: by mail-wm1-x329.google.com with SMTP id d142so8164253wmd.4
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 05:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NBSLhMfP6ive77yg8qefeAx32XqWtybk2GRQOzMqLaY=;
 b=aXOrujjgfF/1Xequlu7Ja/Pv9RRnZSMaZfcQ+vqvp/0QtUxv9k63okAJ5WJ4rDR2vp
 a3Y8+tr4sctpGK5k4FNZxy09cBXWCV6+tCSx2zKGl97S1ziXQAvP+f+dr9eGQayynb+r
 tfmHYp7ZrvFzPUPva+s7YrxM7K31b0Nozt3IlHtB8YDB++xRF8r9q4kyqDhmiYQ7zrRp
 xv00TbRc2jJtZjphaPkQjhOVXSR5rXl7lrEg1vZIdW545jOSJVi+j2W8/v4U81264u7A
 QFGjyNom8vJUEZZCqxpG+EdMAEzPTl4z17FkAUWYzlvRhxtWNV6CgFl13YeLw5UAnvNI
 qhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NBSLhMfP6ive77yg8qefeAx32XqWtybk2GRQOzMqLaY=;
 b=F3g53yLULjsvPyTYTYZ3MFmt/bwL9M4zFoQzh7l8xaIncfR8syIwihnvoBkY9fkvY0
 fC/wiNSGLUgX41B9SWVmPwXb7oj3WkZZJIx5UfBrXGBt/V3iZI/TNlai/goZNFxXR+yZ
 9enYUOXCH2VLBe4cL5eqJEFYCq9hLvRKyPeIkGt0PQ0F6qc8actmQz5iJGWPJlx1p35c
 YV1UHkXHa9cynCrkqCBmzI8yGoStnwPAt8qO56cKC9rfG+d73wJ9nTM3d1hn9AJtDpEP
 fyPXTlvR2SlRO8HwN7DcWeNdeNAaOZZGc6Zaawq8bG4dtdekZHpjBg6xPeKDLnTHnOxO
 M1sA==
X-Gm-Message-State: AOAM533SzQ9nRPfiZP579555t1kW6aB9gOD3NhH/uydLTlWId0BMbB1C
 dothI2v7MDTUcYbeIi6hMvB7aLFSOyFiXw==
X-Google-Smtp-Source: ABdhPJwb5WbzM6Zh6nItfM2lOKZI5bTEgMz0XzIIbL6wpXMXF919B8G53yQfIMFfmZniJmcZaXRp1Q==
X-Received: by 2002:a1c:3c44:: with SMTP id j65mr2716438wma.13.1605274472211; 
 Fri, 13 Nov 2020 05:34:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t13sm11538077wru.67.2020.11.13.05.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:34:30 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 389671FF7E;
 Fri, 13 Nov 2020 13:34:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: add prefixes to the bare mkdtemp calls
Date: Fri, 13 Nov 2020 13:34:24 +0000
Message-Id: <20201113133424.8723-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: peter.maydell@linaro.org, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@hackbox2.linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first step to debug a thing is to know what created the thing in
the first place. Add some prefixes so random tmpdir's have something
grep in the code.

Signed-off-by: Alex Bennée <alex.bennee@hackbox2.linaro.org>
---
 python/qemu/machine.py                    | 2 +-
 tests/acceptance/avocado_qemu/__init__.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6420f01bed..052a77592c 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -303,7 +303,7 @@ class QEMUMachine:
         return args
 
     def _pre_launch(self) -> None:
-        self._temp_dir = tempfile.mkdtemp(dir=self._test_dir)
+        self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-", dir=self._test_dir)
         self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 4cda037187..8496a0c43d 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -171,7 +171,7 @@ class Test(avocado.Test):
             self.cancel("No QEMU binary defined or found in the build tree")
 
     def _new_vm(self, *args):
-        vm = QEMUMachine(self.qemu_bin, sock_dir=tempfile.mkdtemp())
+        vm = QEMUMachine(self.qemu_bin, sock_dir=tempfile.mkdtemp(prefix="avocado_qemu_sock_"))
         if args:
             vm.add_args(*args)
         return vm
-- 
2.20.1


