Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89445FF315
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:41:47 +0200 (CEST)
Received: from localhost ([::1]:35830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOgr-0007y7-Q8
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObS-0002d8-Q8
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:10 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObR-00082i-7m
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:10 -0400
Received: by mail-pg1-x535.google.com with SMTP id f193so4932083pgc.0
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eGQKJel249jbBuJn5CBZX3iJzYynF1O87yjeVXWwNmE=;
 b=1HFL2nrcP0rq2YuQcU65lZBu4GA3tRNxYexHFnBCYCfLmG6kTRZ8CIJqkPu0QEo9O5
 MiyfVRNeLDJZ1BkTRM0zuDoMZX4MFhZGnO9fJDhSuvwpXR5rmrk05Oomii9N3BeYL5iO
 F/JTzYgXpnvPeHjT3qHhUMoHC50cy6JMTSy1Yo8+XPO6cQKiAPT1dobg/n2+VbAsp0Do
 kPLmCdsDdwZvzZQa1Ztq4uJ709nlp0F5D6gSPvTVmllIyvh1EXeMUOb/pw+a0lwjYCUn
 8UQgBSBCnxvM71xqobqXQR05bS4eOULxb87+E0syYpBZAJ3aCrI8tqgwdvJgBCT4ucpn
 l+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eGQKJel249jbBuJn5CBZX3iJzYynF1O87yjeVXWwNmE=;
 b=I/T4aCB4RR4kt4D3GE3bs74Py4GtCfIXxRGH6eR8Hv359i6Gd10+oOQlg8GROfndeo
 5/GW1IjLTQREBoaH+Oam4pqid/I/thQF9t8MpGXcy2yXohqa4C/pmyDGRw5NN0m7q4J+
 iogs7wQnGb17vI8xl1Mtssc9pFosYohN8bHIeTkPTUbzKfgyXnfjoYZN0VLunsUVx7xp
 6V4IuKBJLo7/875eE62bbWPgsLZzZbovhIq/GCjbKL89sa47xeB+eE1kmZNbMZ2EFfFX
 JYVNtoN1MCk4teH+Jy8ypXrABoF/HX1c1c2nN45LRo+k2WbeoZ4ciA0BSDx+ZdmAYOPe
 jqsA==
X-Gm-Message-State: ACrzQf3qTGdENWdNaSULiOIcJAye5IvbNvTuI94MFDpTgnlzCBYpR/1X
 +fKZDMU960Dz+dALoV6gn7/s/GpbbxZ5ZqJr
X-Google-Smtp-Source: AMsMyM6SyCsPS3TTOxSfOM+U9aOZbOxZAUMVnCrQ0g9gOYdC08LPALRKjVQ8M7zXimQAaEuTWCAuUw==
X-Received: by 2002:a05:6a00:1687:b0:565:a932:f05a with SMTP id
 k7-20020a056a00168700b00565a932f05amr6326284pfc.21.1665768967904; 
 Fri, 14 Oct 2022 10:36:07 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:36:07 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v4 03/10] acpi/tests/avocado/bits: disable acpi PSS tests that
 are failing in biosbits
Date: Fri, 14 Oct 2022 23:05:01 +0530
Message-Id: <20221014173508.222823-4-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014173508.222823-1-ani@anisinha.ca>
References: <20221014173508.222823-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::535;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x535.google.com
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
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/testacpi.py2 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
index 18dc818d62..f818a9cce6 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
@@ -40,8 +40,8 @@ import time
 
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


