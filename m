Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8963C6074F1
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:22:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpAC-0003Gw-VD
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:22:06 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olorn-0002BB-Ms
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorO-0001gb-Vr
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:02:48 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olorI-0006GC-R6
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:02:36 -0400
Received: by mail-pg1-x533.google.com with SMTP id f193so2172425pgc.0
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z6GL747aNys3jONLPu3v5IZEA2sjN65vmxGongvs2Bg=;
 b=Tg0/oASTOdHczf21u9bJacc/I2vKBP9kThBOKvMG4kSVIkwXzkAlto66S6HWhaecYf
 t93JIfAY5MNnDST3lZ0pWVjPgzckM1AOnHy0j/3lWIseQdVXx+zPoSFv0OFo/GSmhpP6
 ND/FAde4W2zMj0v/jX3RKDqIPIiH9EDmJp4qbuDghtv36uNBw0k2fXC8NWuUPbXhZxuk
 8xE18qtZXoGt9rKBzJpWLy6/iouRZaBQdJx4e5r7M4NxsVRGoOzmSkT/TJ7ilyikPWcs
 tSKMGQt2IUITsWoP6EF/qnFQIhFSeF/tb70iN8rLQR/ORKJjV/na+jG/oZJv+7zapFxT
 r/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z6GL747aNys3jONLPu3v5IZEA2sjN65vmxGongvs2Bg=;
 b=fIQjmMNoqTk2XXdhmmQrinBiwtxnmSieilqHiipUhz19fIs8kExO3d/BvjX61iSdWy
 07FdRxBaQgHnPX5tM8zl/WUN8nWcpqEc51JDxabFoAWLfU+0i/zEOaHelOxRPFQOvRG1
 4BlKN8aAVQcfG/E0XouG/wFFB/hU2njwEHv4IxTrCvL+MPmEIk5OT9EobdAvvaTaxMQc
 ClOP9YplHaZyznjsbLQTFKXjaDF+zryDsNtZZYxy68con01K735oTppQfr+XHxz8yAp1
 Cc/PtyZ+wTAN1zp86IRuZcXhG9z/b76E2m+5secj9TUWFZpj5zC3mK91Pcn99enMDNed
 WvMA==
X-Gm-Message-State: ACrzQf3Vgwq9+JldE9jE6hJOR4Y7bkj7al/q1t5aLItUPzg5UZClFhqI
 3H1FbbmJuKaakyD/cYDShi0rUQ==
X-Google-Smtp-Source: AMsMyM4O6A4MNp2xoD6/WDZXdQrq7+DHImLL99Z4KvJijhugmsQg+Gm+rbF50CwU+vhm9v8+OUxD9Q==
X-Received: by 2002:a63:2cd2:0:b0:41c:5901:67d8 with SMTP id
 s201-20020a632cd2000000b0041c590167d8mr15680049pgs.365.1666346547759; 
 Fri, 21 Oct 2022 03:02:27 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.212.245.138])
 by smtp.googlemail.com with ESMTPSA id
 e14-20020a631e0e000000b0042fe1914e26sm12997375pge.37.2022.10.21.03.02.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 03:02:27 -0700 (PDT)
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
Subject: [PATCH v7 0/7] Introduce new acpi/smbios avocado tests using biosbits
Date: Fri, 21 Oct 2022 15:21:01 +0530
Message-Id: <20221021095108.104843-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x533.google.com
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

Please see the rst doc file in patch 6 for more details.
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
v7:
  - added "-icount auto" QEMU param in order to remove timing inconsistencies.
  - removed smilatency test and related changes. smilatency tests passes.

=== SMI latency test ====
Warning: touching the keyboard can affect the results of this test.
Starting test. Wait here, I will be back in 15 seconds.
Summary: 1 passed, 0 failed

  - updated doc based on Alex's suggestions. Incorporated his other suggestions.
  - updated tags.
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


Ani Sinha (7):
  acpi/tests/avocado/bits: initial commit of test scripts that are run
    by biosbits
  acpi/tests/avocado/bits: add SPDX license identifiers for bios bits
    tests
  acpi/tests/avocado/bits: disable acpi PSS tests that are failing in
    biosbits
  acpi/tests/avocado/bits: add biosbits config file for running bios
    tests
  acpi/tests/avocado/bits: add acpi and smbios avocado tests that uses
    biosbits
  acpi/tests/avocado/bits/doc: add a doc file to describe the acpi bits
    test
  MAINTAINERS: add myself as the maintainer for acpi biosbits avocado
    tests

 MAINTAINERS                                   |    7 +
 docs/devel/acpi-bits.rst                      |  145 +
 docs/devel/index-build.rst                    |    1 +
 tests/avocado/acpi-bits.py                    |  396 +++
 .../acpi-bits/bits-config/bits-cfg.txt        |   18 +
 tests/avocado/acpi-bits/bits-tests/smbios.py2 | 2434 +++++++++++++++++
 .../avocado/acpi-bits/bits-tests/testacpi.py2 |  287 ++
 .../acpi-bits/bits-tests/testcpuid.py2        |   87 +
 8 files changed, 3375 insertions(+)
 create mode 100644 docs/devel/acpi-bits.rst
 create mode 100644 tests/avocado/acpi-bits.py
 create mode 100644 tests/avocado/acpi-bits/bits-config/bits-cfg.txt
 create mode 100644 tests/avocado/acpi-bits/bits-tests/smbios.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testacpi.py2
 create mode 100644 tests/avocado/acpi-bits/bits-tests/testcpuid.py2

-- 
2.34.1


