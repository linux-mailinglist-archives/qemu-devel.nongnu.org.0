Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ADA4E2B74
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:06:10 +0100 (CET)
Received: from localhost ([::1]:59696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWJbk-0006zS-Ss
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:06:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJUp-000071-Ro
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22233)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nWJUn-0006IO-6j
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 10:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647874736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gsQ6ahvi/ckbWw86L5N3sQQlHisRg/9bxWjfNX/0GKQ=;
 b=AkZby4Plxvoz2mn8mSVXEA87EkKHQcuGw9hMh2SikTmil4XPbjT2GsiN75aKSOPz4CvpMN
 SHmnBRNiP62MldObUQ21oezNJq9Upgrr7kGHV2zHMNloEQI9u8LCo/yQtbfhSgmphE7wYb
 1ziO8dvs7WUN5ONoLzWoKcy0+8j/YNI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-LeODj-XNOya365eAVqqHqQ-1; Mon, 21 Mar 2022 10:58:54 -0400
X-MC-Unique: LeODj-XNOya365eAVqqHqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8B461044562;
 Mon, 21 Mar 2022 14:58:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6AB7D2166B2D;
 Mon, 21 Mar 2022 14:58:54 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49A5B21D1F58; Mon, 21 Mar 2022 15:58:53 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Miscellaneous patches patches for 2022-03-21
Date: Mon, 21 Mar 2022 15:58:49 +0100
Message-Id: <20220321145853.2523825-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If it's too late for trivial cleanup, I'll respin this with the last
patch dropped.

The following changes since commit 2058fdbe81e2985c226a026851dd26b146d3395c:

  Merge tag 'fixes-20220318-pull-request' of git://git.kraxel.org/qemu into staging (2022-03-19 11:28:54 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-misc-2022-03-21

for you to fetch changes up to b21e2380376c470900fcadf47507f4d5ade75e85:

  Use g_new() & friends where that makes obvious sense (2022-03-21 15:44:44 +0100)

----------------------------------------------------------------
Miscellaneous patches patches for 2022-03-21

----------------------------------------------------------------
Markus Armbruster (3):
      scripts/coccinelle: New use-g_new-etc.cocci
      9pfs: Use g_new() & friends where that makes obvious sense
      Use g_new() & friends where that makes obvious sense

Murilo Opsfelder Araujo (1):
      block-qdict: Fix -Werror=maybe-uninitialized build failure

 scripts/coccinelle/use-g_new-etc.cocci   | 75 ++++++++++++++++++++++++++++++++
 include/qemu/timer.h                     |  2 +-
 accel/kvm/kvm-all.c                      |  6 +--
 accel/tcg/tcg-accel-ops-mttcg.c          |  2 +-
 accel/tcg/tcg-accel-ops-rr.c             |  4 +-
 audio/audio.c                            |  4 +-
 audio/audio_legacy.c                     |  6 +--
 audio/dsoundaudio.c                      |  2 +-
 audio/jackaudio.c                        |  6 +--
 audio/paaudio.c                          |  4 +-
 backends/cryptodev.c                     |  2 +-
 contrib/vhost-user-gpu/vhost-user-gpu.c  |  2 +-
 cpus-common.c                            |  4 +-
 dump/dump.c                              |  2 +-
 hw/9pfs/9p-proxy.c                       |  2 +-
 hw/9pfs/9p-synth.c                       |  4 +-
 hw/9pfs/9p.c                             |  8 ++--
 hw/9pfs/codir.c                          |  6 +--
 hw/acpi/hmat.c                           |  2 +-
 hw/audio/intel-hda.c                     |  2 +-
 hw/char/parallel.c                       |  2 +-
 hw/char/riscv_htif.c                     |  2 +-
 hw/char/virtio-serial-bus.c              |  6 +--
 hw/core/irq.c                            |  2 +-
 hw/core/reset.c                          |  2 +-
 hw/display/pxa2xx_lcd.c                  |  2 +-
 hw/display/tc6393xb.c                    |  2 +-
 hw/display/virtio-gpu.c                  |  4 +-
 hw/display/xenfb.c                       |  4 +-
 hw/dma/rc4030.c                          |  4 +-
 hw/i2c/core.c                            |  4 +-
 hw/i2c/i2c_mux_pca954x.c                 |  2 +-
 hw/i386/amd_iommu.c                      |  4 +-
 hw/i386/intel_iommu.c                    |  2 +-
 hw/i386/xen/xen-hvm.c                    | 10 ++---
 hw/i386/xen/xen-mapcache.c               | 14 +++---
 hw/input/lasips2.c                       |  2 +-
 hw/input/pckbd.c                         |  2 +-
 hw/input/ps2.c                           |  4 +-
 hw/input/pxa2xx_keypad.c                 |  2 +-
 hw/input/tsc2005.c                       |  3 +-
 hw/intc/riscv_aclint.c                   |  6 +--
 hw/intc/xics.c                           |  2 +-
 hw/m68k/virt.c                           |  2 +-
 hw/mips/mipssim.c                        |  2 +-
 hw/misc/applesmc.c                       |  2 +-
 hw/misc/imx6_src.c                       |  2 +-
 hw/misc/ivshmem.c                        |  4 +-
 hw/net/virtio-net.c                      |  4 +-
 hw/nvme/ns.c                             |  2 +-
 hw/pci-host/pnv_phb3.c                   |  2 +-
 hw/pci-host/pnv_phb4.c                   |  2 +-
 hw/pci/pcie_sriov.c                      |  2 +-
 hw/ppc/e500.c                            |  2 +-
 hw/ppc/ppc.c                             |  8 ++--
 hw/ppc/ppc405_boards.c                   |  4 +-
 hw/ppc/ppc405_uc.c                       | 18 ++++----
 hw/ppc/ppc4xx_devs.c                     |  2 +-
 hw/ppc/ppc_booke.c                       |  4 +-
 hw/ppc/spapr.c                           |  2 +-
 hw/ppc/spapr_events.c                    |  2 +-
 hw/ppc/spapr_hcall.c                     |  2 +-
 hw/ppc/spapr_numa.c                      |  3 +-
 hw/rdma/vmw/pvrdma_dev_ring.c            |  2 +-
 hw/rdma/vmw/pvrdma_qp_ops.c              |  6 +--
 hw/sh4/r2d.c                             |  4 +-
 hw/sh4/sh7750.c                          |  2 +-
 hw/sparc/leon3.c                         |  2 +-
 hw/sparc64/sparc64.c                     |  4 +-
 hw/timer/arm_timer.c                     |  2 +-
 hw/timer/slavio_timer.c                  |  2 +-
 hw/vfio/pci.c                            |  4 +-
 hw/vfio/platform.c                       |  4 +-
 hw/virtio/virtio-crypto.c                |  2 +-
 hw/virtio/virtio-iommu.c                 |  2 +-
 hw/virtio/virtio.c                       |  5 +--
 hw/xtensa/xtfpga.c                       |  2 +-
 linux-user/syscall.c                     |  2 +-
 migration/dirtyrate.c                    |  4 +-
 migration/multifd-zlib.c                 |  4 +-
 migration/ram.c                          |  2 +-
 monitor/misc.c                           |  2 +-
 monitor/qmp-cmds.c                       |  2 +-
 qga/commands-win32.c                     |  8 ++--
 qga/commands.c                           |  2 +-
 qobject/block-qdict.c                    |  4 +-
 qom/qom-qmp-cmds.c                       |  2 +-
 replay/replay-char.c                     |  4 +-
 replay/replay-events.c                   | 10 ++---
 softmmu/bootdevice.c                     |  4 +-
 softmmu/dma-helpers.c                    |  4 +-
 softmmu/memory_mapping.c                 |  2 +-
 target/i386/cpu-sysemu.c                 |  2 +-
 target/i386/hax/hax-accel-ops.c          |  4 +-
 target/i386/nvmm/nvmm-accel-ops.c        |  4 +-
 target/i386/whpx/whpx-accel-ops.c        |  4 +-
 target/i386/whpx/whpx-all.c              |  2 +-
 target/s390x/cpu-sysemu.c                |  2 +-
 tests/qtest/virtio-9p-test.c             |  4 +-
 tests/unit/test-hbitmap.c                |  2 +-
 tests/unit/test-qmp-cmds.c               | 14 +++---
 tests/unit/test-qobject-output-visitor.c |  2 +-
 tests/unit/test-vmstate.c                | 42 +++++++++---------
 ui/vnc-enc-tight.c                       |  2 +-
 util/envlist.c                           |  2 +-
 util/hbitmap.c                           |  2 +-
 util/main-loop.c                         |  2 +-
 util/qemu-timer.c                        |  2 +-
 util/vfio-helpers.c                      |  4 +-
 109 files changed, 284 insertions(+), 214 deletions(-)
 create mode 100644 scripts/coccinelle/use-g_new-etc.cocci

-- 
2.35.1


