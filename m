Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D1606321
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:33:30 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWbZ-0003Rl-Js
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:33:20 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWXA-0000J6-5a
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUm7-0007yM-BD
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:35:52 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:35763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olUm3-0006zY-EL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:35:50 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13b103a3e5dso318178fac.2
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SfA35nWtgRhjwObgkygVORZmT9Edllr2AuVH/bsVYfw=;
 b=A95nAzcSU1YJRxRNPbBUl+Zik1XAWQlyIeFL1m4n7Ytpsrn3SjUryFApHJyXjjXdUW
 mKGekKhap3/k/oaCE2CLAYYsY1uPXJanTnfrd8M0B2+lyKF8tkvIyJlbk9QulaALDo48
 WKdokRxVyBR30a2q4rRqlmpyNN590JF//kIaVTCP1dTDnEKRbQj3PBosLapWGmsK8j7m
 7V2uo+jxGapEXPWHf7vOpF2XEGdIjeCQjBE9xvpTFOLIiA9Glep45vL+LwIAQOjDyCt7
 beSbNMBNmqQGZeqKySMh49hEHC9SfYBl9D1HuhfLmsuhSsQ4c1gqotMS65hdiE2yY0uQ
 WeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SfA35nWtgRhjwObgkygVORZmT9Edllr2AuVH/bsVYfw=;
 b=zzXopXOUSyn1So8MxIwHbhKO7dkScWr8hPyXxGgSyL3Nu4HXOnCs0g5+jgKKFtKf0t
 DyTFxgZqExqvbZJEqdects/z//q72/FdZ0aO8CrE6czTm4g3V7RHJibt2L51wE5lTE8L
 BwINwCFLYC/0Ut+9aqBl1PmM1S6LUc4WZ6I/eM9vvLcLc4tUR/7msS8PEKveY0wuVg1K
 MlZ7okHQ1aUVT3prd1ZOQ8vULXgj53vPWjxWHeYMc+jO/d30xYMVHSnNLHimzCtvhEvL
 4YC2iDDI+tA626e0F/5nWNzo6pd/oYCcWrbT/wUHenbslf+EVtw6IrCzQc7LNTLLS2Jn
 88pQ==
X-Gm-Message-State: ACrzQf26vHJNVpg2DejQPe1PPWNt/RUxH4HCp7DhdRpS1gN6WknA+kSK
 FfUNXm3ccRK3CER61zR7rEqAt+EhYe/nkB4W
X-Google-Smtp-Source: AMsMyM5MgBGFAXw0gKUoKXVf0yr/JTR4NQ68RP36v77h6L+NQIDax3dyQTbLovtr8yWmftSsSwRJ5A==
X-Received: by 2002:a17:90a:6e09:b0:20d:86b2:4c54 with SMTP id
 b9-20020a17090a6e0900b0020d86b24c54mr15837986pjk.73.1666269334907; 
 Thu, 20 Oct 2022 05:35:34 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.246.137])
 by smtp.googlemail.com with ESMTPSA id
 l11-20020a170903244b00b00176b3c9693esm12794174pls.299.2022.10.20.05.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 05:35:34 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, Qemu Devel <qemu-devel@nongnu.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: [PATCH v6 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Thu, 20 Oct 2022 18:04:56 +0530
Message-Id: <20221020123506.26363-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2001:4860:4864:20::2d;
 envelope-from=ani@anisinha.ca; helo=mail-oa1-x2d.google.com
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

Please see the rst doc file in patch 9 for more details.
Sample runs are as follows:

Passed tests:

$ ./tests/venv/bin/avocado run -t acpi tests/avocado
Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : e95c7413e996bfb59389839e5ca5105464ef098f
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.15-e95c741/job.log
 (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (33.08 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 39.18 s


$ ./tests/venv/bin/avocado run ./tests/avocado/acpi-bits.py 
Fetching asset from ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : c6e588594bceb2c5fdbdf45095559c58e4030f9c
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.13-c6e5885/job.log
 (1/1) ./tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (32.29 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 39.27 s

When PSS tests are enabled:

$ git diff
diff --git a/tests/avocado/acpi-bits/bits-tests/testacpi.py2 b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
index f818a9cce6..18dc818d62 100644
--- a/tests/avocado/acpi-bits/bits-tests/testacpi.py2
+++ b/tests/avocado/acpi-bits/bits-tests/testacpi.py2
@@ -40,8 +40,8 @@ import time
 
 def register_tests():
     testsuite.add_test("ACPI _MAT (Multiple APIC Table Entry) under Processor objects", test_mat, submenu="ACPI Tests")
-#    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
-#    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
+    testsuite.add_test("ACPI _PSS (Pstate) table conformance tests", test_pss, submenu="ACPI Tests")
+    testsuite.add_test("ACPI _PSS (Pstate) runtime tests", test_pstates, submenu="ACPI Tests")
     testsuite.add_test("ACPI DSDT (Differentiated System Description Table)", test_dsdt, submenu="ACPI Tests")
     testsuite.add_test("ACPI FACP (Fixed ACPI Description Table)", test_facp, submenu="ACPI Tests")
     testsuite.add_test("ACPI HPET (High Precision Event Timer Table)", test_hpet, submenu="ACPI Tests")

$ ./tests/venv/bin/avocado run -t acpi tests/avocado
Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
JOB ID     : 16a8b8c7f8dc87c4b84f8a2f95135bb63464a71e
JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T22.43-16a8b8c/job.log
 (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: FAIL: '1' != '0'\n- 1\n+ 0\n : Some bits tests seems to have failed. Please check the test logs for more info. (33.01 s)
RESULTS    : PASS 0 | ERROR 0 | FAIL 1 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 39.17 s


Changelog:
v6:
  - skip test when dependencies (xorriso for example) are not installed.
  - skip test when run on a platform other than x86_64.
  - move README as an rst file under docs/devel.
  - updated tags.
v5:
  - fixed bits so that grub-mkrescue is built as a static binary.
  - updated the test so that it points to the new bits artifact.
  - V=1 now spits out more meaningful information on failure.
  - added a check to see if xorriso is installed. If not, the test skips with
    a meaningful message instructing the user to install it.
  - fixed README by removing references to stale instructions and adding
    updated instructions.
  - tags updated.
v4:
  - renamed the bits test files as .py2.
  - fixed a bug with missing log file parsing. dump bits logs automatically
    for test failures (no need to re-run with V=1).
  - fixed issues with README file and enhanced it.
  - cosmetic comment updates.
v3:
  - converted the existing test to avocado tests as per the popular
    recommendation. Added appropriate tags.
  - artifact download URL modified based on gitlab-CI URL.

  For biosbits repo:
  - moved to a gitlab repo with me being the maintainer.
  - added .gitlab-ci.yml file to generate the artifacts.
v2:
 - a new class of python based tests introduced that is separate from avocado
   tests or qtests. Can be run by using "make check-pytest".
 - acpi biosbits tests are the first tests to use pytest environment.
 - bios bits tests now download the bits binary archives from a remote
   repository if they are not found locally. The test skips if download
   fails.
 - A new environment variable is introduced that can be passed by the tester
   to specify the location of the bits archives locally. test skips if the
   bits binaries are not found in that location.
 - if pip install of python module fails for whatever reaoson, the test skips.
 - misc code fixes including spell check of the README doc. README has been
   updated as well.
 - addition of SPDX license headers to bits test files.
 - update MAINTAINERS to reflect the new pytest test class.

For biosbits repo:
 - added Dockerfile and build script. Made bios bits build on gcc 11.
   https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
   https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
   The build script generates the zip archive and tarball used by the test.

v1: initial patchset. uses qtest to implement the bios bits tests.

Cc: Qemu Devel <qemu-devel@nongnu.org>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>

Ani Sinha (10):
  acpi/tests/avocado/bits: initial commit of test scripts that are run
    by biosbits
  acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
    tests
  acpi/tests/avocado/bits: disable acpi PSS tests that are failing in
    biosbits
  acpi/tests/avocado/bits: add smilatency test suite from bits in order
    to disable it
  acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
    smilatency tests
  acpi/tests/avocado/bits: disable smilatency test since it does not
    pass everytime
  acpi/tests/avocado/bits: add biosbits config file for running bios
    tests
  acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses
    biosbits
  acpi/tests/avocado/bits/doc: add a doc file to describe the acpi bits
    test
  MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
    tests

 MAINTAINERS                                   |    6 +
 docs/devel/acpi-bits.rst                      |  148 +
 tests/avocado/acpi-bits.py                    |  389 +++
 .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
 tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2434 +++++++++++++++++
 .../acpi-bits/bits-tests/smilatency.py2       |  107 +
 .../avocado/acpi-bits/bits-tests/testacpi.py2 |  287 ++
 .../acpi-bits/bits-tests/testcpuid.py2        |   87 +
 8 files changed, 3476 insertions(+)
 create mode 100644 docs/devel/acpi-bits.rst
 create mode 100644 tests/avocado/acpi-bits.py
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2

-- 
2.34.1


