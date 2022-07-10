Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C356D058
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jul 2022 19:13:10 +0200 (CEST)
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAaUX-000613-S6
	for lists+qemu-devel@lfdr.de; Sun, 10 Jul 2022 13:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJj-0007Vx-Gb
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:02:00 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oAaJT-0003RB-1s
 for qemu-devel@nongnu.org; Sun, 10 Jul 2022 13:01:59 -0400
Received: by mail-pg1-x534.google.com with SMTP id 73so2911239pgb.10
 for <qemu-devel@nongnu.org>; Sun, 10 Jul 2022 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rqrck3b6ak37lapLRK1FZzy7J4xATzPy0icWi2Ir0wI=;
 b=eCb2gJkLmYc03PNTcoTuqELwNun4ImFsoGlP4B36UdTZnRmuvxOlROXBlElHYm9uAS
 /ea83jcutn10lydRF9yLhyaa1+fE/Hna/5P+GlDBz3mWdVg9Ga8D5spKvvsszJqNdaZr
 OJu48W7FzDIZfy9U5C3RWriWdntWHp3aIJovhSbemH+enAXenRR6n1dvzI6Uw7klyw2p
 OvVPyJCRi2Q+Mq/yOW+gN6g8rUyfI0iDRjyJdEMTckm0/RQPZYCuf6P4OQaGbcU+3NV+
 R1JzI0HSwc0rHwutBjk0Ic0JvSWahbv5QRuBeDCg3sR0GL52Ejj1W3QnubyroaTaF6ig
 Tmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqrck3b6ak37lapLRK1FZzy7J4xATzPy0icWi2Ir0wI=;
 b=geYogkeesN9oZ2Ppoim/XRKIPaei+/9C4ef+Cuy6PpLDXmON41r8oJMSX3x1kxLZFF
 2MVW3W0s3sdGR2YcoxVKFAtJJYzu5ua7+qAGY22YlHXSHEIWoqkaF9dUvdsSIXm2PsbP
 nCXLhVNOpO4RtJdDazE/aRZFGy7ec7nt2JvZ8oA7VWfkM7w7Ukgmc31xDlUpwj904f0H
 e/q8Msq0VnrkeblTksCXpizyHuixZlbvsmxTkyewq0zbqD23aD/DHPc4cwBZ7a+nW/Mk
 oA8ls2WQ5n0tyxVCy4sYvwgr09GvIC8aMBqlVXotI6a1WKWVUI1BL/XRkEtHfcgcj7zP
 FV/A==
X-Gm-Message-State: AJIora/+cEQz3uZqBkwyDJpGIuZkFJAgxT5B89e6v3BxVqFu5fscO78q
 6bXWinfwviu4yqtk94izyr4jvYknnCcQXcLt
X-Google-Smtp-Source: AGRyM1vozyzLldIBOjobmfXhLs0RBcSLw7l2rPzfgu9H+DB/axJ16xNKB8cSt4S1GhApi6wVBav3lw==
X-Received: by 2002:a62:2544:0:b0:52a:c1dd:8837 with SMTP id
 l65-20020a622544000000b0052ac1dd8837mr5691307pfl.85.1657472501156; 
 Sun, 10 Jul 2022 10:01:41 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.107.107])
 by smtp.googlemail.com with ESMTPSA id
 u14-20020a17090341ce00b0016c19417495sm2930596ple.239.2022.07.10.10.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jul 2022 10:01:40 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org,
	Ani Sinha <ani@anisinha.ca>
Cc: thuth@redhat.com, peter.maydell@linaro.org, berrange@redhat.com,
 jsnow@redhat.com, pbonzini@redhat.com, imammedo@redhat.com, mst@redhat.com
Subject: [PATCH v2 09/11] acpi/tests/bits: add a README file describing bits
 pytests
Date: Sun, 10 Jul 2022 22:30:12 +0530
Message-Id: <20220710170014.1673480-10-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710170014.1673480-1-ani@anisinha.ca>
References: <20220710170014.1673480-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

A README file is added describing the directory structure and the purpose
of every file it contains. It also describes the test added, how to add new
tests, make changes to existing tests or bits config files or regenerate the
bios bits software binaries.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/pytest/acpi-bits/README | 129 ++++++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 tests/pytest/acpi-bits/README

diff --git a/tests/pytest/acpi-bits/README b/tests/pytest/acpi-bits/README
new file mode 100644
index 0000000000..be2ddba8ec
--- /dev/null
+++ b/tests/pytest/acpi-bits/README
@@ -0,0 +1,129 @@
+=============================================================================
+ACPI/SMBIOS PYTESTS USING BIOSBITS
+=============================================================================
+
+Biosbits is a software written by Josh Triplett that can be downloaded by
+visiting https://biosbits.org/. The github codebase can be found here:
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
+This directory contains QEMU pytests written in python that tests the QEMU
+bios components using biosbits and reports test failures.
+
+These tests use python virtual environment. In debian/ubuntu system, the tests
+would require python3.8-venv and python3-pip packages to be installed.
+
+A brief description of the contents of this directory follows:
+
+├── acpi-bits-test.py
+├── acpi-bits-test-venv.sh
+├── bits-config
+│   ├── bits-cfg.txt
+│   └── meson.build
+├── bits-tests
+│   ├── meson.build
+│   ├── smbios.py
+│   ├── smilatency.py
+│   ├── testacpi.py
+│   └── testcpuid.py
+├── meson.build
+├── README
+└── requirements.txt
+
+acpi-bits:
+ - acpi-bits-test-venv.sh: This is a shell script that sets up the virtual
+   environment necessary for the actual python test script to run. Amongst
+   other things, it makes sure that QEMU python library is available within
+   that venv so that QEMU machines can be forked. QEMU python library can be
+   found within python/ directory in QEMU source.
+   After setting up the virtual environment, it runs the python test script
+   from within that environment.
+   If you want to enable verbose mode only for bits test and run make check,
+   one trick is to add V=1 before the call to execute the python script in
+   this file.
+ - acpi-bits-test.py: This is the main python test script that generates a
+   biosbits iso. It then spawns a QEMU VM with it, collects the logs and reports
+   test failures. This is the script one would be interested in if they wanted
+   to add or change some component of the log parsing, add a new command line to
+   how QEMU is spawned etc. Test writers typically would not need to modify
+   this script unless they wanted to enhance or change the log parsing for
+   their tests. Following environment variables are used in this test:
+     - PYTEST_QEMU_BINARY : This should point to the QEMU binary that is being
+       tested. Passing this environment variable is mandatory.
+     - PYTEST_BITSLOC : This is the location that should point to the grub tar
+       archive and the bios bits zip archive needed for this test. If they are
+       absent in that location, the test is skipped. If this environment
+       variable is not passed, the test would first check within the prebuilt/
+       subdirectory to see if those binaries already exists. If they do, then
+       the test would use them. If those binaries are absent, the test would
+       try to download them from a remote repository. If the download fails,
+       the test is skipped. If the download succeeds, the test uses the
+       downloaded binaries.
+       When the user wants to run the test in offline mode, this environment
+       variable is very useful. The user can check out the bios bits archive
+       earlier when connectivity existed. Then in the offline mode, the user
+       can point this environment variable to the location where the archives
+       were downloaded and run the test.
+     - V=1 : This enables verbose mode for the test. It dumps the entire log
+       from bios bits and also more details in case failure happens. It is
+       useful for debugging the test failures or tests themselves.
+     - PYTEST_PWD : Present working directory where the test would look for
+       the QEMU binary. Optional.
+
+- requirements.txt: This text file contains the dependent python libraries
+   needed for the tests to run. If a new dependent library is needed, it would
+   be added here as a new entry and then acpi-bits-test-venv.sh would install
+   it when setting up the python virtual environment using pip.
+ - README: This text file.
+
+acpi-bits/bits-config:
+   This location contains biosbits config files that determine how the software
+   runs the tests.
+ - bits-config.txt: this is the biosbits config file that determines what tests
+   or actions are performed by bits. The description of the config options are
+   provided in the file itself.
+
+acpi-bits/bits-tests:
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
+   step (b): update meson.build and add this file to the list.
+   Commit (a) and (b) together in the same commit.
+
+   step (c): perform modifications to the test.
+   Commit (c) in a separate commit.
+
+   The test framework will then use your modified test script to run the test.
+   No further changes would be needed. Please check the logs to make sure that
+   appropriate changes have taken effect.
+
+meson.build files makes sure that the bits pytests are appropriately integrated
+into the QEMU pytest framework and are run with "make check-pytest".
+Currently, the bits test is configured to run only for x86_64 architectures. Bits
+has been built only for this architecture.
+
+
+Author: Ani Sinha <ani@anisinha.ca>
+
+References:
+(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
+(b) https://www.youtube.com/watch?v=36QIepyUuhg
-- 
2.25.1


