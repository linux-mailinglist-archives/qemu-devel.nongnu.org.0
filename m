Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EB1371287
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:41:42 +0200 (CEST)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldU94-0005A4-1T
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:41:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU4D-0003EE-KR; Mon, 03 May 2021 04:36:37 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:56495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ldU46-0000ci-Aa; Mon, 03 May 2021 04:36:37 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MLiTI-1lv9TO0MSW-00HbtZ; Mon, 03
 May 2021 10:36:26 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 00/23] Trivial branch for 6.1 patches
Date: Mon,  3 May 2021 10:36:00 +0200
Message-Id: <20210503083623.139700-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DLYG4bBG6lKl0cO2ZWWY+xhBveSM8b9X9xmijhNIOxZKl9KhDkB
 iiP8Ptx/StbIXNBdqc+Pa5fyttMfixH6G4OWlRpXNEsnPbhzOL4Pll/iuE+KtpgkdpMkeaB
 0NawqYjVWGnKB8GzKGMaF2dh9mMv/PWq3+iBj/s1Aik5rsSmj1pvCD4ZwqodRqQ9QW4/yBL
 LHY53dUA3hqQnQg7nBVug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7Cxe8OGOHXk=:QyICyWxqm68/gO7P6V6K8c
 Vtk/UeFuzQH4Fan98wpLt2V+9Y9jMRh3NtidrLe3nevCxQ1XBP5U0MKvxoFuQOErAs/W2tttl
 awLouj8mFdqk/Xi5uJG4mAidGhahe/cUL0qljs1Xih3BzVl3p8gMt2jxLILuoTy5/sHkUhk9P
 pJjkYhQCseeei+kqkG3v6PgWn0mAG+sSn2kY2TBQFIsSkrDls7Q+imSk7VYXO3rJPaTjoLhvZ
 XxneyZ72DQtvNvkSq0ooIKRZA+5uCAH9kJ8sCwdefWZSzUHnEBTnzbT8XYsbfbLe/VJQgECs3
 N2XdVV3P2nHKUdszisFAolBVN4MDr2pOGGtdID7UiHAOf2vhiTkXQXg4UcyoYO7Ulaq6l8jZC
 xNYFAzi6uoIXZKrtFS7MP6EotesIZNsvgET0io3H5U2+xwh1VmXxTaD4HtFlPlKiWFOf1XBhU
 NrIfAdiwsLG1svjYsqmYDy0RrKcBpMxtpHLQ9LRzlzZpjB4mqoEJP9RzcQXvZzMZe2824xK7n
 In+Y+46Q26iV+I710ZFtAM=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 53c5433e84e8935abed8e91d4a2eb813168a0ecf=
:=0D
=0D
  Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210501' =
into staging (2021-05-02 12:02:46 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request=
=0D
=0D
for you to fetch changes up to 9197b5d4b5f163455c891baec531ae73f5d3a73a:=0D
=0D
  hw/rx/rx-gdbsim: Do not accept invalid memory size (2021-05-03 10:07:41 +=
0200)=0D
=0D
----------------------------------------------------------------=0D
Trivial patches pull request 20210503=0D
=0D
----------------------------------------------------------------=0D
=0D
David Edmondson (1):=0D
  accel: kvm: clarify that extra exit data is hexadecimal=0D
=0D
Gan Qixin (1):=0D
  mc146818rtc: put it into the 'misc' category=0D
=0D
Greg Kurz (1):=0D
  docs/system: Document the removal of "compat" property for POWER CPUs=0D
=0D
Keqian Zhu (1):=0D
  vmstate: Constify some VMStateDescriptions=0D
=0D
Philippe Mathieu-Daud=C3=A9 (8):=0D
  hw/arm/pxa2xx: Declare PCMCIA bus with Kconfig=0D
  hw/ide: Add Kconfig dependency MICRODRIVE -> PCMCIA=0D
  hw/pcmcia: Do not register PCMCIA type if not required=0D
  hw/arm: Constify VMStateDescription=0D
  hw/display/qxl: Constify VMStateDescription=0D
  hw/usb: Constify VMStateDescription=0D
  ui: Fix memory leak in qemu_xkeymap_mapping_table()=0D
  hw/rx/rx-gdbsim: Do not accept invalid memory size=0D
=0D
Robert Hoo (1):=0D
  docs: More precisely describe memory-backend-*::id's user=0D
=0D
Serge Guelton (1):=0D
  Fix typo in CFI build documentation=0D
=0D
Silvano Cirujano Cuesta (1):=0D
  scripts: fix generation update-binfmts templates=0D
=0D
Thomas Huth (8):=0D
  hw: Remove superfluous includes of hw/hw.h=0D
  hw: Do not include hw/sysbus.h if it is not necessary=0D
  hw: Do not include hw/irq.h if it is not necessary=0D
  hw: Do not include qemu/log.h if it is not necessary=0D
  Do not include sysemu/sysemu.h if it's not really necessary=0D
  Do not include hw/boards.h if it's not really necessary=0D
  Do not include cpu.h if it's not really necessary=0D
  Do not include exec/address-spaces.h if it's not really necessary=0D
=0D
 accel/kvm/kvm-all.c                   |  4 +---=0D
 accel/stubs/kvm-stub.c                |  1 -=0D
 accel/stubs/tcg-stub.c                |  1 -=0D
 accel/tcg/cpu-exec-common.c           |  1 -=0D
 accel/tcg/cpu-exec.c                  |  1 -=0D
 accel/tcg/cputlb.c                    |  2 --=0D
 accel/tcg/plugin-gen.c                |  1 -=0D
 accel/tcg/tcg-accel-ops-icount.c      |  1 -=0D
 accel/tcg/tcg-accel-ops-rr.c          |  1 -=0D
 accel/tcg/tcg-accel-ops.c             |  1 -=0D
 accel/tcg/translate-all.c             |  1 -=0D
 accel/tcg/translator.c                |  1 -=0D
 accel/tcg/user-exec-stub.c            |  1 -=0D
 accel/tcg/user-exec.c                 |  1 -=0D
 backends/hostmem-file.c               |  1 -=0D
 backends/hostmem-memfd.c              |  1 -=0D
 backends/hostmem.c                    |  1 -=0D
 block.c                               |  1 -=0D
 block/block-backend.c                 |  1 -=0D
 block/nfs.c                           |  1 -=0D
 bsd-user/main.c                       |  1 -=0D
 chardev/char-mux.c                    |  1 -=0D
 chardev/char.c                        |  1 -=0D
 disas.c                               |  1 -=0D
 docs/devel/control-flow-integrity.rst |  4 ++--=0D
 docs/system/removed-features.rst      |  6 ++++++=0D
 dump/dump.c                           |  1 -=0D
 dump/win_dump.c                       |  1 -=0D
 gdbstub.c                             |  1 -=0D
 hw/acpi/cpu.c                         |  1 -=0D
 hw/acpi/generic_event_device.c        |  1 -=0D
 hw/acpi/ich9.c                        |  1 -=0D
 hw/acpi/memory_hotplug.c              |  1 -=0D
 hw/acpi/pcihp.c                       |  1 -=0D
 hw/acpi/piix4.c                       |  1 -=0D
 hw/alpha/dp264.c                      |  1 -=0D
 hw/alpha/typhoon.c                    |  2 --=0D
 hw/arm/Kconfig                        |  1 +=0D
 hw/arm/allwinner-a10.c                |  2 --=0D
 hw/arm/allwinner-h3.c                 |  2 --=0D
 hw/arm/armv7m.c                       |  2 --=0D
 hw/arm/aspeed.c                       |  5 -----=0D
 hw/arm/aspeed_ast2600.c               |  3 ---=0D
 hw/arm/aspeed_soc.c                   |  3 ---=0D
 hw/arm/bcm2836.c                      |  1 -=0D
 hw/arm/boot.c                         |  1 -=0D
 hw/arm/cubieboard.c                   |  4 ----=0D
 hw/arm/digic_boards.c                 |  3 ---=0D
 hw/arm/exynos4210.c                   |  1 -=0D
 hw/arm/exynos4_boards.c               |  2 --=0D
 hw/arm/fsl-imx25.c                    |  2 --=0D
 hw/arm/fsl-imx31.c                    |  1 -=0D
 hw/arm/highbank.c                     |  3 +--=0D
 hw/arm/imx25_pdk.c                    |  2 --=0D
 hw/arm/kzm.c                          |  1 -=0D
 hw/arm/mcimx6ul-evk.c                 |  1 -=0D
 hw/arm/mcimx7d-sabre.c                |  1 -=0D
 hw/arm/msf2-soc.c                     |  1 -=0D
 hw/arm/msf2-som.c                     |  1 -=0D
 hw/arm/musicpal.c                     |  2 --=0D
 hw/arm/npcm7xx.c                      |  1 -=0D
 hw/arm/npcm7xx_boards.c               |  2 --=0D
 hw/arm/nrf51_soc.c                    |  2 --=0D
 hw/arm/nseries.c                      |  1 -=0D
 hw/arm/omap1.c                        |  1 -=0D
 hw/arm/omap2.c                        |  1 -=0D
 hw/arm/orangepi.c                     |  3 ---=0D
 hw/arm/palm.c                         |  1 -=0D
 hw/arm/pxa2xx_pic.c                   |  2 +-=0D
 hw/arm/raspi.c                        |  2 --=0D
 hw/arm/realview.c                     |  1 -=0D
 hw/arm/sabrelite.c                    |  1 -=0D
 hw/arm/sbsa-ref.c                     |  1 -=0D
 hw/arm/smmu-common.c                  |  1 -=0D
 hw/arm/smmuv3.c                       |  1 -=0D
 hw/arm/spitz.c                        |  4 ++--=0D
 hw/arm/stellaris.c                    |  1 -=0D
 hw/arm/strongarm.c                    |  3 +--=0D
 hw/arm/versatilepb.c                  |  1 -=0D
 hw/arm/vexpress.c                     |  1 -=0D
 hw/arm/virt.c                         |  3 ---=0D
 hw/arm/xilinx_zynq.c                  |  1 -=0D
 hw/arm/xlnx-versal-virt.c             |  2 --=0D
 hw/arm/xlnx-versal.c                  |  1 -=0D
 hw/arm/xlnx-zcu102.c                  |  1 -=0D
 hw/arm/xlnx-zynqmp.c                  |  2 --=0D
 hw/arm/z2.c                           |  4 ++--=0D
 hw/avr/arduino.c                      |  1 -=0D
 hw/avr/atmega.c                       |  1 -=0D
 hw/block/ecc.c                        |  2 +-=0D
 hw/block/nvme-subsys.c                |  1 -=0D
 hw/char/mchp_pfsoc_mmuart.c           |  1 -=0D
 hw/char/riscv_htif.c                  |  1 -=0D
 hw/char/sifive_uart.c                 |  2 --=0D
 hw/char/spapr_vty.c                   |  1 -=0D
 hw/char/virtio-serial-bus.c           |  1 -=0D
 hw/core/generic-loader.c              |  1 -=0D
 hw/core/guest-loader.c                |  1 -=0D
 hw/core/loader.c                      |  1 -=0D
 hw/core/machine-qmp-cmds.c            |  2 --=0D
 hw/core/null-machine.c                |  1 -=0D
 hw/core/numa.c                        |  1 -=0D
 hw/cris/axis_dev88.c                  |  1 -=0D
 hw/display/next-fb.c                  |  2 --=0D
 hw/display/qxl.c                      |  8 ++++----=0D
 hw/dma/pl080.c                        |  1 -=0D
 hw/dma/pxa2xx_dma.c                   |  4 ++--=0D
 hw/dma/sifive_pdma.c                  |  1 -=0D
 hw/dma/xlnx_csu_dma.c                 |  1 -=0D
 hw/hppa/dino.c                        |  2 --=0D
 hw/hppa/lasi.c                        |  3 ---=0D
 hw/hppa/machine.c                     |  1 -=0D
 hw/i2c/mpc_i2c.c                      |  1 -=0D
 hw/i386/acpi-build.c                  |  1 -=0D
 hw/i386/acpi-microvm.c                |  1 -=0D
 hw/i386/intel_iommu.c                 |  2 --=0D
 hw/i386/kvm/apic.c                    |  1 -=0D
 hw/i386/kvm/clock.c                   |  1 -=0D
 hw/i386/kvm/ioapic.c                  |  1 -=0D
 hw/i386/kvmvapic.c                    |  1 -=0D
 hw/i386/microvm.c                     |  1 -=0D
 hw/i386/pc.c                          |  2 --=0D
 hw/i386/pc_piix.c                     |  3 ---=0D
 hw/i386/pc_q35.c                      |  1 -=0D
 hw/i386/pc_sysfw.c                    |  1 -=0D
 hw/i386/vmport.c                      |  1 -=0D
 hw/i386/x86-iommu.c                   |  1 -=0D
 hw/i386/xen/xen-hvm.c                 |  1 -=0D
 hw/i386/xen/xen_platform.c            |  2 --=0D
 hw/ide/Kconfig                        |  1 +=0D
 hw/ide/ahci_internal.h                |  1 -=0D
 hw/input/lasips2.c                    |  3 ---=0D
 hw/intc/apic.c                        |  1 -=0D
 hw/intc/apic_common.c                 |  1 -=0D
 hw/intc/arm_gic_kvm.c                 |  2 --=0D
 hw/intc/arm_gicv3.c                   |  1 -=0D
 hw/intc/arm_gicv3_kvm.c               |  1 -=0D
 hw/intc/armv7m_nvic.c                 |  1 -=0D
 hw/intc/grlib_irqmp.c                 |  1 -=0D
 hw/intc/imx_gpcv2.c                   |  1 -=0D
 hw/intc/ompic.c                       |  1 -=0D
 hw/intc/openpic.c                     |  1 -=0D
 hw/intc/openpic_kvm.c                 |  2 --=0D
 hw/intc/s390_flic.c                   |  1 -=0D
 hw/intc/s390_flic_kvm.c               |  2 --=0D
 hw/intc/sifive_plic.c                 |  2 --=0D
 hw/intc/xics.c                        |  1 -=0D
 hw/intc/xics_kvm.c                    |  1 -=0D
 hw/intc/xics_spapr.c                  |  1 -=0D
 hw/ipmi/isa_ipmi_bt.c                 |  1 -=0D
 hw/ipmi/isa_ipmi_kcs.c                |  1 -=0D
 hw/isa/isa-superio.c                  |  1 -=0D
 hw/isa/lpc_ich9.c                     |  2 --=0D
 hw/isa/piix3.c                        |  1 -=0D
 hw/isa/piix4.c                        |  1 -=0D
 hw/isa/vt82c686.c                     |  1 -=0D
 hw/lm32/lm32_boards.c                 |  1 -=0D
 hw/lm32/milkymist.c                   |  1 -=0D
 hw/m68k/an5206.c                      |  1 -=0D
 hw/m68k/mcf5208.c                     |  1 -=0D
 hw/m68k/mcf_intc.c                    |  1 -=0D
 hw/m68k/next-cube.c                   |  2 --=0D
 hw/m68k/next-kbd.c                    |  3 ---=0D
 hw/m68k/q800.c                        |  3 ---=0D
 hw/m68k/virt.c                        |  3 ---=0D
 hw/mem/sparse-mem.c                   |  1 -=0D
 hw/microblaze/boot.c                  |  1 -=0D
 hw/mips/boston.c                      |  1 -=0D
 hw/mips/fuloong2e.c                   |  2 --=0D
 hw/mips/gt64xxx_pci.c                 |  1 -=0D
 hw/mips/jazz.c                        |  1 -=0D
 hw/mips/loongson3_virt.c              |  4 ----=0D
 hw/mips/malta.c                       |  3 ---=0D
 hw/mips/mips_int.c                    |  1 -=0D
 hw/mips/mipssim.c                     |  2 --=0D
 hw/misc/imx7_snvs.c                   |  1 -=0D
 hw/misc/imx_ccm.c                     |  1 -=0D
 hw/misc/imx_rngc.c                    |  1 -=0D
 hw/misc/led.c                         |  1 -=0D
 hw/misc/macio/macio.c                 |  1 -=0D
 hw/misc/mchp_pfsoc_dmc.c              |  1 -=0D
 hw/misc/mchp_pfsoc_ioscb.c            |  1 -=0D
 hw/misc/mchp_pfsoc_sysreg.c           |  1 -=0D
 hw/misc/mips_itu.c                    |  1 -=0D
 hw/misc/mst_fpga.c                    |  2 +-=0D
 hw/misc/pvpanic-isa.c                 |  1 -=0D
 hw/misc/pvpanic-pci.c                 |  1 -=0D
 hw/misc/sifive_e_prci.c               |  1 -=0D
 hw/misc/sifive_test.c                 |  1 -=0D
 hw/misc/virt_ctrl.c                   |  1 -=0D
 hw/moxie/moxiesim.c                   |  2 --=0D
 hw/net/can/xlnx-zynqmp-can.c          |  1 -=0D
 hw/net/i82596.c                       |  1 -=0D
 hw/net/lasi_i82596.c                  |  1 -=0D
 hw/net/msf2-emac.c                    |  1 -=0D
 hw/net/spapr_llan.c                   |  1 -=0D
 hw/net/xgmac.c                        |  1 -=0D
 hw/nios2/10m50_devboard.c             |  1 -=0D
 hw/nios2/boot.c                       |  2 --=0D
 hw/nios2/generic_nommu.c              |  2 --=0D
 hw/nubus/nubus-bus.c                  |  1 -=0D
 hw/nvram/nrf51_nvm.c                  |  1 -=0D
 hw/nvram/spapr_nvram.c                |  2 --=0D
 hw/openrisc/openrisc_sim.c            |  1 -=0D
 hw/pci-host/bonito.c                  |  1 -=0D
 hw/pci-host/ppce500.c                 |  1 -=0D
 hw/pci-host/prep.c                    |  1 -=0D
 hw/pci-host/sabre.c                   |  1 -=0D
 hw/pci-host/sh_pci.c                  |  1 -=0D
 hw/pci/pci.c                          |  1 -=0D
 hw/pci/pcie_host.c                    |  1 -=0D
 hw/pcmcia/meson.build                 |  2 +-=0D
 hw/ppc/e500.c                         |  2 --=0D
 hw/ppc/mac_newworld.c                 |  2 --=0D
 hw/ppc/mac_oldworld.c                 |  2 --=0D
 hw/ppc/pnv.c                          |  3 ---=0D
 hw/ppc/pnv_pnor.c                     |  1 -=0D
 hw/ppc/pnv_psi.c                      |  1 -=0D
 hw/ppc/ppc.c                          |  1 -=0D
 hw/ppc/ppc405_boards.c                |  3 ---=0D
 hw/ppc/ppc405_uc.c                    |  1 -=0D
 hw/ppc/ppc440_bamboo.c                |  1 -=0D
 hw/ppc/ppc440_pcix.c                  |  1 -=0D
 hw/ppc/ppc440_uc.c                    |  2 --=0D
 hw/ppc/ppc4xx_devs.c                  |  1 -=0D
 hw/ppc/ppc4xx_pci.c                   |  1 -=0D
 hw/ppc/ppc_booke.c                    |  1 -=0D
 hw/ppc/prep.c                         |  4 ----=0D
 hw/ppc/rs6000_mc.c                    |  1 -=0D
 hw/ppc/sam460ex.c                     |  1 -=0D
 hw/ppc/spapr.c                        |  2 --=0D
 hw/ppc/spapr_drc.c                    |  1 -=0D
 hw/ppc/spapr_events.c                 |  1 -=0D
 hw/ppc/spapr_hcall.c                  |  1 -=0D
 hw/ppc/spapr_iommu.c                  |  1 -=0D
 hw/ppc/spapr_pci.c                    |  2 --=0D
 hw/ppc/spapr_pci_vfio.c               |  1 -=0D
 hw/ppc/spapr_rng.c                    |  1 -=0D
 hw/ppc/spapr_rtas.c                   |  2 --=0D
 hw/ppc/spapr_rtas_ddw.c               |  1 -=0D
 hw/ppc/spapr_rtc.c                    |  1 -=0D
 hw/ppc/spapr_tpm_proxy.c              |  1 -=0D
 hw/ppc/virtex_ml507.c                 |  2 --=0D
 hw/remote/iohub.c                     |  1 -=0D
 hw/remote/machine.c                   |  1 -=0D
 hw/remote/memory.c                    |  1 -=0D
 hw/remote/proxy-memory-listener.c     |  2 --=0D
 hw/riscv/microchip_pfsoc.c            |  2 --=0D
 hw/riscv/numa.c                       |  1 -=0D
 hw/riscv/opentitan.c                  |  1 -=0D
 hw/riscv/sifive_e.c                   |  2 --=0D
 hw/riscv/sifive_u.c                   |  1 -=0D
 hw/riscv/spike.c                      |  1 -=0D
 hw/riscv/virt.c                       |  1 -=0D
 hw/rtc/m48t59.c                       |  1 -=0D
 hw/rtc/mc146818rtc.c                  |  2 +-=0D
 hw/rx/rx-gdbsim.c                     |  5 +----=0D
 hw/rx/rx62n.c                         |  2 --=0D
 hw/s390x/3270-ccw.c                   |  1 -=0D
 hw/s390x/css-bridge.c                 |  1 -=0D
 hw/s390x/css.c                        |  1 -=0D
 hw/s390x/ipl.c                        |  2 --=0D
 hw/s390x/pv.c                         |  1 -=0D
 hw/s390x/s390-ccw.c                   |  1 -=0D
 hw/s390x/s390-pci-bus.c               |  1 -=0D
 hw/s390x/s390-pci-inst.c              |  1 -=0D
 hw/s390x/s390-stattrib-kvm.c          |  1 -=0D
 hw/s390x/s390-stattrib.c              |  1 -=0D
 hw/s390x/s390-virtio-ccw.c            |  4 ----=0D
 hw/s390x/sclp.c                       |  2 --=0D
 hw/s390x/sclpcpu.c                    |  1 -=0D
 hw/s390x/virtio-ccw.c                 |  1 -=0D
 hw/scsi/spapr_vscsi.c                 |  1 -=0D
 hw/sd/cadence_sdhci.c                 |  2 --=0D
 hw/sh4/r2d.c                          |  1 -=0D
 hw/sh4/sh7750.c                       |  1 -=0D
 hw/sh4/shix.c                         |  2 --=0D
 hw/sparc/leon3.c                      |  1 -=0D
 hw/sparc64/niagara.c                  |  1 -=0D
 hw/ssi/aspeed_smc.c                   |  1 -=0D
 hw/ssi/sifive_spi.c                   |  1 -=0D
 hw/ssi/xilinx_spi.c                   |  1 -=0D
 hw/timer/mips_gictimer.c              |  1 -=0D
 hw/timer/sse-counter.c                |  1 -=0D
 hw/tpm/tpm_crb.c                      |  1 -=0D
 hw/tricore/tc27x_soc.c                |  4 ----=0D
 hw/tricore/triboard.c                 |  3 ---=0D
 hw/tricore/tricore_testboard.c        |  1 -=0D
 hw/usb/ccid-card-passthru.c           |  2 +-=0D
 hw/usb/chipidea.c                     |  1 -=0D
 hw/usb/dev-smartcard-reader.c         |  8 ++++----=0D
 hw/usb/hcd-dwc3.c                     |  1 -=0D
 hw/usb/imx-usb-phy.c                  |  1 -=0D
 hw/usb/xen-usb.c                      |  1 -=0D
 hw/usb/xlnx-usb-subsystem.c           |  2 --=0D
 hw/usb/xlnx-versal-usb2-ctrl-regs.c   |  1 -=0D
 hw/vfio/ap.c                          |  2 --=0D
 hw/vfio/ccw.c                         |  1 -=0D
 hw/vfio/display.c                     |  1 -=0D
 hw/vfio/migration.c                   |  1 -=0D
 hw/vfio/pci-quirks.c                  |  1 -=0D
 hw/vfio/pci.c                         |  1 -=0D
 hw/vfio/spapr.c                       |  1 -=0D
 hw/virtio/vhost.c                     |  1 -=0D
 hw/virtio/virtio.c                    |  1 -=0D
 hw/xen/xen-bus-helper.c               |  1 -=0D
 hw/xen/xen-legacy-backend.c           |  1 -=0D
 hw/xen/xen_pt.c                       |  1 -=0D
 hw/xtensa/sim.c                       |  2 --=0D
 hw/xtensa/virt.c                      |  3 ---=0D
 hw/xtensa/xtensa_memory.c             |  1 -=0D
 hw/xtensa/xtfpga.c                    |  1 -=0D
 include/hw/block/flash.h              |  2 +-=0D
 include/hw/char/avr_usart.h           |  1 -=0D
 include/hw/misc/avr_power.h           |  1 -=0D
 include/hw/misc/stm32f4xx_exti.h      |  1 -=0D
 include/hw/misc/stm32f4xx_syscfg.h    |  1 -=0D
 include/hw/pci-host/i440fx.h          |  1 -=0D
 include/hw/timer/avr_timer16.h        |  1 -=0D
 linux-user/main.c                     |  1 -=0D
 linux-user/semihost.c                 |  1 -=0D
 migration/ram.c                       |  2 --=0D
 monitor/misc.c                        |  1 -=0D
 monitor/monitor.c                     |  1 -=0D
 net/dump.c                            |  1 -=0D
 net/filter-replay.c                   |  1 -=0D
 net/net.c                             |  2 --=0D
 net/netmap.c                          |  1 -=0D
 plugins/api.c                         |  2 --=0D
 plugins/core.c                        |  2 --=0D
 plugins/loader.c                      |  1 -=0D
 qemu-options.hx                       |  6 +++---=0D
 scripts/qemu-binfmt-conf.sh           |  4 +++-=0D
 semihosting/arm-compat-semi.c         |  2 --=0D
 semihosting/config.c                  |  1 -=0D
 semihosting/console.c                 |  2 --=0D
 softmmu/arch_init.c                   |  2 --=0D
 softmmu/device_tree.c                 |  1 -=0D
 softmmu/memory.c                      |  2 --=0D
 softmmu/memory_mapping.c              |  1 -=0D
 softmmu/physmem.c                     |  3 ---=0D
 softmmu/qdev-monitor.c                |  1 -=0D
 softmmu/vl.c                          |  1 -=0D
 stubs/semihost.c                      |  1 -=0D
 target/arm/cpu.c                      |  1 -=0D
 target/arm/op_helper.c                |  1 -=0D
 target/hexagon/cpu.c                  |  1 -=0D
 target/hexagon/decode.c               |  1 -=0D
 target/hexagon/genptr.c               |  1 -=0D
 target/i386/cpu.h                     |  2 +-=0D
 target/i386/hvf/hvf.c                 |  1 -=0D
 target/i386/hvf/x86_mmu.c             |  1 -=0D
 target/i386/machine.c                 |  2 +-=0D
 target/i386/sev.c                     |  1 -=0D
 target/lm32/lm32-semi.c               |  1 -=0D
 target/openrisc/sys_helper.c          |  1 -=0D
 target/riscv/op_helper.c              |  1 -=0D
 target/rx/helper.c                    |  1 -=0D
 target/s390x/cpu.c                    |  1 -=0D
 target/s390x/diag.c                   |  1 -=0D
 target/s390x/excp_helper.c            |  1 -=0D
 target/s390x/interrupt.c              |  1 -=0D
 target/xtensa/op_helper.c             |  1 -=0D
 tcg/tcg-op-vec.c                      |  1 -=0D
 tcg/tcg-op.c                          |  1 -=0D
 tcg/tcg.c                             |  2 --=0D
 tests/qtest/fuzz/fuzz.c               |  1 -=0D
 tests/qtest/fuzz/generic_fuzz.c       |  2 --=0D
 tests/qtest/fuzz/qos_fuzz.c           |  2 --=0D
 ui/x_keymap.c                         | 15 ++++++++++-----=0D
 util/oslib-win32.c                    |  1 -=0D
 371 files changed, 53 insertions(+), 507 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

