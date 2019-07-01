Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC9A1B1D4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 10:24:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ6GB-0000wY-KG
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 04:24:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Ac-0004eW-7P
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQ6Aa-0007cz-Ev
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46730)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQ6Aa-0007cA-6Y
	for qemu-devel@nongnu.org; Mon, 13 May 2019 04:18:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B179619CBD6
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:46 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5769017500
	for <qemu-devel@nongnu.org>; Mon, 13 May 2019 08:18:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CA0F311385E4; Mon, 13 May 2019 10:18:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 13 May 2019 10:18:35 +0200
Message-Id: <20190513081844.26699-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 13 May 2019 08:18:46 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 0/9] Miscellaneous patches for 2019-05-13
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is actually a fixed rebase of "[PULL for-4.1 0/9] Miscellaneous
patches for 2019-04-18", but that subject has since become misleading,
so I changed it.

v2:
* Back out the change to tests/fp/platform.h that breaks big endian
* Rebase

The following changes since commit efb4f3b62c69383a7308d7b739a3193e7c0cca=
e8:

  Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request'=
 into staging (2019-05-10 14:49:36 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-misc-2019-05-13

for you to fetch changes up to 6834c3f410f6ce77dd9cad78f3a9a864e7fc8ec5:

  Clean up decorations and whitespace around header guards (2019-05-13 08=
:58:55 +0200)

----------------------------------------------------------------
Miscellaneous patches for 2019-05-13

----------------------------------------------------------------
Markus Armbruster (9):
      Clean up includes
      Use #include "..." for our own headers, <...> for others
      authz: Normalize #include "authz/trace.h" to "trace.h"
      linux-user/nios2 linux-user/riscv: Clean up header guards
      target/xtensa: Clean up core-isa.h header guards
      Clean up header guards that don't match their file name
      Clean up ill-advised or unusual header guards
      Normalize header guard symbol definition.
      Clean up decorations and whitespace around header guards

 authz/base.c                                    |  2 +-
 authz/list.c                                    |  2 +-
 authz/listfile.c                                |  2 +-
 authz/pamacct.c                                 |  2 +-
 authz/simple.c                                  |  2 +-
 block/crypto.h                                  |  6 +++---
 contrib/elf2dmp/main.c                          |  3 +--
 contrib/elf2dmp/pdb.c                           |  3 +--
 contrib/elf2dmp/qemu_elf.h                      |  6 +++---
 contrib/rdmacm-mux/main.c                       | 18 +++++++++---------
 contrib/rdmacm-mux/rdmacm-mux.h                 |  6 +++---
 disas/nanomips.h                                |  4 ++--
 fsdev/qemu-fsdev-throttle.h                     |  7 ++++---
 hw/arm/smmuv3-internal.h                        |  4 ++--
 hw/display/ati.c                                |  1 +
 hw/display/ati_2d.c                             |  1 +
 hw/display/ati_dbg.c                            |  1 +
 hw/display/ati_int.h                            |  1 -
 hw/display/vga_regs.h                           |  6 +++---
 hw/i386/amd_iommu.h                             |  4 ++--
 hw/ide/ahci_internal.h                          |  2 +-
 hw/rdma/rdma_utils.h                            |  1 -
 hw/rdma/vmw/pvrdma_qp_ops.h                     |  4 ++--
 hw/sd/sdmmc-internal.h                          |  5 +++--
 hw/timer/m48t59-internal.h                      |  3 ++-
 hw/tpm/tpm_ioctl.h                              |  7 ++++---
 hw/xtensa/xtensa_memory.h                       |  4 ++--
 include/authz/base.h                            |  7 +++----
 include/authz/list.h                            |  7 +++----
 include/authz/listfile.h                        |  8 +++-----
 include/authz/pamacct.h                         |  7 +++----
 include/authz/simple.h                          |  7 +++----
 include/block/aio-wait.h                        |  2 +-
 include/chardev/spice.h                         |  4 ++--
 include/disas/capstone.h                        |  2 +-
 include/exec/translator.h                       |  2 +-
 include/hw/arm/nrf51_soc.h                      |  1 -
 include/hw/arm/smmu-common.h                    |  2 +-
 include/hw/audio/soundhw.h                      |  4 ++--
 include/hw/cpu/cluster.h                        |  1 -
 include/hw/i386/x86-iommu.h                     |  4 ++--
 include/hw/intc/heathrow_pic.h                  |  6 +++---
 include/hw/intc/xlnx-pmu-iomod-intc.h           |  6 +++---
 include/hw/misc/armsse-mhu.h                    |  4 ++--
 include/hw/misc/imx2_wdt.h                      |  2 +-
 include/hw/misc/nrf51_rng.h                     |  3 ++-
 include/hw/net/ne2000-isa.h                     |  4 ++--
 include/hw/pci-host/designware.h                |  2 +-
 include/hw/pci-host/sabre.h                     |  4 ++--
 include/hw/ppc/pnv.h                            |  7 ++++---
 include/hw/ppc/pnv_core.h                       |  7 ++++---
 include/hw/ppc/pnv_lpc.h                        |  7 ++++---
 include/hw/ppc/pnv_occ.h                        |  7 ++++---
 include/hw/ppc/pnv_psi.h                        |  7 ++++---
 include/hw/ppc/pnv_xscom.h                      |  7 ++++---
 include/hw/ppc/spapr_ovec.h                     |  7 ++++---
 include/hw/riscv/sifive_plic.h                  |  1 -
 include/hw/scsi/emulation.h                     |  2 +-
 include/hw/timer/pl031.h                        |  4 ++--
 include/hw/virtio/vhost-vsock.h                 |  6 +++---
 include/hw/virtio/virtio-crypto.h               |  6 +++---
 include/hw/watchdog/wdt_aspeed.h                |  7 ++++---
 include/hw/xen/start_info.h                     |  6 +++---
 include/hw/xen/xen-legacy-backend.h             |  6 +++---
 include/hw/xtensa/mx_pic.h                      |  4 ++--
 include/hw/xtensa/xtensa-isa.h                  |  6 +++---
 include/migration/qemu-file-types.h             |  4 ++--
 include/qemu/drm.h                              |  4 ++--
 include/qemu/filemonitor.h                      |  6 +++---
 include/qemu/jhash.h                            |  6 +++---
 include/qemu/pmem.h                             |  2 +-
 include/qemu/stats64.h                          |  2 +-
 include/qemu/sys_membarrier.h                   |  2 +-
 include/qemu/systemd.h                          |  2 +-
 include/scsi/constants.h                        |  4 ++--
 include/scsi/utils.h                            |  2 +-
 include/sysemu/hvf.h                            |  5 +++--
 include/ui/kbd-state.h                          |  3 ++-
 linux-user/nios2/target_cpu.h                   |  4 ++--
 linux-user/nios2/target_signal.h                |  6 +++---
 linux-user/nios2/target_structs.h               |  4 ++--
 linux-user/nios2/target_syscall.h               |  6 +++---
 linux-user/riscv/target_cpu.h                   |  4 ++--
 linux-user/riscv/target_signal.h                |  6 +++---
 linux-user/riscv/target_structs.h               |  4 ++--
 linux-user/xtensa/syscall_nr.h                  |  6 +++---
 linux-user/xtensa/target_structs.h              |  4 ++--
 linux-user/xtensa/termbits.h                    |  6 +++---
 net/colo.h                                      |  6 +++---
 qga/vss-win32/vss-handles.h                     |  4 ++--
 scsi/pr-helper.h                                |  3 ++-
 target/i386/hax-i386.h                          |  4 ++--
 target/i386/hax-interface.h                     |  4 ++--
 target/i386/hax-posix.h                         |  6 +++---
 target/i386/hvf/hvf-i386.h                      |  4 ++--
 target/i386/hvf/vmcs.h                          |  4 ++--
 target/i386/hvf/x86.h                           |  2 +-
 target/i386/hvf/x86_decode.h                    |  2 +-
 target/i386/hvf/x86_descr.h                     |  2 +-
 target/i386/hvf/x86_emu.h                       |  5 +++--
 target/i386/hvf/x86_flags.h                     |  7 ++++---
 target/i386/hvf/x86_mmu.h                       |  7 ++++---
 target/i386/hvf/x86_task.h                      |  6 ++++--
 target/i386/whp-dispatch.h                      |  2 +-
 target/i386/whpx-all.c                          |  1 -
 target/nios2/cpu.h                              |  7 ++++---
 target/nios2/mmu.h                              |  7 ++++---
 target/ppc/mmu-book3s-v3.h                      |  6 +++---
 target/riscv/pmp.h                              |  4 ++--
 target/sparc/asi.h                              |  6 +++---
 target/xtensa/core-de212/core-isa.h             |  8 +++-----
 target/xtensa/core-sample_controller/core-isa.h |  8 +++-----
 target/xtensa/core-test_kc705_be/core-isa.h     |  8 +++-----
 target/xtensa/core-test_mmuhifi_c3/core-isa.h   |  8 +++-----
 target/xtensa/xtensa-isa-internal.h             |  2 +-
 tests/acpi-utils.h                              |  2 +-
 tests/libqos/e1000e.h                           |  4 ++--
 tests/libqos/qgraph.h                           |  4 ----
 tests/libqos/qgraph_internal.h                  |  4 ++--
 tests/libqos/sdhci.h                            |  4 ++--
 tests/migration/migration-test.h                |  7 ++++---
 tests/qos-test.c                                |  2 +-
 tests/tpm-emu.h                                 |  2 +-
 123 files changed, 274 insertions(+), 273 deletions(-)

--=20
2.17.2


