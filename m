Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DACB603867
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 05:07:48 +0200 (CEST)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okzQn-0005pz-QR
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 23:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzI2-0001mo-EM
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:58:42 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okzI0-0003RX-06
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 22:58:41 -0400
Received: by mail-pl1-x62e.google.com with SMTP id i6so15630397pli.12
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 19:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PhxwtSP3EsWTF7oR9k2ew5PWkIP7Rm88K5wF9Ct85GQ=;
 b=K9NdzDHe5MGlMMa2zemoyjUziugVbCjTBRPWIGR5XB24VGzP65DYuynQ0FV/M5nkbn
 hScCyEfClCVJdbv2RlP4pwloNsZZD3nWsz6aQfXtJ47uqaQNfh7mOW4E50aa5KkznOzM
 xzT93egk5EH9VKYtgUczVZwWjgUsoLuuPdnH8KU/tloCZk4wMDKzdBcU6HsPkK1IA+q1
 OSCzYybbs1XIyCHJgyiucZFRj7wWMGsxJ/rcEcHUX24WWFimBji2tLjhgYUPMpCZU3wv
 GIiX98BkCFd4uLPVrbNkGx9vmFAm6FVeqYoKwjdv8rK1CzlcNL/YS/BW44Jy8IPCyLcn
 HLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PhxwtSP3EsWTF7oR9k2ew5PWkIP7Rm88K5wF9Ct85GQ=;
 b=vriV8x78c8DLVBzLJpzRLPQ/T0mouhrY0i9+N+fTRQkV7L9XKzFP7XtQUE4VXVjL55
 DGhVhOqjcBEwwIupgBG+qQ94mR1BG180lZBP13q40CTDLobpNG6Bn5XD0XBCDdusyKOc
 TPCn1siukW4fhsWjzBmMiSYO7OQ9mf2WhJBgqxAjVxb/ZKPTtNrlWeb5utYN0MMiUbii
 hHNerIHw0mkeypABv3w2bsMu7EfksKH63DGuXm5yTyXz54up5nuCKL8qo1roRGOZ4XcC
 w+0HMl9HEimKTIAyBfeT1mD8/iqzM9EwvxyN5x43MvZ4hMdelr6QSm5b8S2Of6e/k1/l
 HSmw==
X-Gm-Message-State: ACrzQf0vwpUxxWNf71Juog/ZcgHXuXhqoKW0vssoLaW15Rim5ZABkZXJ
 4yEhyDaVReNPhW6yh+ESFxGZyw==
X-Google-Smtp-Source: AMsMyM5DEisM1fOBKuNIJ/U0OmEyHKcBM7752sCtt3UZecNZ60r1mu93kWi8v02A4JUzOi2ZD8y+MA==
X-Received: by 2002:a17:903:1053:b0:185:37cb:da04 with SMTP id
 f19-20020a170903105300b0018537cbda04mr6266267plc.108.1666148317872; 
 Tue, 18 Oct 2022 19:58:37 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.142.248])
 by smtp.googlemail.com with ESMTPSA id
 203-20020a6214d4000000b005626fcc32b0sm10320593pfu.175.2022.10.18.19.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 19:58:37 -0700 (PDT)
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
Subject: [PATCH v5 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Date: Wed, 19 Oct 2022 08:28:18 +0530
Message-Id: <20221019025828.683113-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62e.google.com
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
  acpi/tests/avocado/bits: add a README file to describe the test
  MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
    tests

 MAINTAINERS                                   |    6 +
 tests/avocado/acpi-bits.py                    |  363 +++
 tests/avocado/acpi-bits/README                |  133 +
 .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
 tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2434 +++++++++++++++++
 .../acpi-bits/bits-tests/smilatency.py2       |  107 +
 .../avocado/acpi-bits/bits-tests/testacpi.py2 |  287 ++
 .../acpi-bits/bits-tests/testcpuid.py2        |   87 +
 8 files changed, 3435 insertions(+)
 create mode 100644 tests/avocado/acpi-bits.py
 create mode 100644 tests/avocado/acpi-bits/README
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smilatency.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2

-- 
2.34.1


