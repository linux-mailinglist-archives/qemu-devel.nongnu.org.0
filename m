Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AD0671AC7
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:36:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6i4-0004KQ-T4; Wed, 18 Jan 2023 06:34:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6i2-0004Jk-VL
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6i1-0007V7-2m
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BcRPJr4+gtWRhB6RLPVlON++SbPvbAybS3XmJgCkGEM=;
 b=T5Yhcr8MXaUpOmtJCU4ViwqkpWHu8RdqaRFXVaaYvezg4fbqrjHO7gjkuGXngCoexqD6NI
 qmG/EehcMZgHh3rGJDYhDj5+BphZP8IeCqGkaFAgwb+AWvebumYDBH2w1StT8i45t5oqx4
 7C0Q+9quG5VH21MBHvcnwr9gCFCz43s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-SYLiz-mQMqGBI1jZJTdrXg-1; Wed, 18 Jan 2023 06:34:21 -0500
X-MC-Unique: SYLiz-mQMqGBI1jZJTdrXg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7F5129AA3BF;
 Wed, 18 Jan 2023 11:34:20 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 367C7492B00;
 Wed, 18 Jan 2023 11:34:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 0/9] Testing, s390x and misc patches
Date: Wed, 18 Jan 2023 12:34:09 +0100
Message-Id: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

 Hi Peter!

The following changes since commit 7c9236d6d61f30583d5d860097d88dbf0fe487bf:

  Merge tag 'pull-tcg-20230116' of https://gitlab.com/rth7680/qemu into staging (2023-01-17 10:24:16 +0000)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2023-01-18

for you to fetch changes up to 75d7150c636569f6687f7e70a33be893be43eb5f:

  s390x/pv: Implement a CGS check helper (2023-01-18 12:27:21 +0100)

----------------------------------------------------------------
* Fix the FreeBSD CI jobs in Gitlab by upgrading the packages in the beginning
* Fix the Haiku VM test by updating it to r1beta4
* Allow "make uninstall"
* Rename TARGET_FMT_plx to HWADDR_FMT_plx
* Some small qtest fixes/improvements
* Check for valid amount of CPUs before starting a secure execution s390x guest

----------------------------------------------------------------
Akihiko Odaki (2):
      tests/qtest/e1000e-test: Fix the code style
      tests/qtest/libqos/e1000e: Remove duplicate register definitions

Cédric Le Goater (1):
      s390x/pv: Implement a CGS check helper

Fabiano Rosas (1):
      tests/qtest: Restrict bcm2835-dma-test to CONFIG_RASPI

Li-Wen Hsu (1):
      Upgrade all packages in the FreeBSD VMs to ensure the freshness

Peter Maydell (1):
      Makefile: allow 'make uninstall'

Philippe Mathieu-Daudé (1):
      bulk: Rename TARGET_FMT_plx -> HWADDR_FMT_plx

Thomas Huth (2):
      MAINTAINERS: Remove bouncing mail address from Kamil Rytarowski
      tests/vm/haiku.x86_64: Update the Haiku VM to Beta 4

 MAINTAINERS                         |  2 --
 Makefile                            |  2 +-
 include/exec/hwaddr.h               |  2 +-
 tests/qtest/libqos/e1000e.h         |  5 -----
 accel/tcg/cputlb.c                  |  2 +-
 hw/arm/strongarm.c                  | 24 +++++++++++-----------
 hw/block/pflash_cfi01.c             |  2 +-
 hw/char/digic-uart.c                |  4 ++--
 hw/char/etraxfs_ser.c               |  4 ++--
 hw/core/loader.c                    |  8 ++++----
 hw/core/sysbus.c                    |  4 ++--
 hw/display/cirrus_vga.c             |  4 ++--
 hw/display/g364fb.c                 |  4 ++--
 hw/display/vga.c                    |  8 ++++----
 hw/dma/etraxfs_dma.c                | 34 +++++++++++++++----------------
 hw/dma/pl330.c                      | 14 ++++++-------
 hw/dma/xilinx_axidma.c              |  4 ++--
 hw/dma/xlnx_csu_dma.c               |  4 ++--
 hw/i2c/mpc_i2c.c                    |  4 ++--
 hw/i386/multiboot.c                 |  8 ++++----
 hw/i386/xen/xen-hvm.c               |  8 ++++----
 hw/i386/xen/xen-mapcache.c          | 16 +++++++--------
 hw/i386/xen/xen_platform.c          |  4 ++--
 hw/intc/arm_gicv3_dist.c            |  8 ++++----
 hw/intc/arm_gicv3_its.c             | 14 ++++++-------
 hw/intc/arm_gicv3_redist.c          |  8 ++++----
 hw/intc/exynos4210_combiner.c       | 10 +++++-----
 hw/misc/auxbus.c                    |  2 +-
 hw/misc/ivshmem.c                   |  6 +++---
 hw/misc/macio/mac_dbdma.c           |  4 ++--
 hw/misc/mst_fpga.c                  |  4 ++--
 hw/net/allwinner-sun8i-emac.c       |  4 ++--
 hw/net/allwinner_emac.c             |  4 ++--
 hw/net/fsl_etsec/etsec.c            |  4 ++--
 hw/net/fsl_etsec/rings.c            |  4 ++--
 hw/net/pcnet.c                      |  4 ++--
 hw/net/rocker/rocker.c              | 26 ++++++++++++------------
 hw/net/rocker/rocker_desc.c         |  2 +-
 hw/net/xilinx_axienet.c             |  4 ++--
 hw/net/xilinx_ethlite.c             |  6 +++---
 hw/pci-bridge/pci_expander_bridge.c |  2 +-
 hw/pci-host/bonito.c                | 14 ++++++-------
 hw/pci-host/ppce500.c               |  4 ++--
 hw/pci/pci_host.c                   |  4 ++--
 hw/ppc/ppc4xx_sdram.c               |  2 +-
 hw/rtc/exynos4210_rtc.c             |  4 ++--
 hw/s390x/pv.c                       | 40 +++++++++++++++++++++++++++++++++++++
 hw/sh4/sh7750.c                     |  4 ++--
 hw/ssi/xilinx_spi.c                 |  4 ++--
 hw/ssi/xilinx_spips.c               |  8 ++++----
 hw/timer/digic-timer.c              |  4 ++--
 hw/timer/etraxfs_timer.c            |  3 +--
 hw/timer/exynos4210_mct.c           |  2 +-
 hw/timer/exynos4210_pwm.c           |  4 ++--
 hw/virtio/virtio-mmio.c             |  4 ++--
 hw/xen/xen_pt.c                     |  4 ++--
 monitor/misc.c                      |  2 +-
 softmmu/memory.c                    | 18 ++++++++---------
 softmmu/memory_mapping.c            |  4 ++--
 softmmu/physmem.c                   | 10 +++++-----
 target/i386/monitor.c               |  6 +++---
 target/loongarch/tlb_helper.c       |  2 +-
 target/microblaze/op_helper.c       |  2 +-
 target/mips/tcg/sysemu/tlb_helper.c |  2 +-
 target/ppc/mmu-hash32.c             | 14 ++++++-------
 target/ppc/mmu-hash64.c             | 12 +++++------
 target/ppc/mmu_common.c             | 26 ++++++++++++------------
 target/ppc/mmu_helper.c             |  4 ++--
 target/riscv/cpu_helper.c           | 10 +++++-----
 target/riscv/monitor.c              |  2 +-
 target/sparc/ldst_helper.c          |  6 +++---
 target/sparc/mmu_helper.c           | 10 +++++-----
 target/tricore/helper.c             |  2 +-
 tests/qtest/e1000e-test.c           |  2 +-
 tests/qtest/libqos/e1000e.c         | 26 +++++++++++++-----------
 .gitlab-ci.d/cirrus.yml             |  4 ++--
 tests/qtest/meson.build             |  4 ++--
 tests/vm/haiku.x86_64               |  7 +++----
 78 files changed, 300 insertions(+), 267 deletions(-)


