Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB99662D98B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 12:38:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovdCV-0004rV-4g; Thu, 17 Nov 2022 06:36:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovdCS-0004rC-MS
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 06:36:56 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovdCQ-0000Uv-M0
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 06:36:56 -0500
Received: by mail-pj1-x1031.google.com with SMTP id b11so1420706pjp.2
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 03:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PA+R8Lt5E3H+irliSoTwD2CzXOiiz/wpS5WJVlBlQiQ=;
 b=y2cM/bJg9Ogq8lrkCZGd3S35334YeN4gQv/ny2p08Z0TbLtGC5yIQK37tQL3dKkVji
 GJFzHN6roBWh8I5aD4mxJ/Aukff5SCrTfwTbm7E/m82w04mWpOgj9yc7dSNLlIDG6Uj7
 b6ZL0+DFoIq5LbLZTNGU0OKvBDgPyBNCEF+DVmTFyVyIL85jRbRdK30+lYMjl1ngXHZn
 ejJOQq6E4GkL/xkALIs/xmnwHAZM+3bv3kmSADLBu80VgzBKxPpo1qNRnQPU/s/JJ0hW
 edv0PBw9ssIM2NxDLyHQ9kCiURIbC7Msmxzec/r8AtKypr3hrlLCz2kOfmlMF10BxAOL
 0tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PA+R8Lt5E3H+irliSoTwD2CzXOiiz/wpS5WJVlBlQiQ=;
 b=7kbMOAE0jpCagrQWA2//5Rs4EHvEUhhWTt/O190cj+11YdnUIKNaWx9eUDGt/uoPY7
 OqAePENgd8OwUg6Yum7Jhqw1xLrlFIjuUdOObq3PrIZYZ/iK3+s+AaBZNBgJzhaV7Kva
 BObmf3UcG8sZA6tY1P93TXvK/sYFzTzAx4Ky+mY0O5vPJwMFao811eCJg6RroBEjDC1A
 c7MN1+LcNrQvHdfxozyNkcPzEUC69jojRDRhqp59iZvxT3Scc8xmcx5T+C2z4aZsVsqu
 e8AmREIcA5InC61VCZOzLX7IkgAvwJwj4D2x8B9sUybRrU+SJGu8uvdFHk/nRo6rjeoE
 UC8w==
X-Gm-Message-State: ANoB5pmhVPxebfJOx0seKY7XAmEugj1nY8aG9Lt2vNenEe8DXmE/3ndc
 J7n5aHMXynAkvKyDBWWnpAaWyw==
X-Google-Smtp-Source: AA0mqf4A9nCXbjPTaKDFu0RMX3g5Eo7uL/ylLkx6brecvDZZo8JRN3wPBziZPmyIrQw3pL4hl4vCow==
X-Received: by 2002:a17:903:3111:b0:188:5c0c:7590 with SMTP id
 w17-20020a170903311100b001885c0c7590mr2452471plc.65.1668685012896; 
 Thu, 17 Nov 2022 03:36:52 -0800 (PST)
Received: from anisinha-lenovo.apac.nsn-net.net ([131.228.104.90])
 by smtp.googlemail.com with ESMTPSA id
 v4-20020a1709029a0400b001782398648dsm1135384plp.8.2022.11.17.03.36.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 03:36:52 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v2] acpi/tests/avocado/bits: keep the work directory when
 BITS_DEBUG is set in env
Date: Thu, 17 Nov 2022 17:06:30 +0530
Message-Id: <20221117113630.543495-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Debugging bits issue often involves running the QEMU command line manually
outside of the avocado environment with the generated ISO. Hence, its
inconvenient if the iso gets cleaned up after the test has finished. This change
makes sure that the work directory is kept after the test finishes if the test
is run with BITS_DEBUG=1 in the environment so that the iso is available for use
with the QEMU command line.

CC: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits.py | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

changelog:
changes from v1: introduced a separate BITS_DEBUG env var and tie
workdir removal with this instead of using V.

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index e4d60a34ce..898c837f26 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -263,7 +263,7 @@ def generate_bits_iso(self):
         self.logger.info('using grub-mkrescue for generating biosbits iso ...')
 
         try:
-            if os.getenv('V'):
+            if os.getenv('V') or os.getenv('BITS_DEBUG'):
                 subprocess.check_call([mkrescue_script, '-o', iso_file,
                                        bits_dir], stderr=subprocess.STDOUT)
             else:
@@ -347,7 +347,7 @@ def parse_log(self):
                 self._print_log(log)
                 raise e
             else:
-                if os.getenv('V'):
+                if os.getenv('V') or os.getenv('BITS_DEBUG'):
                     self._print_log(log)
 
     def tearDown(self):
@@ -356,8 +356,13 @@ def tearDown(self):
         """
         if self._vm:
             self.assertFalse(not self._vm.is_running)
-        self.logger.info('removing the work directory %s', self._workDir)
-        shutil.rmtree(self._workDir)
+        if not os.getenv('BITS_DEBUG'):
+            self.logger.info('removing the work directory %s', self._workDir)
+            shutil.rmtree(self._workDir)
+        else:
+            self.logger.info('not removing the work directory %s ' \
+                             'as BITS_DEBUG is ' \
+                             'passed in the environment', self._workDir)
         super().tearDown()
 
     def test_acpi_smbios_bits(self):
-- 
2.34.1


