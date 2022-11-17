Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE5462D458
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 08:47:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovZbz-0004sV-DO; Thu, 17 Nov 2022 02:47:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovZbo-0004s8-6v
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 02:46:52 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ovZbm-0001KB-Ik
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 02:46:51 -0500
Received: by mail-pj1-x1033.google.com with SMTP id m14so975860pji.0
 for <qemu-devel@nongnu.org>; Wed, 16 Nov 2022 23:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0p4OsZGCJ7X1cjJzbSGuHrrKxVzBOqUfDSi9b0jB6yI=;
 b=XGdm5q6reIuKwSRreUZI4Ejm+/94vCQb3XC3Gnq3Uxy/sNklG2Z3W39aqDfGdswvD2
 2kJN4PNzgeLyrqJCubicRJbVBU3YWVvLGOT9c4Jtge4APdmNqwR4UILHOceTMDHXgP/U
 Xpm3qYnfJqm8ySUAmdfuDUDI+4Z0QRXBNixIcBBU2H43oM87Sw0jG9ilrbCnEGctulwe
 o59Hl7G14c8HkV1o+G6LNS1AWYV1Mc+dJHNaj1RaKYZwqw5edolcRkL62jZHKtTZmsKu
 roTQVzzNUUIPMrAQbp5/tjkPrcd9gizvzW9TUFyZ66A6WKaeLyUvLAXst7pDmQomXWSW
 3Mbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0p4OsZGCJ7X1cjJzbSGuHrrKxVzBOqUfDSi9b0jB6yI=;
 b=ohR2BSpIELkmElwLYCjW71vZzKQ/kSY0/sE4k2AvQ09ui10cQbiZp9OV+ZPjSh8fOS
 IdZGV7Nm0stH2sKQdiL2xhSrfbQcmH3iyh13O7jet0+1vjNhvmWIlZ/U9LraFAdACmku
 M4jgDQDNPBU51GJn5NNpV6pxT+EFk088s75OWhwjg0JoLDUTwU9BaU1FQ+wdhdRCPKSV
 OsXRrfBiziIlmKhuNRHynMvEKOOeGDSyxuEzz12AtuAYli1tQ+4iIpG4L+0c1ApdyNpt
 i6MD7r5jW60JCJZxo3ICv4rzZx3aB+OhVBLVVEeObEHv5RS1Q9JXGC5BGgJ2dAddSEYP
 PUQA==
X-Gm-Message-State: ANoB5pnI+cEoCPm4GxmDzPCXdSd1SxQ572TZ0Z+M5b95OfqQ62Ar0UQm
 OFHu3eGf3TaLH/s5w0thTuEfGg==
X-Google-Smtp-Source: AA0mqf7q1ZW9G2/uiMzwKXO4VlQW7305c9F9Q26/G6gzn3PXwKK+JJYmXSiRRO+e+4HJBDVvh4O7ww==
X-Received: by 2002:a17:903:153:b0:180:4030:1c7d with SMTP id
 r19-20020a170903015300b0018040301c7dmr1622886plc.99.1668671207160; 
 Wed, 16 Nov 2022 23:46:47 -0800 (PST)
Received: from anisinha-lenovo.apac.nsn-net.net ([131.228.104.90])
 by smtp.googlemail.com with ESMTPSA id
 g8-20020a17090a640800b0020a81cf4a9asm2887024pjj.14.2022.11.16.23.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 23:46:46 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] acpi/tests/avocado/bits: don't remove the work directory when
 V is in env
Date: Thu, 17 Nov 2022 13:16:29 +0530
Message-Id: <20221117074629.526448-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1033;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1033.google.com
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
is run with V=1 in the environment so that the iso is available for use with the
QEMU command line.

CC: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/acpi-bits.py b/tests/avocado/acpi-bits.py
index 8745a58a76..7657343f2a 100644
--- a/tests/avocado/acpi-bits.py
+++ b/tests/avocado/acpi-bits.py
@@ -354,7 +354,11 @@ def tearDown(self):
         if self._vm:
             self.assertFalse(not self._vm.is_running)
         self.logger.info('removing the work directory %s', self._workDir)
-        shutil.rmtree(self._workDir)
+        if not os.getenv('V'):
+            shutil.rmtree(self._workDir)
+        else:
+            self.logger.info('not removing the work directory %s as V is ' \
+                             'passed in the environment', self._workDir)
         super().tearDown()
 
     def test_acpi_smbios_bits(self):
-- 
2.34.1


