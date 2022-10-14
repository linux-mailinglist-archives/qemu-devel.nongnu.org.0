Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A0C5FF30B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:41:01 +0200 (CEST)
Received: from localhost ([::1]:47562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOg7-00076Y-Rt
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojObE-0002L3-98
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:35:56 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojOb9-0007wY-Jd
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:35:56 -0400
Received: by mail-pl1-x632.google.com with SMTP id 10so5436066pli.0
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mw9yfJ2LtHiagslkG34ibpExfSNSrF6cyHSLRWxbBSg=;
 b=e+3j9ltsTbD1T1KCic9HRDZ60nRGDyJb/TMyHD3MWtbpX9djvrW7h9xbClgAxwzXpM
 AN/T+DtTrScspLd0aVFvVnAE6dT71qRC+BB0N3DQI2wZYDN305qZCNmd1PeHqEOiO8q8
 ZYempEpYRL5AWGRIjCebc498MNMgY0BiaKAAbciJyajxL9t0hM/gX2NXGxmZ7KOynQMl
 HGLfxeoUez/23hIpmgErUd2wFuCnYU2izYhnjANDlVEKaMgbeeesFp6dcgzpw5v2ZnY7
 cKnTknZrNTjAAbD0xKCVfgIfwataDAzqIpOGPg5uD3ClElQZ/gt4AlS61iu9qk7o8V/b
 icBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mw9yfJ2LtHiagslkG34ibpExfSNSrF6cyHSLRWxbBSg=;
 b=A8ILYyT+VnvrIExkSlIuVogsSVcpNMYmZNQ87iifnZQpWdU60kIe3FET+8NhurEifW
 FfQu/TTPqk9vGV61w0QMpprh0NEC1b1iF5yRaCl09xYopPQ6g9H6LB68bEMKVU9eV2fz
 DidVeLsE5EFMBDHH5i53L5xyZCK1kOsT017M3Fs1UrWb8VnwLxHUSGu4GwCf/GlXiAwZ
 4Mq/hEy2Zmyc+52cgbQnlzcpTsIq7I0iLhc7WEmZi5tQaf5+bst4TveegnCwc6TXEEeA
 dgqymW/K4z1tFDWUfXtHA9DGFGTsHRLigwzs9xJOTiFwrVC5KivqHmKPTMq5IXVteXTF
 Fe2Q==
X-Gm-Message-State: ACrzQf0WZctV9vffKLld/L4W6Cc+R4Dfk/dLySru3tkfio/rbQIQ+TaS
 0gDHbfA9tCi7QJN3oaCWfCR2nQ==
X-Google-Smtp-Source: AMsMyM6L5ABd8/Cei2a4mledOkfmWKLbbcZDkisnpiXhut3zk+OOvNhcXHTtqc5zS5AHAL2vPwcUFA==
X-Received: by 2002:a17:90b:4c04:b0:20d:4ef6:aacc with SMTP id
 na4-20020a17090b4c0400b0020d4ef6aaccmr18770129pjb.199.1665768946612; 
 Fri, 14 Oct 2022 10:35:46 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:35:46 -0700 (PDT)
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
Subject: [PATCH v4 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Fri, 14 Oct 2022 23:04:58 +0530
Message-Id: <20221014173508.222823-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::632;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x632.google.com
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

Please see the README file in patch 9 for more details.
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
  acpi/tests/avocado/bits: add a README file to describe the test
  MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
    tests

 MAINTAINERS                                   |    6 +
 tests/avocado/acpi-bits.py                    |  353 +++
 tests/avocado/acpi-bits/README                |  128 +
 .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
 tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2434 +++++++++++++++++
 .../acpi-bits/bits-tests/smilatency.py2       |  107 +
 .../avocado/acpi-bits/bits-tests/testacpi.py2 |  287 ++
 .../acpi-bits/bits-tests/testcpuid.py2        |   87 +
 8 files changed, 3420 insertions(+)
 create mode 100644 tests/avocado/acpi-bits.py
 create mode 100644 tests/avocado/acpi-bits/README
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2

-- 
2.34.1


