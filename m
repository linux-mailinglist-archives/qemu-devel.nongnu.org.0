Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C21444A21
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 22:17:11 +0100 (CET)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miNd9-000145-3r
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 17:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1miNar-0007e5-OD
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:14:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1miNah-00069B-IC
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 17:14:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635974078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTGmbtm6mOzaVvDLAzbzAAZckVWl8VCFXHF2TihEqnc=;
 b=AxfPNhMC4FPSwWMqRL2KVwiH4o5J/R+e7KIOX3WAZ0Hd8GFRu/3Pq0HZD5pRUwtv894ei0
 oHfADm05D8ub6d1RzX3F6I8+Rr3544Ra8Iwua4d15rntqKxJJy2EKOgjSSNVIomcCPuF9T
 LCUEL/Y8xDk2EwcNJnbEJ4gO6uWiwe0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-0JVKqRHdPZ2SZSx2UBQiKQ-1; Wed, 03 Nov 2021 17:14:33 -0400
X-MC-Unique: 0JVKqRHdPZ2SZSx2UBQiKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB9111923763;
 Wed,  3 Nov 2021 21:14:31 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.18.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D38B85D9D3;
 Wed,  3 Nov 2021 21:14:24 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] tests/acceptance: rename tests acceptance to tests avocado
Date: Wed,  3 Nov 2021 18:14:04 -0300
Message-Id: <20211103211404.79953-2-willianr@redhat.com>
In-Reply-To: <20211103211404.79953-1-willianr@redhat.com>
References: <20211103211404.79953-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_QUOTING=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the discussion about renaming the `tests/acceptance` [1], the
conclusion was that the folders inside `tests` are related to the
framework running the tests and not directly related to the type of
the tests.

This changes the folder to `tests/avocado` and adjusts the MAKEFILE, the
CI related files and the documentation.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-05/msg06553.html

Signed-off-by: Willian Rampazzo <willianr@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml           |  2 +-
 .gitlab-ci.d/buildtest.yml                    | 56 +++++++++----------
 MAINTAINERS                                   | 52 ++++++++---------
 configure                                     |  2 +-
 docs/devel/build-system.rst                   |  2 +-
 docs/devel/ci-definitions.rst.inc             |  2 +-
 docs/devel/testing.rst                        | 49 ++++++++--------
 docs/system/arm/orangepi.rst                  |  8 +--
 python/qemu/machine/README.rst                |  2 +-
 python/qemu/qmp/README.rst                    |  2 +-
 python/qemu/utils/README.rst                  |  2 +-
 tests/Makefile.include                        | 14 ++---
 tests/acceptance/README.rst                   | 10 ----
 tests/avocado/README.rst                      | 10 ++++
 .../avocado_qemu/__init__.py                  |  2 +-
 tests/{acceptance => avocado}/boot_linux.py   |  0
 .../boot_linux_console.py                     |  0
 tests/{acceptance => avocado}/boot_xen.py     |  0
 tests/{acceptance => avocado}/cpu_queries.py  |  0
 .../empty_cpu_model.py                        |  0
 tests/{acceptance => avocado}/hotplug_cpu.py  |  0
 tests/{acceptance => avocado}/info_usernet.py |  0
 tests/{acceptance => avocado}/intel_iommu.py  |  0
 tests/{acceptance => avocado}/linux_initrd.py |  2 +-
 .../linux_ssh_mips_malta.py                   |  0
 .../machine_arm_canona1100.py                 |  0
 .../machine_arm_integratorcp.py               |  0
 .../machine_arm_n8x0.py                       |  0
 tests/{acceptance => avocado}/machine_avr6.py |  2 +-
 .../machine_m68k_nextcube.py                  |  0
 .../machine_microblaze.py                     |  0
 .../machine_mips_fuloong2e.py                 |  0
 .../machine_mips_loongson3v.py                |  0
 .../machine_mips_malta.py                     |  0
 .../machine_rx_gdbsim.py                      |  0
 .../machine_s390_ccw_virtio.py                |  0
 .../machine_sparc64_sun4u.py                  |  0
 .../machine_sparc_leon3.py                    |  0
 tests/{acceptance => avocado}/migration.py    |  0
 tests/{acceptance => avocado}/multiprocess.py |  0
 .../pc_cpu_hotplug_props.py                   |  0
 tests/{acceptance => avocado}/ppc_405.py      |  0
 tests/{acceptance => avocado}/ppc_bamboo.py   |  0
 .../{acceptance => avocado}/ppc_mpc8544ds.py  |  0
 tests/{acceptance => avocado}/ppc_prep_40p.py | 12 ++--
 tests/{acceptance => avocado}/ppc_pseries.py  |  0
 .../ppc_virtex_ml507.py                       |  0
 .../{acceptance => avocado}/replay_kernel.py  |  0
 tests/{acceptance => avocado}/replay_linux.py |  0
 .../reverse_debugging.py                      |  0
 tests/{acceptance => avocado}/smmu.py         |  0
 tests/{acceptance => avocado}/tcg_plugins.py  |  0
 .../tesseract_utils.py                        |  0
 tests/{acceptance => avocado}/version.py      |  0
 tests/{acceptance => avocado}/virtio-gpu.py   |  0
 .../virtio_check_params.py                    |  0
 .../{acceptance => avocado}/virtio_version.py |  0
 .../virtiofs_submounts.py                     |  0
 .../virtiofs_submounts.py.data/cleanup.sh     |  0
 .../guest-cleanup.sh                          |  0
 .../virtiofs_submounts.py.data/guest.sh       |  0
 .../virtiofs_submounts.py.data/host.sh        |  0
 tests/{acceptance => avocado}/vnc.py          |  0
 .../x86_cpu_model_versions.py                 |  0
 64 files changed, 113 insertions(+), 118 deletions(-)
 delete mode 100644 tests/acceptance/README.rst
 create mode 100644 tests/avocado/README.rst
 rename tests/{acceptance => avocado}/avocado_qemu/__init__.py (99%)
 rename tests/{acceptance => avocado}/boot_linux.py (100%)
 rename tests/{acceptance => avocado}/boot_linux_console.py (100%)
 rename tests/{acceptance => avocado}/boot_xen.py (100%)
 rename tests/{acceptance => avocado}/cpu_queries.py (100%)
 rename tests/{acceptance => avocado}/empty_cpu_model.py (100%)
 rename tests/{acceptance => avocado}/hotplug_cpu.py (100%)
 rename tests/{acceptance => avocado}/info_usernet.py (100%)
 rename tests/{acceptance => avocado}/intel_iommu.py (100%)
 rename tests/{acceptance => avocado}/linux_initrd.py (99%)
 rename tests/{acceptance => avocado}/linux_ssh_mips_malta.py (100%)
 rename tests/{acceptance => avocado}/machine_arm_canona1100.py (100%)
 rename tests/{acceptance => avocado}/machine_arm_integratorcp.py (100%)
 rename tests/{acceptance => avocado}/machine_arm_n8x0.py (100%)
 rename tests/{acceptance => avocado}/machine_avr6.py (98%)
 rename tests/{acceptance => avocado}/machine_m68k_nextcube.py (100%)
 rename tests/{acceptance => avocado}/machine_microblaze.py (100%)
 rename tests/{acceptance => avocado}/machine_mips_fuloong2e.py (100%)
 rename tests/{acceptance => avocado}/machine_mips_loongson3v.py (100%)
 rename tests/{acceptance => avocado}/machine_mips_malta.py (100%)
 rename tests/{acceptance => avocado}/machine_rx_gdbsim.py (100%)
 rename tests/{acceptance => avocado}/machine_s390_ccw_virtio.py (100%)
 rename tests/{acceptance => avocado}/machine_sparc64_sun4u.py (100%)
 rename tests/{acceptance => avocado}/machine_sparc_leon3.py (100%)
 rename tests/{acceptance => avocado}/migration.py (100%)
 rename tests/{acceptance => avocado}/multiprocess.py (100%)
 rename tests/{acceptance => avocado}/pc_cpu_hotplug_props.py (100%)
 rename tests/{acceptance => avocado}/ppc_405.py (100%)
 rename tests/{acceptance => avocado}/ppc_bamboo.py (100%)
 rename tests/{acceptance => avocado}/ppc_mpc8544ds.py (100%)
 rename tests/{acceptance => avocado}/ppc_prep_40p.py (92%)
 rename tests/{acceptance => avocado}/ppc_pseries.py (100%)
 rename tests/{acceptance => avocado}/ppc_virtex_ml507.py (100%)
 rename tests/{acceptance => avocado}/replay_kernel.py (100%)
 rename tests/{acceptance => avocado}/replay_linux.py (100%)
 rename tests/{acceptance => avocado}/reverse_debugging.py (100%)
 rename tests/{acceptance => avocado}/smmu.py (100%)
 rename tests/{acceptance => avocado}/tcg_plugins.py (100%)
 rename tests/{acceptance => avocado}/tesseract_utils.py (100%)
 rename tests/{acceptance => avocado}/version.py (100%)
 rename tests/{acceptance => avocado}/virtio-gpu.py (100%)
 rename tests/{acceptance => avocado}/virtio_check_params.py (100%)
 rename tests/{acceptance => avocado}/virtio_version.py (100%)
 rename tests/{acceptance => avocado}/virtiofs_submounts.py (100%)
 rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/cleanup.sh (100%)
 rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/guest-cleanup.sh (100%)
 rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/guest.sh (100%)
 rename tests/{acceptance => avocado}/virtiofs_submounts.py.data/host.sh (100%)
 rename tests/{acceptance => avocado}/vnc.py (100%)
 rename tests/{acceptance => avocado}/x86_cpu_model_versions.py (100%)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index fcbcc4e627..2c7980a4f6 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -37,7 +37,7 @@
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
-.acceptance_test_job_template:
+.avocado_test_job_template:
   extends: .native_test_job_template
   cache:
     key: "${CI_JOB_NAME}-cache"
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 6c1301e912..71d0f407ad 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -26,14 +26,14 @@ check-system-alpine:
     IMAGE: alpine
     MAKE_CHECK_ARGS: check
 
-acceptance-system-alpine:
-  extends: .acceptance_test_job_template
+avocado-system-alpine:
+  extends: .avocado_test_job_template
   needs:
     - job: build-system-alpine
       artifacts: true
   variables:
     IMAGE: alpine
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 build-system-ubuntu:
   extends: .native_build_job_template
@@ -59,14 +59,14 @@ check-system-ubuntu:
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
-acceptance-system-ubuntu:
-  extends: .acceptance_test_job_template
+avocado-system-ubuntu:
+  extends: .avocado_test_job_template
   needs:
     - job: build-system-ubuntu
       artifacts: true
   variables:
     IMAGE: ubuntu2004
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
   extends: .native_build_job_template
@@ -91,14 +91,14 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
-acceptance-system-debian:
-  extends: .acceptance_test_job_template
+avocado-system-debian:
+  extends: .avocado_test_job_template
   needs:
     - job: build-system-debian
       artifacts: true
   variables:
     IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 build-system-fedora:
   extends: .native_build_job_template
@@ -125,14 +125,14 @@ check-system-fedora:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-system-fedora:
-  extends: .acceptance_test_job_template
+avocado-system-fedora:
+  extends: .avocado_test_job_template
   needs:
     - job: build-system-fedora
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 build-system-centos:
   extends: .native_build_job_template
@@ -159,14 +159,14 @@ check-system-centos:
     IMAGE: centos8
     MAKE_CHECK_ARGS: check
 
-acceptance-system-centos:
-  extends: .acceptance_test_job_template
+avocado-system-centos:
+  extends: .avocado_test_job_template
   needs:
     - job: build-system-centos
       artifacts: true
   variables:
     IMAGE: centos8
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 build-system-opensuse:
   extends: .native_build_job_template
@@ -191,14 +191,14 @@ check-system-opensuse:
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check
 
-acceptance-system-opensuse:
-  extends: .acceptance_test_job_template
+avocado-system-opensuse:
+  extends: .avocado_test_job_template
   needs:
     - job: build-system-opensuse
       artifacts: true
   variables:
     IMAGE: opensuse-leap
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 
 # This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
@@ -317,7 +317,7 @@ clang-user:
 # This can be accomplished by using -enable-slirp=git, which avoids the use of
 # a system-wide version of the library
 #
-# Split in three sets of build/check/acceptance to limit the execution time of each
+# Split in three sets of build/check/avocado to limit the execution time of each
 # job
 build-cfi-aarch64:
   extends: .native_build_job_template
@@ -352,14 +352,14 @@ check-cfi-aarch64:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-cfi-aarch64:
-  extends: .acceptance_test_job_template
+avocado-cfi-aarch64:
+  extends: .avocado_test_job_template
   needs:
     - job: build-cfi-aarch64
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-ppc64-s390x:
   extends: .native_build_job_template
@@ -394,14 +394,14 @@ check-cfi-ppc64-s390x:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-cfi-ppc64-s390x:
-  extends: .acceptance_test_job_template
+avocado-cfi-ppc64-s390x:
+  extends: .avocado_test_job_template
   needs:
     - job: build-cfi-ppc64-s390x
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-x86_64:
   extends: .native_build_job_template
@@ -430,14 +430,14 @@ check-cfi-x86_64:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
-acceptance-cfi-x86_64:
-  extends: .acceptance_test_job_template
+avocado-cfi-x86_64:
+  extends: .avocado_test_job_template
   needs:
     - job: build-cfi-x86_64
       artifacts: true
   variables:
     IMAGE: fedora
-    MAKE_CHECK_ARGS: check-acceptance
+    MAKE_CHECK_ARGS: check-avocado
 
 tsan-build:
   extends: .native_build_job_template
diff --git a/MAINTAINERS b/MAINTAINERS
index c0d1518e0d..02e191b917 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -177,7 +177,7 @@ L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/smmu*
 F: include/hw/arm/smmu*
-F: tests/acceptance/smmu.py
+F: tests/avocado/smmu.py
 
 AVR TCG CPUs
 M: Michael Rolnik <mrolnik@gmail.com>
@@ -185,7 +185,7 @@ S: Maintained
 F: docs/system/target-avr.rst
 F: gdb-xml/avr-cpu.xml
 F: target/avr/
-F: tests/acceptance/machine_avr6.py
+F: tests/avocado/machine_avr6.py
 
 CRIS TCG CPUs
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -654,7 +654,7 @@ S: Odd Fixes
 F: include/hw/arm/digic.h
 F: hw/*/digic*
 F: include/hw/*/digic*
-F: tests/acceptance/machine_arm_canona1100.py
+F: tests/avocado/machine_arm_canona1100.py
 F: docs/system/arm/digic.rst
 
 Goldfish RTC
@@ -705,7 +705,7 @@ S: Maintained
 F: hw/arm/integratorcp.c
 F: hw/misc/arm_integrator_debug.c
 F: include/hw/misc/arm_integrator_debug.h
-F: tests/acceptance/machine_arm_integratorcp.py
+F: tests/avocado/machine_arm_integratorcp.py
 F: docs/system/arm/integratorcp.rst
 
 MCIMX6UL EVK / i.MX6ul
@@ -802,7 +802,7 @@ F: include/hw/display/blizzard.h
 F: include/hw/input/lm832x.h
 F: include/hw/input/tsc2xxx.h
 F: include/hw/misc/cbus.h
-F: tests/acceptance/machine_arm_n8x0.py
+F: tests/avocado/machine_arm_n8x0.py
 F: docs/system/arm/nseries.rst
 
 Palm
@@ -1156,7 +1156,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: hw/microblaze/petalogix_s3adsp1800_mmu.c
 F: include/hw/char/xilinx_uartlite.h
-F: tests/acceptance/machine_microblaze.py
+F: tests/avocado/machine_microblaze.py
 
 petalogix_ml605
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
@@ -1189,8 +1189,8 @@ F: hw/acpi/piix4.c
 F: hw/mips/malta.c
 F: hw/mips/gt64xxx_pci.c
 F: include/hw/southbridge/piix.h
-F: tests/acceptance/linux_ssh_mips_malta.py
-F: tests/acceptance/machine_mips_malta.py
+F: tests/avocado/linux_ssh_mips_malta.py
+F: tests/avocado/machine_mips_malta.py
 
 Mipssim
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
@@ -1208,7 +1208,7 @@ F: hw/isa/vt82c686.c
 F: hw/pci-host/bonito.c
 F: hw/usb/vt82c686-uhci-pci.c
 F: include/hw/isa/vt82c686.h
-F: tests/acceptance/machine_mips_fuloong2e.py
+F: tests/avocado/machine_mips_fuloong2e.py
 
 Loongson-3 virtual platforms
 M: Huacai Chen <chenhuacai@kernel.org>
@@ -1218,7 +1218,7 @@ F: hw/intc/loongson_liointc.c
 F: hw/mips/loongson3_bootp.c
 F: hw/mips/loongson3_bootp.h
 F: hw/mips/loongson3_virt.c
-F: tests/acceptance/machine_mips_loongson3v.py
+F: tests/avocado/machine_mips_loongson3v.py
 
 Boston
 M: Paul Burton <paulburton@kernel.org>
@@ -1247,7 +1247,7 @@ Bamboo
 L: qemu-ppc@nongnu.org
 S: Orphan
 F: hw/ppc/ppc440_bamboo.c
-F: tests/acceptance/ppc_bamboo.py
+F: tests/avocado/ppc_bamboo.py
 
 e500
 L: qemu-ppc@nongnu.org
@@ -1268,7 +1268,7 @@ L: qemu-ppc@nongnu.org
 S: Orphan
 F: hw/ppc/mpc8544ds.c
 F: hw/ppc/mpc8544_guts.c
-F: tests/acceptance/ppc_mpc8544ds.py
+F: tests/avocado/ppc_mpc8544ds.py
 
 New World (mac99)
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
@@ -1315,7 +1315,7 @@ F: hw/dma/i82374.c
 F: hw/rtc/m48t59-isa.c
 F: include/hw/isa/pc87312.h
 F: include/hw/rtc/m48t59.h
-F: tests/acceptance/ppc_prep_40p.py
+F: tests/avocado/ppc_prep_40p.py
 
 sPAPR
 M: David Gibson <david@gibson.dropbear.id.au>
@@ -1333,7 +1333,7 @@ F: tests/qtest/spapr*
 F: tests/qtest/libqos/*spapr*
 F: tests/qtest/rtas*
 F: tests/qtest/libqos/rtas*
-F: tests/acceptance/ppc_pseries.py
+F: tests/avocado/ppc_pseries.py
 
 PowerNV (Non-Virtualized)
 M: Cédric Le Goater <clg@kaod.org>
@@ -1353,7 +1353,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/virtex_ml507.c
-F: tests/acceptance/ppc_virtex_ml507.py
+F: tests/avocado/ppc_virtex_ml507.py
 
 sam460ex
 M: BALATON Zoltan <balaton@eik.bme.hu>
@@ -1440,7 +1440,7 @@ R: Yoshinori Sato <ysato@users.sourceforge.jp>
 S: Orphan
 F: docs/system/target-rx.rst
 F: hw/rx/rx-gdbsim.c
-F: tests/acceptance/machine_rx_gdbsim.py
+F: tests/avocado/machine_rx_gdbsim.py
 
 SH4 Machines
 ------------
@@ -1494,7 +1494,7 @@ F: include/hw/pci-host/sabre.h
 F: hw/pci-bridge/simba.c
 F: include/hw/pci-bridge/simba.h
 F: pc-bios/openbios-sparc64
-F: tests/acceptance/machine_sparc64_sun4u.py
+F: tests/avocado/machine_sparc64_sun4u.py
 
 Sun4v
 M: Artyom Tarasenko <atar4qemu@gmail.com>
@@ -1510,7 +1510,7 @@ S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
 F: include/hw/*/grlib*
-F: tests/acceptance/machine_sparc_leon3.py
+F: tests/avocado/machine_sparc_leon3.py
 
 S390 Machines
 -------------
@@ -1525,7 +1525,7 @@ F: include/hw/s390x/
 F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
 F: configs/devices/s390x-softmmu/default.mak
-F: tests/acceptance/machine_s390_ccw_virtio.py
+F: tests/avocado/machine_s390_ccw_virtio.py
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
@@ -2109,7 +2109,7 @@ M: Alex Bennée <alex.bennee@linaro.org>
 S: Maintained
 F: hw/core/guest-loader.c
 F: docs/system/guest-loader.rst
-F: tests/acceptance/boot_xen.py
+F: tests/avocado/boot_xen.py
 
 Intel Hexadecimal Object File Loader
 M: Su Hang <suhang16@mails.ucas.ac.cn>
@@ -2983,9 +2983,9 @@ F: net/filter-replay.c
 F: include/sysemu/replay.h
 F: docs/replay.txt
 F: stubs/replay.c
-F: tests/acceptance/replay_kernel.py
-F: tests/acceptance/replay_linux.py
-F: tests/acceptance/reverse_debugging.py
+F: tests/avocado/replay_kernel.py
+F: tests/avocado/replay_linux.py
+F: tests/avocado/reverse_debugging.py
 F: qapi/replay.json
 
 IOVA Tree
@@ -3102,7 +3102,7 @@ S: Maintained
 F: docs/devel/tcg-plugins.rst
 F: plugins/
 F: tests/plugin/
-F: tests/acceptance/tcg_plugins.py
+F: tests/avocado/tcg_plugins.py
 F: contrib/plugins/
 
 AArch64 TCG target
@@ -3491,14 +3491,14 @@ S: Maintained
 F: tests/tcg/Makefile
 F: tests/tcg/Makefile.include
 
-Acceptance (Integration) Testing with the Avocado framework
+Integration Testing with the Avocado framework
 W: https://trello.com/b/6Qi1pxVn/avocado-qemu
 R: Cleber Rosa <crosa@redhat.com>
 R: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 R: Willian Rampazzo <willianr@redhat.com>
 S: Odd Fixes
-F: tests/acceptance/
+F: tests/avocado/
 
 Documentation
 -------------
diff --git a/configure b/configure
index d57ad58342..65c8de911c 100755
--- a/configure
+++ b/configure
@@ -3901,7 +3901,7 @@ LINKS="$LINKS pc-bios/s390-ccw/Makefile"
 LINKS="$LINKS roms/seabios/Makefile"
 LINKS="$LINKS pc-bios/qemu-icon.bmp"
 LINKS="$LINKS .gdbinit scripts" # scripts needed by relative path in .gdbinit
-LINKS="$LINKS tests/acceptance tests/data"
+LINKS="$LINKS tests/avocado tests/data"
 LINKS="$LINKS tests/qemu-iotests/check"
 LINKS="$LINKS python"
 LINKS="$LINKS contrib/plugins/Makefile "
diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 7f106d2f1c..911ee5a8df 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -416,7 +416,7 @@ number of dynamically created files listed later.
 
 ``tests/Makefile.include``
   Rules for external test harnesses. These include the TCG tests,
-  ``qemu-iotests`` and the Avocado-based acceptance tests.
+  ``qemu-iotests`` and the Avocado-based integration tests.
 
 ``tests/docker/Makefile.include``
   Rules for Docker tests. Like tests/Makefile, this file is included
diff --git a/docs/devel/ci-definitions.rst.inc b/docs/devel/ci-definitions.rst.inc
index 32e22ff468..6d5c6fd9f2 100644
--- a/docs/devel/ci-definitions.rst.inc
+++ b/docs/devel/ci-definitions.rst.inc
@@ -59,7 +59,7 @@ to system testing [5]_. Note that, in some cases, system testing may require
 interaction with third-party software, like operating system images, databases,
 networks, and so on.
 
-On QEMU, system testing is represented by the 'check-acceptance' target from
+On QEMU, system testing is represented by the 'check-avocado' target from
 'make'.
 
 Flaky tests
diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 7500f076c2..dc5dbd057d 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -653,17 +653,16 @@ supported. To start the fuzzer, run
 Alternatively, some command different from "qemu-img info" can be tested, by
 changing the ``-c`` option.
 
-Acceptance tests using the Avocado Framework
---------------------------------------------
+Integration tests using the Avocado Framework
+---------------------------------------------
 
-The ``tests/acceptance`` directory hosts functional tests, also known
-as acceptance level tests.  They're usually higher level tests, and
-may interact with external resources and with various guest operating
-systems.
+The ``tests/avocado`` directory hosts integration tests. They're usually
+higher level tests, and may interact with external resources and with
+various guest operating systems.
 
 These tests are written using the Avocado Testing Framework (which must
 be installed separately) in conjunction with a the ``avocado_qemu.Test``
-class, implemented at ``tests/acceptance/avocado_qemu``.
+class, implemented at ``tests/avocado/avocado_qemu``.
 
 Tests based on ``avocado_qemu.Test`` can easily:
 
@@ -695,11 +694,11 @@ Tests based on ``avocado_qemu.Test`` can easily:
 Running tests
 ~~~~~~~~~~~~~
 
-You can run the acceptance tests simply by executing:
+You can run the avocado tests simply by executing:
 
 .. code::
 
-  make check-acceptance
+  make check-avocado
 
 This involves the automatic creation of Python virtual environment
 within the build tree (at ``tests/venv``) which will have all the
@@ -714,12 +713,12 @@ specific version, they may be on packages named ``python3-venv`` and
 ``python3-pip``.
 
 It is also possible to run tests based on tags using the
-``make check-acceptance`` command and the ``AVOCADO_TAGS`` environment
+``make check-avocado`` command and the ``AVOCADO_TAGS`` environment
 variable:
 
 .. code::
 
-   make check-acceptance AVOCADO_TAGS=quick
+   make check-avocado AVOCADO_TAGS=quick
 
 Note that tags separated with commas have an AND behavior, while tags
 separated by spaces have an OR behavior. For more information on Avocado
@@ -728,31 +727,31 @@ tags, see:
  https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
 
 To run a single test file, a couple of them, or a test within a file
-using the ``make check-acceptance`` command, set the ``AVOCADO_TESTS``
+using the ``make check-avocado`` command, set the ``AVOCADO_TESTS``
 environment variable with the test files or test names. To run all
 tests from a single file, use:
 
  .. code::
 
-  make check-acceptance AVOCADO_TESTS=$FILEPATH
+  make check-avocado AVOCADO_TESTS=$FILEPATH
 
 The same is valid to run tests from multiple test files:
 
  .. code::
 
-  make check-acceptance AVOCADO_TESTS='$FILEPATH1 $FILEPATH2'
+  make check-avocado AVOCADO_TESTS='$FILEPATH1 $FILEPATH2'
 
 To run a single test within a file, use:
 
  .. code::
 
-  make check-acceptance AVOCADO_TESTS=$FILEPATH:$TESTCLASS.$TESTNAME
+  make check-avocado AVOCADO_TESTS=$FILEPATH:$TESTCLASS.$TESTNAME
 
 The same is valid to run single tests from multiple test files:
 
  .. code::
 
-  make check-acceptance AVOCADO_TESTS='$FILEPATH1:$TESTCLASS1.$TESTNAME1 $FILEPATH2:$TESTCLASS2.$TESTNAME2'
+  make check-avocado AVOCADO_TESTS='$FILEPATH1:$TESTCLASS1.$TESTNAME1 $FILEPATH2:$TESTCLASS2.$TESTNAME2'
 
 The scripts installed inside the virtual environment may be used
 without an "activation".  For instance, the Avocado test runner
@@ -760,9 +759,9 @@ may be invoked by running:
 
  .. code::
 
-  tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/acceptance/
+  tests/venv/bin/avocado run $OPTION1 $OPTION2 tests/avocado/
 
-Note that if ``make check-acceptance`` was not executed before, it is
+Note that if ``make check-avocado`` was not executed before, it is
 possible to create the Python virtual environment with the dependencies
 needed running:
 
@@ -775,20 +774,20 @@ a test file. To run tests from a single file within the build tree, use:
 
  .. code::
 
-  tests/venv/bin/avocado run tests/acceptance/$TESTFILE
+  tests/venv/bin/avocado run tests/avocado/$TESTFILE
 
 To run a single test within a test file, use:
 
  .. code::
 
-  tests/venv/bin/avocado run tests/acceptance/$TESTFILE:$TESTCLASS.$TESTNAME
+  tests/venv/bin/avocado run tests/avocado/$TESTFILE:$TESTCLASS.$TESTNAME
 
 Valid test names are visible in the output from any previous execution
-of Avocado or ``make check-acceptance``, and can also be queried using:
+of Avocado or ``make check-avocado``, and can also be queried using:
 
  .. code::
 
-  tests/venv/bin/avocado list tests/acceptance
+  tests/venv/bin/avocado list tests/avocado
 
 Manual Installation
 ~~~~~~~~~~~~~~~~~~~
@@ -806,7 +805,7 @@ Alternatively, follow the instructions on this link:
 Overview
 ~~~~~~~~
 
-The ``tests/acceptance/avocado_qemu`` directory provides the
+The ``tests/avocado/avocado_qemu`` directory provides the
 ``avocado_qemu`` Python module, containing the ``avocado_qemu.Test``
 class.  Here's a simple usage example:
 
@@ -913,7 +912,7 @@ like this:
           self.ssh_command('some_command_to_be_run_in_the_guest')
 
 Please refer to tests that use ``avocado_qemu.LinuxTest`` under
-``tests/acceptance`` for more examples.
+``tests/avocado`` for more examples.
 
 QEMUMachine
 ~~~~~~~~~~~
@@ -1204,7 +1203,7 @@ And remove any package you want with::
 
   pip uninstall <package_name>
 
-If you've used ``make check-acceptance``, the Python virtual environment where
+If you've used ``make check-avocado``, the Python virtual environment where
 Avocado is installed will be cleaned up as part of ``make check-clean``.
 
 .. _checktcg-ref:
diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
index 6f23907fb6..c55694dd91 100644
--- a/docs/system/arm/orangepi.rst
+++ b/docs/system/arm/orangepi.rst
@@ -250,14 +250,14 @@ and set the following environment variables before booting:
 Optionally you may save the environment variables to SD card with 'saveenv'.
 To continue booting simply give the 'boot' command and NetBSD boots.
 
-Orange Pi PC acceptance tests
-"""""""""""""""""""""""""""""
+Orange Pi PC integration tests
+""""""""""""""""""""""""""""""
 
-The Orange Pi PC machine has several acceptance tests included.
+The Orange Pi PC machine has several integration tests included.
 To run the whole set of tests, build QEMU from source and simply
 provide the following command:
 
 .. code-block:: bash
 
   $ AVOCADO_ALLOW_LARGE_STORAGE=yes avocado --show=app,console run \
-     -t machine:orangepi-pc tests/acceptance/boot_linux_console.py
+     -t machine:orangepi-pc tests/avocado/boot_linux_console.py
diff --git a/python/qemu/machine/README.rst b/python/qemu/machine/README.rst
index ac2b4fffb4..8de2c3d772 100644
--- a/python/qemu/machine/README.rst
+++ b/python/qemu/machine/README.rst
@@ -2,7 +2,7 @@ qemu.machine package
 ====================
 
 This package provides core utilities used for testing and debugging
-QEMU. It is used by the iotests, vm tests, acceptance tests, and several
+QEMU. It is used by the iotests, vm tests, avocado tests, and several
 other utilities in the ./scripts directory. It is not a fully-fledged
 SDK and it is subject to change at any time.
 
diff --git a/python/qemu/qmp/README.rst b/python/qemu/qmp/README.rst
index c21951491c..5bfb82535f 100644
--- a/python/qemu/qmp/README.rst
+++ b/python/qemu/qmp/README.rst
@@ -3,7 +3,7 @@ qemu.qmp package
 
 This package provides a library used for connecting to and communicating
 with QMP servers. It is used extensively by iotests, vm tests,
-acceptance tests, and other utilities in the ./scripts directory. It is
+avocado tests, and other utilities in the ./scripts directory. It is
 not a fully-fledged SDK and is subject to change at any time.
 
 See the documentation in ``__init__.py`` for more information.
diff --git a/python/qemu/utils/README.rst b/python/qemu/utils/README.rst
index 975fbf4d7d..d5f2da1454 100644
--- a/python/qemu/utils/README.rst
+++ b/python/qemu/utils/README.rst
@@ -2,6 +2,6 @@ qemu.utils package
 ==================
 
 This package provides miscellaneous utilities used for testing and
-debugging QEMU. It is used primarily by the vm and acceptance tests.
+debugging QEMU. It is used primarily by the vm and avocado tests.
 
 See the documentation in ``__init__.py`` for more information.
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 8434a33fe6..49f2aa342d 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -16,7 +16,7 @@ ifneq ($(filter $(all-check-targets), check-softfloat),)
 	@echo " $(MAKE) check-tcg            Run TCG tests"
 	@echo " $(MAKE) check-softfloat      Run FPU emulation tests"
 endif
-	@echo " $(MAKE) check-acceptance     Run acceptance (functional) tests for currently configured targets"
+	@echo " $(MAKE) check-avocado        Run avocado (integration) tests for currently configured targets"
 	@echo
 	@echo " $(MAKE) check-report.tap     Generates an aggregated TAP test report"
 	@echo " $(MAKE) check-venv           Creates a Python venv for tests"
@@ -24,7 +24,7 @@ endif
 	@echo
 	@echo "The following are useful for CI builds"
 	@echo " $(MAKE) check-build          Build most test binaris"
-	@echo " $(MAKE) get-vm-images        Downloads all images used by acceptance tests, according to configured targets (~350 MB each, 1.5 GB max)"
+	@echo " $(MAKE) get-vm-images        Downloads all images used by avocado tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
 	@echo "The variable SPEED can be set to control the gtester speed setting."
@@ -83,13 +83,13 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
 
 # Python venv for running tests
 
-.PHONY: check-venv check-acceptance
+.PHONY: check-venv check-avocado
 
 TESTS_VENV_DIR=$(BUILD_DIR)/tests/venv
 TESTS_VENV_REQ=$(SRC_PATH)/tests/requirements.txt
 TESTS_RESULTS_DIR=$(BUILD_DIR)/tests/results
 ifndef AVOCADO_TESTS
-	AVOCADO_TESTS=tests/acceptance
+	AVOCADO_TESTS=tests/avocado
 endif
 # Controls the output generated by Avocado when running tests.
 # Any number of command separated loggers are accepted.  For more
@@ -127,12 +127,12 @@ get-vm-image-fedora-31-%: check-venv
 	$(call quiet-command, \
              $(TESTS_VENV_DIR)/bin/python -m avocado vmimage get \
              --distro=fedora --distro-version=31 --arch=$*, \
-	"AVOCADO", "Downloading acceptance tests VM image for $*")
+	"AVOCADO", "Downloading avocado tests VM image for $*")
 
 # download all vm images, according to defined targets
 get-vm-images: check-venv $(patsubst %,get-vm-image-fedora-31-%, $(FEDORA_31_DOWNLOAD))
 
-check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
+check-avocado: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 	$(call quiet-command, \
             $(TESTS_VENV_DIR)/bin/python -m avocado \
             --show=$(AVOCADO_SHOW) run --job-results-dir=$(TESTS_RESULTS_DIR) \
@@ -140,7 +140,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR) get-vm-images
 			--filter-by-tags-include-empty-key) \
             $(AVOCADO_CMDLINE_TAGS) \
             $(if $(GITLAB_CI),,--failfast) $(AVOCADO_TESTS), \
-            "AVOCADO", "tests/acceptance")
+            "AVOCADO", "tests/avocado")
 
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
diff --git a/tests/avocado/README.rst b/tests/avocado/README.rst
new file mode 100644
index 0000000000..94488371bb
--- /dev/null
+++ b/tests/avocado/README.rst
@@ -0,0 +1,10 @@
+=============================================
+Integration tests using the Avocado Framework
+=============================================
+
+This directory contains integration tests. They're usually higher
+level, and may interact with external resources and with various
+guest operating systems.
+
+For more information, please refer to ``docs/devel/testing.rst``,
+section "Integration tests using the Avocado Framework".
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
similarity index 99%
rename from tests/acceptance/avocado_qemu/__init__.py
rename to tests/avocado/avocado_qemu/__init__.py
index 1841053e2c..cd21b59e04 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -27,7 +27,7 @@
 BUILD_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(__file__))))
 
 if os.path.islink(os.path.dirname(os.path.dirname(__file__))):
-    # The link to the acceptance tests dir in the source code directory
+    # The link to the avocado tests dir in the source code directory
     lnk = os.path.dirname(os.path.dirname(__file__))
     #: The QEMU root source directory
     SOURCE_DIR = os.path.dirname(os.path.dirname(os.readlink(lnk)))
diff --git a/tests/acceptance/boot_linux.py b/tests/avocado/boot_linux.py
similarity index 100%
rename from tests/acceptance/boot_linux.py
rename to tests/avocado/boot_linux.py
diff --git a/tests/acceptance/boot_linux_console.py b/tests/avocado/boot_linux_console.py
similarity index 100%
rename from tests/acceptance/boot_linux_console.py
rename to tests/avocado/boot_linux_console.py
diff --git a/tests/acceptance/boot_xen.py b/tests/avocado/boot_xen.py
similarity index 100%
rename from tests/acceptance/boot_xen.py
rename to tests/avocado/boot_xen.py
diff --git a/tests/acceptance/cpu_queries.py b/tests/avocado/cpu_queries.py
similarity index 100%
rename from tests/acceptance/cpu_queries.py
rename to tests/avocado/cpu_queries.py
diff --git a/tests/acceptance/empty_cpu_model.py b/tests/avocado/empty_cpu_model.py
similarity index 100%
rename from tests/acceptance/empty_cpu_model.py
rename to tests/avocado/empty_cpu_model.py
diff --git a/tests/acceptance/hotplug_cpu.py b/tests/avocado/hotplug_cpu.py
similarity index 100%
rename from tests/acceptance/hotplug_cpu.py
rename to tests/avocado/hotplug_cpu.py
diff --git a/tests/acceptance/info_usernet.py b/tests/avocado/info_usernet.py
similarity index 100%
rename from tests/acceptance/info_usernet.py
rename to tests/avocado/info_usernet.py
diff --git a/tests/acceptance/intel_iommu.py b/tests/avocado/intel_iommu.py
similarity index 100%
rename from tests/acceptance/intel_iommu.py
rename to tests/avocado/intel_iommu.py
diff --git a/tests/acceptance/linux_initrd.py b/tests/avocado/linux_initrd.py
similarity index 99%
rename from tests/acceptance/linux_initrd.py
rename to tests/avocado/linux_initrd.py
index a249e2f14a..9b4880cd8c 100644
--- a/tests/acceptance/linux_initrd.py
+++ b/tests/avocado/linux_initrd.py
@@ -1,4 +1,4 @@
-# Linux initrd acceptance test.
+# Linux initrd integration test.
 #
 # Copyright (c) 2018 Red Hat, Inc.
 #
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
similarity index 100%
rename from tests/acceptance/linux_ssh_mips_malta.py
rename to tests/avocado/linux_ssh_mips_malta.py
diff --git a/tests/acceptance/machine_arm_canona1100.py b/tests/avocado/machine_arm_canona1100.py
similarity index 100%
rename from tests/acceptance/machine_arm_canona1100.py
rename to tests/avocado/machine_arm_canona1100.py
diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/avocado/machine_arm_integratorcp.py
similarity index 100%
rename from tests/acceptance/machine_arm_integratorcp.py
rename to tests/avocado/machine_arm_integratorcp.py
diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/avocado/machine_arm_n8x0.py
similarity index 100%
rename from tests/acceptance/machine_arm_n8x0.py
rename to tests/avocado/machine_arm_n8x0.py
diff --git a/tests/acceptance/machine_avr6.py b/tests/avocado/machine_avr6.py
similarity index 98%
rename from tests/acceptance/machine_avr6.py
rename to tests/avocado/machine_avr6.py
index 6baf4e9c7f..6bab31342a 100644
--- a/tests/acceptance/machine_avr6.py
+++ b/tests/avocado/machine_avr6.py
@@ -1,5 +1,5 @@
 #
-# QEMU AVR acceptance tests
+# QEMU AVR integration tests
 #
 # Copyright (c) 2019-2020 Michael Rolnik <mrolnik@gmail.com>
 #
diff --git a/tests/acceptance/machine_m68k_nextcube.py b/tests/avocado/machine_m68k_nextcube.py
similarity index 100%
rename from tests/acceptance/machine_m68k_nextcube.py
rename to tests/avocado/machine_m68k_nextcube.py
diff --git a/tests/acceptance/machine_microblaze.py b/tests/avocado/machine_microblaze.py
similarity index 100%
rename from tests/acceptance/machine_microblaze.py
rename to tests/avocado/machine_microblaze.py
diff --git a/tests/acceptance/machine_mips_fuloong2e.py b/tests/avocado/machine_mips_fuloong2e.py
similarity index 100%
rename from tests/acceptance/machine_mips_fuloong2e.py
rename to tests/avocado/machine_mips_fuloong2e.py
diff --git a/tests/acceptance/machine_mips_loongson3v.py b/tests/avocado/machine_mips_loongson3v.py
similarity index 100%
rename from tests/acceptance/machine_mips_loongson3v.py
rename to tests/avocado/machine_mips_loongson3v.py
diff --git a/tests/acceptance/machine_mips_malta.py b/tests/avocado/machine_mips_malta.py
similarity index 100%
rename from tests/acceptance/machine_mips_malta.py
rename to tests/avocado/machine_mips_malta.py
diff --git a/tests/acceptance/machine_rx_gdbsim.py b/tests/avocado/machine_rx_gdbsim.py
similarity index 100%
rename from tests/acceptance/machine_rx_gdbsim.py
rename to tests/avocado/machine_rx_gdbsim.py
diff --git a/tests/acceptance/machine_s390_ccw_virtio.py b/tests/avocado/machine_s390_ccw_virtio.py
similarity index 100%
rename from tests/acceptance/machine_s390_ccw_virtio.py
rename to tests/avocado/machine_s390_ccw_virtio.py
diff --git a/tests/acceptance/machine_sparc64_sun4u.py b/tests/avocado/machine_sparc64_sun4u.py
similarity index 100%
rename from tests/acceptance/machine_sparc64_sun4u.py
rename to tests/avocado/machine_sparc64_sun4u.py
diff --git a/tests/acceptance/machine_sparc_leon3.py b/tests/avocado/machine_sparc_leon3.py
similarity index 100%
rename from tests/acceptance/machine_sparc_leon3.py
rename to tests/avocado/machine_sparc_leon3.py
diff --git a/tests/acceptance/migration.py b/tests/avocado/migration.py
similarity index 100%
rename from tests/acceptance/migration.py
rename to tests/avocado/migration.py
diff --git a/tests/acceptance/multiprocess.py b/tests/avocado/multiprocess.py
similarity index 100%
rename from tests/acceptance/multiprocess.py
rename to tests/avocado/multiprocess.py
diff --git a/tests/acceptance/pc_cpu_hotplug_props.py b/tests/avocado/pc_cpu_hotplug_props.py
similarity index 100%
rename from tests/acceptance/pc_cpu_hotplug_props.py
rename to tests/avocado/pc_cpu_hotplug_props.py
diff --git a/tests/acceptance/ppc_405.py b/tests/avocado/ppc_405.py
similarity index 100%
rename from tests/acceptance/ppc_405.py
rename to tests/avocado/ppc_405.py
diff --git a/tests/acceptance/ppc_bamboo.py b/tests/avocado/ppc_bamboo.py
similarity index 100%
rename from tests/acceptance/ppc_bamboo.py
rename to tests/avocado/ppc_bamboo.py
diff --git a/tests/acceptance/ppc_mpc8544ds.py b/tests/avocado/ppc_mpc8544ds.py
similarity index 100%
rename from tests/acceptance/ppc_mpc8544ds.py
rename to tests/avocado/ppc_mpc8544ds.py
diff --git a/tests/acceptance/ppc_prep_40p.py b/tests/avocado/ppc_prep_40p.py
similarity index 92%
rename from tests/acceptance/ppc_prep_40p.py
rename to tests/avocado/ppc_prep_40p.py
index 5e61e686bd..d1e5674673 100644
--- a/tests/acceptance/ppc_prep_40p.py
+++ b/tests/avocado/ppc_prep_40p.py
@@ -13,6 +13,10 @@
 
 
 class IbmPrep40pMachine(Test):
+    """
+    :avocado: tags=arch:ppc
+    :avocado: tags=machine:40p
+    """
 
     timeout = 60
 
@@ -24,8 +28,6 @@ class IbmPrep40pMachine(Test):
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     def test_factory_firmware_and_netbsd(self):
         """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:40p
         :avocado: tags=os:netbsd
         :avocado: tags=slowness:high
         """
@@ -48,10 +50,6 @@ def test_factory_firmware_and_netbsd(self):
         wait_for_console_pattern(self, 'Model: IBM PPS Model 6015')
 
     def test_openbios_192m(self):
-        """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:40p
-        """
         self.vm.set_console()
         self.vm.add_args('-m', '192') # test fw_cfg
 
@@ -62,8 +60,6 @@ def test_openbios_192m(self):
 
     def test_openbios_and_netbsd(self):
         """
-        :avocado: tags=arch:ppc
-        :avocado: tags=machine:40p
         :avocado: tags=os:netbsd
         """
         drive_url = ('https://archive.netbsd.org/pub/NetBSD-archive/'
diff --git a/tests/acceptance/ppc_pseries.py b/tests/avocado/ppc_pseries.py
similarity index 100%
rename from tests/acceptance/ppc_pseries.py
rename to tests/avocado/ppc_pseries.py
diff --git a/tests/acceptance/ppc_virtex_ml507.py b/tests/avocado/ppc_virtex_ml507.py
similarity index 100%
rename from tests/acceptance/ppc_virtex_ml507.py
rename to tests/avocado/ppc_virtex_ml507.py
diff --git a/tests/acceptance/replay_kernel.py b/tests/avocado/replay_kernel.py
similarity index 100%
rename from tests/acceptance/replay_kernel.py
rename to tests/avocado/replay_kernel.py
diff --git a/tests/acceptance/replay_linux.py b/tests/avocado/replay_linux.py
similarity index 100%
rename from tests/acceptance/replay_linux.py
rename to tests/avocado/replay_linux.py
diff --git a/tests/acceptance/reverse_debugging.py b/tests/avocado/reverse_debugging.py
similarity index 100%
rename from tests/acceptance/reverse_debugging.py
rename to tests/avocado/reverse_debugging.py
diff --git a/tests/acceptance/smmu.py b/tests/avocado/smmu.py
similarity index 100%
rename from tests/acceptance/smmu.py
rename to tests/avocado/smmu.py
diff --git a/tests/acceptance/tcg_plugins.py b/tests/avocado/tcg_plugins.py
similarity index 100%
rename from tests/acceptance/tcg_plugins.py
rename to tests/avocado/tcg_plugins.py
diff --git a/tests/acceptance/tesseract_utils.py b/tests/avocado/tesseract_utils.py
similarity index 100%
rename from tests/acceptance/tesseract_utils.py
rename to tests/avocado/tesseract_utils.py
diff --git a/tests/acceptance/version.py b/tests/avocado/version.py
similarity index 100%
rename from tests/acceptance/version.py
rename to tests/avocado/version.py
diff --git a/tests/acceptance/virtio-gpu.py b/tests/avocado/virtio-gpu.py
similarity index 100%
rename from tests/acceptance/virtio-gpu.py
rename to tests/avocado/virtio-gpu.py
diff --git a/tests/acceptance/virtio_check_params.py b/tests/avocado/virtio_check_params.py
similarity index 100%
rename from tests/acceptance/virtio_check_params.py
rename to tests/avocado/virtio_check_params.py
diff --git a/tests/acceptance/virtio_version.py b/tests/avocado/virtio_version.py
similarity index 100%
rename from tests/acceptance/virtio_version.py
rename to tests/avocado/virtio_version.py
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/avocado/virtiofs_submounts.py
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py
rename to tests/avocado/virtiofs_submounts.py
diff --git a/tests/acceptance/virtiofs_submounts.py.data/cleanup.sh b/tests/avocado/virtiofs_submounts.py.data/cleanup.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/cleanup.sh
rename to tests/avocado/virtiofs_submounts.py.data/cleanup.sh
diff --git a/tests/acceptance/virtiofs_submounts.py.data/guest-cleanup.sh b/tests/avocado/virtiofs_submounts.py.data/guest-cleanup.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/guest-cleanup.sh
rename to tests/avocado/virtiofs_submounts.py.data/guest-cleanup.sh
diff --git a/tests/acceptance/virtiofs_submounts.py.data/guest.sh b/tests/avocado/virtiofs_submounts.py.data/guest.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/guest.sh
rename to tests/avocado/virtiofs_submounts.py.data/guest.sh
diff --git a/tests/acceptance/virtiofs_submounts.py.data/host.sh b/tests/avocado/virtiofs_submounts.py.data/host.sh
similarity index 100%
rename from tests/acceptance/virtiofs_submounts.py.data/host.sh
rename to tests/avocado/virtiofs_submounts.py.data/host.sh
diff --git a/tests/acceptance/vnc.py b/tests/avocado/vnc.py
similarity index 100%
rename from tests/acceptance/vnc.py
rename to tests/avocado/vnc.py
diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/avocado/x86_cpu_model_versions.py
similarity index 100%
rename from tests/acceptance/x86_cpu_model_versions.py
rename to tests/avocado/x86_cpu_model_versions.py
-- 
2.33.1


