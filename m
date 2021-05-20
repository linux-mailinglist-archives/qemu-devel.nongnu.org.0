Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA1938B7E5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 21:56:22 +0200 (CEST)
Received: from localhost ([::1]:54702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljomL-0000jQ-Cf
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 15:56:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljoju-0006gn-Dj
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:53:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1ljojm-0001nS-QQ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 15:53:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621540422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3zooC3LdQClShNdHNzTGxWKtQCYw+vNCxf/b/3NZms=;
 b=EV2Dd8dhFeMglzcAjOOQq4q2Sbl2r7LI4DQLWD/9MpfdcFfiK32d22r7vZL2iOiQ40qJ2e
 Id/t6aSqsrojY+nlLw4cok4F+h304/rSUg6ZRCyIao3f9XsGYRJDTt1WA/HasFspyRNeM+
 qKVLSUHcoZl/gh02jd+ZDosFnlOhBN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-vxu4C-FjObC1drASGAnjFg-1; Thu, 20 May 2021 15:53:38 -0400
X-MC-Unique: vxu4C-FjObC1drASGAnjFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16330801106;
 Thu, 20 May 2021 19:53:37 +0000 (UTC)
Received: from wrampazz.redhat.com (ovpn-113-104.rdu2.redhat.com
 [10.10.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1026D5D74B;
 Thu, 20 May 2021 19:53:33 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/1] acceptance tests: rename acceptance to system
Date: Thu, 20 May 2021 16:53:22 -0300
Message-Id: <20210520195322.205691-2-willianr@redhat.com>
In-Reply-To: <20210520195322.205691-1-willianr@redhat.com>
References: <20210520195322.205691-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Conceptually speaking, acceptance tests "are a series of specific tests
conducted by the customer in an attempt to uncover product errors before
accepting the software from the developer. Conducted by the end-user rather
than software engineers, acceptance testing can range from an informal
“test drive” to a planned and systematically executed series of scripted
tests" [1]. Every time Pressman refers to the term "acceptance testing," he
also refers to user's agreement in the final state of an implemented feature.
Today, QEMU is not implementing user acceptance tests as described by Pressman.

There are other three possible terms we could use to describe what is currently
QEMU "acceptance" tests:

  1 - Integration tests:
      - "Integration testing is a systematic technique for constructing the
         software architecture while at the same time conducting tests to
         uncover errors associated with interfacing. The objective is to take
         unit-tested components and build a program structure that has been
         dictated by design." [2]
      * Note: Sommerville does not have a clear definition of integration
        testing. He refers to incremental integration of components inside
        the system testing (see [3]).

  2 - Validation tests:
      - "Validation testing begins at the culmination of integration testing,
         when individual components have been exercised, the software is
         completely assembled as a package, and interfacing errors have been
         uncovered and corrected. At the validation or system level, the
         distinction between different software categories disappears. Testing
         focuses on user-visible actions and user-recognizable output from the
         system." [4]
      - "where you expect the system to perform correctly using a set of test
         cases that reflect the system’s expected use." [5]
      * Note: the definition of "validation testing" from Sommerville reflects
        the same definition found around the Internet, as one of the processes
        inside the "Verification & Validation (V&V)." In this concept,
        validation testing is a high-level definition that covers unit testing,
        functional testing, integration testing, system testing, and acceptance
        testing.

  3 - System tests:
      - "verifies that all elements mesh properly and that overall system
         function and performance is achieved." [6]
      - "involves integrating components to create a version of the system and
         then testing the integrated system. System testing checks that
         components are compatible, interact correctly, and transfer the right
         data at the right time across their interfaces." [7]

The tests implemented inside the QEMU "acceptance" directory depend on the
software completely assembled and, sometimes, on other elements, like operating
system images. In this case, the proposal here is to rename the current
"acceptance" directory to "system."

[1] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
    Practitioner’s Approach. p. 430.
[2] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
    Practitioner’s Approach. Software Engineering, p. 398.
[3] Sommerville, Ian (2016). Software Engineering. p. 240-242.
[4] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
    Practitioner’s Approach. Software Engineering, p. 407.
[5] Sommerville, Ian (2016). Software Engineering. p. 227.
[6] Pressman, Roger S. & Maxim, Bruce R. (2020). Software Engineering, A
    Practitioner’s Approach. Software Engineering, p. 377.
[7] Sommerville, Ian (2016). Software Engineering. p. 240.

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 .gitlab-ci.yml                                | 58 +++++++++----------
 MAINTAINERS                                   | 40 ++++++-------
 configure                                     |  2 +-
 docs/devel/build-system.rst                   |  2 +-
 docs/devel/testing.rst                        | 23 ++++----
 docs/system/arm/orangepi.rst                  |  8 +--
 tests/Makefile.include                        | 14 ++---
 tests/acceptance/README.rst                   | 10 ----
 tests/system/README.rst                       | 10 ++++
 .../avocado_qemu/__init__.py                  |  2 +-
 tests/{acceptance => system}/boot_linux.py    |  0
 .../boot_linux_console.py                     |  0
 tests/{acceptance => system}/boot_xen.py      |  0
 tests/{acceptance => system}/cpu_queries.py   |  0
 .../{acceptance => system}/empty_cpu_model.py |  0
 tests/{acceptance => system}/linux_initrd.py  |  2 +-
 .../linux_ssh_mips_malta.py                   |  0
 .../machine_arm_canona1100.py                 |  0
 .../machine_arm_integratorcp.py               |  0
 .../machine_arm_n8x0.py                       |  0
 tests/{acceptance => system}/machine_avr6.py  |  2 +-
 .../machine_m68k_nextcube.py                  |  0
 .../machine_microblaze.py                     |  0
 .../machine_mips_loongson3v.py                |  0
 .../machine_mips_malta.py                     |  0
 tests/{acceptance => system}/machine_ppc.py   |  0
 .../machine_rx_gdbsim.py                      |  0
 .../machine_s390_ccw_virtio.py                |  0
 .../machine_sparc64_sun4u.py                  |  0
 .../machine_sparc_leon3.py                    |  0
 tests/{acceptance => system}/migration.py     |  0
 tests/{acceptance => system}/multiprocess.py  |  0
 .../pc_cpu_hotplug_props.py                   |  0
 tests/{acceptance => system}/ppc_prep_40p.py  |  0
 tests/{acceptance => system}/replay_kernel.py |  0
 .../reverse_debugging.py                      |  0
 tests/{acceptance => system}/tcg_plugins.py   |  0
 .../{acceptance => system}/tesseract_utils.py |  0
 tests/{acceptance => system}/version.py       |  0
 tests/{acceptance => system}/virtio-gpu.py    |  0
 .../virtio_check_params.py                    |  0
 .../{acceptance => system}/virtio_version.py  |  0
 .../virtiofs_submounts.py                     |  0
 .../virtiofs_submounts.py.data/cleanup.sh     |  0
 .../guest-cleanup.sh                          |  0
 .../virtiofs_submounts.py.data/guest.sh       |  0
 .../virtiofs_submounts.py.data/host.sh        |  0
 tests/{acceptance => system}/vnc.py           |  0
 .../x86_cpu_model_versions.py                 |  0
 49 files changed, 86 insertions(+), 87 deletions(-)
 delete mode 100644 tests/acceptance/README.rst
 create mode 100644 tests/system/README.rst
 rename tests/{acceptance => system}/avocado_qemu/__init__.py (99%)
 rename tests/{acceptance => system}/boot_linux.py (100%)
 rename tests/{acceptance => system}/boot_linux_console.py (100%)
 rename tests/{acceptance => system}/boot_xen.py (100%)
 rename tests/{acceptance => system}/cpu_queries.py (100%)
 rename tests/{acceptance => system}/empty_cpu_model.py (100%)
 rename tests/{acceptance => system}/linux_initrd.py (99%)
 rename tests/{acceptance => system}/linux_ssh_mips_malta.py (100%)
 rename tests/{acceptance => system}/machine_arm_canona1100.py (100%)
 rename tests/{acceptance => system}/machine_arm_integratorcp.py (100%)
 rename tests/{acceptance => system}/machine_arm_n8x0.py (100%)
 rename tests/{acceptance => system}/machine_avr6.py (98%)
 rename tests/{acceptance => system}/machine_m68k_nextcube.py (100%)
 rename tests/{acceptance => system}/machine_microblaze.py (100%)
 rename tests/{acceptance => system}/machine_mips_loongson3v.py (100%)
 rename tests/{acceptance => system}/machine_mips_malta.py (100%)
 rename tests/{acceptance => system}/machine_ppc.py (100%)
 rename tests/{acceptance => system}/machine_rx_gdbsim.py (100%)
 rename tests/{acceptance => system}/machine_s390_ccw_virtio.py (100%)
 rename tests/{acceptance => system}/machine_sparc64_sun4u.py (100%)
 rename tests/{acceptance => system}/machine_sparc_leon3.py (100%)
 rename tests/{acceptance => system}/migration.py (100%)
 rename tests/{acceptance => system}/multiprocess.py (100%)
 rename tests/{acceptance => system}/pc_cpu_hotplug_props.py (100%)
 rename tests/{acceptance => system}/ppc_prep_40p.py (100%)
 rename tests/{acceptance => system}/replay_kernel.py (100%)
 rename tests/{acceptance => system}/reverse_debugging.py (100%)
 rename tests/{acceptance => system}/tcg_plugins.py (100%)
 rename tests/{acceptance => system}/tesseract_utils.py (100%)
 rename tests/{acceptance => system}/version.py (100%)
 rename tests/{acceptance => system}/virtio-gpu.py (100%)
 rename tests/{acceptance => system}/virtio_check_params.py (100%)
 rename tests/{acceptance => system}/virtio_version.py (100%)
 rename tests/{acceptance => system}/virtiofs_submounts.py (100%)
 rename tests/{acceptance => system}/virtiofs_submounts.py.data/cleanup.sh (100%)
 rename tests/{acceptance => system}/virtiofs_submounts.py.data/guest-cleanup.sh (100%)
 rename tests/{acceptance => system}/virtiofs_submounts.py.data/guest.sh (100%)
 rename tests/{acceptance => system}/virtiofs_submounts.py.data/host.sh (100%)
 rename tests/{acceptance => system}/vnc.py (100%)
 rename tests/{acceptance => system}/x86_cpu_model_versions.py (100%)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f718b61fa7..c5de3c9fd5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -52,7 +52,7 @@ include:
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
-.acceptance_template: &acceptance_definition
+.system_template: &system_definition
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
@@ -107,15 +107,15 @@ check-system-alpine:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check
 
-acceptance-system-alpine:
+system-test-system-alpine:
   extends: .native_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
   variables:
     IMAGE: alpine
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -141,15 +141,15 @@ check-system-ubuntu:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
-acceptance-system-ubuntu:
+system-test-system-ubuntu:
   extends: .native_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 build-system-debian:
   extends: .native_build_job_template
@@ -175,15 +175,15 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
-acceptance-system-debian:
+system-test-system-debian:
   extends: .native_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -210,15 +210,15 @@ check-system-fedora:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-system-fedora:
+system-test-system-fedora:
   extends: .native_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 build-system-centos:
   extends: .native_build_job_template
@@ -245,15 +245,15 @@ check-system-centos:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check
 
-acceptance-system-centos:
+system-test-system-centos:
   extends: .native_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -278,15 +278,15 @@ check-system-opensuse:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check
 
-acceptance-system-opensuse:
+system-test-system-opensuse:
   extends: .native_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
   variables:
     IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 
 build-disabled:
@@ -502,7 +502,7 @@ clang-user:
 # This can be accomplished by using -enable-slirp=git, which avoids the use of
 # a system-wide version of the library
 #
-# Split in three sets of build/check/acceptance to limit the execution time of each
+# Split in three sets of build/check/system to limit the execution time of each
 # job
 build-cfi-aarch64:
   extends: .native_build_job_template
@@ -531,15 +531,15 @@ check-cfi-aarch64:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-cfi-aarch64:
+system-test-cfi-aarch64:
   extends: .native_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -568,15 +568,15 @@ check-cfi-ppc64-s390x:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-cfi-ppc64-s390x:
+system-test-cfi-ppc64-s390x:
   extends: .native_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -605,15 +605,15 @@ check-cfi-x86_64:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-cfi-x86_64:
+system-test-cfi-x86_64:
   extends: .native_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
-  <<: *acceptance_definition
+    MAKE_CHECK_ARGS: check-system
+  <<: *system_definition
 
 tsan-build:
   extends: .native_build_job_template
diff --git a/MAINTAINERS b/MAINTAINERS
index 75e0f2d750..bc8a2dd248 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -178,7 +178,7 @@ S: Maintained
 F: docs/system/target-avr.rst
 F: gdb-xml/avr-cpu.xml
 F: target/avr/
-F: tests/acceptance/machine_avr6.py
+F: tests/system/machine_avr6.py
 
 CRIS TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -272,7 +272,7 @@ F: target/ppc/
 F: hw/ppc/
 F: include/hw/ppc/
 F: disas/ppc.c
-F: tests/acceptance/machine_ppc.py
+F: tests/system/machine_ppc.py
 
 RISC-V TCG CPUs
 M: Palmer Dabbelt <palmer@dabbelt.com>
@@ -641,7 +641,7 @@ S: Odd Fixes
 F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
-F: tests/acceptance/machine_arm_canona1100.py
+F: tests/system/machine_arm_canona1100.py
 F: docs/system/arm/digic.rst
 
 Goldfish RTC
@@ -690,7 +690,7 @@ S: Maintained
 F: hw/arm/integratorcp.c
 F: hw/misc/arm_integrator_debug.c
 F: include/hw/misc/arm_integrator_debug.h
-F: tests/acceptance/machine_arm_integratorcp.py
+F: tests/system/machine_arm_integratorcp.py
 F: docs/system/arm/integratorcp.rst
 
 MCIMX6UL EVK / i.MX6ul
@@ -787,7 +787,7 @@ F: hw/rtc/twl92230.c
 F: include/hw/display/blizzard.h
 F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
-F: tests/acceptance/machine_arm_n8x0.py
+F: tests/system/machine_arm_n8x0.py
 F: docs/system/arm/nseries.rst
 
 Palm
@@ -1123,7 +1123,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: hw/microblaze/petalogix_s3adsp1800_mmu.c
 F: include/hw/char/xilinx_uartlite.h
-F: tests/acceptance/machine_microblaze.py
+F: tests/system/machine_microblaze.py
 
 petalogix_ml605
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -1149,8 +1149,8 @@ F: hw/acpi/piix4.c
 F: hw/mips/malta.c
 F: hw/mips/gt64xxx_pci.c
 F: include/hw/southbridge/piix.h
-F: tests/acceptance/linux_ssh_mips_malta.py
-F: tests/acceptance/machine_mips_malta.py
+F: tests/system/linux_ssh_mips_malta.py
+F: tests/system/machine_mips_malta.py
 
 Mipssim
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
@@ -1177,7 +1177,7 @@ F: hw/intc/loongson_liointc.c
 F: hw/mips/loongson3_bootp.c
 F: hw/mips/loongson3_bootp.h
 F: hw/mips/loongson3_virt.c
-F: tests/acceptance/machine_mips_loongson3v.py
+F: tests/system/machine_mips_loongson3v.py
 
 Boston
 M: Paul Burton <paulburton@kernel.org>
@@ -1284,7 +1284,7 @@ F: hw/dma/i82374.c
 F: hw/rtc/m48t59-isa.c
 F: include/hw/isa/pc87312.h
 F: include/hw/rtc/m48t59.h
-F: tests/acceptance/ppc_prep_40p.py
+F: tests/system/ppc_prep_40p.py
 
 sPAPR
 M: David Gibson <david@gibson.dropbear.id.au>
@@ -1402,7 +1402,7 @@ R: Yoshinori Sato <ysato@users.sourceforge.jp>
 S: Orphan
 F: docs/system/target-rx.rst
 F: hw/rx/rx-gdbsim.c
-F: tests/acceptance/machine_rx_gdbsim.py
+F: tests/system/machine_rx_gdbsim.py
 
 SH4 Machines
 ------------
@@ -1456,7 +1456,7 @@ F: include/hw/pci-host/sabre.h
 F: hw/pci-bridge/simba.c
 F: include/hw/pci-bridge/simba.h
 F: pc-bios/openbios-sparc64
-F: tests/acceptance/machine_sparc64_sun4u.py
+F: tests/system/machine_sparc64_sun4u.py
 
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
@@ -1472,7 +1472,7 @@ S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
 F: include/hw/*/grlib*
-F: tests/acceptance/machine_sparc_leon3.py
+F: tests/system/machine_sparc_leon3.py
 
 S390 Machines
 -------------
@@ -1488,7 +1488,7 @@ F: include/hw/s390x/
 F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
 F: default-configs/*/s390x-softmmu.mak
-F: tests/acceptance/machine_s390_ccw_virtio.py
+F: tests/system/machine_s390_ccw_virtio.py
 T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
@@ -2045,7 +2045,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
 F: docs/system/guest-loader.rst
-F: tests/acceptance/boot_xen.py
+F: tests/system/boot_xen.py
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
@@ -2854,8 +2854,8 @@ F: net/filter-replay.c
 F: include/sysemu/replay.h
 F: docs/replay.txt
 F: stubs/replay.c
-F: tests/acceptance/replay_kernel.py
-F: tests/acceptance/reverse_debugging.py
+F: tests/system/replay_kernel.py
+F: tests/system/reverse_debugging.py
 F: qapi/replay.json
 
 IOVA Tree
@@ -2970,7 +2970,7 @@ S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
 F: tests/plugin/
-F: tests/acceptance/tcg_plugins.py
+F: tests/system/tcg_plugins.py
 F: contrib/plugins/
 
 AArch64 TCG target
@@ -3348,13 +3348,13 @@ S: Maintained
 F: tests/tcg/Makefile
 F: tests/tcg/Makefile.include
 
-Acceptance (Integration) Testing with the Avocado framework
+System Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Odd Fixes
-F: tests/acceptance/
+F: tests/system/
 
 Documentation
 -------------
diff --git a/configure b/configure
index 9470fff09a..70a3ab0095 100755
--- a/configure
+++ b/configure
@@ -6290,7 +6290,7 @@ LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS roms/seabios/Makefile"
 LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
-LINKS="$LINKS tests/acceptance tests/data"
+LINKS="$LINKS tests/system tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7ef36f42d0..4ee01d270b 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -387,7 +387,7 @@ number of dynamically created files listed later.
 
 `tests/Makefile.include`
   Rules for external test harnesses. These include the TCG tests,
-  `qemu-iotests` and the Avocado-based acceptance tests.
+  `qemu-iotests` and the Avocado-based system tests.
 
 `tests/docker/Makefile.include`
   Rules for Docker tests. Like tests/Makefile, this file is included
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1da4c4e4c4..e60a035bca 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -643,17 +643,16 @@ supported. To start the fuzzer, run
 Alternatively, some command different from "qemu-img info" can be tested, by
 changing the ``-c`` option.
 
-Acceptance tests using the Avocado Framework
-============================================
+System tests using the Avocado Framework
+========================================
 
-The ``tests/acceptance`` directory hosts functional tests, also known
-as acceptance level tests.  They're usually higher level tests, and
-may interact with external resources and with various guest operating
-systems.
+The ``tests/system`` directory hosts system tests. They're usually higher
+level tests, and may interact with external resources and with various
+guest operating systems.
 
 These tests are written using the Avocado Testing Framework (which must
 be installed separately) in conjunction with a the ``avocado_qemu.Test``
-class, implemented at ``tests/acceptance/avocado_qemu``.
+class, implemented at ``tests/system/avocado_qemu``.
 
 Tests based on ``avocado_qemu.Test`` can easily:
 
@@ -685,11 +684,11 @@ Tests based on ``avocado_qemu.Test`` can easily:
 Running tests
 -------------
 
-You can run the acceptance tests simply by executing:
+You can run the system tests simply by executing:
 
 .. code::
 
-  make check-acceptance
+  make check-system
 
 This involves the automatic creation of Python virtual environment
 within the build tree (at ``tests/venv``) which will have all the
@@ -709,7 +708,7 @@ may be invoked by running:
 
  .. code::
 
-  tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
+  tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/system/
 
 Manual Installation
 -------------------
@@ -727,7 +726,7 @@ Alternatively, follow the instructions on this link:
 Overview
 --------
 
-The ``tests/acceptance/avocado_qemu`` directory provides the
+The ``tests/system/avocado_qemu`` directory provides the
 ``avocado_qemu`` Python module, containing the ``avocado_qemu.Test``
 class.  Here's a simple usage example:
 
@@ -1011,7 +1010,7 @@ And remove any package you want with::
 
   pip uninstall <package_name>
 
-If you've used ``make check-acceptance``, the Python virtual environment where
+If you've used ``make check-system``, the Python virtual environment where
 Avocado is installed will be cleaned up as part of ``make check-clean``.
 
 .. _checktcg-ref:
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index 6f23907fb6..84124b104d 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -250,14 +250,14 @@ and set the following environment variables before booting:
 Optionally you may save the environment variables to SD card with 'saveenv'.
 To continue booting simply give the 'boot' command and NetBSD boots.
 
-Orange Pi PC acceptance tests
-"""""""""""""""""""""""""""""
+Orange Pi PC system tests
+"""""""""""""""""""""""""
 
-The Orange Pi PC machine has several acceptance tests included.
+The Orange Pi PC machine has several system tests included.
 To run the whole set of tests, build QEMU from source and simply
 provide the following command:
 
 .. code-block:: bash
 
   $ AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run \
-     -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
+     -t machine:orangepi-pc tests/system/boot_linux_console.py
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8f220e15d1..c580292bb5 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 endif
-	@echo " $(MAKE) check-acceptance     Run all acceptance (functional) tests"
+	@echo " $(MAKE) check-system         Run all system tests"
 	@echo
 	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
 	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
@@ -24,7 +24,7 @@ endif
 	@echo
 	@echo "The following are useful for CI builds"
 	@echo " $(MAKE) check-build          Build most test binaris"
-	@echo " $(MAKE) get-vm-images        Downloads all images used by acceptance tests, according to configured targets (~350 MB each, 1.5 GB max)"
+	@echo " $(MAKE) get-vm-images        Downloads all images used by system tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
 	@echo "The variable SPEED can be set to control the gtester speed setting."
@@ -83,7 +83,7 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 # Python venv for running tests
 
-.PHONY: check-venv check-acceptance
+.PHONY: check-venv check-system
 
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
@@ -119,19 +119,19 @@ get-vm-image-fedora-31-%: check-venv
 	$(call quiet-command, \
              $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
              --distro=fedora --distro-version=31 --arch=$*, \
-	"AVOCADO", "Downloading acceptance tests VM image for $*")
+	"AVOCADO", "Downloading system tests VM image for $*")
 
 # download all vm images, according to defined targets
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
-check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
+check-system: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
             --filter-by-tags-include-empty --filter-by-tags-include-empty-key \
             $(AVOCADO_TAGS) \
-            $(if $(GITLAB_CI),,--failfast) tests/acceptance, \
-            "AVOCADO", "tests/acceptance")
+            $(if $(GITLAB_CI),,--failfast) tests/system, \
+            "AVOCADO", "tests/system")
 
 # Consolidated targets
 
diff --git a/tests/acceptance/README.rst b/tests/acceptance/README.rst
deleted file mode 100644
index 89260faed6..0000000000
--- a/tests/acceptance/README.rst
+++ /dev/null
@@ -1,10 +0,0 @@
-============================================
-Acceptance tests using the Avocado Framework
-============================================
-
-This directory contains functional tests, also known as acceptance
-level tests.  They're usually higher level, and may interact with
-external resources and with various guest operating systems.
-
-For more information, please refer to ``docs/devel/testing.rst``,
-section "Acceptance tests using the Avocado Framework".
diff --git a/tests/system/README.rst b/tests/system/README.rst
new file mode 100644
index 0000000000..ece14073c5
--- /dev/null
+++ b/tests/system/README.rst
@@ -0,0 +1,10 @@
+========================================
+System tests using the Avocado Framework
+========================================
+
+This directory contains system tests. They're usually higher level,
+and may interact with external resources and with various guest
+operating systems.
+
+For more information, please refer to ``docs/devel/testing.rst``,
+section "System tests using the Avocado Framework".
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/system/avocado_qemu/__init__.py
similarity index 99%
rename from tests/acceptance/avocado_qemu/__init__.py
rename to tests/system/avocado_qemu/__init__.py
index 83b1741ec8..c04f9901f3 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/system/avocado_qemu/__init__.py
@@ -31,7 +31,7 @@
 BUILD_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
 
 if os.path.islink(os.path.dirname(os.path.dirname(__file__))):
-    # The link to the acceptance tests dir in the source code directory
+    # The link to the system tests dir in the source code directory
     lnk = os.path.dirname(os.path.dirname(__file__))
     #: The QEMU root source directory
     SOURCE_DIR = os.path.dirname(os.path.dirname(os.readlink(lnk)))
diff --git a/tests/acceptance/boot_linux.py b/tests/system/boot_linux.py
similarity index 100%
rename from tests/acceptance/boot_linux.py
rename to tests/system/boot_linux.py
diff --git a/tests/acceptance/boot_linux_console.py b/tests/system/boot_linux_console.py
similarity index 100%
rename from tests/acceptance/boot_linux_console.py
rename to tests/system/boot_linux_console.py
diff --git a/tests/acceptance/boot_xen.py b/tests/system/boot_xen.py
similarity index 100%
rename from tests/acceptance/boot_xen.py
rename to tests/system/boot_xen.py
diff --git a/tests/acceptance/cpu_queries.py b/tests/system/cpu_queries.py
similarity index 100%
rename from tests/acceptance/cpu_queries.py
rename to tests/system/cpu_queries.py
diff --git a/tests/acceptance/empty_cpu_model.py b/tests/system/empty_cpu_model.py
similarity index 100%
rename from tests/acceptance/empty_cpu_model.py
rename to tests/system/empty_cpu_model.py
diff --git a/tests/acceptance/linux_initrd.py b/tests/system/linux_initrd.py
similarity index 99%
rename from tests/acceptance/linux_initrd.py
rename to tests/system/linux_initrd.py
index a249e2f14a..351ca4959d 100644
--- a/tests/acceptance/linux_initrd.py
+++ b/tests/system/linux_initrd.py
@@ -1,4 +1,4 @@
-# Linux initrd acceptance test.
+# Linux initrd system test.
 #
 # Copyright (c) 2018 Red Hat, Inc.
 #
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/system/linux_ssh_mips_malta.py
similarity index 100%
rename from tests/acceptance/linux_ssh_mips_malta.py
rename to tests/system/linux_ssh_mips_malta.py
diff --git a/tests/acceptance/machine_arm_canona1100.py b/tests/system/machine_arm_canona1100.py
similarity index 100%
rename from tests/acceptance/machine_arm_canona1100.py
rename to tests/system/machine_arm_canona1100.py
diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/system/machine_arm_integratorcp.py
similarity index 100%
rename from tests/acceptance/machine_arm_integratorcp.py
rename to tests/system/machine_arm_integratorcp.py
diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/system/machine_arm_n8x0.py
similarity index 100%
rename from tests/acceptance/machine_arm_n8x0.py
rename to tests/system/machine_arm_n8x0.py
diff --git a/tests/acceptance/machine_avr6.py b/tests/system/machine_avr6.py
similarity index 98%
rename from tests/acceptance/machine_avr6.py
rename to tests/system/machine_avr6.py
index 6baf4e9c7f..acc5608776 100644
--- a/tests/acceptance/machine_avr6.py
+++ b/tests/system/machine_avr6.py
@@ -1,5 +1,5 @@
 #
-# QEMU AVR acceptance tests
+# QEMU AVR system tests
 #
 # Copyright (c) 2019-2020 Michael Rolnik <mrolnik@gmail.com>
 #
diff --git a/tests/acceptance/machine_m68k_nextcube.py b/tests/system/machine_m68k_nextcube.py
similarity index 100%
rename from tests/acceptance/machine_m68k_nextcube.py
rename to tests/system/machine_m68k_nextcube.py
diff --git a/tests/acceptance/machine_microblaze.py b/tests/system/machine_microblaze.py
similarity index 100%
rename from tests/acceptance/machine_microblaze.py
rename to tests/system/machine_microblaze.py
diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/system/machine_mips_loongson3v.py
similarity index 100%
rename from tests/acceptance/machine_mips_loongson3v.py
rename to tests/system/machine_mips_loongson3v.py
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/system/machine_mips_malta.py
similarity index 100%
rename from tests/acceptance/machine_mips_malta.py
rename to tests/system/machine_mips_malta.py
diff --git a/tests/acceptance/machine_ppc.py b/tests/system/machine_ppc.py
similarity index 100%
rename from tests/acceptance/machine_ppc.py
rename to tests/system/machine_ppc.py
diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/system/machine_rx_gdbsim.py
similarity index 100%
rename from tests/acceptance/machine_rx_gdbsim.py
rename to tests/system/machine_rx_gdbsim.py
diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/system/machine_s390_ccw_virtio.py
similarity index 100%
rename from tests/acceptance/machine_s390_ccw_virtio.py
rename to tests/system/machine_s390_ccw_virtio.py
diff --git a/tests/acceptance/machine_sparc64_sun4u.py b/tests/system/machine_sparc64_sun4u.py
similarity index 100%
rename from tests/acceptance/machine_sparc64_sun4u.py
rename to tests/system/machine_sparc64_sun4u.py
diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/system/machine_sparc_leon3.py
similarity index 100%
rename from tests/acceptance/machine_sparc_leon3.py
rename to tests/system/machine_sparc_leon3.py
diff --git a/tests/acceptance/migration.py b/tests/system/migration.py
similarity index 100%
rename from tests/acceptance/migration.py
rename to tests/system/migration.py
diff --git a/tests/acceptance/multiprocess.py b/tests/system/multiprocess.py
similarity index 100%
rename from tests/acceptance/multiprocess.py
rename to tests/system/multiprocess.py
diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/system/pc_cpu_hotplug_props.py
similarity index 100%
rename from tests/acceptance/pc_cpu_hotplug_props.py
rename to tests/system/pc_cpu_hotplug_props.py
diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/system/ppc_prep_40p.py
similarity index 100%
rename from tests/acceptance/ppc_prep_40p.py
rename to tests/system/ppc_prep_40p.py
diff --git a/tests/acceptance/replay_kernel.py b/tests/system/replay_kernel.py
similarity index 100%
rename from tests/acceptance/replay_kernel.py
rename to tests/system/replay_kernel.py
diff --git a/tests/acceptance/reverse_debugging.py b/tests/system/reverse_debugging.py
similarity index 100%
rename from tests/acceptance/reverse_debugging.py
rename to tests/system/reverse_debugging.py
diff --git a/tests/acceptance/tcg_plugins.py b/tests/system/tcg_plugins.py
similarity index 100%
rename from tests/acceptance/tcg_plugins.py
rename to tests/system/tcg_plugins.py
diff --git a/tests/acceptance/tesseract_utils.py b/tests/system/tesseract_utils.py
similarity index 100%
rename from tests/acceptance/tesseract_utils.py
rename to tests/system/tesseract_utils.py
diff --git a/tests/acceptance/version.py b/tests/system/version.py
similarity index 100%
rename from tests/acceptance/version.py
rename to tests/system/version.py
diff --git a/tests/acceptance/virtio-gpu.py b/tests/system/virtio-gpu.py
similarity index 100%
rename from tests/acceptance/virtio-gpu.py
rename to tests/system/virtio-gpu.py
diff --git a/tests/acceptance/virtio_check_params.py b/tests/system/virtio_check_params.py
similarity index 100%
rename from tests/acceptance/virtio_check_params.py
rename to tests/system/virtio_check_params.py
diff --git a/tests/acceptance/virtio_version.py b/tests/system/virtio_version.py
similarity index 100%
rename from tests/acceptance/virtio_version.py
rename to tests/system/virtio_version.py
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/system/virtiofs_submounts.py
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py
rename to tests/system/virtiofs_submounts.py
diff --git a/tests/acceptance/virtiofs_submounts.py.data/cleanup.sh b/tests/system/virtiofs_submounts.py.data/cleanup.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/cleanup.sh
rename to tests/system/virtiofs_submounts.py.data/cleanup.sh
diff --git a/tests/acceptance/virtiofs_submounts.py.data/guest-cleanup.sh b/tests/system/virtiofs_submounts.py.data/guest-cleanup.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/guest-cleanup.sh
rename to tests/system/virtiofs_submounts.py.data/guest-cleanup.sh
diff --git a/tests/acceptance/virtiofs_submounts.py.data/guest.sh b/tests/system/virtiofs_submounts.py.data/guest.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/guest.sh
rename to tests/system/virtiofs_submounts.py.data/guest.sh
diff --git a/tests/acceptance/virtiofs_submounts.py.data/host.sh b/tests/system/virtiofs_submounts.py.data/host.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/host.sh
rename to tests/system/virtiofs_submounts.py.data/host.sh
diff --git a/tests/acceptance/vnc.py b/tests/system/vnc.py
similarity index 100%
rename from tests/acceptance/vnc.py
rename to tests/system/vnc.py
diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/system/x86_cpu_model_versions.py
similarity index 100%
rename from tests/acceptance/x86_cpu_model_versions.py
rename to tests/system/x86_cpu_model_versions.py
-- 
2.31.1


