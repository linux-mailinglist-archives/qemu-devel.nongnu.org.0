Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C4B5F9AEE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:26:51 +0200 (CEST)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oho7e-0005Ml-Mh
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfq-0004Ll-Bw
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:58:06 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55224)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfm-0005ss-JK
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:58:06 -0400
Received: by mail-pj1-x1034.google.com with SMTP id 70so9203524pjo.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpVb0KjSAMysrCzWbfH8lM7+WaGp23hYd+3wlL7w+vI=;
 b=q7V7QC/+v1i1BEPW8nE3tTIfxZvuGTMTaeZEKrBCHUXVqy3tgbI1l4kOiDD/k3nIvb
 XU3LUu4bcWEkG/drzHuBuL37TkewQyyQySsFotClSmV4NuPpzYZk2VBrgDDpSSsx79Gh
 lCttbQ8aAfF6J1W5gKc6O5z8kiIHAMll+ZhtpUpm5k2Fdw63XnaVUO9ao8iS1MU7xtBP
 JCQXMOyRQQcB30uYJR3XFP7v6xL0ToG1lpqmc9tN8JlYjKzymLRKanVAc65qV5gWde8I
 6tZGgZSpuPDu0ZJ2CT5LK+VlaqfWCRXyg0vo3GyGYAaVpmLJxfgycoRRRObqClNB6Aik
 nZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpVb0KjSAMysrCzWbfH8lM7+WaGp23hYd+3wlL7w+vI=;
 b=G75f6GyFY6WfHtU51BLcnq1Ua2QnoiBwKlwXmbqmo3t0c2EpDdtRBffsx0zEZvTK+C
 FxnQOPnflmyWu4M1mEnFF45kgXKK+trFzSMkonMhTRf7dG7J7yy8swWWZrf3qwAh69a6
 SQFEzhYCkE0lGWfDKMrgjkzEzN2KQdNg8UiwOmMPiZAZgxMYNVyZydNa9+BnvVejVpsI
 7ASQsCVhs37nOP5s6MEw3livBWNhi05yEfr90gjlNwOqlNwVUAnXJOCCZ3I70X603Ejl
 zy6C5Pj9m1RRQgmNekaKxBQSrj9u9mKWORdjzVluIFAaz6gHwX1zwLz8WcCll0e2u9y9
 RaKA==
X-Gm-Message-State: ACrzQf38JACAXgrXKBiV+2YGrhE01uGvj2CX8w7C5xQMNvHR1jbxHnYu
 rnfy4Sulcq+gi9RxwIspSKakHEs8UBANgQ==
X-Google-Smtp-Source: AMsMyM6jLK7ZpW2neOQi5XaSzpSwDpml9eu23IERD1JgSXIzZ2RJEsf4+LKgLkkOQtQgTgAh17tDbQ==
X-Received: by 2002:a17:90a:7805:b0:20d:4fd9:9a0e with SMTP id
 w5-20020a17090a780500b0020d4fd99a0emr1411514pjk.169.1665388681146; 
 Mon, 10 Oct 2022 00:58:01 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a625e02000000b005624b4bd738sm6200379pfb.156.2022.10.10.00.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:58:00 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mst@redhat.com, imammedo@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 10/10] acpi/tests/avocado/bits: add a README file
Date: Mon, 10 Oct 2022 13:26:19 +0530
Message-Id: <20221010075619.4147111-11-ani@anisinha.ca>
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

Add a README file that describes the purpose of the various test files and gives
guidance to developers on where and how to make changes.

Cc: Daniel P. BerrangÃ" <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/README | 90 ++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 tests/avocado/acpi-bits/README

diff --git a/tests/avocado/acpi-bits/README b/tests/avocado/acpi-bits/README
new file mode 100644
index 0000000000..91e8fd235f
--- /dev/null
+++ b/tests/avocado/acpi-bits/README
@@ -0,0 +1,90 @@
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
+This directory contains tests written in python that exercizes the QEMU
+bios components using biosbits and reports test failures.
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
+│ │ ├── smbios.py
+│ │ ├── smilatency.py
+│ │ ├── testacpi.py
+│ │ └── testcpuid.py
+│ └── README
+├── acpi-bits.py
+
+tests/avocado:
+ - acpi-bits.py: This is the main python avocado test script that generates a
+   biosbits iso. It then spawns a QEMU VM with it, collects the logs and reports
+   test failures. This is the script one would be interested in if they wanted
+   to add or change some component of the log parsing, add a new command line to
+   how QEMU is spawned etc. Test writers typically would not need to modify
+   this script unless they wanted to enhance or change the log parsing for
+   their tests. Following environment variables are used in this test:
+     - V=1 : This enables verbose mode for the test. It dumps the entire log
+       from bios bits and also more details in case failure happens. It is
+       useful for debugging the test failures or tests themselves.
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
+
+Author: Ani Sinha <ani@anisinha.ca>
+
+References:
+(a) https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
+(b) https://www.youtube.com/watch?v=36QIepyUuhg
-- 
2.34.1


