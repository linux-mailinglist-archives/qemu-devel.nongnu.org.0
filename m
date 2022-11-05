Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A1261DC81
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:35:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMnK-0006u6-0p; Sat, 05 Nov 2022 13:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmO-0006Tv-FI
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmK-0007LK-Rj
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m3FHixKkG/soQHBQxHKtxJZpm4FNMe+a1ZZo7qWndEQ=;
 b=cHbJc5iCHRZ4q0VUOf3sdszTyFckZiiGX32jLCe/6KkbensoriqLVPA68wsODmLwfGBYIj
 jqR7rOPpa7TLy+WUSQR4OJGuRGZ9sO764dYgahFLRHKZX5rjfiNSTla7oDxPVHmSoYMlUk
 UPGo24xRL77b2oDIUsjFeUJvNhVEM5I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-8-u2KQpX4YOrmJFyk8aq05LQ-1; Sat, 05 Nov 2022 13:16:15 -0400
X-MC-Unique: u2KQpX4YOrmJFyk8aq05LQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 c130-20020a1c3588000000b003b56be513e1so3860483wma.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m3FHixKkG/soQHBQxHKtxJZpm4FNMe+a1ZZo7qWndEQ=;
 b=ZWXbxQetsCnkQEsN+1i7I0/O2HhfjE+IEk6XiCIgK4yJ8p5Cc3HOZuBRsr7TN/3o7Q
 wfrDVGEph8niJdQTq4+sugfvLXoJlTJzVUQcnh1v8BkqK+bjxRSoNnaucubUC/84z4P5
 jI9sj0t3K4hZZiyTpprde63a65Jon7CavcbmTeEqlEBxkuPTNGnuOSriTkC4sGcbmG9M
 Imzc0R5k9IQewT2TyU9QxoNQNT+MpuuGC0EndSh+WVE2tYEP/3/6iSxccjKw+a1TE82r
 x6TM+Z/aeFADkHzx4PBbHYVyVO9Lj8rXfdYLNvpQWkRWfJe9nks4lrMJSYoYJwJ2IFyn
 1d+w==
X-Gm-Message-State: ACrzQf3q62TMPCkuA42lfX3dedZRfnWyb5wUKDEw+3vJEZviUQx80avY
 WK2cZMjKeGi3C6l6K++S8h9yywI57Ymdd3VamP+ttBgLJOy67ma5H3Pc98OMwFMIuTEb6ErEqbI
 DQJMfARp8h7G+EQJGvUlFl5eL2MdXBrXb+WFGRdfmgx5w4Unfzv9Glwn1PheO
X-Received: by 2002:adf:e985:0:b0:236:6a53:3a16 with SMTP id
 h5-20020adfe985000000b002366a533a16mr25265168wrm.501.1667668573446; 
 Sat, 05 Nov 2022 10:16:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6b5RRDJ6sTpJydbwJ18NMeEPgj3qmkmwMYiytd93hYn+QrDu6iBdRglDRMYME+3JO3vJlG9A==
X-Received: by 2002:adf:e985:0:b0:236:6a53:3a16 with SMTP id
 h5-20020adfe985000000b002366a533a16mr25265145wrm.501.1667668573073; 
 Sat, 05 Nov 2022 10:16:13 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c510d00b003cf54b77bfesm6917510wms.28.2022.11.05.10.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:12 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
Subject: [PULL v3 15/81] acpi/tests/avocado/bits/doc: add a doc file to
 describe the acpi bits test
Message-ID: <20221105171116.432921-16-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <ani@anisinha.ca>

A doc file is added under docs/devel that describes the purpose of the various
test files and gives guidance to developers on where and how to make changes.

Cc: Daniel P. Berrange" <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <20221021095108.104843-7-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 docs/devel/acpi-bits.rst   | 145 +++++++++++++++++++++++++++++++++++++
 docs/devel/index-build.rst |   1 +
 2 files changed, 146 insertions(+)
 create mode 100644 docs/devel/acpi-bits.rst

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
new file mode 100644
index 0000000000..c9564d871a
--- /dev/null
+++ b/docs/devel/acpi-bits.rst
@@ -0,0 +1,145 @@
+=============================================================================
+ACPI/SMBIOS avocado tests using biosbits
+=============================================================================
+
+Biosbits is a software written by Josh Triplett that can be downloaded
+from https://biosbits.org/. The github codebase can be found
+`here <https://github.com/biosbits/bits/tree/master>`__. It is a software that executes
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
+life uses can be found in [#a]_ and [#b]_.
+This directory contains tests written in python using avocado framework that
+exercises the QEMU bios components using biosbits and reports test failures.
+For QEMU, we maintain a fork of bios bits in gitlab along with all the
+dependent submodules:
+https://gitlab.com/qemu-project/biosbits-bits
+This fork contains numerous fixes, a newer acpica and changes specific to
+running this avocado QEMU tests using bits. The author of this document
+is the sole maintainer of the QEMU fork of bios bits repo.
+
+Under the directory ``tests/avocado/``, ``acpi-bits.py`` is a QEMU avocado
+test that drives all this.
+
+A brief description of the various test files follows.
+
+Under ``tests/avocado/`` as the root we have:
+
+::
+
+   ├── acpi-bits
+   │ ├── bits-config
+   │ │ └── bits-cfg.txt
+   │ ├── bits-tests
+   │ │ ├── smbios.py2
+   │ │ ├── testacpi.py2
+   │ │ └── testcpuid.py2
+   │ └── README
+   ├── acpi-bits.py
+
+* ``tests/avocado``:
+
+   ``acpi-bits.py``:
+   This is the main python avocado test script that generates a
+   biosbits iso. It then spawns a QEMU VM with it, collects the log and reports
+   test failures. This is the script one would be interested in if they wanted
+   to add or change some component of the log parsing, add a new command line
+   to alter how QEMU is spawned etc. Test writers typically would not need to
+   modify this script unless they wanted to enhance or change the log parsing
+   for their tests. In order to enable debugging, you can set **V=1**
+   environment variable. This enables verbose mode for the test and also dumps
+   the entire log from bios bits and more information in case failure happens.
+
+   In order to run this test, please perform the following steps from the QEMU
+   build directory:
+   ::
+
+     $ make check-venv (needed only the first time to create the venv)
+     $ ./tests/venv/bin/avocado run -t acpi tests/avocado
+
+   The above will run all acpi avocado tests including this one.
+   In order to run the individual tests, perform the following:
+   ::
+
+     $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py --tap -
+
+   The above will produce output in tap format. You can omit "--tap -" in the
+   end and it will produce output like the following:
+   ::
+
+      $ ./tests/venv/bin/avocado run tests/avocado/acpi-bits.py
+      Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
+      JOB ID     : eab225724da7b64c012c65705dc2fa14ab1defef
+      JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-10T17.58-eab2257/job.log
+      (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (33.09 s)
+      RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
+      JOB TIME   : 39.22 s
+
+   You can inspect the log file for more information about the run or in order
+   to diagnoze issues. If you pass V=1 in the environment, more diagnostic logs
+   would be found in the test log.
+
+* ``tests/avocado/acpi-bits/bits-config``:
+
+   This location contains biosbits configuration files that determine how the
+   software runs the tests.
+
+   ``bits-config.txt``:
+   This is the biosbits config file that determines what tests
+   or actions are performed by bits. The description of the config options are
+   provided in the file itself.
+
+* ``tests/avocado/acpi-bits/bits-tests``:
+
+   This directory contains biosbits python based tests that are run from within
+   the biosbits environment in the spawned VM. New additions of test cases can
+   be made in the appropriate test file. For example, new acpi tests can go
+   into testacpi.py2 and one would call testsuite.add_test() to register the new
+   test so that it gets executed as a part of the ACPI tests.
+   It might be occasionally necessary to disable some subtests or add a new
+   test that belongs to a test suite not already present in this directory. To
+   do this, please clone the bits source from
+   https://gitlab.com/qemu-project/biosbits-bits/-/tree/qemu-bits.
+   Note that this is the "qemu-bits" branch and not the "bits" branch of the
+   repository. "qemu-bits" is the branch where we have made all the QEMU
+   specific enhancements and we must use the source from this branch only.
+   Copy the test suite/script that needs modification (addition of new tests
+   or disabling them) from python directory into this directory. For
+   example, in order to change cpuid related tests, copy the following
+   file into this directory and rename it with .py2 extension:
+   https://gitlab.com/qemu-project/biosbits-bits/-/blob/qemu-bits/python/testcpuid.py
+   Then make your additions and changes here. Therefore, the steps are:
+
+       (a) Copy unmodified test script to this directory from bits source.
+       (b) Add a SPDX license header.
+       (c) Perform modifications to the test.
+
+   Commits (a), (b) and (c) should go under separate commits so that the original
+   test script and the changes we have made are separated and clear.
+
+   The test framework will then use your modified test script to run the test.
+   No further changes would be needed. Please check the logs to make sure that
+   appropriate changes have taken effect.
+
+   The tests have an extension .py2 in order to indicate that:
+
+   (a) They are python2.7 based scripts and not python 3 scripts.
+   (b) They are run from within the bios bits VM and is not subjected to QEMU
+       build/test python script maintainance and dependency resolutions.
+   (c) They need not be loaded by avocado framework when running tests.
+
+
+Author: Ani Sinha <ani@anisinha.ca>
+
+References:
+-----------
+.. [#a] https://blog.linuxplumbersconf.org/2011/ocw/system/presentations/867/original/bits.pdf
+.. [#b] https://www.youtube.com/watch?v=36QIepyUuhg
+
diff --git a/docs/devel/index-build.rst b/docs/devel/index-build.rst
index 1002a533a6..57e8d39d98 100644
--- a/docs/devel/index-build.rst
+++ b/docs/devel/index-build.rst
@@ -11,6 +11,7 @@ the basics if you are adding new files and targets to the build.
    build-system
    kconfig
    testing
+   acpi-bits
    qtest
    ci
    qapi-code-gen
-- 
MST


