Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E02B43BE
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 13:30:06 +0100 (CET)
Received: from localhost ([::1]:39800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kede1-0008I2-7Z
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 07:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYn-0001sP-1W
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:41 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:33653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kedYk-0003BF-QT
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 07:24:40 -0500
Received: by mail-wr1-x429.google.com with SMTP id u12so11265673wrt.0
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 04:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28K6JTDfvyt129r+I2Y/ffL4NilW+jIaq7T324O7hUA=;
 b=y/ltc9XcSx/9PJfDpz32Bs0tIHeZjqxWILWrGLIQR85yd04f1X1OW5el0sGwiIVJQn
 418IUL703JAEAyXMymmwQZiJtlpuM2iqESVfKQcOk8Vi/UdQKYzxehq7pL3Oil1eBe8U
 uzhQbaG9GYLFDDC0hQEn5ql2I/EuWwNB7yWsy0UmVO2XJTNiHH3RdplwJxyLN8ttBsgO
 Klxsq29/c8PSUYC1LD1trSfGWbu8EadGMXpjoUi6Xy1A/9yhryBimKgEjiVvfv6OGrzX
 mAsNKe6sN2LPAo5SwPYDCMOXORF1j3zplrbLXyr0RoNhsGQuAM5rbCmRevLrhvQ6wyQk
 Go3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28K6JTDfvyt129r+I2Y/ffL4NilW+jIaq7T324O7hUA=;
 b=VVhYjjGp0ihLyW8c2h1jD3DdOsu5Pe+L9TfUxowKUyVkUL5msujp7d9zN0nKlwKqoW
 SFl7JRqT7QmFr/Fu9wfApeAI9yw1D1mudvG7VJYA1rge+42BedyL337vfOifgZfFF2Ah
 Vmfyv91TFtFuKRwg/sui+6RsRnD2UjQUGeObUvBLw/u4zW9PwL8qSFTbJLfvZETA0F21
 TJ0UIG6IdpTwcA+j4ktGG09KxZC3sXNXpk7ioJtLSU+P0WFv69yFXHjRzV4TjgJ6MWRr
 wggussVmmL5GezjIMYIqY9nav4KygrzaqbSDjSCPKxEC1O6jigZ8xbfEPDkaRtXOhUe4
 kSLA==
X-Gm-Message-State: AOAM532eGQkICuGtcQ7VE+LkZmrZSgTzm7K3WS54zPTP2MqxWoPh11XI
 kB6XgfBflChXPP81uwvVhHPQaA==
X-Google-Smtp-Source: ABdhPJygdntTybNKUSY3XdieZFgMpvPVxBftljabWbO7MJBIjwSt49trkc3KSCLeTMjIsxY9v1CvGg==
X-Received: by 2002:a5d:488f:: with SMTP id g15mr18952642wrq.151.1605529477384; 
 Mon, 16 Nov 2020 04:24:37 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d134sm19429705wmd.8.2020.11.16.04.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 04:24:27 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8634E1FF96;
 Mon, 16 Nov 2020 12:24:18 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 8/9] tests/acceptance: Disable Spartan-3A DSP 1800A test
Date: Mon, 16 Nov 2020 12:24:16 +0000
Message-Id: <20201116122417.28346-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116122417.28346-1-alex.bennee@linaro.org>
References: <20201116122417.28346-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

This test is regularly failing on CI:

   (05/34) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_microblaze_s3adsp1800:
  Linux version 4.11.3 (thuth@thuth.remote.csb) (gcc version 6.4.0 (Buildroot 2018.05.2) ) #5 Tue Dec 11 11:56:23 CET 2018
  ...
  Freeing unused kernel memory: 1444K
  This architecture does not have kernel memory protection.
  [nothing happens here]
  Runner error occurred: Timeout reached (90.91 s)

This is a regression. Until someone figure out the problem,
disable the test to keep CI pipeline useful.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201109091719.2449141-1-f4bug@amsat.org>
Message-Id: <20201110192316.26397-9-alex.bennee@linaro.org>

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 8f433a67f8..cc6ec0f8c1 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -13,6 +13,7 @@ import lzma
 import gzip
 import shutil
 
+from avocado import skip
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import exec_command_and_wait_for_pattern
@@ -1025,6 +1026,7 @@ class BootLinuxConsole(LinuxKernelTest):
         tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
         self.do_test_advcal_2018('07', tar_hash, 'sanity-clause.elf')
 
+    @skip("Test currently broken") # Console stuck as of 5.2-rc1
     def test_microblaze_s3adsp1800(self):
         """
         :avocado: tags=arch:microblaze
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 00c228382b..772633b01d 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -14,6 +14,7 @@ import shutil
 import logging
 import time
 
+from avocado import skip
 from avocado import skipIf
 from avocado import skipUnless
 from avocado_qemu import wait_for_console_pattern
@@ -280,6 +281,7 @@ class ReplayKernelNormal(ReplayKernelBase):
         file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
         self.do_test_advcal_2018(file_path, 'sanity-clause.elf')
 
+    @skip("Test currently broken") # Console stuck as of 5.2-rc1
     def test_microblaze_s3adsp1800(self):
         """
         :avocado: tags=arch:microblaze
-- 
2.20.1


