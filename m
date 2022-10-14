Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC155FF31E
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 19:47:24 +0200 (CEST)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojOmJ-0005Lj-Gf
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 13:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojOcA-0003HP-N0
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:54 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:38641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ojOc8-0008BX-Fl
 for qemu-devel@nongnu.org; Fri, 14 Oct 2022 13:36:54 -0400
Received: by mail-pl1-x62b.google.com with SMTP id o21so2973864ple.5
 for <qemu-devel@nongnu.org>; Fri, 14 Oct 2022 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=usU4IJGAuVj2QRylQJgWxXPnJnB2R4kNFG9T/K9SdN0=;
 b=039W625fVbaCZOXX4xAsI0TNM5zNWecWzsr9PGeJs4bYh3pT7De8uX6Ll/EKDMu4uV
 GJF0I1ultrSInTyMBKr0VxbQGy9e7WFCbHeSZ+bdNRzEdeTpVgoBwSg5eDcgwg2xCv0L
 cYop0kBH2WqAn/sTmWwPe22X4oJTyZXVNIx0F3aGn8DipvU06thkqxgf3sBxQvJhjfUe
 cbGtSQfVMpELtpsz5tTRbCGD7iJDp7ijnmCSFYKMJd246tuNcWA6dnMNufpTXu8sExP6
 NysQGMumhMbdc6sgFLLZoTl+n3PrBwDQB3KbRiyXXTCd2Rhkc3ShAcmdxk/ANWeJvmMB
 Ar9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=usU4IJGAuVj2QRylQJgWxXPnJnB2R4kNFG9T/K9SdN0=;
 b=v99hmTTMZAGECqqTBx1SfqK2yJltrIWCB4OcelzYMqe+cfLedwSll5kCfX1ZKUL8Fg
 Y1VW1EUswWJczvyWFvvodLL/yl6f8zK9oI3Zrtl4hfg+V1yZMdpBbAN/17xmKmX63fQo
 KBPQzz7tqZ3aai5CqigKU6GqmaUHBd0L15njDDwi0vUJMomp+VQ7Ct6nzcMlbCT9zeM6
 Ul69A2AtZkv16V4nDuYHRHyfhPejLp051TlmKlMa7uIQdSfIm0TqGgj7QWRKZ3+ya7YY
 Th7fIgwGJAIWnOTYv31FWbkfpFwerFJ81i4Egg1fh0wGvJ8HuORkieLoMBLxSj6RlwGA
 tpYA==
X-Gm-Message-State: ACrzQf0V5BItM7gMwAkmCuik4YfWrfCYI64RmJ1UArbPtQdDub8iV01G
 H5E0eMbHPzCs4fwkP90zi9iBCg==
X-Google-Smtp-Source: AMsMyM64BM+/k5lXQLFmhFDaJgTT6iZLfe32140azy/g5xc8leJr4dZiayINY5mrJ1DjMiXBCfMz6A==
X-Received: by 2002:a17:90b:3c8f:b0:20d:959b:26f4 with SMTP id
 pv15-20020a17090b3c8f00b0020d959b26f4mr7088441pjb.104.1665769011190; 
 Fri, 14 Oct 2022 10:36:51 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.243.197])
 by smtp.googlemail.com with ESMTPSA id
 t13-20020a1709027fcd00b0016d8d277c02sm2030042plb.25.2022.10.14.10.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 10:36:50 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Subject: [PATCH v4 09/10] acpi/tests/avocado/bits: add a README file to
 describe the test
Date: Fri, 14 Oct 2022 23:05:07 +0530
Message-Id: <20221014173508.222823-10-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014173508.222823-1-ani@anisinha.ca>
References: <20221014173508.222823-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62b;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62b.google.com
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

Add a README file that describes the purpose of the various test files and gives
guidance to developers on where and how to make changes.

Cc: Daniel P. Berrange" <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/README | 128 +++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 tests/avocado/acpi-bits/README

diff --git a/tests/avocado/acpi-bits/README b/tests/avocado/acpi-bits/README
new file mode 100644
index 0000000000..6950d8d7db
--- /dev/null
+++ b/tests/avocado/acpi-bits/README
@@ -0,0 +1,128 @@
+=============================================================================
+ACPI/SMBIOS AVOCADO TESTS USING BIOSBITS
+=============================================================================
+
+Biosbits is a software written by Josh Triplett that can be downloaded
+from https://biosbits.org/. The github codebase can be found here:
+https://github.com/biosbits/bits/tree/master. It is a software that executes
+the bios components such as acpi and smbios tables directly through acpica
+bios interpreter (a freely available C based library written by Intel,
+downloadable from https://acpica.org/ and is included with biosbits) without an
+operating system getting involved in between.
+There are several advantages to directly testing the bios in a real physical
+machine or VM as opposed to indirectly discovering bios issues through the
+operating system. For one thing, the OSes tend to hide bios problems from the
+end user. The other is that we have more control of what we wanted to test
+and how by directly using acpica interpreter on top of the bios on a running
+system. More details on the inspiration for developing biosbits and its real
+life uses can be found in (a) and (b).
+This directory contains tests written in python using avocado framework that
+exercizes the QEMU bios components using biosbits and reports test failures.
+For QEMU, we maintain a fork of bios bits in gitlab along with all the
+dependent submodules:
+https://gitlab.com/qemu-project/biosbits-bits
+This fork contains numerous fixes, a newer acpica and changes specific to
+running this avocado QEMU tests using bits. The author of this document
+is the sole maintainer of the QEMU fork of bios bits repo.
+
+Under the directory tests/avocado/, acpi-bits.py is a QEMU avocado test that
+drives all this.
+
+A brief description of the various test files follows.
+
+Under tests/avocado/ as the root we have:
+
+├── acpi-bits
+│ ├── bits-config
+│ │ └── bits-cfg.txt
+│ ├── bits-tests
+│ │ ├── smbios.py2
+│ │ ├── smilatency.py2
+│ │ ├── testacpi.py2
+│ │ └── testcpuid.py2
+│ └── README
+├── acpi-bits.py
+
+tests/avocado:
+ - acpi-bits.py: This is the main python avocado test script that generates a
+   biosbits iso. It then spawns a QEMU VM with it, collects the log and reports
+   test failures. This is the script one would be interested in if they wanted
+   to add or change some component of the log parsing, add a new command line
+   to alter how QEMU is spawned etc. Test writers typically would not need to
+   modify this script unless they wanted to enhance or change the log parsing
+   for their tests. Following environment variables are used in this test:
+     - V=1 : This enables verbose mode for the test. It dumps the entire log
+       from bios bits and also more details in case failure happens. It is
+       useful for debugging the test failures or tests themselves.
+
+   In order to run this test, please perform the following steps:
+   from the QEMU build directory:
+
+   $ make check-venv (needed only the first time to create the venv)
+   $ ./tests/venv/bin/avocado run -t acpi tests/avocado
+
+   The above will run all acpi avocado tests including this one.
+   In order to run the individual test, perform:
+
+   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
+
+   The above will produce output in tap format. You can omit "--tap -" in the
+   end and it will produce more output like the following:
+
+   $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
+     Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
+     JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
+     JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17.58-eab2257/job.log
+     (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (33.09 s)
+     RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
+     JOB TIME   : 39.22 s
+
+   You can inspect the log file for more information about the run or in order
+   to diagnoze issues. If you pass V=1 in the environment, more diagnostic logs
+   would be found in the test log.
+
+tests/avocado/acpi-bits:
+ - README: This text file.
+
+tests/avocado/acpi-bits/bits-config:
+   This location contains biosbits config files that determine how the software
+   runs the tests.
+ - bits-config.txt: this is the biosbits config file that determines what tests
+   or actions are performed by bits. The description of the config options are
+   provided in the file itself.
+
+tests/avocado/acpi-bits/bits-tests:
+   This directory contains biosbits python based tests that are run from within
+   the biosbits environment in the spawned VM. New additions of test cases can
+   be made in the appropriate test file. For example, new acpi tests can go
+   into testacpi.py and one would call testsuite.add_test() to register the new
+   test so that it gets executed as a part of the ACPI tests.
+   It might be occasionally necessary to disable some subtests or add a new
+   test that belongs to a test suite not already present in this directory. To
+   do this, please extract the bits source from the zip file mentioned above.
+   Copy the test suite/script that needs modification (addition of new tests
+   or disabling them) from boot/python location of the extracted directory
+   into this directory.
+
+   step (a): copy unmodified test script to this directory.
+
+   step (b): perform modifications to the test.
+   Commit (a) and (b) in separate commits so that the original test script
+   and the changes we have made are separated and clear.
+
+   The test framework will then use your modified test script to run the test.
+   No further changes would be needed. Please check the logs to make sure that
+   appropriate changes have taken effect.
+
+   The tests have an extension .py2 in order to indicate that
+   (a) they are python2.7 based scripts and not python 3 scripts.
+   (b) they are run from within the bios bits VM and is not subjected to QEMU
+       build/test python script maintainance and dependency resolutions.
+   (c) They need not be loaded by avocado framework when running tests.
+
+
+Author: Ani Sinha <ani@anisinha.ca>
+
+References:
+(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
+(b) https://www.youtube.com/watch?v=36QIepyUuhg
-- 
2.34.1


