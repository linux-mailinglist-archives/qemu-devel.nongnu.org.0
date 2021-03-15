Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9102433C9CA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 00:12:38 +0100 (CET)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLwO5-0006Bn-JY
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 19:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKk-0001k9-6f
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:09:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLwKh-000267-Sn
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 19:09:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id l11so9529008wrp.7
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YTXlhkG2Ovry9Jhj0XTrAo3VZzzvcKLTHnzNgI1T5kA=;
 b=taNjqGhNnNAXP9edIB3tCuApJx9aESGakqJsWYEr4gMipLwzcBTIpUeJY6WT7+MiqA
 nDzPx8LwEYtmdqF3DKchjpbDRwRPycIc+bQ9PQdkzU5kuLeRSXG4uJsh64h9rHN87/6h
 QN2dkI7ochZ2yVCHBVpPGivRVwM7yAHadTCZwucvc53UM+h4QLvfOV3MK/Wzjui6HJky
 Wx5GcXWW6HKjKFUecN8rlM9YomHAW9EmboZ/DyZc83q1fJRKehHvq7ea7/0g39J3FlnU
 G5RAXF6heoQco6OtMmxBsJ5/xuI5+onAQBNB4T7SyWRFGGfpHBUtiQlGMUoy2vYPIbwO
 V+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YTXlhkG2Ovry9Jhj0XTrAo3VZzzvcKLTHnzNgI1T5kA=;
 b=KB9QQuGfujTAs8eKcy36PGhvq1jX89490+qX/QPoWNsGfygt7Qlhacv7XBCNuXGP3L
 9r9Yd/A1Vlq3tz1Sgx0CMmSn8R4iVXrLO6RVL+kdCxHUMQPBKJ+w/VREzpWmRFXjoU+c
 GzFucnK+7mAIu2yN3lhr54awHYzb9lUA/qhHBgFr8umgxHgZqX4n6F7AW9cpydW3Pw+4
 V1KNGI2A2FPua5Ns/csjZm4mRY86mergBysqqpnttLSxp1rZ7ogLqM0QTlt+3zaXS2fT
 hIijqrNN5NcwKRwYQjHlRZpQ3qFnO01kA+OFNj7xiqh4yMGIlR7/e6YtnG5Z4hUeZIpq
 ULQA==
X-Gm-Message-State: AOAM532shIBHet0P8dCWZo3uI7uwhA8xCA2M2H8LB/Vr+e+Ws84/S+El
 pWTPreXIBz8eKngK82XKR4qe6lBinIV1Xw==
X-Google-Smtp-Source: ABdhPJwkMBGsz/pr5WofxyZxjFvwRyMYsUSSi5L2toiV10l3yW/FfnjWubBY8sxz4MWov1pRRi4pCQ==
X-Received: by 2002:adf:ab52:: with SMTP id r18mr1757701wrc.65.1615849746231; 
 Mon, 15 Mar 2021 16:09:06 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id k12sm20886107wrx.7.2021.03.15.16.09.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 16:09:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] tests/acceptance: Add bFLT loader linux-user test
Date: Tue, 16 Mar 2021 00:08:38 +0100
Message-Id: <20210315230838.2973103-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210315230838.2973103-1-f4bug@amsat.org>
References: <20210315230838.2973103-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a very quick test that runs a busybox binary in bFLT format:

  $ avocado --show=app run -t linux_user tests/acceptance/load_bflt.py
  JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
  JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
   (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 0.54 s

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3: Check for 'cpio' (thuth)
---
 tests/acceptance/load_bflt.py | 54 +++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 tests/acceptance/load_bflt.py

diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.py
new file mode 100644
index 00000000000..f071a979d8e
--- /dev/null
+++ b/tests/acceptance/load_bflt.py
@@ -0,0 +1,54 @@
+# Test the bFLT loader format
+#
+# Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import bz2
+import subprocess
+
+from avocado import skipUnless
+from avocado_qemu import QemuUserTest
+from avocado_qemu import has_cmd
+
+
+class LoadBFLT(QemuUserTest):
+
+    def extract_cpio(self, cpio_path):
+        """
+        Extracts a cpio archive into the test workdir
+
+        :param cpio_path: path to the cpio archive
+        """
+        cwd = os.getcwd()
+        os.chdir(self.workdir)
+        with bz2.open(cpio_path, 'rb') as archive_cpio:
+            subprocess.run(['cpio', '-i'], input=archive_cpio.read(),
+                           stderr=subprocess.DEVNULL)
+        os.chdir(cwd)
+
+    @skipUnless(*has_cmd('cpio'))
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_stm32(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=linux_user
+        :avocado: tags=quick
+        """
+        # See https://elinux.org/STM32#User_Space
+        rootfs_url = ('https://elinux.org/images/5/51/'
+                      'Stm32_mini_rootfs.cpio.bz2')
+        rootfs_hash = '9f065e6ba40cce7411ba757f924f30fcc57951e6'
+        rootfs_path_bz2 = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+        busybox_path = self.workdir + "/bin/busybox"
+
+        self.extract_cpio(rootfs_path_bz2)
+
+        res = self.run(busybox_path)
+        ver = 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) multi-call binary.'
+        self.assertIn(ver, res.stdout_text)
+
+        res = self.run(busybox_path, ['uname', '-a'])
+        unm = 'armv7l GNU/Linux'
+        self.assertIn(unm, res.stdout_text)
-- 
2.26.2


