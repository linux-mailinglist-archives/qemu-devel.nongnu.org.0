Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E963936146E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 00:00:05 +0200 (CEST)
Received: from localhost ([::1]:50102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXA1t-0000EK-06
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 18:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uX-0000pJ-KW
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lX9uV-00021N-Cc
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 17:52:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618523546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkWMv7xUMu8MY3LOt1r2rePtPYwoeOS7Bqa0X8F7UbA=;
 b=iryLRAblehau4IIVr02mDHPt/1UuKXCBPjKy6Mq3+Jdyt3A5n1K7rogQFKT8JBiRyBU5RJ
 DfOVf0NVbqAxH5m5HcCihREEHpKVjuo6Cd+ScTDwRAKYVom7gFjLXmVRTcGis5itsoVFw5
 6dFhqsNekJ9McwEIKRQSbVY9pQ9eVUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-cwzBeyHaPSKuhDI5w1-D5g-1; Thu, 15 Apr 2021 17:52:22 -0400
X-MC-Unique: cwzBeyHaPSKuhDI5w1-D5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 380451854E23;
 Thu, 15 Apr 2021 21:52:21 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-207.rdu2.redhat.com
 [10.10.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71C685D9DE;
 Thu, 15 Apr 2021 21:52:19 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/8] Tests: add custom test jobs
Date: Thu, 15 Apr 2021 17:51:41 -0400
Message-Id: <20210415215141.1865467-9-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-1-crosa@redhat.com>
References: <20210415215141.1865467-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Different users (or even companies) have different interests, and
may want to run a reduced set of tests during development, or a
larger set of tests during QE.

To cover these use cases, some example (but functional) jobs are
introduced here:

1) acceptance-all-targets.py: runs all arch agnostic tests on all
   built targets, unless there are conditions that make them not work
   out of the box ATM, then run all tests that are specific to
   predefined targets.

2) acceptance-kvm-only.py: runs only tests that require KVM and are
   specific to the host architecture.

3) qtest-unit.py: runs a combination of qtest and unit tests (in
   parallel).

4) qtest-unit-acceptance.py: runs a combineation of qtest, unit tests
   and acceptance tests (all of them in parallel)

To run the first two manually, follow the example bellow:

 $ cd build
 $ make check-venv
 $ ./tests/venv/bin/python3 tests/jobs/acceptance-all-targets.py
 $ ./tests/venv/bin/python3 tests/jobs/acceptance-kvm-only.py

The third and fouth example depends on information coming from Meson,
so the easiest way to run it is:

 $ cd build
 $ make check-qtest-unit
 $ make check-qtest-unit-acceptance

These are based on Avocado's Job API, a way to customize an Avocado
job execution beyond the possibilities of command line arguments.
For more Job API resources, please refer to:

a) Job API Examples:
 - https://github.com/avocado-framework/avocado/tree/master/examples/jobs

b) Documentation about configurable features at the Job Level:
 - https://avocado-framework.readthedocs.io/en/87.0/config/index.html

c) Documentation about the TestSuite class
 - https://avocado-framework.readthedocs.io/en/87.0/api/core/avocado.core.html#avocado.core.suite.TestSuite

d) Documentation about the Job class
 - https://avocado-framework.readthedocs.io/en/87.0/api/core/avocado.core.html#avocado.core.job.Job

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 configure                            |  2 +-
 tests/Makefile.include               |  8 ++++
 tests/jobs/acceptance-all-targets.py | 67 ++++++++++++++++++++++++++++
 tests/jobs/acceptance-kvm-only.py    | 35 +++++++++++++++
 tests/jobs/qtest-unit-acceptance.py  | 31 +++++++++++++
 tests/jobs/qtest-unit.py             | 24 ++++++++++
 tests/jobs/utils.py                  | 22 +++++++++
 7 files changed, 188 insertions(+), 1 deletion(-)
 create mode 100644 tests/jobs/acceptance-all-targets.py
 create mode 100644 tests/jobs/acceptance-kvm-only.py
 create mode 100644 tests/jobs/qtest-unit-acceptance.py
 create mode 100644 tests/jobs/qtest-unit.py
 create mode 100644 tests/jobs/utils.py

diff --git a/configure b/configure
index 4f374b4889..23273262e5 100755
--- a/configure
+++ b/configure
@@ -6265,7 +6265,7 @@ LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS roms/seabios/Makefile"
 LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
-LINKS="$LINKS tests/acceptance tests/data"
+LINKS="$LINKS tests/acceptance tests/data tests/jobs"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 63477c8b4b..03443dd0e8 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -133,6 +133,14 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
             $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
             "AVOCADO", "tests/acceptance")
 
+# Runs qtest and unit tests on a custom Avocado job
+check-qtest-unit: check-venv $(TESTS_RESULTS_DIR)
+	$(MESON) introspect --tests | $(TESTS_VENV_DIR)/bin/python $(SRC_PATH)/tests/jobs/qtest-unit.py $(TESTS_RESULTS_DIR)
+
+# Runs qtest and unit and accpetance tests on a custom Avocado job
+check-qtest-unit-acceptance: check-venv $(TESTS_RESULTS_DIR)
+	$(MESON) introspect --tests | $(TESTS_VENV_DIR)/bin/python $(SRC_PATH)/tests/jobs/qtest-unit-acceptance.py $(TESTS_RESULTS_DIR)
+
 # Consolidated targets
 
 .PHONY: check-block check check-clean get-vm-images
diff --git a/tests/jobs/acceptance-all-targets.py b/tests/jobs/acceptance-all-targets.py
new file mode 100644
index 0000000000..96703824e6
--- /dev/null
+++ b/tests/jobs/acceptance-all-targets.py
@@ -0,0 +1,67 @@
+#!/usr/bin/env python3
+
+import glob
+import os
+import sys
+
+from avocado.core.job import Job
+from avocado.core.suite import TestSuite
+
+
+def filter_out_currently_broken(variants):
+    """Filter out targets that can not be currently used transparently."""
+    result = []
+    for variant in variants:
+        if (# qemu-system-m68k: Kernel image must be specified
+            variant['qemu_bin'].endswith('qemu-system-m68k') or
+            # qemu-system-sh4: Could not load SHIX bios 'shix_bios.bin'
+            variant['qemu_bin'].endswith('qemu-system-sh4')):
+            continue
+        result.append(variant)
+    return result
+
+
+def add_machine_type(variants):
+    """Add default machine type  parameters to targets that require one."""
+    for variant in variants:
+        if (variant['qemu_bin'].endswith('-arm') or
+            variant['qemu_bin'].endswith('-aarch64')):
+            variant['machine'] = 'virt'
+        if variant['qemu_bin'].endswith('-rx'):
+            variant['machine'] = 'none'
+        if variant['qemu_bin'].endswith('-avr'):
+            variant['machine'] = 'none'
+
+
+def all_system_binaries():
+    """Looks for all system binaries and creates dict variants."""
+    binaries = [target for target in glob.glob('./qemu-system-*')
+                if (os.path.isfile(target) and
+                    os.access(target, os.R_OK | os.X_OK))]
+    variants = []
+    for target in binaries:
+        variants.append({'qemu_bin': target})
+    variants = filter_out_currently_broken(variants)
+    add_machine_type(variants)
+    return variants
+
+
+def main():
+    suite1 = TestSuite.from_config(
+        {'run.references': ['tests/acceptance/'],
+         'filter.by_tags.tags': ['-arch'],
+         'run.dict_variants': all_system_binaries()},
+        name='non-arch-specific')
+
+    suite2 = TestSuite.from_config(
+        {'run.references': ['tests/acceptance/'],
+         'filter.by_tags.tags': ['arch']},
+        name='arch-specific')
+
+    with Job({'job.run.result.html.enabled': 'on'},
+             [suite1, suite2]) as job:
+        return job.run()
+
+
+if __name__ == '__main__':
+    sys.exit(main())
diff --git a/tests/jobs/acceptance-kvm-only.py b/tests/jobs/acceptance-kvm-only.py
new file mode 100644
index 0000000000..acdcbbe087
--- /dev/null
+++ b/tests/jobs/acceptance-kvm-only.py
@@ -0,0 +1,35 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+
+# This comes from tests/acceptance/avocado_qemu/__init__.py and should
+# not be duplicated here.  The solution is to have the "avocado_qemu"
+# code and "python/qemu" available during build
+BUILD_DIR = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))
+if os.path.islink(os.path.dirname(os.path.dirname(__file__))):
+    # The link to the acceptance tests dir in the source code directory
+    lnk = os.path.dirname(os.path.dirname(__file__))
+    #: The QEMU root source directory
+    SOURCE_DIR = os.path.dirname(os.path.dirname(os.readlink(lnk)))
+else:
+    SOURCE_DIR = BUILD_DIR
+sys.path.append(os.path.join(SOURCE_DIR, 'python'))
+
+from avocado.core.job import Job
+
+from qemu.accel import kvm_available
+
+
+def main():
+    if not kvm_available():
+        sys.exit(0)
+
+    config = {'run.references': ['tests/acceptance/'],
+              'filter.by_tags.tags': ['accel:kvm,arch:%s' % os.uname()[4]]}
+    with Job.from_config(config) as job:
+        return job.run()
+
+
+if __name__ == '__main__':
+    sys.exit(main())
diff --git a/tests/jobs/qtest-unit-acceptance.py b/tests/jobs/qtest-unit-acceptance.py
new file mode 100644
index 0000000000..67a25c93f5
--- /dev/null
+++ b/tests/jobs/qtest-unit-acceptance.py
@@ -0,0 +1,31 @@
+#!/usr/bin/env python3
+
+import json
+import random
+import sys
+
+from avocado.core.job import Job
+from avocado.core.resolver import resolve
+from avocado.core.suite import resolutions_to_runnables
+
+from utils import meson_introspect_to_avocado_suite
+
+
+def main():
+    config = {'run.test_runner': 'nrunner'}
+    if len(sys.argv) > 1:
+        config['run.results_dir'] = sys.argv[1]
+
+    suite = meson_introspect_to_avocado_suite(json.load(sys.stdin),
+                                              'qtest-unit-acceptance',
+                                              config)
+    acceptance = resolutions_to_runnables(resolve(["tests/acceptance"]),
+                                          config)
+    suite.tests += acceptance
+    random.shuffle(suite.tests)
+    with Job(config, [suite]) as j:
+        return j.run()
+
+
+if __name__ == '__main__':
+    sys.exit(main())
diff --git a/tests/jobs/qtest-unit.py b/tests/jobs/qtest-unit.py
new file mode 100644
index 0000000000..6f4d1b40c6
--- /dev/null
+++ b/tests/jobs/qtest-unit.py
@@ -0,0 +1,24 @@
+#!/usr/bin/env python3
+
+import sys
+import json
+
+from avocado.core.job import Job
+
+from utils import meson_introspect_to_avocado_suite
+
+
+def main():
+    config = {'run.test_runner': 'nrunner'}
+    if len(sys.argv) > 1:
+        config['run.results_dir'] = sys.argv[1]
+
+    suite = meson_introspect_to_avocado_suite(json.load(sys.stdin),
+                                              'qtest-unit',
+                                              config)
+    with Job(config, [suite]) as j:
+        return j.run()
+
+
+if __name__ == '__main__':
+    sys.exit(main())
diff --git a/tests/jobs/utils.py b/tests/jobs/utils.py
new file mode 100644
index 0000000000..79ac129231
--- /dev/null
+++ b/tests/jobs/utils.py
@@ -0,0 +1,22 @@
+from avocado.core.suite import TestSuite
+from avocado.core.nrunner import Runnable
+
+
+def protocol_tap_to_runnable(entry):
+    runnable = Runnable('tap',
+                        entry['cmd'][0],
+                        *entry['cmd'][1:],
+                        **entry['env'])
+    return runnable
+
+
+def meson_introspect_to_avocado_suite(introspect, suite_name, config):
+    tests = []
+    for entry in introspect:
+        if entry['protocol'] != 'tap':
+            continue
+        runnable = protocol_tap_to_runnable(entry)
+        tests.append(runnable)
+
+    suite = TestSuite(name=suite_name, config=config, tests=tests)
+    return suite
-- 
2.25.4


