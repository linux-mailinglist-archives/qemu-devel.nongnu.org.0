Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2D655B854
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 09:48:08 +0200 (CEST)
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5jTb-0003RR-MD
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 03:48:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jD5-0005fp-IA
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:31:03 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:42840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o5jD3-00066f-8U
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 03:31:03 -0400
Received: by mail-pl1-x62f.google.com with SMTP id jb13so7393385plb.9
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 00:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qy9AWsz8rYWaNTIyJpEsyqxUHWXGXQepnsbPdWDlZLE=;
 b=G1V1+zuDp/8Tt4m8RxS6ZYv2GU0lJ4Nxiq/untohxAhCzeHSImhkaBXgx7vWj8La5W
 iyvj7xqSX13NNEX07pTW1VjM7sy4KSOqBNEFpNAiAe+tQZsH35SJ0RKCGTBQqMUZ3dW/
 mu+fpwwXXFBroJPFkVkitXV91yCkNGLxNpysIYm8cB8VGRe2j4GiD+uhVszdDWf+Bj/E
 Hc8KM2iw/L+/uQiHtUkYv/mF96NhZPs61yX0quswtUteUwju8I0w6NZNnb65HAoDa0xE
 rXakCvYylr+9JZMWf/cyUDbJ+kJgxN+TVXIyQcP3oc4Z2xTFgmp5tng+kN5SdVzKOfIg
 O+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qy9AWsz8rYWaNTIyJpEsyqxUHWXGXQepnsbPdWDlZLE=;
 b=b8n1L+H1jNUcAwkv2nNAiUATAS7RC8/cBZIwFdNSdlcw4+4ki3JDIAxWk70WT3zsEb
 TWWyTdr0X58yRexWN7zx9YmxEw49L+VEcOs3ek08llTAexH2AmNVzqIlobrp7DPEntO7
 6aZ69W7/yPdnQWmHjOWCMKyr1Lw8cJDf3B3FjV4dh/9+A89o/Wx6hspOz7wiTHE8yoE2
 Lu9LKPhApJpgCVFvyAt7B8hSBs0jNLul3CrsNorltQL3wLu/mw8hU+WF6S2rAVNnEkwr
 l6vuCCDsKcf98ZcZgRvIwbpb5V/ZAMjj5TsjVlH7+JYtkBIeLHH+zDOUQqSl9pfi5ltg
 EQbQ==
X-Gm-Message-State: AJIora+ES1FJMcLboxAtuuTRcTEY6uswksBbIgdAURu0sVK1kf98D5wV
 CtPAokzNsCbMfB4lF6QmXiMuL+3B7uHwA+PU7vs=
X-Google-Smtp-Source: AGRyM1uHGfQK7qyvKoVDAtyR0nUxj9A1t4n3QWXB4xGLuPANairn/fLDA985OPPFK3/BaY48fRZaOA==
X-Received: by 2002:a17:903:18f:b0:16a:5c43:9a85 with SMTP id
 z15-20020a170903018f00b0016a5c439a85mr13097035plg.122.1656315059548; 
 Mon, 27 Jun 2022 00:30:59 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([115.96.136.66])
 by smtp.googlemail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm6420928plk.137.2022.06.27.00.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 00:30:59 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: imammedo@redhat.com,
	mst@redhat.com
Subject: [PATCH 11/12] acpi/tests/bits: add README file for bits qtests
Date: Mon, 27 Jun 2022 12:58:55 +0530
Message-Id: <20220627072856.1529357-12-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627072856.1529357-1-ani@anisinha.ca>
References: <20220627072856.1529357-1-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The README file is added describing the directory structure and the purpose
of every file it contains. It also describes how to add new tests, make changes
to existing tests or bits config files or regenerate the bits software.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/acpi-bits/README | 168 +++++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 tests/qtest/acpi-bits/README

diff --git a/tests/qtest/acpi-bits/README b/tests/qtest/acpi-bits/README
new file mode 100644
index 0000000000..97b15f1665
--- /dev/null
+++ b/tests/qtest/acpi-bits/README
@@ -0,0 +1,168 @@
+=============================================================================
+ACPI/SMBIOS QTESTS USING BIOSBITS
+=============================================================================
+
+Biosbits is a software written by Josh Triplett that can be downloaded by
+visiting https://biosbits.org/. The github codebase can be found here:
+https://github.com/biosbits/bits/tree/master. It is a software that exercizes
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
+This directory contains QEMU qtests written in python that exercizes the QEMU
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
+├── prebuilt
+│   ├── bits-2095-grub.tar.gz
+│   ├── bits-2095.zip
+│   └── meson.build
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
+   to add or change some component of the log parsing, add a new commandline to
+   how QEMU is spawned etc. Test writers typically would not need to modify
+   this script unless they wanted to enhance or change the log parsing for
+   their tests.
+ - requirements.txt: This text file contains the dependent python libraries
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
+acpi-bits/prebuilt:
+   This location contains prebuilt biosbits binaries that are used to generate
+   the bits iso file for testing.
+ - bits-2095.zip: The contents from this zip archive are the main contents of
+    the iso file that are used for testing. This binary zip archive also
+    contains the full source of the bits software including the full text of
+    the license agreement listed here:
+    https://github.com/biosbits/bits/blob/master/COPYING
+    The source tarball can be found in this location in the zip file:
+    boot/src/bits-2095.tar.gz
+    The additional changes beyond those that are present in the official
+    biosbits github repository can be found here:
+    https://github.com/ani-sinha/bits/tree/bits-qemu-logging
+
+    Basically these changes can be categorized into the following:
+    (a) changes to make sure biosbits builds with the latest gcc compiler
+    (gcc 9.4).
+    (b) upgrade of acpica to the latest version (march 2022).
+    (c) send bits logs to the debug IO port at addresss 0x403 so that isa
+    debugcon can be used to collect the logs.
+    (d) send a gub halt command to shutdown the VM once all the tests have been
+    executed.
+
+    This zip file is automatically generated by the bits build system. It can
+    be found in the bits build directory and it is suffixed by the bits build
+    number.
+    Normally, there is no need to make any alteration to this zip archive
+    unless one wanted to change the bits software itself (for example to add
+    a new config option or change actions of existing options or change the
+    debug IO port etc). When such changes are made and a new biosbits software
+    is needed to be generated, please refresh this zip archive as well as the
+    grub tarball at the same time. Tests will break if changes are made to bits
+    that are incompatible with existing behavior. So care must be taken to make
+    sure that the change is compatible with existing bits software as much as
+    possible. When a new config option is introduced for example, bits must
+    be upadated here first before introducing the new config option through
+    a later commit.
+ - prebuilt/bits-2095-grub.tar.gz: This tarbball contains bits generated grub
+    scripts and modules to the prebuilt directory. These prebuilt grub
+    artifacts are required in order to generate a bootable bits iso file that
+    can run tests.
+    In order to generate this tar archive, please put the following two
+    directories that can be found in the bits build directory in a single
+    tar archive file named as bits-<n>-grub.tar.gz where n is the version of
+    bits that generated the archive:
+
+    grub-inst-x86_64-efi
+    grub-inst
+
+    This version should be the same as the version number of bits that generated
+    bits-<n>.zip file. In other words, the two files must be in sync and should
+    come from the same build of biosbits of the same version. Things may still
+    work if they come from different versions but mixing version numbers are
+    not recommended.
+    There is normally no need to regenerate this archive unless some fixes or
+    changes have gone into the grub that are part of biosbits.
+
+acpi-bits/bits-tests:
+   This directory contains biosbits python based tests that are run from within
+   the biosbits environment in the spawned VM. New additions of test cases can
+   be made in the appropriate test file. For example, new acpi tests can go
+   into testacpi.py and one would call testsuite.add_test() to register the new
+   test so that it gets executed as a part of the ACPI tests.
+   It might be occassionally necessary to disable some subtests or add a new
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
+meson.build files makes sure that the bits qtests are appropriately integrated
+into the QEMU qtest framework and are run with "make check-qtest".
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


