Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E6342BB5A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 11:18:53 +0200 (CEST)
Received: from localhost ([::1]:42992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maaPU-00009p-I7
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 05:18:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEc-0002C5-5J
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:43 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1maaEX-0005aJ-TA
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 05:07:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id a25so7232577edx.8
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jdODuhQSbSneu6LsgolsgrPxYzk6J9fHhWKfFe/Veik=;
 b=cTEm5hXfTZ73G/rTr7IfKW35Vq9XiJ73PQwfB7tduprFybY1dtoPyCYjnjWi4qAcYz
 cS6THtdbg+xTvF+iGYm/pR5CIg8/8RLdLiuq7R2dnPwqIu+ZDH3nomgaWq57xQZaZ1z6
 Se1f16nirH4yBYVPygkXc/c2/t6R78tS2sfabzdocXmaUoBIUtYjLMkxSudpDclXt1Rw
 WWD1IW20Q9LTj3/AfpL+KhHBoRXgHaiIkau/HTNNqZP06PvYYrQ4V5jpxKR6L5ObMpXc
 885RiJePSvIpzkl2So6khRn3LnHg2ajyHctPHrcZXlYgeUwMDt/v5IKpfdooN+uVenSo
 QScw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jdODuhQSbSneu6LsgolsgrPxYzk6J9fHhWKfFe/Veik=;
 b=TIL0tILIYo5b3MBUvUyDi/hQIUbdNFMC5FFqsXFqxsPXaZyCu7Qof66jTx+dEaaNej
 a7Jh/5bDnEyDa0Pcx+hup2Sm2ecXmZ0DY7us59BcsEHzt7EGLugafxZKVDbmHKcskgT9
 kVMnFJ65uPA6Yq9JH4itPQIkG3z6Q9D2lSi1yV8lOJ/69flyfqYXcs7/EEIGV27c6Zs9
 VS3JXlHDjEWog3dEOTyapZXqJhqjte+zDLx6prSB455576JYnvCcnq/1CyG9AMns9p/C
 er8PSz/LV/bZNaGx9tGUuDbx2itVt/P3m2td7UMjEOuzFyx09jnQ/ydvifXs2ZBSzgsl
 u4CA==
X-Gm-Message-State: AOAM531PIUtdTzY/XMQMGlqRUCe3dck8hNqpq+6GR6bbq/2tJND5w6VK
 /rZH7YsQv9hVAwD2xQfjgUwYW7gBR9I=
X-Google-Smtp-Source: ABdhPJwz3jG/NHwiA78EP8HlKalyxUtD20kUIh3lc8xYT9J0gIGwkVNbJEYVmf5RmeFMWn3DtdnOew==
X-Received: by 2002:a05:6402:438f:: with SMTP id
 o15mr7611605edc.301.1634116050243; 
 Wed, 13 Oct 2021 02:07:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c6sm6177849ejb.41.2021.10.13.02.07.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 02:07:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/40] Misc patches for 2021-10-13
Date: Wed, 13 Oct 2021 11:06:48 +0200
Message-Id: <20211013090728.309365-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ee26ce674a93c824713542cec3b6a9ca85459165:

  Merge remote-tracking branch 'remotes/jsnow/tags/python-pull-request' into staging (2021-10-12 16:08:33 -0700)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to eeecc2ede44b2a5f2551dfcebd561a3945d4c132:

  ebpf: really include it only in system emulators (2021-10-13 10:47:50 +0200)

----------------------------------------------------------------
* SEV and SGX cleanups (Philippe, Dov)
* bugfixes for "check-block"
* bugfix for static build
* ObjectOptions cleanups (Thomas)
* binutils fix for PVH (Cole)
* HVF cleanup (Alex)

----------------------------------------------------------------
Alexander Graf (1):
      hvf: Determine slot count from struct layout

Cole Robinson (1):
      tests: tcg: Fix PVH test with binutils 2.36+

Dov Murik (2):
      target/i386/sev: Use local variable for kvm_sev_launch_start
      target/i386/sev: Use local variable for kvm_sev_launch_measure

Dr. David Alan Gilbert (1):
      target/i386/sev: sev_get_attestation_report use g_autofree

Kacper Słomiński (1):
      util/compatfd.c: use libc signalfd wrapper instead of raw syscall

Markus Armbruster (1):
      monitor: Tidy up find_device_state()

Paolo Bonzini (5):
      tests: add missing dependency for check-block
      build: fix "make check" without earlier "make"
      qemu-iotests: flush after every test
      Revert "hw/misc: applesmc: use host osk as default on macs"
      ebpf: really include it only in system emulators

Philippe Mathieu-Daudé (27):
      MAINTAINERS: Add myself as reviewer of the 'Memory API'
      qapi/misc-target: Wrap long 'SEV Attestation Report' long lines
      qapi/misc-target: Group SEV QAPI definitions
      target/i386/kvm: Introduce i386_softmmu_kvm Meson source set
      target/i386/kvm: Restrict SEV stubs to x86 architecture
      target/i386/sev: Prefix QMP errors with 'SEV'
      target/i386/monitor: Return QMP error when SEV is not enabled for guest
      target/i386/cpu: Add missing 'qapi/error.h' header
      target/i386/sev_i386.h: Remove unused headers
      target/i386/sev: Remove sev_get_me_mask()
      target/i386/sev: Mark unreachable code with g_assert_not_reached()
      target/i386/sev: Use g_autofree in sev_launch_get_measure()
      target/i386/sev: Restrict SEV to system emulation
      target/i386/sev: Rename sev_i386.h -> sev.h
      target/i386/sev: Declare system-specific functions in 'sev.h'
      target/i386/sev: Remove stubs by using code elision
      target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c
      target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c
      target/i386/sev: Move qmp_query_sev_capabilities() to sev.c
      target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c
      target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c
      monitor: Reduce hmp_info_sev() declaration
      MAINTAINERS: Cover SEV-related files with X86/KVM section
      MAINTAINERS: Cover SGX documentation file with X86/KVM section
      hw/i386/sgx: Have sgx_epc_get_section() return a boolean
      hw/i386/sgx: Move qmp_query_sgx_capabilities() to hw/i386/sgx.c
      hw/i386/sgx: Move qmp_query_sgx() and hmp_info_sgx() to hw/i386/sgx.c

Thomas Huth (1):
      qapi: Make some ObjectTypes depend on the build settings

 MAINTAINERS                           |   4 +
 accel/hvf/hvf-accel-ops.c             |   2 +-
 accel/kvm/meson.build                 |   1 -
 hw/i386/pc_sysfw.c                    |   2 +-
 hw/i386/sgx-stub.c                    |  16 ++-
 hw/i386/sgx.c                         |  35 +++++-
 hw/i386/x86.c                         |   2 +-
 hw/misc/applesmc.c                    | 192 +-------------------------------
 include/hw/i386/sgx-epc.h             |   2 +-
 include/hw/i386/sgx.h                 |  12 --
 include/monitor/hmp-target.h          |   1 +
 include/monitor/hmp.h                 |   1 -
 include/sysemu/sev.h                  |  28 -----
 meson.build                           |   9 +-
 qapi/misc-target.json                 |  77 ++++++-------
 qapi/qom.json                         |  36 ++++--
 softmmu/qdev-monitor.c                |  13 +--
 target/i386/cpu.c                     |  16 +--
 target/i386/kvm/kvm.c                 |   3 +-
 target/i386/kvm/meson.build           |   8 +-
 {accel => target/i386}/kvm/sev-stub.c |   2 +-
 target/i386/meson.build               |   4 +-
 target/i386/monitor.c                 | 124 +--------------------
 target/i386/sev-stub.c                |  88 ---------------
 target/i386/sev-sysemu-stub.c         |  70 ++++++++++++
 target/i386/sev.c                     | 201 +++++++++++++++++++++++-----------
 target/i386/{sev_i386.h => sev.h}     |  35 +++---
 tests/Makefile.include                |  16 ++-
 tests/qemu-iotests/testrunner.py      |   1 +
 tests/tcg/x86_64/system/kernel.ld     |   5 +-
 util/compatfd.c                       |   5 +-
 31 files changed, 392 insertions(+), 619 deletions(-)
 delete mode 100644 include/hw/i386/sgx.h
 delete mode 100644 include/sysemu/sev.h
 rename {accel => target/i386}/kvm/sev-stub.c (94%)
 delete mode 100644 target/i386/sev-stub.c
 create mode 100644 target/i386/sev-sysemu-stub.c
 rename target/i386/{sev_i386.h => sev.h} (62%)
-- 
2.31.1


