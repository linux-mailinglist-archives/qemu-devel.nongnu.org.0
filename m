Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCD639BC6E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 17:59:48 +0200 (CEST)
Received: from localhost ([::1]:36768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCEd-0000DY-Mi
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 11:59:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8S-0002OT-82
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:24 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:38653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lpC8M-0008O0-RH
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 11:53:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 t4-20020a1c77040000b029019d22d84ebdso8195678wmi.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 08:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRsDRKLq/Uir6P9oU9A9gBbmovSfHrM+JstIhOStmjg=;
 b=wtFLshJqLzdAbYKPVRUsDVJi5yI+QzwsW+oBmWx4j9chU1Rr+avGBe/XYwrFonRPpC
 0uX+QVJBBVRPF71BEhKoYf6Kl5KXZvCz9wNgM7nkbDSRfv1uxN2u+KUcViypWTA+Y7D9
 pWtnUlHVI2gv91C6q28aKtWv+KSexmiwxYN28CIqV6s2LGTwKkRlMuUx65CUf7YTiIHE
 nzqJnWH0Gn7cnVslJ8SSrR0fmiR671ktj2LWw3T1Q0WjejwnHs/CvYXlrqk+HNcuZq/E
 d19zZ/PJrQ7OIiW+Ks9q/GntISRBvwp20kw6Wpqau30WqNVMe/gqtNVpjuspmVJLTCdl
 kNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qRsDRKLq/Uir6P9oU9A9gBbmovSfHrM+JstIhOStmjg=;
 b=qBVM6I1yy5kRFqqf+mFslprRgtBIHWNdAoReM79nhWh0VJh6b4qAgCv7NLkDEOHvPx
 RTCvHKj97YgJz6UIEgFB2N76ZRSGFbJjyHRuNNx0w1TOjUEg0xGEfnFom1NwBAKSCItA
 QwsXjuRf8nt9r0OQJGTJwcnaJoz+8mXfGf9yUotFO69GT0PhfP/7XWEm6Mk60u24oszR
 fSo/3ieZcksZpLicMqVzEKPMGpu9KfN86oBgGRD30Cc+hbJzTVG6CFfXhtXYvnW5SiAG
 2z9Dl6nMs0ytMiJPplBDwDedNCufDrzo+7vErMoSwuFDG0D9hvlzoki6Z7TM5WyzoEF7
 6hbg==
X-Gm-Message-State: AOAM533oIwSqPoire78Q0aORW9lvVXhpukNN5G1W4DCP5HEd7z4YiVf4
 XTr8fiTaRZD2xwGvnJLO+w6otUtMxNTiOg==
X-Google-Smtp-Source: ABdhPJwVeJiOV0Ot9nxvhtFYjUQkyZsZ0n1tUtFtWqIx7Lo0IkdzCtw0yWeM0jGgBtyi0Q5+6SxYiA==
X-Received: by 2002:a05:600c:3789:: with SMTP id
 o9mr4417872wmr.78.1622821997010; 
 Fri, 04 Jun 2021 08:53:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y6sm9231696wmy.23.2021.06.04.08.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:53:13 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 596C61FF7E;
 Fri,  4 Jun 2021 16:53:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v16 00/99] arm tcg/kvm refactor and split with kvm only support
Date: Fri,  4 Jun 2021 16:51:33 +0100
Message-Id: <20210604155312.15902-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

I have picked up the baton from Claudio to try and get the ARM
re-factoring across the line. Most of the patches from Claudio remain
unchanged and have just had minor fixups from re-basing against the
moving target. I've done my best to make sure any fixes that have been
made in the meantime weren't lost.

I've included Phillipe's qtest_has_accel v7 patches (I had problems
with v8) to aid in my aarch64 testing. I'm expecting them to be
up-streamed by Phillipe in due course. I've also nabbed one of
Phillipe's Kconfig tweaks to allow for target specific expression of
some config variables.

The main thing that enables the --disable-tcg build is the addition of
--with-devices-FOO configure option which is a mechanism to override
the existing default device configurations. The two that I've been
testing are a 64 bit only build on x86:

  '../../configure' '--without-default-features' \
     '--target-list=arm-softmmu,aarch64-softmmu' \
     '--with-devices-aarch64=../../configs/aarch64-softmmu/64bit-only.mak'

which results in the aarch64-softmmu build only supporting sbsa-ref,
virt and xlnx-versal-virt.

The second is a KVM only cross build:

  '../../configure' '--disable-docs' \
    '--target-list=aarch64-softmmu' \
    '--enable-kvm' '--disable-tcg' \
    '--cross-prefix=aarch64-linux-gnu-' \
    '--with-devices-aarch64=../../configs/aarch64-softmmu/virt-only.mak'

Finally I've made a few minor Kconfig and testing tweaks before adding
some gitlab coverage. As a result I was able to drop the Revert: idau
patch because I can properly build an image without stray devices in
the qtree.

The following need review:

 - gitlab: defend the new stripped down arm64 configs
 - tests/qtest: make xlnx-can-test conditional on being configured
 - tests/qtest: split the cdrom-test into arm/aarch64
 - hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
 - target/arm: move CONFIG_V7M out of default-devices

Alex Bennée (6):
  target/arm: move CONFIG_V7M out of default-devices
  hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
  tests/qtest: split the cdrom-test into arm/aarch64
  tests/qtest: make xlnx-can-test conditional on being configured
  configure: allow the overriding of default-config in the build
  gitlab: defend the new stripped down arm64 configs

Claudio Fontana (80):
  meson: add target_user_arch
  accel: add cpu_reset
  target/arm: move translate modules to tcg/
  target/arm: move helpers to tcg/
  arm: tcg: only build under CONFIG_TCG
  target/arm: tcg: add sysemu and user subdirs
  target/arm: tcg: split mte_helper user-only and sysemu code
  target/arm: tcg: move sysemu-only parts of debug_helper
  target/arm: tcg: split tlb_helper user-only and sysemu-only parts
  target/arm: tcg: split m_helper user-only and sysemu-only parts
  target/arm: only build psci for TCG
  target/arm: split off cpu-sysemu.c
  target/arm: tcg: fix comment style before move to cpu-mmu
  target/arm: move physical address translation to cpu-mmu
  target/arm: fix style in preparation of new cpregs module
  target/arm: split cpregs from tcg/helper.c
  target/arm: move cpu definitions to common cpu module
  target/arm: only perform TCG cpu and machine inits if TCG enabled
  target/arm: tcg: add stubs for some helpers for non-tcg builds
  target/arm: move cpsr_read, cpsr_write to cpu_common
  target/arm: add temporary stub for arm_rebuild_hflags
  target/arm: move arm_hcr_el2_eff from tcg/ to common_cpu
  target/arm: split vfp state setting from tcg helpers
  target/arm: move arm_mmu_idx* to cpu-mmu
  target/arm: move sve_zcr_len_for_el to common_cpu
  target/arm: move arm_sctlr away from tcg helpers
  target/arm: move arm_cpu_list to common_cpu
  target/arm: move aarch64_sync_32_to_64 (and vv) to cpu code
  target/arm: new cpu32 ARM 32 bit CPU Class
  target/arm: split 32bit and 64bit arm dump state
  target/arm: move a15 cpu model away from the TCG-only models
  target/arm: fixup sve_exception_el code style before move
  target/arm: move sve_exception_el out of TCG helpers
  target/arm: fix comments style of fp_exception_el before moving it
  target/arm: move fp_exception_el out of TCG helpers
  target/arm: remove now useless ifndef from fp_exception_el
  target/arm: make further preparation for the exception code to move
  target/arm: fix style of arm_cpu_do_interrupt functions before move
  target/arm: move exception code out of tcg/helper.c
  target/arm: rename handle_semihosting to tcg_handle_semihosting
  target/arm: replace CONFIG_TCG with tcg_enabled
  target/arm: move TCGCPUOps to tcg/tcg-cpu.c
  target/arm: move cpu_tcg to tcg/tcg-cpu-models.c
  target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()
  target/arm: remove kvm include file for PSCI and arm-powerctl
  target/arm: move kvm-const.h, kvm.c, kvm64.c, kvm_arm.h to kvm/
  MAINTAINERS: update arm kvm maintained files to all in target/arm/kvm/
  target/arm: cleanup cpu includes
  target/arm: remove broad "else" statements when checking accels
  target/arm: remove kvm-stub.c
  tests/qtest: skip bios-tables-test test_acpi_oem_fields_virt for KVM
  tests: do not run test-hmp on all machines for ARM KVM-only
  tests: device-introspect-test: cope with ARM TCG-only devices
  tests: do not run qom-test on all machines for ARM KVM-only
  target/arm: create kvm cpu accel class
  target/arm: move kvm post init initialization to kvm cpu accel
  target/arm: add tcg cpu accel class
  target/arm: move TCG gt timer creation code in tcg/
  target/arm: cpu-sve: new module
  target/arm: cpu-sve: rename functions according to module prefix
  target/arm: cpu-sve: split TCG and KVM functionality
  target/arm: cpu-sve: make cpu_sve_finalize_features return bool
  target/arm: make is_aa64 and arm_el_is_aa64 a macro for
    !TARGET_AARCH64
  target/arm: restrict rebuild_hflags_a64 to TARGET_AARCH64
  target/arm: arch_dump: restrict ELFCLASS64 to AArch64
  target/arm: cpu-exceptions, cpu-exceptions-aa64: new modules
  target/arm: tcg: restrict ZCR cpregs to TARGET_AARCH64
  target/arm: tcg-sve: import narrow_vq and change_el functions
  target/arm: tcg-sve: rename the narrow_vq and change_el functions
  target/arm: move sve_zcr_len_for_el to TARGET_AARCH64-only cpu-sve
  cpu-sve: rename sve_zcr_len_for_el to cpu_sve_get_zcr_len_for_el
  target/arm: cpu-common: wrap a64-only check with is_a64
  target/arm: cpu-pauth: new module for ARMv8.3 Pointer Authentication
  target/arm: cpu-pauth: change arm_cpu_pauth_finalize name and sig
  target/arm: move arm_cpu_finalize_features into cpu64
  target/arm: cpu64: rename arm_cpu_finalize_features
  target/arm: cpu64: some final cleanup on aarch64_cpu_finalize_features
  XXX target/arm: experiment refactoring cpu "max"
  target/arm: tcg: remove superfluous CONFIG_TCG check
  target/arm: remove v7m stub function for !CONFIG_TCG

Philippe Mathieu-Daudé (13):
  MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section
  accel: Introduce 'query-accels' QMP command
  qtest: Add qtest_has_accel() method
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM
  qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM
  qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG
  qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64
  qtest/bios-tables-test: Rename tests not TCG specific
  qtest/bios-tables-test: Rename TCG specific tests
  qtest/bios-tables-test: Make test build-independent from accelerator
  qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore
  meson: Introduce target-specific Kconfig

 configure                                     |   20 +
 configs/aarch64-softmmu/64bit-only.mak        |   10 +
 configs/aarch64-softmmu/virt-only.mak         |    8 +
 default-configs/devices/arm-softmmu.mak       |    3 -
 meson.build                                   |    9 +-
 qapi/machine.json                             |   47 +
 include/hw/core/accel-cpu.h                   |    2 +
 include/qemu/accel.h                          |    6 +
 target/arm/arm-powerctl.h                     |    2 -
 target/arm/cpregs.h                           |  515 ++
 target/arm/cpu-exceptions-aa64.h              |   28 +
 target/arm/cpu-mmu.h                          |  119 +
 target/arm/cpu-qom.h                          |    3 -
 target/arm/cpu-sve.h                          |   40 +
 target/arm/cpu-vfp.h                          |   29 +
 target/arm/cpu.h                              |  534 +-
 target/arm/cpu32.h                            |   32 +
 target/arm/helper-a64.h                       |    2 +
 target/arm/helper.h                           |    1 -
 target/arm/internals.h                        |   46 +-
 target/arm/{ => kvm}/kvm-consts.h             |    0
 target/arm/kvm/kvm-sve.h                      |   28 +
 target/arm/{ => kvm}/kvm_arm.h                |    0
 target/arm/kvm/trace.h                        |    1 +
 target/arm/tcg/cpu-pauth.h                    |   34 +
 target/arm/tcg/m_helper.h                     |   21 +
 target/arm/tcg/mte_helper.h                   |   53 +
 target/arm/{ => tcg}/op_addsub.h              |    0
 target/arm/tcg/tcg-cpu.h                      |   40 +
 target/arm/tcg/tcg-sve.h                      |   29 +
 target/arm/tcg/tlb_helper.h                   |   17 +
 target/arm/tcg/trace.h                        |    1 +
 target/arm/{ => tcg}/translate-a64.h          |    0
 target/arm/{ => tcg}/translate.h              |    0
 target/arm/{ => tcg}/vec_internal.h           |    0
 target/arm/trace.h                            |    1 -
 tests/qtest/libqos/libqtest.h                 |    8 +
 target/arm/{ => tcg}/a32-uncond.decode        |    0
 target/arm/{ => tcg}/a32.decode               |    0
 target/arm/{ => tcg}/m-nocp.decode            |    0
 target/arm/{ => tcg}/neon-dp.decode           |    0
 target/arm/{ => tcg}/neon-ls.decode           |    0
 target/arm/{ => tcg}/neon-shared.decode       |    0
 target/arm/{ => tcg}/sve.decode               |    0
 target/arm/{ => tcg}/t16.decode               |    0
 target/arm/{ => tcg}/t32.decode               |    0
 target/arm/{ => tcg}/vfp-uncond.decode        |    0
 target/arm/{ => tcg}/vfp.decode               |    0
 accel/accel-common.c                          |    9 +
 accel/accel-qmp.c                             |   49 +
 hw/arm/boot.c                                 |    5 +-
 hw/arm/pxa2xx.c                               |    1 +
 hw/arm/pxa2xx_pic.c                           |    1 +
 hw/arm/sbsa-ref.c                             |    2 +-
 hw/arm/virt-acpi-build.c                      |    2 +-
 hw/arm/virt.c                                 |    2 +-
 hw/arm/xlnx-versal.c                          |    2 +-
 hw/arm/xlnx-zynqmp.c                          |    2 +-
 hw/core/cpu-common.c                          |    3 +-
 hw/cpu/a15mpcore.c                            |    2 +-
 hw/intc/arm_gic_kvm.c                         |    2 +-
 hw/intc/arm_gicv3_cpuif.c                     |    1 +
 hw/intc/arm_gicv3_its_kvm.c                   |    2 +-
 hw/intc/arm_gicv3_kvm.c                       |    3 +-
 linux-user/syscall.c                          |    6 +-
 target/arm/arch_dump.c                        |   15 +-
 target/arm/arm-powerctl.c                     |    8 +-
 target/arm/cpregs.c                           |  380 +
 target/arm/cpu-common.c                       |  358 +
 target/arm/cpu-exceptions-aa64.c              |  277 +
 target/arm/cpu-exceptions.c                   |  445 ++
 target/arm/cpu-mmu-sysemu.c                   | 2307 ++++++
 target/arm/cpu-mmu.c                          |  215 +
 target/arm/cpu-sve.c                          |  323 +
 target/arm/cpu-sysemu.c                       |  482 ++
 target/arm/cpu-user.c                         |   46 +
 target/arm/cpu-vfp.c                          |   97 +
 target/arm/cpu.c                              |  759 +-
 target/arm/cpu32.c                            |  260 +
 target/arm/cpu64.c                            |  723 +-
 target/arm/cpustate-list.c                    |  146 +
 target/arm/gdbstub.c                          |    1 +
 target/arm/kvm-stub.c                         |   24 -
 target/arm/kvm/kvm-cpu.c                      |  128 +
 target/arm/kvm/kvm-sve.c                      |  118 +
 target/arm/{ => kvm}/kvm.c                    |   18 +-
 target/arm/{ => kvm}/kvm64.c                  |    0
 target/arm/machine.c                          |   39 +-
 target/arm/monitor.c                          |   10 +-
 target/arm/psci.c                             |    1 -
 target/arm/{helper.c => tcg/cpregs.c}         | 6557 +----------------
 target/arm/tcg/cpu-pauth.c                    |   66 +
 target/arm/tcg/cpu-vfp.c                      |  146 +
 target/arm/{ => tcg}/crypto_helper.c          |    0
 target/arm/{ => tcg}/debug_helper.c           |   27 -
 target/arm/{ => tcg}/helper-a64.c             |    3 +-
 target/arm/tcg/helper.c                       | 1300 ++++
 target/arm/{ => tcg}/iwmmxt_helper.c          |    0
 target/arm/tcg/m_helper.c                     |   93 +
 target/arm/{ => tcg}/mte_helper.c             |  191 +-
 target/arm/{ => tcg}/neon_helper.c            |    0
 target/arm/{ => tcg}/op_helper.c              |    1 +
 target/arm/{ => tcg}/pauth_helper.c           |    2 +-
 target/arm/{ => tcg}/sve_helper.c             |    0
 target/arm/tcg/sysemu/debug_helper.c          |   33 +
 target/arm/{ => tcg/sysemu}/m_helper.c        |  203 +-
 target/arm/tcg/sysemu/mte_helper.c            |  159 +
 target/arm/tcg/sysemu/tcg-cpu.c               |  119 +
 target/arm/tcg/sysemu/tlb_helper.c            |   84 +
 .../arm/{cpu_tcg.c => tcg/tcg-cpu-models.c}   |  153 +-
 target/arm/tcg/tcg-cpu.c                      |  502 ++
 target/arm/tcg/tcg-stubs.c                    |   21 +
 target/arm/tcg/tcg-sve.c                      |  167 +
 target/arm/{ => tcg}/tlb_helper.c             |   97 +-
 target/arm/{ => tcg}/translate-a64.c          |    1 +
 target/arm/{ => tcg}/translate-m-nocp.c       |    0
 target/arm/{ => tcg}/translate-neon.c         |    0
 target/arm/{ => tcg}/translate-sve.c          |    0
 target/arm/{ => tcg}/translate-vfp.c          |    0
 target/arm/{ => tcg}/translate.c              |    1 +
 target/arm/tcg/user/m_helper.c                |   97 +
 target/arm/tcg/user/mte_helper.c              |   57 +
 target/arm/tcg/user/tlb_helper.c              |   32 +
 target/arm/{ => tcg}/vec_helper.c             |    0
 target/arm/{ => tcg}/vfp_helper.c             |  216 +-
 target/i386/cpu.c                             |    4 -
 target/i386/kvm/kvm-cpu.c                     |    6 +
 tests/qtest/arm-cpu-features.c                |   47 +-
 tests/qtest/bios-tables-test.c                |  163 +-
 tests/qtest/cdrom-test.c                      |    5 +-
 tests/qtest/device-introspect-test.c          |   32 +-
 tests/qtest/libqtest.c                        |   29 +
 tests/qtest/migration-test.c                  |    4 +-
 tests/qtest/qom-test.c                        |   20 +
 tests/qtest/test-hmp.c                        |   20 +
 .gitlab-ci.d/buildtest.yml                    |   10 +
 .gitlab-ci.d/crossbuilds.yml                  |    9 +
 Kconfig                                       |    1 +
 MAINTAINERS                                   |    3 +-
 accel/meson.build                             |    2 +-
 hw/arm/Kconfig                                |    4 +
 roms/u-boot                                   |    2 +-
 target/Kconfig                                |   23 +
 target/alpha/Kconfig                          |    2 +
 target/alpha/meson.build                      |    3 +
 target/arm/Kconfig                            |    6 +
 target/arm/kvm/meson.build                    |    6 +
 target/arm/kvm/trace-events                   |    4 +
 target/arm/meson.build                        |   64 +-
 target/arm/tcg/meson.build                    |   53 +
 target/arm/tcg/sysemu/meson.build             |   10 +
 target/arm/{ => tcg}/trace-events             |    5 +-
 target/arm/tcg/user/meson.build               |    5 +
 target/avr/Kconfig                            |    2 +
 target/cris/Kconfig                           |    2 +
 target/cris/meson.build                       |    3 +
 target/hexagon/meson.build                    |    3 +
 target/hppa/Kconfig                           |    2 +
 target/hppa/meson.build                       |    3 +
 target/i386/Kconfig                           |    5 +
 target/lm32/Kconfig                           |    2 +
 target/m68k/Kconfig                           |    2 +
 target/m68k/meson.build                       |    3 +
 target/microblaze/Kconfig                     |    2 +
 target/microblaze/meson.build                 |    3 +
 target/mips/Kconfig                           |    6 +
 target/moxie/Kconfig                          |    2 +
 target/nios2/Kconfig                          |    2 +
 target/nios2/meson.build                      |    3 +
 target/openrisc/Kconfig                       |    2 +
 target/openrisc/meson.build                   |    3 +
 target/ppc/Kconfig                            |    5 +
 target/ppc/meson.build                        |    3 +
 target/riscv/Kconfig                          |    5 +
 target/riscv/meson.build                      |    3 +
 target/rx/Kconfig                             |    2 +
 target/s390x/Kconfig                          |    2 +
 target/s390x/meson.build                      |    3 +
 target/sh4/Kconfig                            |    2 +
 target/sh4/meson.build                        |    3 +
 target/sparc/Kconfig                          |    5 +
 target/sparc/meson.build                      |    3 +
 target/tilegx/Kconfig                         |    2 +
 target/tricore/Kconfig                        |    2 +
 target/tricore/meson.build                    |    3 +
 target/unicore32/Kconfig                      |    2 +
 target/xtensa/Kconfig                         |    2 +
 target/xtensa/meson.build                     |    3 +
 tests/qtest/meson.build                       |    5 +-
 189 files changed, 10701 insertions(+), 9237 deletions(-)
 create mode 100644 configs/aarch64-softmmu/64bit-only.mak
 create mode 100644 configs/aarch64-softmmu/virt-only.mak
 create mode 100644 target/arm/cpregs.h
 create mode 100644 target/arm/cpu-exceptions-aa64.h
 create mode 100644 target/arm/cpu-mmu.h
 create mode 100644 target/arm/cpu-sve.h
 create mode 100644 target/arm/cpu-vfp.h
 create mode 100644 target/arm/cpu32.h
 rename target/arm/{ => kvm}/kvm-consts.h (100%)
 create mode 100644 target/arm/kvm/kvm-sve.h
 rename target/arm/{ => kvm}/kvm_arm.h (100%)
 create mode 100644 target/arm/kvm/trace.h
 create mode 100644 target/arm/tcg/cpu-pauth.h
 create mode 100644 target/arm/tcg/m_helper.h
 create mode 100644 target/arm/tcg/mte_helper.h
 rename target/arm/{ => tcg}/op_addsub.h (100%)
 create mode 100644 target/arm/tcg/tcg-cpu.h
 create mode 100644 target/arm/tcg/tcg-sve.h
 create mode 100644 target/arm/tcg/tlb_helper.h
 create mode 100644 target/arm/tcg/trace.h
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 delete mode 100644 target/arm/trace.h
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)
 create mode 100644 accel/accel-qmp.c
 create mode 100644 target/arm/cpregs.c
 create mode 100644 target/arm/cpu-common.c
 create mode 100644 target/arm/cpu-exceptions-aa64.c
 create mode 100644 target/arm/cpu-exceptions.c
 create mode 100644 target/arm/cpu-mmu-sysemu.c
 create mode 100644 target/arm/cpu-mmu.c
 create mode 100644 target/arm/cpu-sve.c
 create mode 100644 target/arm/cpu-sysemu.c
 create mode 100644 target/arm/cpu-user.c
 create mode 100644 target/arm/cpu-vfp.c
 create mode 100644 target/arm/cpu32.c
 create mode 100644 target/arm/cpustate-list.c
 delete mode 100644 target/arm/kvm-stub.c
 create mode 100644 target/arm/kvm/kvm-cpu.c
 create mode 100644 target/arm/kvm/kvm-sve.c
 rename target/arm/{ => kvm}/kvm.c (98%)
 rename target/arm/{ => kvm}/kvm64.c (100%)
 rename target/arm/{helper.c => tcg/cpregs.c} (57%)
 create mode 100644 target/arm/tcg/cpu-pauth.c
 create mode 100644 target/arm/tcg/cpu-vfp.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/debug_helper.c (92%)
 rename target/arm/{ => tcg}/helper-a64.c (99%)
 create mode 100644 target/arm/tcg/helper.c
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 create mode 100644 target/arm/tcg/m_helper.c
 rename target/arm/{ => tcg}/mte_helper.c (76%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (99%)
 rename target/arm/{ => tcg}/pauth_helper.c (99%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 create mode 100644 target/arm/tcg/sysemu/debug_helper.c
 rename target/arm/{ => tcg/sysemu}/m_helper.c (94%)
 create mode 100644 target/arm/tcg/sysemu/mte_helper.c
 create mode 100644 target/arm/tcg/sysemu/tcg-cpu.c
 create mode 100644 target/arm/tcg/sysemu/tlb_helper.c
 rename target/arm/{cpu_tcg.c => tcg/tcg-cpu-models.c} (86%)
 create mode 100644 target/arm/tcg/tcg-cpu.c
 create mode 100644 target/arm/tcg/tcg-stubs.c
 create mode 100644 target/arm/tcg/tcg-sve.c
 rename target/arm/{ => tcg}/tlb_helper.c (56%)
 rename target/arm/{ => tcg}/translate-a64.c (99%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (99%)
 create mode 100644 target/arm/tcg/user/m_helper.c
 create mode 100644 target/arm/tcg/user/mte_helper.c
 create mode 100644 target/arm/tcg/user/tlb_helper.c
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 rename target/arm/{ => tcg}/vfp_helper.c (84%)
 create mode 100644 target/Kconfig
 create mode 100644 target/alpha/Kconfig
 create mode 100644 target/arm/Kconfig
 create mode 100644 target/arm/kvm/meson.build
 create mode 100644 target/arm/kvm/trace-events
 create mode 100644 target/arm/tcg/meson.build
 create mode 100644 target/arm/tcg/sysemu/meson.build
 rename target/arm/{ => tcg}/trace-events (78%)
 create mode 100644 target/arm/tcg/user/meson.build
 create mode 100644 target/avr/Kconfig
 create mode 100644 target/cris/Kconfig
 create mode 100644 target/hppa/Kconfig
 create mode 100644 target/i386/Kconfig
 create mode 100644 target/lm32/Kconfig
 create mode 100644 target/m68k/Kconfig
 create mode 100644 target/microblaze/Kconfig
 create mode 100644 target/mips/Kconfig
 create mode 100644 target/moxie/Kconfig
 create mode 100644 target/nios2/Kconfig
 create mode 100644 target/openrisc/Kconfig
 create mode 100644 target/ppc/Kconfig
 create mode 100644 target/riscv/Kconfig
 create mode 100644 target/rx/Kconfig
 create mode 100644 target/s390x/Kconfig
 create mode 100644 target/sh4/Kconfig
 create mode 100644 target/sparc/Kconfig
 create mode 100644 target/tilegx/Kconfig
 create mode 100644 target/tricore/Kconfig
 create mode 100644 target/unicore32/Kconfig
 create mode 100644 target/xtensa/Kconfig

-- 
2.20.1


