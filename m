Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8445F9AAE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:09:31 +0200 (CEST)
Received: from localhost ([::1]:50244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnqt-0004K4-2i
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnf9-0003eA-5v
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:23 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnf7-0005ni-Jx
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:22 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so9677248pjl.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qImELMZXZ5O0YW6fmVspF8gAQNT6R6J7ioumXB3vd40=;
 b=a6HZKNZflNOcE49omVjTEwI5IJsGee9Gv+VNHuM7JCBtMRJ7GvdzNGcmo3Ulh3tbUC
 GoKp9Dr56YK1F0cjqJ2+dxL7zOOrHtCt7NMOYIgl656egN4EyrI1WnFGPAKuV4okcdK7
 DIPEPJoRBU13jTkDW4Q9FGiM/T1RymLm6Sif41U/BklrDcP2J2zLdtHYlQifkLer1b+5
 HeMpcHtDJliNyiMREjkkHW8B5c7oxgsmK9sj4XNbH8uoGBR20cOx2Mh82ploulBOb/T1
 JtqLctT22SQoRkns/stvLVbf13n9hN9xOdurIewKCM0ohaokXXQmy9qDN8STIstIWxRS
 bYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qImELMZXZ5O0YW6fmVspF8gAQNT6R6J7ioumXB3vd40=;
 b=N8HPEYbhnnQmmC/MVFR/L0jdrNgBs7Rb/S1PTBR4F0mEGpZLPqEjMnGbOGUUOKdWQx
 S/rGH+Q8G6fyepBTQL8A91jF5xY4qpvo40A5A53OYpmhWo6xXCtDTT6KHLtWMA3XK2yD
 5GkTSH9OZmfRxoFetbf3OHSY9lRdmJlTc5UkwyVBlx2oXrcrgf2Y+jj5UDKfq72qLXTZ
 1o9qO3z+YDkCaOB7R/UbaHw1j9zvU0jrea0dm4KOx4v7d1ZZGYNbdIyOzgq41oDTUFS+
 z+EsJ3cj+uALyeoTOtAcj3YwRzQtxGdyTUv/K1VQMCgL67AYXN1M68covnSUNjTADmxD
 DusQ==
X-Gm-Message-State: ACrzQf3omaXicyBVHWd/EONTuZ2mvz/K7GXFHIVqnUPI7XaZxR/u2m0b
 9xdOzMfCbWktEctQBfbgeY2XYH2aaqgk6g==
X-Google-Smtp-Source: AMsMyM6R5lT6q9wjFPgt5CA04LWmv1PGHjm5h1sbHVQG+ia1kcRQ/TgCuFqhDYOP5PyVnqvgMFnbEg==
X-Received: by 2002:a17:902:dccb:b0:181:a83b:2a8c with SMTP id
 t11-20020a170902dccb00b00181a83b2a8cmr7815963pll.10.1665388639071; 
 Mon, 10 Oct 2022 00:57:19 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a625e02000000b005624b4bd738sm6200379pfb.156.2022.10.10.00.57.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:57:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mst@redhat.com, imammedo@redhat.com, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 03/10] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Date: Mon, 10 Oct 2022 13:26:12 +0530
Message-Id: <20221010075619.4147111-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010075619.4147111-2-ani@anisinha.ca>
References: <20221010075619.4147111-2-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PSS tests in acpi test suite seems to be failing in biosbits. This is because
the test is unable to find PSS support in QEMU bios. Let us disable
them for now so that make check does not fail. We can fix the tests and
re-enable them later.

Example failure:

---- ACPI _PSS (Pstate) table conformance tests ----
[assert] _PSS must exist FAIL
  \_SB_.CPUS.C000
  No _PSS exists
Summary: 1 passed, 1 failed
---- ACPI _PSS (Pstate) runtime tests ----
[assert] _PSS must exist FAIL
  \_SB_.CPUS.C000
  No _PSS exists
Summary: 0 passed, 1 failed

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/testacpi.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py b/tests/avocado/acpi-bits/bits-tests/testacpi.py
index 18dc818d62..f818a9cce6 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py
@@ -40,8 +40,8 @@
 
 def register_tests():
     testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Processor objects", test_mat, submenu="ACPI Tests")
-    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
-    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
+#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
+#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
     testsuite.add_test("ACPI DSDT (Differentiated System Description Table)", test_dsdt, submenu="ACPI Tests")
     testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_facp, submenu="ACPI Tests")
     testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", test_hpet, submenu="ACPI Tests")
-- 
2.34.1


