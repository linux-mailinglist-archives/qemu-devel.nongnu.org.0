Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E65AB382AA3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 13:13:01 +0200 (CEST)
Received: from localhost ([::1]:55772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1libBE-0005lg-Tw
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 07:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9b-0003C7-G9
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:19 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lib9Z-00009N-3m
 for qemu-devel@nongnu.org; Mon, 17 May 2021 07:11:19 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d11so5930389wrw.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 04:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCSZYcBuBdq5eloUqDup6TATlXgJsogGq0QZGkrobLE=;
 b=MCrt7iqnOlROkJCLftDWHAJt75ptnuqzbKLWeCqiIs9IjwQ2ALoMVhgC1vkXtJEq3I
 it/b+uKjArdU2qmyannKOJwfoAL8lx/ecTJ4FAQazczYbBcFg+pjzTC04jip3rW4xj9B
 zBW2CmGTjGGbS5iyGb3X0dY0FChaWFvRzrUpfyn2137WNRRZ/T9vEaaEEPvxL1Q8CA91
 hvT140SD7mBLXq4kNn5ehosJDuZnQdOIEHKC5fnZ+O+gq/MKmy3pa7vYZxOD2k15j+Wj
 t568Ng8RYOi/6BCAfkZi5Jc6x5k84rcwmA7v2GklTCqr9zkXvM6jmyeHKhuLLBhqx8Bd
 qf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bCSZYcBuBdq5eloUqDup6TATlXgJsogGq0QZGkrobLE=;
 b=o2O0ZB+lj1P4E0zspHEQq+VBdtGOBkJvqPu4vFXpN2R9KFHK1acUwra8vcV1MsZnxm
 jr+Ai71qiS6T8PNYrvwljR2QBOM4NbHA1X0kc4bSIgetsBeX1XXYVHSTLvdxX5EwhBaK
 KaTfACkfJntlkOxG+kz7ymwCIk6DfJL8zvh+nxJ3i7cCtTT+n704KJS/vsj6TwoboCmX
 w6HwqwCs175tX1yC2v7rzVWARtZMT7OdbVcx8ZE6yZppm4JSbMroubphaeG3HKs4LFi9
 RXSsKZ7a7yQFlMiEjgwRXoXVI9yIGQ8hZWXs9cHltRlVzUmFJuzMZ0AZvHaLT7rSDBWz
 jahQ==
X-Gm-Message-State: AOAM533eJzF81oRsdYJvIMrvZTjcdGEOQGkDhGkRbqEQLEpZg3xI/C+v
 WTwVNS5fSYXFEVoF13Gk+5pr83QqqVTN1Q==
X-Google-Smtp-Source: ABdhPJwFrsvQmu22LtaUs3gpIHxVU/bAykDVX5w5FIjV8AHwYleDGHj1yffRbZg9Fvgv5K1BlEvr+A==
X-Received: by 2002:a5d:48ce:: with SMTP id p14mr1391977wrs.170.1621249874247; 
 Mon, 17 May 2021 04:11:14 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id r17sm20834925wmh.25.2021.05.17.04.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 04:11:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/11] exec: Restrict various system emulation specific
 headers (to sysemu)
Date: Mon, 17 May 2021 13:11:00 +0200
Message-Id: <20210517111111.1068153-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series restricts various system emulation specific headers=0D
by moving them under sysemu/ and adding #error if included from=0D
user emulation.=0D
We could avoid the sysemu/ rename if too much churn, but enforcing=0D
error of headers that must not be included in user emulation allows=0D
further cleanups (to be sent later).=0D
=0D
I had to split the ioport.c file to cpu-io (generic to any target=0D
having access to I/O bus, but I haven't checked the TCG implementation=0D
details for user emulation) VS ioport (system specific, access to=0D
hardware).=0D
=0D
Many files are changed, but this is mostly one-line mechanical=0D
updates of old path to new path using sed.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  NOTFORMERGE target/arm: Restrict KVM files to softmmu=0D
  exec: Restrict hwaddr.h to sysemu/=0D
  exec: Restrict cputlb.h to sysemu/=0D
  exec: Restrict memory.h to sysemu/=0D
  exec: Restrict memory-internal.h to sysemu/=0D
  exec: Restrict address-spaces.h to sysemu/=0D
  exec: Extract CPU I/O instructions to "cpu-io.h"=0D
  exec: Restrict ioport.h to sysemu/=0D
  exec: Restrict ram_addr.h to sysemu/=0D
  exec: Restrict ramblock.h to sysemu/=0D
  exec: Restrict confidential-guest-support.h to sysemu/=0D
=0D
 docs/devel/memory.rst                         |  2 +-=0D
 hw/arm/strongarm.h                            |  2 +-=0D
 hw/audio/lm4549.h                             |  2 +-=0D
 hw/display/framebuffer.h                      |  2 +-=0D
 hw/display/vga_int.h                          |  4 +-=0D
 hw/net/can/can_sja1000.h                      |  2 +-=0D
 hw/net/can/ctucan_core.h                      |  2 +-=0D
 hw/net/i82596.h                               |  4 +-=0D
 hw/net/net_tx_pkt.h                           |  2 +-=0D
 hw/net/pcnet.h                                |  2 +-=0D
 hw/ppc/mac.h                                  |  2 +-=0D
 hw/s390x/ipl.h                                |  2 +-=0D
 hw/tpm/tpm_ppi.h                              |  2 +-=0D
 hw/usb/hcd-uhci.h                             |  2 +-=0D
 hw/vfio/pci.h                                 |  2 +-=0D
 include/disas/disas.h                         |  4 +-=0D
 include/exec/cpu-all.h                        |  6 +-=0D
 include/exec/cpu-common.h                     |  2 +-=0D
 include/exec/cpu-defs.h                       |  2 +-=0D
 include/exec/cpu-io.h                         | 30 +++++++=0D
 include/exec/{ =3D> sysemu}/address-spaces.h    | 14 +--=0D
 include/exec/{ =3D> sysemu}/cputlb.h            | 11 ++-=0D
 include/exec/{ =3D> sysemu}/hwaddr.h            |  7 +-=0D
 include/exec/{ =3D> sysemu}/memory-internal.h   |  7 +-=0D
 include/exec/{ =3D> sysemu}/memory.h            |  8 +-=0D
 include/hw/acpi/acpi.h                        |  2 +-=0D
 include/hw/acpi/tco.h                         |  2 +-=0D
 include/hw/arm/fsl-imx25.h                    |  2 +-=0D
 include/hw/arm/fsl-imx31.h                    |  2 +-=0D
 include/hw/arm/fsl-imx6.h                     |  2 +-=0D
 include/hw/arm/fsl-imx6ul.h                   |  2 +-=0D
 include/hw/arm/omap.h                         |  2 +-=0D
 include/hw/arm/pxa.h                          |  2 +-=0D
 include/hw/arm/sharpsl.h                      |  2 +-=0D
 include/hw/arm/soc_dma.h                      |  2 +-=0D
 include/hw/arm/sysbus-fdt.h                   |  2 +-=0D
 include/hw/arm/virt.h                         |  2 +-=0D
 include/hw/block/block.h                      |  2 +-=0D
 include/hw/block/fdc.h                        |  2 +-=0D
 include/hw/block/flash.h                      |  2 +-=0D
 include/hw/boards.h                           |  2 +-=0D
 include/hw/char/riscv_htif.h                  |  2 +-=0D
 include/hw/char/serial.h                      |  2 +-=0D
 include/hw/core/cpu.h                         |  4 +-=0D
 include/hw/cris/etraxfs_dma.h                 |  2 +-=0D
 include/hw/display/macfb.h                    |  2 +-=0D
 include/hw/display/vga.h                      |  2 +-=0D
 include/hw/dma/i8257.h                        |  2 +-=0D
 include/hw/gpio/npcm7xx_gpio.h                |  2 +-=0D
 include/hw/i2c/npcm7xx_smbus.h                |  2 +-=0D
 include/hw/i2c/pm_smbus.h                     |  2 +-=0D
 include/hw/i386/apic_internal.h               |  2 +-=0D
 include/hw/i386/ioapic_internal.h             |  2 +-=0D
 include/hw/i386/microvm.h                     |  2 +-=0D
 include/hw/i386/x86.h                         |  2 +-=0D
 include/hw/ide.h                              |  2 +-=0D
 include/hw/input/lasips2.h                    |  2 +-=0D
 include/hw/ipmi/ipmi.h                        |  2 +-=0D
 include/hw/isa/apm.h                          |  2 +-=0D
 include/hw/isa/isa.h                          |  4 +-=0D
 include/hw/loader-fit.h                       |  2 +-=0D
 include/hw/mem/npcm7xx_mc.h                   |  2 +-=0D
 include/hw/mem/pc-dimm.h                      |  2 +-=0D
 include/hw/mips/mips.h                        |  2 +-=0D
 include/hw/misc/allwinner-h3-dramc.h          |  2 +-=0D
 include/hw/misc/auxbus.h                      |  2 +-=0D
 include/hw/misc/empty_slot.h                  |  2 +-=0D
 include/hw/misc/mac_via.h                     |  2 +-=0D
 include/hw/misc/mos6522.h                     |  2 +-=0D
 include/hw/misc/npcm7xx_clk.h                 |  2 +-=0D
 include/hw/misc/npcm7xx_gcr.h                 |  2 +-=0D
 include/hw/misc/npcm7xx_mft.h                 |  2 +-=0D
 include/hw/net/msf2-emac.h                    |  2 +-=0D
 include/hw/nubus/nubus.h                      |  2 +-=0D
 include/hw/nvram/fw_cfg.h                     |  2 +-=0D
 include/hw/nvram/npcm7xx_otp.h                |  2 +-=0D
 include/hw/pci-host/gpex.h                    |  2 +-=0D
 include/hw/pci-host/pam.h                     |  2 +-=0D
 include/hw/pci-host/remote.h                  |  2 +-=0D
 include/hw/pci/pci.h                          |  2 +-=0D
 include/hw/pci/pcie_host.h                    |  2 +-=0D
 include/hw/pci/shpc.h                         |  2 +-=0D
 include/hw/ppc/mac_dbdma.h                    |  2 +-=0D
 include/hw/ppc/ppc4xx.h                       |  2 +-=0D
 include/hw/ppc/xics.h                         |  2 +-=0D
 include/hw/register.h                         |  2 +-=0D
 include/hw/remote/memory.h                    |  2 +-=0D
 include/hw/remote/mpqemu-link.h               |  2 +-=0D
 include/hw/remote/proxy-memory-listener.h     |  2 +-=0D
 include/hw/rtc/m48t59.h                       |  2 +-=0D
 include/hw/rtc/sun4v-rtc.h                    |  2 +-=0D
 include/hw/sh4/sh_intc.h                      |  2 +-=0D
 include/hw/sysbus.h                           |  2 +-=0D
 include/hw/timer/npcm7xx_timer.h              |  2 +-=0D
 include/hw/timer/tmu012.h                     |  2 +-=0D
 include/hw/tricore/triboard.h                 |  2 +-=0D
 include/hw/tricore/tricore.h                  |  2 +-=0D
 include/hw/usb.h                              |  2 +-=0D
 include/hw/vfio/vfio-common.h                 |  2 +-=0D
 include/hw/virtio/vhost-backend.h             |  2 +-=0D
 include/hw/virtio/vhost.h                     |  2 +-=0D
 include/hw/virtio/virtio-access.h             |  2 +-=0D
 include/hw/virtio/virtio.h                    |  2 +-=0D
 include/hw/xtensa/mx_pic.h                    |  2 +-=0D
 include/monitor/monitor.h                     |  2 +-=0D
 include/qemu/accel.h                          |  4 +-=0D
 include/qemu/iova-tree.h                      |  4 +-=0D
 include/qemu/userfaultfd.h                    |  2 +-=0D
 .../confidential-guest-support.h              |  6 +-=0D
 include/sysemu/dma.h                          |  4 +-=0D
 include/sysemu/hostmem.h                      |  2 +-=0D
 include/{exec =3D> sysemu}/ioport.h             | 19 ++--=0D
 include/sysemu/kvm_int.h                      |  2 +-=0D
 include/sysemu/memory_mapping.h               |  2 +-=0D
 include/{exec =3D> sysemu}/ram_addr.h           | 13 +--=0D
 include/{exec =3D> sysemu}/ramblock.h           | 13 +--=0D
 include/sysemu/vhost-user-backend.h           |  2 +-=0D
 target/arm/kvm_arm.h                          |  2 +-=0D
 target/i386/hvf/vmx.h                         |  2 +-=0D
 accel/kvm/kvm-all.c                           |  4 +-=0D
 accel/tcg/cputlb.c                            |  8 +-=0D
 accel/tcg/translate-all.c                     |  8 +-=0D
 backends/confidential-guest-support.c         |  2 +-=0D
 backends/tpm/tpm_util.c                       |  2 +-=0D
 cpu.c                                         |  2 +-=0D
 dump/dump.c                                   |  2 +-=0D
 dump/win_dump.c                               |  2 +-=0D
 hw/arm/collie.c                               |  2 +-=0D
 hw/arm/exynos4_boards.c                       |  2 +-=0D
 hw/arm/fsl-imx31.c                            |  2 +-=0D
 hw/arm/gumstix.c                              |  2 +-=0D
 hw/arm/integratorcp.c                         |  2 +-=0D
 hw/arm/kzm.c                                  |  2 +-=0D
 hw/arm/mainstone.c                            |  2 +-=0D
 hw/arm/microbit.c                             |  2 +-=0D
 hw/arm/mps2-tz.c                              |  2 +-=0D
 hw/arm/mps2.c                                 |  2 +-=0D
 hw/arm/msf2-soc.c                             |  2 +-=0D
 hw/arm/msf2-som.c                             |  2 +-=0D
 hw/arm/musca.c                                |  2 +-=0D
 hw/arm/omap1.c                                |  2 +-=0D
 hw/arm/omap2.c                                |  2 +-=0D
 hw/arm/omap_sx1.c                             |  2 +-=0D
 hw/arm/orangepi.c                             |  2 +-=0D
 hw/arm/sbsa-ref.c                             |  2 +-=0D
 hw/arm/spitz.c                                |  2 +-=0D
 hw/arm/stellaris.c                            |  2 +-=0D
 hw/arm/stm32f205_soc.c                        |  2 +-=0D
 hw/arm/stm32f405_soc.c                        |  2 +-=0D
 hw/arm/tosa.c                                 |  2 +-=0D
 hw/arm/z2.c                                   |  2 +-=0D
 hw/avr/atmega.c                               |  4 +-=0D
 hw/block/nvme.c                               |  2 +-=0D
 hw/block/onenand.c                            |  2 +-=0D
 hw/char/goldfish_tty.c                        |  2 +-=0D
 hw/char/omap_uart.c                           |  2 +-=0D
 hw/core/loader-fit.c                          |  2 +-=0D
 hw/core/loader.c                              |  2 +-=0D
 hw/core/machine.c                             |  2 +-=0D
 hw/core/null-machine.c                        |  2 +-=0D
 hw/core/sysbus.c                              |  2 +-=0D
 hw/display/edid-region.c                      |  2 +-=0D
 hw/display/tc6393xb.c                         |  2 +-=0D
 hw/dma/etraxfs_dma.c                          |  2 +-=0D
 hw/dma/rc4030.c                               |  2 +-=0D
 hw/hyperv/hyperv.c                            |  2 +-=0D
 hw/i386/acpi-common.c                         |  2 +-=0D
 hw/i386/acpi-microvm.c                        |  2 +-=0D
 hw/i386/pc.c                                  |  2 +-=0D
 hw/i386/pc_piix.c                             |  2 +-=0D
 hw/i386/xen/xen-hvm.c                         |  1 +=0D
 hw/input/lasips2.c                            |  4 +-=0D
 hw/intc/mips_gic.c                            |  2 +-=0D
 hw/intc/ompic.c                               |  2 +-=0D
 hw/m68k/next-cube.c                           |  2 +-=0D
 hw/microblaze/petalogix_ml605_mmu.c           |  2 +-=0D
 hw/microblaze/petalogix_s3adsp1800_mmu.c      |  2 +-=0D
 hw/microblaze/xlnx-zynqmp-pmu.c               |  2 +-=0D
 hw/misc/allwinner-h3-dramc.c                  |  2 +-=0D
 hw/misc/omap_gpmc.c                           |  4 +-=0D
 hw/net/ne2000.c                               |  2 +-=0D
 hw/nios2/10m50_devboard.c                     |  4 +-=0D
 hw/nios2/generic_nommu.c                      |  4 +-=0D
 hw/pci-bridge/pci_bridge_dev.c                |  2 +-=0D
 hw/pci-host/mv64361.c                         |  2 +-=0D
 hw/pci-host/remote.c                          |  2 +-=0D
 hw/ppc/pef.c                                  |  2 +-=0D
 hw/ppc/pegasos2.c                             |  2 +-=0D
 hw/ppc/pnv_homer.c                            |  4 +-=0D
 hw/ppc/ppc405_uc.c                            |  2 +-=0D
 hw/ppc/ppc440_uc.c                            |  2 +-=0D
 hw/ppc/ppc4xx_devs.c                          |  2 +-=0D
 hw/ppc/prep_systemio.c                        |  2 +-=0D
 hw/ppc/rs6000_mc.c                            |  2 +-=0D
 hw/ppc/sam460ex.c                             |  2 +-=0D
 hw/ppc/spapr.c                                |  2 +-=0D
 hw/ppc/spapr_caps.c                           |  2 +-=0D
 hw/ppc/spapr_ovec.c                           |  2 +-=0D
 hw/ppc/spapr_pci.c                            |  2 +-=0D
 hw/remote/machine.c                           |  2 +-=0D
 hw/remote/memory.c                            |  2 +-=0D
 hw/remote/proxy-memory-listener.c             |  4 +-=0D
 hw/riscv/shakti_c.c                           |  2 +-=0D
 hw/s390x/css.c                                |  2 +-=0D
 hw/s390x/pv.c                                 |  2 +-=0D
 hw/s390x/s390-pci-inst.c                      |  2 +-=0D
 hw/s390x/s390-stattrib-kvm.c                  |  2 +-=0D
 hw/s390x/s390-stattrib.c                      |  2 +-=0D
 hw/s390x/s390-virtio-ccw.c                    |  2 +-=0D
 hw/sparc/sun4m_iommu.c                        |  2 +-=0D
 hw/sparc64/sun4u_iommu.c                      |  2 +-=0D
 hw/timer/hpet.c                               |  2 +-=0D
 hw/timer/sh_timer.c                           |  2 +-=0D
 hw/vfio/ap.c                                  |  2 +-=0D
 hw/vfio/ccw.c                                 |  2 +-=0D
 hw/vfio/common.c                              |  6 +-=0D
 hw/vfio/migration.c                           |  2 +-=0D
 hw/vfio/platform.c                            |  4 +-=0D
 hw/vfio/spapr.c                               |  2 +-=0D
 hw/virtio/virtio-balloon.c                    |  2 +-=0D
 hw/virtio/virtio-bus.c                        |  2 +-=0D
 hw/virtio/virtio-mem.c                        |  2 +-=0D
 hw/xtensa/sim.c                               |  2 +-=0D
 hw/xtensa/virt.c                              |  2 +-=0D
 hw/xtensa/xtensa_memory.c                     |  2 +-=0D
 hw/xtensa/xtfpga.c                            |  2 +-=0D
 migration/dirtyrate.c                         |  2 +-=0D
 migration/multifd.c                           |  2 +-=0D
 migration/postcopy-ram.c                      |  2 +-=0D
 migration/ram.c                               |  2 +-=0D
 migration/rdma.c                              |  2 +-=0D
 migration/savevm.c                            |  2 +-=0D
 monitor/misc.c                                |  4 +-=0D
 plugins/api.c                                 |  2 +-=0D
 semihosting/arm-compat-semi.c                 |  2 +-=0D
 softmmu/cpu-io.c                              | 88 +++++++++++++++++++=0D
 softmmu/ioport.c                              | 66 +-------------=0D
 softmmu/memory.c                              |  6 +-=0D
 softmmu/memory_mapping.c                      |  4 +-=0D
 softmmu/physmem.c                             |  8 +-=0D
 softmmu/qtest.c                               |  5 +-=0D
 softmmu/vl.c                                  |  2 +-=0D
 stubs/ram-block.c                             |  2 +-=0D
 target/arm/cpu.c                              |  2 +-=0D
 target/arm/cpu64.c                            |  2 +-=0D
 target/arm/kvm.c                              |  2 +-=0D
 target/arm/mte_helper.c                       |  2 +-=0D
 target/avr/helper.c                           |  2 +-=0D
 target/i386/cpu-sysemu.c                      |  2 +-=0D
 target/i386/cpu.c                             |  2 +-=0D
 target/i386/hax/hax-all.c                     |  2 +-=0D
 target/i386/hax/hax-mem.c                     |  2 +-=0D
 target/i386/nvmm/nvmm-all.c                   |  4 +-=0D
 target/i386/sev.c                             |  2 +-=0D
 target/i386/tcg/sysemu/misc_helper.c          |  2 +-=0D
 target/i386/tcg/sysemu/tcg-cpu.c              |  2 +-=0D
 target/i386/whpx/whpx-all.c                   |  4 +-=0D
 target/ppc/kvm.c                              |  2 +-=0D
 target/s390x/excp_helper.c                    |  2 +-=0D
 target/s390x/kvm.c                            |  2 +-=0D
 target/s390x/misc_helper.c                    |  2 +-=0D
 target/s390x/mmu_helper.c                     |  2 +-=0D
 target/s390x/sigp.c                           |  2 +-=0D
 target/xtensa/dbg_helper.c                    |  2 +-=0D
 tests/qtest/fuzz/generic_fuzz.c               |  4 +-=0D
 tests/qtest/fuzz/qos_fuzz.c                   |  2 +-=0D
 tests/qtest/fuzz/qtest_wrappers.c             |  3 +-=0D
 tests/qtest/microbit-test.c                   |  2 +-=0D
 ui/console.c                                  |  2 +-=0D
 util/vfio-helpers.c                           |  2 +-=0D
 MAINTAINERS                                   | 12 +--=0D
 scripts/analyze-inclusions                    |  2 +-=0D
 .../codeconverter/test_regexps.py             |  4 +-=0D
 softmmu/meson.build                           |  3 +-=0D
 target/arm/meson.build                        |  4 +-=0D
 275 files changed, 491 insertions(+), 409 deletions(-)=0D
 create mode 100644 include/exec/cpu-io.h=0D
 rename include/exec/{ =3D> sysemu}/address-spaces.h (80%)=0D
 rename include/exec/{ =3D> sysemu}/cputlb.h (86%)=0D
 rename include/exec/{ =3D> sysemu}/hwaddr.h (81%)=0D
 rename include/exec/{ =3D> sysemu}/memory-internal.h (94%)=0D
 rename include/exec/{ =3D> sysemu}/memory.h (99%)=0D
 rename include/{exec =3D> sysemu}/confidential-guest-support.h (95%)=0D
 rename include/{exec =3D> sysemu}/ioport.h (86%)=0D
 rename include/{exec =3D> sysemu}/ram_addr.h (99%)=0D
 rename include/{exec =3D> sysemu}/ramblock.h (92%)=0D
 create mode 100644 softmmu/cpu-io.c=0D
=0D
-- =0D
2.26.3=0D
=0D

