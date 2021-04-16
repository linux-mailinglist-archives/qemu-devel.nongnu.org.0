Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F14936275E
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 20:02:32 +0200 (CEST)
Received: from localhost ([::1]:57088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXSnW-0005fR-K5
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 14:02:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXS2T-00079n-Tv
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:13:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lXS2O-0003el-Fe
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 13:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618593219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bY847EY0tN8+dAd9pkAafxyTBhqB/2dt+cqjpI3NHds=;
 b=K8WtYbeFcg0WFRvmNbV2k2VeK5FpEjv5iDbNqF7fm+oTIbCM0BKMbtwJ1Bjm5eIt/ughKX
 mJyjT3yOVRgz1lo8FGQGtl5foVcvehVqI5WN5GFvP/OeOxlj8bGBQRbOLLhHcsttYRMJbT
 xi7eNyx42HOMMF9m+GXfeuS1BtmZkpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-scjEPH2zNX6tVLWWAz_WaQ-1; Fri, 16 Apr 2021 13:13:19 -0400
X-MC-Unique: scjEPH2zNX6tVLWWAz_WaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 370B410053EE;
 Fri, 16 Apr 2021 17:13:18 +0000 (UTC)
Received: from thuth.com (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22E662B0DF;
 Fri, 16 Apr 2021 17:13:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.1 0/4] Remove more superfluous include statements
Date: Fri, 16 Apr 2021 19:13:10 +0200
Message-Id: <20210416171314.2074665-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here are some more patches to remove superfluous include statements.
Compile-tested here:

 https://gitlab.com/thuth/qemu/-/pipelines/287607644

and here:

 https://cirrus-ci.com/build/5073843392872448

Thomas Huth (4):
  Do not include sysemu/sysemu.h if it's not really necessary
  Do not include hw/boards.h if it's not really necessary
  Do not include cpu.h if it's not really necessary
  Do not include exec/address-spaces.h if it's not really necessary

 accel/kvm/kvm-all.c               | 2 --
 accel/stubs/kvm-stub.c            | 1 -
 accel/stubs/tcg-stub.c            | 1 -
 accel/tcg/cpu-exec-common.c       | 1 -
 accel/tcg/cpu-exec.c              | 1 -
 accel/tcg/cputlb.c                | 2 --
 accel/tcg/plugin-gen.c            | 1 -
 accel/tcg/tcg-accel-ops-icount.c  | 1 -
 accel/tcg/tcg-accel-ops-rr.c      | 1 -
 accel/tcg/tcg-accel-ops.c         | 1 -
 accel/tcg/translate-all.c         | 1 -
 accel/tcg/translator.c            | 1 -
 accel/tcg/user-exec-stub.c        | 1 -
 accel/tcg/user-exec.c             | 1 -
 backends/hostmem-file.c           | 1 -
 backends/hostmem-memfd.c          | 1 -
 backends/hostmem.c                | 1 -
 block.c                           | 1 -
 block/block-backend.c             | 1 -
 block/nfs.c                       | 1 -
 bsd-user/main.c                   | 1 -
 chardev/char-mux.c                | 1 -
 chardev/char.c                    | 1 -
 disas.c                           | 1 -
 dump/dump.c                       | 1 -
 dump/win_dump.c                   | 1 -
 gdbstub.c                         | 1 -
 hw/acpi/cpu.c                     | 1 -
 hw/acpi/generic_event_device.c    | 1 -
 hw/acpi/ich9.c                    | 1 -
 hw/acpi/memory_hotplug.c          | 1 -
 hw/acpi/pcihp.c                   | 1 -
 hw/acpi/piix4.c                   | 1 -
 hw/alpha/dp264.c                  | 1 -
 hw/alpha/typhoon.c                | 2 --
 hw/arm/allwinner-a10.c            | 2 --
 hw/arm/allwinner-h3.c             | 2 --
 hw/arm/armv7m.c                   | 2 --
 hw/arm/aspeed.c                   | 4 ----
 hw/arm/aspeed_ast2600.c           | 2 --
 hw/arm/aspeed_soc.c               | 2 --
 hw/arm/bcm2836.c                  | 1 -
 hw/arm/boot.c                     | 1 -
 hw/arm/cubieboard.c               | 3 ---
 hw/arm/digic_boards.c             | 3 ---
 hw/arm/exynos4_boards.c           | 2 --
 hw/arm/fsl-imx25.c                | 2 --
 hw/arm/fsl-imx31.c                | 1 -
 hw/arm/highbank.c                 | 1 -
 hw/arm/imx25_pdk.c                | 2 --
 hw/arm/kzm.c                      | 1 -
 hw/arm/mcimx6ul-evk.c             | 1 -
 hw/arm/mcimx7d-sabre.c            | 1 -
 hw/arm/msf2-som.c                 | 1 -
 hw/arm/musicpal.c                 | 1 -
 hw/arm/npcm7xx.c                  | 1 -
 hw/arm/npcm7xx_boards.c           | 2 --
 hw/arm/nrf51_soc.c                | 2 --
 hw/arm/nseries.c                  | 1 -
 hw/arm/omap1.c                    | 1 -
 hw/arm/omap2.c                    | 1 -
 hw/arm/orangepi.c                 | 2 --
 hw/arm/palm.c                     | 1 -
 hw/arm/raspi.c                    | 2 --
 hw/arm/realview.c                 | 1 -
 hw/arm/sabrelite.c                | 1 -
 hw/arm/sbsa-ref.c                 | 1 -
 hw/arm/smmu-common.c              | 1 -
 hw/arm/smmuv3.c                   | 1 -
 hw/arm/stellaris.c                | 1 -
 hw/arm/strongarm.c                | 1 -
 hw/arm/versatilepb.c              | 1 -
 hw/arm/vexpress.c                 | 1 -
 hw/arm/virt.c                     | 3 ---
 hw/arm/xilinx_zynq.c              | 1 -
 hw/arm/xlnx-versal-virt.c         | 1 -
 hw/arm/xlnx-zcu102.c              | 1 -
 hw/arm/xlnx-zynqmp.c              | 2 --
 hw/avr/arduino.c                  | 1 -
 hw/avr/atmega.c                   | 1 -
 hw/block/nvme-subsys.c            | 1 -
 hw/char/mchp_pfsoc_mmuart.c       | 1 -
 hw/char/spapr_vty.c               | 1 -
 hw/core/loader.c                  | 1 -
 hw/core/machine-qmp-cmds.c        | 2 --
 hw/core/null-machine.c            | 1 -
 hw/core/numa.c                    | 1 -
 hw/cris/axis_dev88.c              | 1 -
 hw/display/next-fb.c              | 1 -
 hw/dma/pl080.c                    | 1 -
 hw/hppa/dino.c                    | 2 --
 hw/hppa/lasi.c                    | 2 --
 hw/hppa/machine.c                 | 1 -
 hw/i386/acpi-build.c              | 1 -
 hw/i386/acpi-microvm.c            | 1 -
 hw/i386/intel_iommu.c             | 2 --
 hw/i386/kvm/apic.c                | 1 -
 hw/i386/kvm/clock.c               | 1 -
 hw/i386/kvmvapic.c                | 1 -
 hw/i386/microvm.c                 | 1 -
 hw/i386/pc.c                      | 2 --
 hw/i386/pc_piix.c                 | 3 ---
 hw/i386/pc_q35.c                  | 1 -
 hw/i386/pc_sysfw.c                | 1 -
 hw/i386/vmport.c                  | 1 -
 hw/i386/x86-iommu.c               | 1 -
 hw/i386/xen/xen-hvm.c             | 1 -
 hw/i386/xen/xen_platform.c        | 1 -
 hw/input/lasips2.c                | 1 -
 hw/intc/apic.c                    | 1 -
 hw/intc/apic_common.c             | 1 -
 hw/intc/arm_gic_kvm.c             | 1 -
 hw/intc/armv7m_nvic.c             | 1 -
 hw/intc/grlib_irqmp.c             | 1 -
 hw/intc/openpic_kvm.c             | 2 --
 hw/intc/s390_flic.c               | 1 -
 hw/intc/s390_flic_kvm.c           | 1 -
 hw/intc/sifive_plic.c             | 2 --
 hw/intc/xics.c                    | 1 -
 hw/intc/xics_kvm.c                | 1 -
 hw/intc/xics_spapr.c              | 1 -
 hw/isa/isa-superio.c              | 1 -
 hw/isa/lpc_ich9.c                 | 1 -
 hw/isa/piix3.c                    | 1 -
 hw/isa/vt82c686.c                 | 1 -
 hw/lm32/lm32_boards.c             | 1 -
 hw/lm32/milkymist.c               | 1 -
 hw/m68k/an5206.c                  | 1 -
 hw/m68k/mcf5208.c                 | 1 -
 hw/m68k/next-cube.c               | 2 --
 hw/m68k/next-kbd.c                | 2 --
 hw/m68k/q800.c                    | 1 -
 hw/m68k/virt.c                    | 1 -
 hw/mem/sparse-mem.c               | 1 -
 hw/microblaze/boot.c              | 1 -
 hw/mips/boston.c                  | 1 -
 hw/mips/fuloong2e.c               | 1 -
 hw/mips/gt64xxx_pci.c             | 1 -
 hw/mips/jazz.c                    | 1 -
 hw/mips/loongson3_virt.c          | 3 ---
 hw/mips/malta.c                   | 3 ---
 hw/mips/mips_int.c                | 1 -
 hw/mips/mipssim.c                 | 2 --
 hw/misc/macio/macio.c             | 1 -
 hw/misc/mips_itu.c                | 1 -
 hw/moxie/moxiesim.c               | 1 -
 hw/net/can/xlnx-zynqmp-can.c      | 1 -
 hw/net/i82596.c                   | 1 -
 hw/net/lasi_i82596.c              | 1 -
 hw/net/msf2-emac.c                | 1 -
 hw/net/spapr_llan.c               | 1 -
 hw/nios2/10m50_devboard.c         | 1 -
 hw/nios2/boot.c                   | 2 --
 hw/nios2/generic_nommu.c          | 1 -
 hw/nvram/nrf51_nvm.c              | 1 -
 hw/nvram/spapr_nvram.c            | 1 -
 hw/openrisc/openrisc_sim.c        | 1 -
 hw/pci-host/bonito.c              | 1 -
 hw/pci-host/ppce500.c             | 1 -
 hw/pci-host/prep.c                | 1 -
 hw/pci-host/sabre.c               | 1 -
 hw/pci-host/sh_pci.c              | 1 -
 hw/pci/pci.c                      | 1 -
 hw/pci/pcie_host.c                | 1 -
 hw/ppc/e500.c                     | 2 --
 hw/ppc/mac_newworld.c             | 2 --
 hw/ppc/mac_oldworld.c             | 2 --
 hw/ppc/pnv.c                      | 2 --
 hw/ppc/pnv_psi.c                  | 1 -
 hw/ppc/ppc.c                      | 1 -
 hw/ppc/ppc405_boards.c            | 2 --
 hw/ppc/ppc440_bamboo.c            | 1 -
 hw/ppc/ppc440_pcix.c              | 1 -
 hw/ppc/ppc440_uc.c                | 2 --
 hw/ppc/ppc4xx_devs.c              | 1 -
 hw/ppc/ppc4xx_pci.c               | 1 -
 hw/ppc/prep.c                     | 3 ---
 hw/ppc/rs6000_mc.c                | 1 -
 hw/ppc/sam460ex.c                 | 1 -
 hw/ppc/spapr.c                    | 2 --
 hw/ppc/spapr_drc.c                | 1 -
 hw/ppc/spapr_events.c             | 1 -
 hw/ppc/spapr_hcall.c              | 1 -
 hw/ppc/spapr_iommu.c              | 1 -
 hw/ppc/spapr_pci.c                | 2 --
 hw/ppc/spapr_pci_vfio.c           | 1 -
 hw/ppc/spapr_rng.c                | 1 -
 hw/ppc/spapr_rtas.c               | 2 --
 hw/ppc/spapr_rtas_ddw.c           | 1 -
 hw/ppc/spapr_rtc.c                | 1 -
 hw/ppc/spapr_tpm_proxy.c          | 1 -
 hw/ppc/virtex_ml507.c             | 1 -
 hw/remote/iohub.c                 | 1 -
 hw/remote/machine.c               | 1 -
 hw/remote/memory.c                | 1 -
 hw/remote/proxy-memory-listener.c | 2 --
 hw/riscv/opentitan.c              | 1 -
 hw/riscv/sifive_e.c               | 1 -
 hw/rtc/m48t59.c                   | 1 -
 hw/rtc/mc146818rtc.c              | 1 -
 hw/rx/rx-gdbsim.c                 | 2 --
 hw/rx/rx62n.c                     | 1 -
 hw/s390x/3270-ccw.c               | 1 -
 hw/s390x/css-bridge.c             | 1 -
 hw/s390x/css.c                    | 1 -
 hw/s390x/ipl.c                    | 2 --
 hw/s390x/pv.c                     | 1 -
 hw/s390x/s390-pci-bus.c           | 1 -
 hw/s390x/s390-pci-inst.c          | 1 -
 hw/s390x/s390-stattrib-kvm.c      | 1 -
 hw/s390x/s390-stattrib.c          | 1 -
 hw/s390x/s390-virtio-ccw.c        | 4 ----
 hw/s390x/sclp.c                   | 2 --
 hw/s390x/sclpcpu.c                | 1 -
 hw/scsi/spapr_vscsi.c             | 1 -
 hw/sh4/r2d.c                      | 1 -
 hw/sh4/sh7750.c                   | 1 -
 hw/sh4/shix.c                     | 2 --
 hw/sparc/leon3.c                  | 1 -
 hw/sparc64/niagara.c              | 1 -
 hw/ssi/aspeed_smc.c               | 1 -
 hw/ssi/sifive_spi.c               | 1 -
 hw/tpm/tpm_crb.c                  | 1 -
 hw/tricore/tc27x_soc.c            | 3 ---
 hw/tricore/triboard.c             | 3 ---
 hw/tricore/tricore_testboard.c    | 1 -
 hw/vfio/ap.c                      | 1 -
 hw/vfio/display.c                 | 1 -
 hw/vfio/migration.c               | 1 -
 hw/vfio/pci.c                     | 1 -
 hw/vfio/spapr.c                   | 1 -
 hw/virtio/vhost.c                 | 1 -
 hw/virtio/virtio.c                | 1 -
 hw/xen/xen_pt.c                   | 1 -
 hw/xtensa/sim.c                   | 2 --
 hw/xtensa/virt.c                  | 3 ---
 hw/xtensa/xtensa_memory.c         | 1 -
 hw/xtensa/xtfpga.c                | 1 -
 linux-user/main.c                 | 1 -
 linux-user/semihost.c             | 1 -
 migration/ram.c                   | 2 --
 monitor/misc.c                    | 1 -
 monitor/monitor.c                 | 1 -
 net/net.c                         | 2 --
 net/netmap.c                      | 1 -
 plugins/api.c                     | 2 --
 plugins/core.c                    | 2 --
 plugins/loader.c                  | 1 -
 semihosting/arm-compat-semi.c     | 1 -
 semihosting/config.c              | 1 -
 semihosting/console.c             | 2 --
 softmmu/arch_init.c               | 2 --
 softmmu/device_tree.c             | 1 -
 softmmu/memory.c                  | 2 --
 softmmu/memory_mapping.c          | 1 -
 softmmu/physmem.c                 | 3 ---
 softmmu/qdev-monitor.c            | 1 -
 softmmu/vl.c                      | 1 -
 stubs/semihost.c                  | 1 -
 target/arm/cpu.c                  | 1 -
 target/i386/hvf/hvf.c             | 1 -
 target/i386/hvf/x86_mmu.c         | 1 -
 target/i386/sev.c                 | 1 -
 target/openrisc/sys_helper.c      | 1 -
 target/rx/helper.c                | 1 -
 target/s390x/cpu.c                | 1 -
 target/s390x/diag.c               | 1 -
 target/s390x/excp_helper.c        | 1 -
 target/xtensa/op_helper.c         | 1 -
 tcg/tcg-op-vec.c                  | 1 -
 tcg/tcg-op.c                      | 1 -
 tcg/tcg.c                         | 2 --
 tests/qtest/fuzz/fuzz.c           | 1 -
 tests/qtest/fuzz/generic_fuzz.c   | 2 --
 tests/qtest/fuzz/qos_fuzz.c       | 2 --
 util/oslib-win32.c                | 1 -
 276 files changed, 356 deletions(-)

-- 
2.27.0


