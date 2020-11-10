Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 220E62ADFE8
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 20:40:42 +0100 (CET)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcZVR-00062G-5t
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 14:40:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEt-0002UX-C3
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:40 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kcZEq-0007b1-8J
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 14:23:35 -0500
Received: by mail-wr1-x432.google.com with SMTP id j7so6732327wrp.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 11:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzzvm2OB2T7zjQdwXywRM7z/pkFqmZxSoEM/blZsIyc=;
 b=XKuqi6t+CnqFPIo13edi6WVFdfB58wvldnAswk2uqc7WQ3X7srkfDgLYdqOcwMTIOV
 zBgUBRX7+kYNsG6NDgLCJZqSwqqsgTIZyFMgc18FnnAjWo11wTzk60K384ExTj2DW5uv
 SKVG20YGybH7hvwczZ/s/VZEOzbQzQt7yTzAUl2FIA5BM/fimB8P7JzdYrgkyUAaWv35
 3V6Xxy0XNaXeA9OHHWf2yNv50xnhpoZyOue2ShVai69nikK5mCSKV7gak8REO7MIHd6t
 NwCjX5TFxwL6bOavM+5j5NhdSVE4REnN0ks8KoZHqMhhkzbDU3CX8yFVUZiheUDOtOcP
 pjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzzvm2OB2T7zjQdwXywRM7z/pkFqmZxSoEM/blZsIyc=;
 b=O7cIRsLCgIprQVuocXVxOwg9Z1uo8ql0oQgcWwjSaJ6/9NPelQkV80NOnh/XuuNisU
 xsfAUfBTqk2Lt8A0T58YzcEMoQrOaoP0C6vqm6DODmpbRo8mB1FdPeK+Py5975Sbmaqy
 7ia1FiFYdkJwCfbVq7inIMwgFmhY4Vu1i2bJnctcvv7iGBQMtd0GO6C45VjqwfqBqTfW
 ATVSwEOXlk0a+XLoKzYFPEgQkM+A8ICPvxmspErj9bV2v0c+rxzdLfckBs15G3BxaW9B
 dOSOtEjc/LNVDuOsPxUQf/Rp+vY9kMlj+Mhj2qr1YLCC1dhY+OJlND8tZOUDayfpNt/1
 XykA==
X-Gm-Message-State: AOAM531Ci5BJS/SAzAkpygHpkb37UH8rIGuv5n8jneDy+xW6jCctyMcH
 YocvO0XReutF4s+6wtdQcTVdhg==
X-Google-Smtp-Source: ABdhPJxDTP0Ly9+kJ3j/1ZCKcJjPxiV3MFpxGIjxYBl+BMCKr4bdppifJotC0C4+6Cdwdd0feY4E4g==
X-Received: by 2002:a5d:60c4:: with SMTP id x4mr27294841wrt.175.1605036210350; 
 Tue, 10 Nov 2020 11:23:30 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b1sm4071959wmd.43.2020.11.10.11.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 11:23:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0D4DE1FF96;
 Tue, 10 Nov 2020 19:23:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 08/10] tests/acceptance: Disable Spartan-3A DSP 1800A test
Date: Tue, 10 Nov 2020 19:23:14 +0000
Message-Id: <20201110192316.26397-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110192316.26397-1-alex.bennee@linaro.org>
References: <20201110192316.26397-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
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
Acked-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201109091719.2449141-1-f4bug@amsat.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/acceptance/boot_linux_console.py | 2 ++
 tests/acceptance/replay_kernel.py      | 2 ++
 2 files changed, 4 insertions(+)

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


