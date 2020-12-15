Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1C82DB319
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 18:58:30 +0100 (CET)
Received: from localhost ([::1]:52254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEaj-00072Q-AU
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 12:58:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXG-0002u3-1C
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXC-0001Rl-Gi
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:54:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hybkaUYAraoAaFklDY/Eokoq2GG00bcFRb9eVUTPGuQ=;
 b=W2muYtWzI5yoFGLpcfkQugmtYDHr0sOKZhhw7dFs64rzmPrJ9QAwD7Z/okn63hAV9L0lBo
 /qAOQQ3SY46Nx462VaTm7KtvC/RT2sQp5r551FBzjDpkxY9aY2/4whf+Q0/KW/ZUXsjkm1
 tS1nJNUXlAeactS9qVaKcWxmmAOV/VU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-bk0RZlK3NQaRzTU4qEFYvw-1; Tue, 15 Dec 2020 12:54:47 -0500
X-MC-Unique: bk0RZlK3NQaRzTU4qEFYvw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C9028015D4
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE57560C15
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:54:45 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/45] Misc patches for 2020-12-15
Date: Tue, 15 Dec 2020 12:54:00 -0500
Message-Id: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 69e92bd558d71fdbd0c1989391b20edcc700daa9:

  Merge remote-tracking branch 'remotes/ehabkost/tags/machine-next-pull-request' into staging (2020-12-15 15:35:47 +0000)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to bbd2d5a8120771ec59b86a80a1f51884e0a26e53:

  build: -no-pie is no functional linker flag (2020-12-15 12:53:16 -0500)

----------------------------------------------------------------
* New -action option and set-action QMP command (Alejandro)
* More vl.c cleanup (myself with help from Daniel and Igor)
* Remove deprecated options (Philippe, Thomas)
* Dirty bitmap fix (Zenghui)
* icount caching speedup (Pavel)
* SCSI race fix (Maxim)
* Remove pre-GCC 4.8 code (Marc-André)

----------------------------------------------------------------
Alejandro Jimenez (4):
      qmp: generalize watchdog-set-action to -no-reboot/-no-shutdown
      vl: Add an -action option specifying response to guest events
      vl: Add option to avoid stopping VM upon guest panic
      qtest/pvpanic: Test panic option that allows VM to continue

Christian Ehrhardt (1):
      build: -no-pie is no functional linker flag

Igor Mammedov (1):
      ppc/spapr: cleanup -machine pseries,nvdimm=X handling

Marc-André Lureau (11):
      docs: set CONFDIR when running sphinx
      compiler.h: remove GCC < 3 __builtin_expect fallback
      qemu-plugin.h: remove GCC < 4
      tests: remove GCC < 4 fallbacks
      virtiofsd: replace _Static_assert with QEMU_BUILD_BUG_ON
      compiler.h: explicit case for Clang printf attribute
      poison: remove GNUC check
      xen: remove GNUC check
      compiler: remove GNUC check
      linux-user: remove GNUC check
      compiler.h: remove QEMU_GNUC_PREREQ

Maxim Levitsky (1):
      scsi: fix device removal race vs IO restart callback on resume

Paolo Bonzini (17):
      remove preconfig state
      vl: remove separate preconfig main_loop
      vl: allow -incoming defer with -preconfig
      vl: extract softmmu/runstate.c
      vl: extract softmmu/globals.c
      vl: move all generic initialization out of vl.c
      chardev: do not use machine_init_done
      machine: introduce MachineInitPhase
      vl: make qemu_get_machine_opts static
      plugin: propagate errors
      memory: allow creating MemoryRegions before accelerators
      monitor: allow quitting while in preconfig state
      msix: assert that accesses are within bounds
      memory: clamp cached translation in case it points to an MMIO region
      qemu-option: simplify search for end of key
      qemu-option: pass QemuOptsList to opts_accepts_any
      vl: rename local variable in configure_accelerators

Pavel Dovgalyuk (1):
      icount: improve exec nocache usage

Philippe Mathieu-Daudé (5):
      accel/tcg: Remove deprecated '-tb-size' option
      hw/core: Restrict 'fw-path-provider.c' to system mode emulation
      qemu/atomic: Drop special case for unsupported compiler
      accel/tcg: Remove special case for GCC < 4.6
      scripts/git.orderfile: Keep files with .inc extension sorted

Thomas Huth (3):
      docs/system: Move the list of removed features to a separate file
      Remove the deprecated -realtime option
      Remove the deprecated -show-cursor option

Zenghui Yu (1):
      kvm: Take into account the unaligned section size when preparing bitmap

 MAINTAINERS                         |    2 +
 accel/kvm/kvm-all.c                 |   18 +-
 accel/tcg/cpu-exec.c                |    4 +-
 accel/tcg/translate-all.c           |    2 +-
 chardev/char-mux.c                  |   38 +-
 chardev/chardev-sysemu.c            |   69 ---
 chardev/meson.build                 |    2 +-
 configure                           |    3 -
 docs/meson.build                    |    2 +-
 docs/system/deprecated.rst          |  246 --------
 docs/system/index.rst               |    1 +
 docs/system/removed-features.rst    |  243 ++++++++
 hmp-commands.hx                     |    1 +
 hw/arm/boot.c                       |    2 +-
 hw/core/machine-qmp-cmds.c          |    7 +-
 hw/core/machine.c                   |   55 +-
 hw/core/meson.build                 |    2 +-
 hw/core/qdev.c                      |   28 +-
 hw/microblaze/boot.c                |    9 +-
 hw/nios2/boot.c                     |    9 +-
 hw/pci/msix.c                       |    3 +
 hw/pci/pci.c                        |    2 +-
 hw/ppc/e500.c                       |    5 +-
 hw/ppc/spapr.c                      |   13 +
 hw/ppc/spapr_nvdimm.c               |   14 +-
 hw/ppc/virtex_ml507.c               |    2 +-
 hw/riscv/sifive_u.c                 |    6 +-
 hw/riscv/virt.c                     |    6 +-
 hw/scsi/scsi-bus.c                  |    4 +
 hw/usb/core.c                       |    2 +-
 hw/virtio/virtio-iommu.c            |    2 +-
 hw/xtensa/xtfpga.c                  |    9 +-
 include/chardev/char.h              |    6 +-
 include/exec/cpu-common.h           |    3 +
 include/exec/exec-all.h             |    3 -
 include/exec/poison.h               |    2 -
 include/hw/qdev-core.h              |   33 +-
 include/hw/xen/interface/io/ring.h  |    9 -
 include/qapi/qmp/dispatch.h         |    1 +
 include/qemu/atomic.h               |   17 -
 include/qemu/compiler.h             |   45 +-
 include/qemu/plugin.h               |    4 +-
 include/qemu/qemu-plugin.h          |    9 +-
 include/sysemu/runstate-action.h    |   19 +
 include/sysemu/runstate.h           |    1 -
 include/sysemu/sysemu.h             |    7 +-
 linux-user/main.c                   |    4 +-
 linux-user/strace.c                 |    4 -
 monitor/hmp.c                       |    7 +-
 monitor/qmp-cmds.c                  |   13 +-
 pc-bios/optionrom/Makefile          |    1 -
 plugins/loader.c                    |   34 +-
 qapi/control.json                   |    3 +-
 qapi/qmp-dispatch.c                 |    5 +-
 qapi/run-state.json                 |   79 ++-
 qemu-options.hx                     |   54 +-
 scripts/cocci-macro-file.h          |    1 -
 scripts/git.orderfile               |    3 +
 softmmu/device_tree.c               |    2 +-
 softmmu/globals.c                   |   72 +++
 softmmu/memory.c                    |   12 +-
 softmmu/meson.build                 |    3 +
 softmmu/physmem.c                   |   10 +
 softmmu/qdev-monitor.c              |   34 +-
 softmmu/runstate-action.c           |   46 ++
 softmmu/runstate.c                  |  812 ++++++++++++++++++++++++++
 softmmu/vl.c                        | 1078 ++++-------------------------------
 stubs/machine-init-done.c           |    8 -
 stubs/meson.build                   |    2 +-
 stubs/qmp-command-available.c       |    7 +
 tests/migration/guestperf/engine.py |    2 +-
 tests/qtest/fuzz-test.c             |   51 ++
 tests/qtest/pvpanic-test.c          |   26 +-
 tests/qtest/qmp-test.c              |    2 +-
 tests/tcg/arm/fcvt.c                |    8 +-
 tools/virtiofsd/fuse_common.h       |   11 +-
 ui/console.c                        |    2 +-
 ui/sdl2.c                           |    5 +-
 util/qemu-option.c                  |   58 +-
 79 files changed, 1833 insertions(+), 1596 deletions(-)
 delete mode 100644 chardev/chardev-sysemu.c
 create mode 100644 docs/system/removed-features.rst
 create mode 100644 include/sysemu/runstate-action.h
 create mode 100644 softmmu/globals.c
 create mode 100644 softmmu/runstate-action.c
 create mode 100644 softmmu/runstate.c
 delete mode 100644 stubs/machine-init-done.c
 create mode 100644 stubs/qmp-command-available.c
-- 
2.26.2


