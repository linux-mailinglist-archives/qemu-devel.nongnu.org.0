Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C2736FE46
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:10:30 +0200 (CEST)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVin-0004cE-FZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVYo-0006oM-Hu; Fri, 30 Apr 2021 12:00:13 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:58395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVYg-0004Qm-0v; Fri, 30 Apr 2021 12:00:10 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N6JtR-1lWMYT14nJ-016jCH; Fri, 30 Apr 2021 17:59:52 +0200
Subject: Re: [PATCH 4/4] Do not include exec/address-spaces.h if it's not
 really necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-5-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <91ff7547-97d2-1dd3-6546-2d3a0dac8bcd@vivier.eu>
Date: Fri, 30 Apr 2021 17:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416171314.2074665-5-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:r1CGTsTB1pEJ8LRXaPk2nqGY5+PgasmT3WF20McegWVIZuZxlDp
 hEfPfFFVmh5f2s+JCzi3eeJBvxEjVHiyN6t6Yz6suke4NrLwTN528RLAkbovauewbBktpft
 qzYdUkF1gGgsrlK5fTKA9QwkJ06hmYzAsZGtF98+HTmPDkTP5kPqPCC7e5tQxyYBk1eSoun
 D5yJAUyUQqxFx2coa3PGA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:T3YMVgkBtns=:Q38pL7kieZqnxlSv8MhDCc
 HzuBmu1NfrBnJZ1bCRQ5XHGHLsdreJLDfB0lZAT8pJLpH7yUWwt1EyZePdIEMivySR8cbH85A
 FxjcqGLPu5SuXPjT/WBm90UGH7tIgYR53DOH2ghz39KjXGDUkxyqTPyVDe2+ySUhptHX5zT+X
 qt/C68uvICZTT+exSpkUDeoYSSpLENas6NJWTrj7MFo20WdjJDCXfYKoDqFi3U2GyOooP+iw5
 gv7eEx7HthnNC5RyxzMGLu5VDNQfOTD9d24rSd/DQt3Tfzw52DHTjKXF7+S4Yy+Y9zH/1XDPK
 fCgXQuluOL+ZywOu5MytzajXaIH0KKdWYdoIWu9InJdwQszl/sctgIWItoBNMIH/fENKU4omW
 LWR3Ao8q+IeNaRrK6lwkrX4PHMDQ7jwDeCoVV5cPYSORX7Eg/0eFi1yPjkpsEGVQawaKSsquq
 SzZ27M/AVzWUuLS9NMFotuZGYEPBUyC/n1Bvz+3K9YI77kmliUrdrNWigrpNTG3zM/iZKkidF
 W0QD4BsOTKHmqK6HvIQoYg=
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 16/04/2021 à 19:13, Thomas Huth a écrit :
> Stop including exec/address-spaces.h in files that don't need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/kvm/kvm-all.c               | 1 -
>  accel/tcg/cputlb.c                | 1 -
>  hw/acpi/generic_event_device.c    | 1 -
>  hw/acpi/ich9.c                    | 1 -
>  hw/acpi/pcihp.c                   | 1 -
>  hw/acpi/piix4.c                   | 1 -
>  hw/alpha/typhoon.c                | 1 -
>  hw/arm/allwinner-a10.c            | 1 -
>  hw/arm/allwinner-h3.c             | 1 -
>  hw/arm/armv7m.c                   | 1 -
>  hw/arm/aspeed.c                   | 1 -
>  hw/arm/aspeed_ast2600.c           | 1 -
>  hw/arm/aspeed_soc.c               | 1 -
>  hw/arm/boot.c                     | 1 -
>  hw/arm/cubieboard.c               | 1 -
>  hw/arm/digic_boards.c             | 1 -
>  hw/arm/fsl-imx25.c                | 1 -
>  hw/arm/highbank.c                 | 1 -
>  hw/arm/imx25_pdk.c                | 1 -
>  hw/arm/musicpal.c                 | 1 -
>  hw/arm/npcm7xx.c                  | 1 -
>  hw/arm/npcm7xx_boards.c           | 1 -
>  hw/arm/nrf51_soc.c                | 1 -
>  hw/arm/nseries.c                  | 1 -
>  hw/arm/palm.c                     | 1 -
>  hw/arm/realview.c                 | 1 -
>  hw/arm/sbsa-ref.c                 | 1 -
>  hw/arm/smmu-common.c              | 1 -
>  hw/arm/smmuv3.c                   | 1 -
>  hw/arm/versatilepb.c              | 1 -
>  hw/arm/vexpress.c                 | 1 -
>  hw/arm/virt.c                     | 1 -
>  hw/arm/xilinx_zynq.c              | 1 -
>  hw/arm/xlnx-versal-virt.c         | 1 -
>  hw/arm/xlnx-zynqmp.c              | 1 -
>  hw/char/mchp_pfsoc_mmuart.c       | 1 -
>  hw/core/loader.c                  | 1 -
>  hw/cris/axis_dev88.c              | 1 -
>  hw/dma/pl080.c                    | 1 -
>  hw/hppa/dino.c                    | 1 -
>  hw/hppa/lasi.c                    | 1 -
>  hw/i386/intel_iommu.c             | 1 -
>  hw/i386/pc.c                      | 1 -
>  hw/i386/pc_piix.c                 | 1 -
>  hw/i386/pc_q35.c                  | 1 -
>  hw/i386/xen/xen-hvm.c             | 1 -
>  hw/i386/xen/xen_platform.c        | 1 -
>  hw/intc/openpic_kvm.c             | 1 -
>  hw/isa/lpc_ich9.c                 | 1 -
>  hw/isa/vt82c686.c                 | 1 -
>  hw/lm32/lm32_boards.c             | 1 -
>  hw/lm32/milkymist.c               | 1 -
>  hw/m68k/an5206.c                  | 1 -
>  hw/m68k/mcf5208.c                 | 1 -
>  hw/m68k/next-cube.c               | 1 -
>  hw/m68k/next-kbd.c                | 1 -
>  hw/m68k/q800.c                    | 1 -
>  hw/m68k/virt.c                    | 1 -
>  hw/mem/sparse-mem.c               | 1 -
>  hw/mips/boston.c                  | 1 -
>  hw/mips/fuloong2e.c               | 1 -
>  hw/mips/gt64xxx_pci.c             | 1 -
>  hw/mips/jazz.c                    | 1 -
>  hw/mips/loongson3_virt.c          | 1 -
>  hw/mips/malta.c                   | 1 -
>  hw/mips/mipssim.c                 | 1 -
>  hw/moxie/moxiesim.c               | 1 -
>  hw/net/msf2-emac.c                | 1 -
>  hw/nvram/nrf51_nvm.c              | 1 -
>  hw/openrisc/openrisc_sim.c        | 1 -
>  hw/pci-host/bonito.c              | 1 -
>  hw/pci-host/ppce500.c             | 1 -
>  hw/pci-host/prep.c                | 1 -
>  hw/pci-host/sabre.c               | 1 -
>  hw/pci-host/sh_pci.c              | 1 -
>  hw/pci/pci.c                      | 1 -
>  hw/pci/pcie_host.c                | 1 -
>  hw/ppc/e500.c                     | 1 -
>  hw/ppc/mac_newworld.c             | 1 -
>  hw/ppc/mac_oldworld.c             | 1 -
>  hw/ppc/pnv.c                      | 1 -
>  hw/ppc/pnv_psi.c                  | 1 -
>  hw/ppc/ppc405_boards.c            | 1 -
>  hw/ppc/ppc440_bamboo.c            | 1 -
>  hw/ppc/ppc440_pcix.c              | 1 -
>  hw/ppc/ppc440_uc.c                | 1 -
>  hw/ppc/ppc4xx_pci.c               | 1 -
>  hw/ppc/prep.c                     | 1 -
>  hw/ppc/sam460ex.c                 | 1 -
>  hw/ppc/spapr.c                    | 1 -
>  hw/ppc/spapr_iommu.c              | 1 -
>  hw/ppc/spapr_pci.c                | 1 -
>  hw/ppc/virtex_ml507.c             | 1 -
>  hw/remote/machine.c               | 1 -
>  hw/remote/memory.c                | 1 -
>  hw/remote/proxy-memory-listener.c | 1 -
>  hw/riscv/opentitan.c              | 1 -
>  hw/riscv/sifive_e.c               | 1 -
>  hw/rtc/m48t59.c                   | 1 -
>  hw/rtc/mc146818rtc.c              | 1 -
>  hw/s390x/s390-virtio-ccw.c        | 1 -
>  hw/sh4/r2d.c                      | 1 -
>  hw/sh4/shix.c                     | 1 -
>  hw/sparc/leon3.c                  | 1 -
>  hw/sparc64/niagara.c              | 1 -
>  hw/ssi/aspeed_smc.c               | 1 -
>  hw/tpm/tpm_crb.c                  | 1 -
>  hw/tricore/tc27x_soc.c            | 1 -
>  hw/tricore/triboard.c             | 1 -
>  hw/tricore/tricore_testboard.c    | 1 -
>  hw/virtio/vhost.c                 | 1 -
>  hw/virtio/virtio.c                | 1 -
>  hw/xen/xen_pt.c                   | 1 -
>  hw/xtensa/sim.c                   | 1 -
>  hw/xtensa/virt.c                  | 1 -
>  hw/xtensa/xtfpga.c                | 1 -
>  softmmu/memory.c                  | 1 -
>  softmmu/physmem.c                 | 1 -
>  target/i386/hvf/hvf.c             | 1 -
>  target/i386/hvf/x86_mmu.c         | 1 -
>  target/i386/sev.c                 | 1 -
>  target/s390x/diag.c               | 1 -
>  target/xtensa/op_helper.c         | 1 -
>  tests/qtest/fuzz/generic_fuzz.c   | 2 --
>  tests/qtest/fuzz/qos_fuzz.c       | 1 -
>  125 files changed, 126 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index f42b743977..e51ff2f611 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -33,7 +33,6 @@
>  #include "qemu/bswap.h"
>  #include "exec/memory.h"
>  #include "exec/ram_addr.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/event_notifier.h"
>  #include "qemu/main-loop.h"
>  #include "trace.h"
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 502f803e5e..84e7d91a5c 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -22,7 +22,6 @@
>  #include "hw/core/tcg-cpu-ops.h"
>  #include "exec/exec-all.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "exec/cpu_ldst.h"
>  #include "exec/cputlb.h"
>  #include "exec/tb-hash.h"
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 5454be67d5..39c825763a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -11,7 +11,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/irq.h"
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 853447cf9d..4daa79ec8d 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -35,7 +35,6 @@
>  #include "sysemu/runstate.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/tco.h"
> -#include "exec/address-spaces.h"
>  
>  #include "hw/i386/ich9.h"
>  #include "hw/mem/pc-dimm.h"
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index f4cb3c979d..4999277d57 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -31,7 +31,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bridge.h"
>  #include "hw/acpi/acpi.h"
> -#include "exec/address-spaces.h"
>  #include "hw/pci/pci_bus.h"
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 8f8b0e95e5..0bd23d74e2 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -33,7 +33,6 @@
>  #include "sysemu/xen.h"
>  #include "qapi/error.h"
>  #include "qemu/range.h"
> -#include "exec/address-spaces.h"
>  #include "hw/acpi/pcihp.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "hw/acpi/cpu.h"
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index 96c35c5fdb..87020cbe0d 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -13,7 +13,6 @@
>  #include "cpu.h"
>  #include "hw/irq.h"
>  #include "alpha_sys.h"
> -#include "exec/address-spaces.h"
>  #include "qom/object.h"
>  
>  
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index 0844a65641..05e84728cb 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -16,7 +16,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
>  #include "hw/sysbus.h"
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index bbe65d1860..27f1070145 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -18,7 +18,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index caeed29670..af0d935bf7 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -18,7 +18,6 @@
>  #include "sysemu/reset.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> -#include "exec/address-spaces.h"
>  #include "target/arm/idau.h"
>  
>  /* Bitbanded IO.  Each word corresponds to a single bit.  */
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 7480533cb7..b623226cdf 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -11,7 +11,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 8e4ef07b14..8202b4f174 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -9,7 +9,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/char/serial.h"
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index fc270daa57..abc90ed8ec 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
>  #include "hw/char/serial.h"
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index e56c42ac22..d7b059225e 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -25,7 +25,6 @@
>  #include "sysemu/device_tree.h"
>  #include "qemu/config-file.h"
>  #include "qemu/option.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/units.h"
>  
>  /* Kernel boot protocol is specified in the kernel docs
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index d7184e5ec2..294ba5de6e 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -16,7 +16,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index fdb6781567..b771a3d8b7 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -28,7 +28,6 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "hw/boards.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/digic.h"
>  #include "hw/block/flash.h"
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index dafc0bef47..24c4374590 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -26,7 +26,6 @@
>  #include "qapi/error.h"
>  #include "hw/arm/fsl-imx25.h"
>  #include "sysemu/sysemu.h"
> -#include "exec/address-spaces.h"
>  #include "hw/qdev-properties.h"
>  #include "chardev/char.h"
>  
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index bf886268c5..7a85a34a39 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -29,7 +29,6 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "hw/char/pl011.h"
>  #include "hw/ide/ahci.h"
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 9c58fbde57..11426e5ec0 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -29,7 +29,6 @@
>  #include "hw/arm/fsl-imx25.h"
>  #include "hw/boards.h"
>  #include "qemu/error-report.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/qtest.h"
>  #include "hw/i2c/i2c.h"
>  #include "qemu/cutils.h"
> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
> index 7d67dc7254..2d612cc0c9 100644
> --- a/hw/arm/musicpal.c
> +++ b/hw/arm/musicpal.c
> @@ -31,7 +31,6 @@
>  #include "sysemu/block-backend.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/dma.h"
> -#include "exec/address-spaces.h"
>  #include "ui/pixel_ops.h"
>  #include "qemu/cutils.h"
>  #include "qom/object.h"
> diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
> index 495b0f8e91..2ab0080e0b 100644
> --- a/hw/arm/npcm7xx.c
> +++ b/hw/arm/npcm7xx.c
> @@ -16,7 +16,6 @@
>  
>  #include "qemu/osdep.h"
>  
> -#include "exec/address-spaces.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/npcm7xx.h"
>  #include "hw/char/serial.h"
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index d91d687700..d4553e3786 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -16,7 +16,6 @@
>  
>  #include "qemu/osdep.h"
>  
> -#include "exec/address-spaces.h"
>  #include "hw/arm/npcm7xx.h"
>  #include "hw/core/cpu.h"
>  #include "hw/i2c/smbus_eeprom.h"
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index 71bdcf06b4..9407c2f268 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -13,7 +13,6 @@
>  #include "hw/arm/boot.h"
>  #include "hw/sysbus.h"
>  #include "hw/misc/unimp.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/log.h"
>  
>  #include "hw/arm/nrf51.h"
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 387eea4d44..0aefa5d0f3 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -43,7 +43,6 @@
>  #include "hw/loader.h"
>  #include "hw/sysbus.h"
>  #include "qemu/log.h"
> -#include "exec/address-spaces.h"
>  
>  /* Nokia N8x0 support */
>  struct n800_s {
> diff --git a/hw/arm/palm.c b/hw/arm/palm.c
> index 4e3dc5fbbf..68e11dd1ec 100644
> --- a/hw/arm/palm.c
> +++ b/hw/arm/palm.c
> @@ -29,7 +29,6 @@
>  #include "hw/input/tsc2xxx.h"
>  #include "hw/irq.h"
>  #include "hw/loader.h"
> -#include "exec/address-spaces.h"
>  #include "cpu.h"
>  #include "qemu/cutils.h"
>  #include "qom/object.h"
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 0831159d15..1c54316ba3 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -20,7 +20,6 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/i2c.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "hw/char/pl011.h"
>  #include "hw/cpu/a9mpcore.h"
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 88dfb2284c..43c19b4923 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -27,7 +27,6 @@
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> -#include "exec/address-spaces.h"
>  #include "exec/hwaddr.h"
>  #include "kvm_arm.h"
>  #include "hw/arm/boot.h"
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 84d2c62c26..0459850a93 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -17,7 +17,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  #include "exec/target_page.h"
>  #include "hw/core/cpu.h"
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 8705612535..5b51ca2dd6 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -23,7 +23,6 @@
>  #include "migration/vmstate.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
> -#include "exec/address-spaces.h"
>  #include "cpu.h"
>  #include "trace.h"
>  #include "qemu/log.h"
> diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
> index 1ea5534626..575399c4fc 100644
> --- a/hw/arm/versatilepb.c
> +++ b/hw/arm/versatilepb.c
> @@ -21,7 +21,6 @@
>  #include "hw/i2c/arm_sbcon_i2c.h"
>  #include "hw/irq.h"
>  #include "hw/boards.h"
> -#include "exec/address-spaces.h"
>  #include "hw/block/flash.h"
>  #include "qemu/error-report.h"
>  #include "hw/char/pl011.h"
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 326a1a6db5..58481c0762 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -35,7 +35,6 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> -#include "exec/address-spaces.h"
>  #include "hw/block/flash.h"
>  #include "sysemu/device_tree.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 300b3b18be..3415d55c99 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -50,7 +50,6 @@
>  #include "sysemu/tpm.h"
>  #include "sysemu/kvm.h"
>  #include "hw/loader.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 8db6cfd47f..85f25d15db 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -22,7 +22,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "net/net.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/block/flash.h"
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index 73e8268b35..5bca360dce 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -13,7 +13,6 @@
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "sysemu/device_tree.h"
> -#include "exec/address-spaces.h"
>  #include "hw/boards.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/sysbus-fdt.h"
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 6c93dcb820..3597e8db4d 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -21,7 +21,6 @@
>  #include "hw/arm/xlnx-zynqmp.h"
>  #include "hw/intc/arm_gic_common.h"
>  #include "hw/boards.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/sysemu.h"
>  #include "kvm_arm.h"
> diff --git a/hw/char/mchp_pfsoc_mmuart.c b/hw/char/mchp_pfsoc_mmuart.c
> index 8a002b0a19..2facf85c2d 100644
> --- a/hw/char/mchp_pfsoc_mmuart.c
> +++ b/hw/char/mchp_pfsoc_mmuart.c
> @@ -23,7 +23,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "chardev/char.h"
> -#include "exec/address-spaces.h"
>  #include "hw/char/mchp_pfsoc_mmuart.h"
>  
>  static uint64_t mchp_pfsoc_mmuart_read(void *opaque, hwaddr addr, unsigned size)
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index d3e5f3b423..5b34869a54 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -57,7 +57,6 @@
>  #include "hw/loader.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "hw/boards.h"
>  #include "qemu/cutils.h"
>  #include "sysemu/runstate.h"
> diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
> index af5a0e3517..d82050d927 100644
> --- a/hw/cris/axis_dev88.c
> +++ b/hw/cris/axis_dev88.c
> @@ -34,7 +34,6 @@
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "boot.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/sysemu.h"
>  
> diff --git a/hw/dma/pl080.c b/hw/dma/pl080.c
> index f1a586b1d7..2627307cc8 100644
> --- a/hw/dma/pl080.c
> +++ b/hw/dma/pl080.c
> @@ -10,7 +10,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/dma/pl080.h"
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index bd97e0c51d..eab96dd84e 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -19,7 +19,6 @@
>  #include "hw/pci/pci_bus.h"
>  #include "migration/vmstate.h"
>  #include "hppa_sys.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
> index 408af9ccb7..88c3791eb6 100644
> --- a/hw/hppa/lasi.c
> +++ b/hw/hppa/lasi.c
> @@ -22,7 +22,6 @@
>  #include "hw/char/parallel.h"
>  #include "hw/char/serial.h"
>  #include "hw/input/lasips2.h"
> -#include "exec/address-spaces.h"
>  #include "migration/vmstate.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 1c10643432..209b3f5553 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -24,7 +24,6 @@
>  #include "qemu/main-loop.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
> -#include "exec/address-spaces.h"
>  #include "intel_iommu_internal.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index b5ce3835e7..7d80c505a9 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -65,7 +65,6 @@
>  #include "hw/xen/start_info.h"
>  #include "ui/qemu-spice.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/arch_init.h"
>  #include "qemu/bitmap.h"
>  #include "qemu/config-file.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 6d6cd65dcd..8404d9803e 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -47,7 +47,6 @@
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/xen/xen-x86.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "hw/acpi/acpi.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 53450190f5..b76969fc25 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -38,7 +38,6 @@
>  #include "hw/kvm/clock.h"
>  #include "hw/pci-host/q35.h"
>  #include "hw/qdev-properties.h"
> -#include "exec/address-spaces.h"
>  #include "hw/i386/x86.h"
>  #include "hw/i386/pc.h"
>  #include "hw/i386/ich9.h"
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 7ce672e5a5..c53fa17c50 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -33,7 +33,6 @@
>  #include "sysemu/xen.h"
>  #include "sysemu/xen-mapcache.h"
>  #include "trace.h"
> -#include "exec/address-spaces.h"
>  
>  #include <xen/hvm/ioreq.h>
>  #include <xen/hvm/e820.h>
> diff --git a/hw/i386/xen/xen_platform.c b/hw/i386/xen/xen_platform.c
> index bf4f20e92b..72028449ba 100644
> --- a/hw/i386/xen/xen_platform.c
> +++ b/hw/i386/xen/xen_platform.c
> @@ -31,7 +31,6 @@
>  #include "migration/vmstate.h"
>  #include "hw/xen/xen-legacy-backend.h"
>  #include "trace.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/xen.h"
>  #include "sysemu/block-backend.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
> index 16badace8b..21da680389 100644
> --- a/hw/intc/openpic_kvm.c
> +++ b/hw/intc/openpic_kvm.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include <sys/ioctl.h>
> -#include "exec/address-spaces.h"
>  #include "hw/ppc/openpic.h"
>  #include "hw/ppc/openpic_kvm.h"
>  #include "hw/pci/msi.h"
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 160bea447a..5f9de0239c 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -44,7 +44,6 @@
>  #include "hw/acpi/ich9.h"
>  #include "hw/pci/pci_bus.h"
>  #include "hw/qdev-properties.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/core/cpu.h"
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 98325bb32b..31b1818b21 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -30,7 +30,6 @@
>  #include "qemu/module.h"
>  #include "qemu/range.h"
>  #include "qemu/timer.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  
>  #define TYPE_VIA_PM "via-pm"
> diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
> index b5d97dd53e..2961e4c2b4 100644
> --- a/hw/lm32/lm32_boards.c
> +++ b/hw/lm32/lm32_boards.c
> @@ -30,7 +30,6 @@
>  #include "elf.h"
>  #include "lm32_hwsetup.h"
>  #include "lm32.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/sysemu.h"
>  
> diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
> index 72d1326531..bef7855328 100644
> --- a/hw/lm32/milkymist.c
> +++ b/hw/lm32/milkymist.c
> @@ -37,7 +37,6 @@
>  #include "hw/display/milkymist_tmu2.h"
>  #include "hw/sd/sd.h"
>  #include "lm32.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/cutils.h"
>  
>  #define BIOS_FILENAME    "mmone-bios.bin"
> diff --git a/hw/m68k/an5206.c b/hw/m68k/an5206.c
> index 673898b0ea..11ae4c9795 100644
> --- a/hw/m68k/an5206.c
> +++ b/hw/m68k/an5206.c
> @@ -13,7 +13,6 @@
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
>  
> diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
> index 7a03c71059..93812ee206 100644
> --- a/hw/m68k/mcf5208.c
> +++ b/hw/m68k/mcf5208.c
> @@ -26,7 +26,6 @@
>  #include "hw/loader.h"
>  #include "hw/sysbus.h"
>  #include "elf.h"
> -#include "exec/address-spaces.h"
>  
>  #define SYS_FREQ 166666666
>  
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index 5bd4f2d832..de951ffe5d 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -11,7 +11,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "exec/hwaddr.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "hw/irq.h"
> diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
> index 30a8c9fbfa..0544160e91 100644
> --- a/hw/m68k/next-kbd.c
> +++ b/hw/m68k/next-kbd.c
> @@ -29,7 +29,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> -#include "exec/address-spaces.h"
>  #include "hw/sysbus.h"
>  #include "hw/m68k/next-cube.h"
>  #include "ui/console.h"
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index d1ab1ff77d..11376daa85 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -31,7 +31,6 @@
>  #include "elf.h"
>  #include "hw/loader.h"
>  #include "ui/console.h"
> -#include "exec/address-spaces.h"
>  #include "hw/char/escc.h"
>  #include "hw/sysbus.h"
>  #include "hw/scsi/esp.h"
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index 9469f82800..4e8bce5aa6 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -17,7 +17,6 @@
>  #include "elf.h"
>  #include "hw/loader.h"
>  #include "ui/console.h"
> -#include "exec/address-spaces.h"
>  #include "hw/sysbus.h"
>  #include "standard-headers/asm-m68k/bootinfo.h"
>  #include "standard-headers/asm-m68k/bootinfo-virt.h"
> diff --git a/hw/mem/sparse-mem.c b/hw/mem/sparse-mem.c
> index a13ac74dd9..e6640eb8e7 100644
> --- a/hw/mem/sparse-mem.c
> +++ b/hw/mem/sparse-mem.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  
> -#include "exec/address-spaces.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "qapi/error.h"
> diff --git a/hw/mips/boston.c b/hw/mips/boston.c
> index ac2e93a05a..20b06865b2 100644
> --- a/hw/mips/boston.c
> +++ b/hw/mips/boston.c
> @@ -20,7 +20,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  
> -#include "exec/address-spaces.h"
>  #include "hw/boards.h"
>  #include "hw/char/serial.h"
>  #include "hw/ide/pci.h"
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index 1851eb0944..c1b8066a13 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -38,7 +38,6 @@
>  #include "hw/qdev-properties.h"
>  #include "elf.h"
>  #include "hw/isa/vt82c686.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/mips/gt64xxx_pci.c b/hw/mips/gt64xxx_pci.c
> index 43349d6837..c7480bd019 100644
> --- a/hw/mips/gt64xxx_pci.c
> +++ b/hw/mips/gt64xxx_pci.c
> @@ -33,7 +33,6 @@
>  #include "migration/vmstate.h"
>  #include "hw/intc/i8259.h"
>  #include "hw/irq.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
> index 1a0888a0fd..dba2088ed1 100644
> --- a/hw/mips/jazz.c
> +++ b/hw/mips/jazz.c
> @@ -47,7 +47,6 @@
>  #include "hw/audio/pcspk.h"
>  #include "hw/input/i8042.h"
>  #include "hw/sysbus.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
>  #include "qapi/error.h"
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index 16f7f84d34..ae192db0c8 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -47,7 +47,6 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/usb.h"
>  #include "net/net.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 459791414a..7dcf175d72 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -45,7 +45,6 @@
>  #include "hw/irq.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> -#include "exec/address-spaces.h"
>  #include "qom/object.h"
>  #include "hw/sysbus.h"             /* SysBusDevice */
>  #include "qemu/host-utils.h"
> diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
> index 2e0d4aceed..2325e7e05a 100644
> --- a/hw/mips/mipssim.c
> +++ b/hw/mips/mipssim.c
> @@ -42,7 +42,6 @@
>  #include "elf.h"
>  #include "hw/sysbus.h"
>  #include "hw/qdev-properties.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
> diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
> index 196b730589..3d255d4879 100644
> --- a/hw/moxie/moxiesim.c
> +++ b/hw/moxie/moxiesim.c
> @@ -35,7 +35,6 @@
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/char/serial.h"
> -#include "exec/address-spaces.h"
>  #include "elf.h"
>  
>  #define PHYS_MEM_BASE 0x80000000
> diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> index 3e6206044f..9278fdce0b 100644
> --- a/hw/net/msf2-emac.c
> +++ b/hw/net/msf2-emac.c
> @@ -32,7 +32,6 @@
>  #include "qemu-common.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "hw/registerfields.h"
>  #include "hw/net/msf2-emac.h"
>  #include "hw/net/mii.h"
> diff --git a/hw/nvram/nrf51_nvm.c b/hw/nvram/nrf51_nvm.c
> index 7b3460d52d..7f1db8c423 100644
> --- a/hw/nvram/nrf51_nvm.c
> +++ b/hw/nvram/nrf51_nvm.c
> @@ -21,7 +21,6 @@
>  #include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> -#include "exec/address-spaces.h"
>  #include "hw/arm/nrf51.h"
>  #include "hw/nvram/nrf51_nvm.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
> index 39f1d344ae..73fe383c2d 100644
> --- a/hw/openrisc/openrisc_sim.c
> +++ b/hw/openrisc/openrisc_sim.c
> @@ -29,7 +29,6 @@
>  #include "net/net.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/qtest.h"
> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
> index 2a2db7cea6..afb3d1f81d 100644
> --- a/hw/pci-host/bonito.c
> +++ b/hw/pci-host/bonito.c
> @@ -49,7 +49,6 @@
>  #include "migration/vmstate.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -#include "exec/address-spaces.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/registerfields.h"
>  #include "qom/object.h"
> diff --git a/hw/pci-host/ppce500.c b/hw/pci-host/ppce500.c
> index 5ad1424b31..89c1b53dd7 100644
> --- a/hw/pci-host/ppce500.c
> +++ b/hw/pci-host/ppce500.c
> @@ -415,7 +415,6 @@ static const VMStateDescription vmstate_ppce500_pci = {
>      }
>  };
>  
> -#include "exec/address-spaces.h"
>  
>  static void e500_pcihost_bridge_realize(PCIDevice *d, Error **errp)
>  {
> diff --git a/hw/pci-host/prep.c b/hw/pci-host/prep.c
> index 0a9162fba9..9fef74fc56 100644
> --- a/hw/pci-host/prep.c
> +++ b/hw/pci-host/prep.c
> @@ -38,7 +38,6 @@
>  #include "hw/irq.h"
>  #include "hw/loader.h"
>  #include "hw/or-irq.h"
> -#include "exec/address-spaces.h"
>  #include "elf.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/pci-host/sabre.c b/hw/pci-host/sabre.c
> index f41a0cc301..949ecc21f2 100644
> --- a/hw/pci-host/sabre.c
> +++ b/hw/pci-host/sabre.c
> @@ -34,7 +34,6 @@
>  #include "hw/irq.h"
>  #include "hw/pci-bridge/simba.h"
>  #include "hw/pci-host/sabre.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> diff --git a/hw/pci-host/sh_pci.c b/hw/pci-host/sh_pci.c
> index 734892f47c..08c1562e22 100644
> --- a/hw/pci-host/sh_pci.c
> +++ b/hw/pci-host/sh_pci.c
> @@ -30,7 +30,6 @@
>  #include "hw/pci/pci_host.h"
>  #include "qemu/bswap.h"
>  #include "qemu/module.h"
> -#include "exec/address-spaces.h"
>  #include "qom/object.h"
>  
>  #define TYPE_SH_PCI_HOST_BRIDGE "sh_pci"
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 8f35e13a0c..377084f1a8 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -45,7 +45,6 @@
>  #include "trace.h"
>  #include "hw/pci/msi.h"
>  #include "hw/pci/msix.h"
> -#include "exec/address-spaces.h"
>  #include "hw/hotplug.h"
>  #include "hw/boards.h"
>  #include "qapi/error.h"
> diff --git a/hw/pci/pcie_host.c b/hw/pci/pcie_host.c
> index 3534006f99..5abbe83220 100644
> --- a/hw/pci/pcie_host.c
> +++ b/hw/pci/pcie_host.c
> @@ -23,7 +23,6 @@
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pcie_host.h"
>  #include "qemu/module.h"
> -#include "exec/address-spaces.h"
>  
>  /* a helper function to get a PCIDevice for a given mmconfig address */
>  static inline PCIDevice *pcie_dev_find_by_mmcfg_addr(PCIBus *s,
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 03b3bd322f..95451414dd 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -38,7 +38,6 @@
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "hw/sysbus.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/option.h"
>  #include "hw/pci-host/ppce500.h"
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 9659857dba..f24abf71af 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -70,7 +70,6 @@
>  #include "sysemu/reset.h"
>  #include "kvm_ppc.h"
>  #include "hw/usb.h"
> -#include "exec/address-spaces.h"
>  #include "hw/sysbus.h"
>  #include "trace.h"
>  
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 95d3d95158..de2be960e6 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -48,7 +48,6 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
>  #include "kvm_ppc.h"
> -#include "exec/address-spaces.h"
>  
>  #define MAX_IDE_BUS 2
>  #define CFG_ADDR 0xf0000510
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 22b1c4f1f3..ffe01977cd 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -38,7 +38,6 @@
>  #include "hw/ppc/pnv_core.h"
>  #include "hw/loader.h"
>  #include "hw/nmi.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/visitor.h"
>  #include "monitor/monitor.h"
>  #include "hw/intc/intc.h"
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index 3e868c8c8d..382ac20fa6 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -26,7 +26,6 @@
>  #include "qapi/error.h"
>  #include "monitor/monitor.h"
>  
> -#include "exec/address-spaces.h"
>  
>  #include "hw/ppc/fdt.h"
>  #include "hw/ppc/pnv.h"
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 8da7bc7af9..972a7a4a3e 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -40,7 +40,6 @@
>  #include "hw/boards.h"
>  #include "qemu/error-report.h"
>  #include "hw/loader.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/cutils.h"
>  
>  #define BIOS_FILENAME "ppc405_rom.bin"
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index b7539aa721..7fb620b9a0 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -25,7 +25,6 @@
>  #include "sysemu/device_tree.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> -#include "exec/address-spaces.h"
>  #include "hw/char/serial.h"
>  #include "hw/ppc/ppc.h"
>  #include "ppc405.h"
> diff --git a/hw/ppc/ppc440_pcix.c b/hw/ppc/ppc440_pcix.c
> index 91cbcd0504..788d25514a 100644
> --- a/hw/ppc/ppc440_pcix.c
> +++ b/hw/ppc/ppc440_pcix.c
> @@ -28,7 +28,6 @@
>  #include "hw/ppc/ppc4xx.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 96a1fe06c3..993e3ba955 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -15,7 +15,6 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "hw/irq.h"
> -#include "exec/address-spaces.h"
>  #include "exec/memory.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index e8789f64e8..8147ba6f94 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -28,7 +28,6 @@
>  #include "sysemu/reset.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index e8dc128308..acfc2a91d8 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -43,7 +43,6 @@
>  #include "sysemu/arch_init.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  #include "elf.h"
>  #include "qemu/units.h"
> diff --git a/hw/ppc/sam460ex.c b/hw/ppc/sam460ex.c
> index 0c6baf77e8..0737234d66 100644
> --- a/hw/ppc/sam460ex.c
> +++ b/hw/ppc/sam460ex.c
> @@ -24,7 +24,6 @@
>  #include "sysemu/block-backend.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> -#include "exec/address-spaces.h"
>  #include "exec/memory.h"
>  #include "ppc440.h"
>  #include "ppc405.h"
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 89e0e60446..7aaa6f3c8a 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -69,7 +69,6 @@
>  #include "hw/virtio/virtio-scsi.h"
>  #include "hw/virtio/vhost-scsi-common.h"
>  
> -#include "exec/address-spaces.h"
>  #include "exec/ram_addr.h"
>  #include "hw/usb.h"
>  #include "qemu/config-file.h"
> diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
> index 24537ffcbd..db01071858 100644
> --- a/hw/ppc/spapr_iommu.c
> +++ b/hw/ppc/spapr_iommu.c
> @@ -25,7 +25,6 @@
>  #include "kvm_ppc.h"
>  #include "migration/vmstate.h"
>  #include "sysemu/dma.h"
> -#include "exec/address-spaces.h"
>  #include "trace.h"
>  
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 4effe23a18..7a725855f9 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -34,7 +34,6 @@
>  #include "hw/pci/pci_host.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/pci-host/spapr.h"
> -#include "exec/address-spaces.h"
>  #include "exec/ram_addr.h"
>  #include <libfdt.h>
>  #include "trace.h"
> diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
> index 3a57604ac0..9c575403b8 100644
> --- a/hw/ppc/virtex_ml507.c
> +++ b/hw/ppc/virtex_ml507.c
> @@ -39,7 +39,6 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
> -#include "exec/address-spaces.h"
>  
>  #include "hw/intc/ppc-uic.h"
>  #include "hw/ppc/ppc.h"
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index c0ab4f528a..952105eab5 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -17,7 +17,6 @@
>  #include "qemu-common.h"
>  
>  #include "hw/remote/machine.h"
> -#include "exec/address-spaces.h"
>  #include "exec/memory.h"
>  #include "qapi/error.h"
>  #include "hw/pci/pci_host.h"
> diff --git a/hw/remote/memory.c b/hw/remote/memory.c
> index 32085b1e05..2d4174614a 100644
> --- a/hw/remote/memory.c
> +++ b/hw/remote/memory.c
> @@ -12,7 +12,6 @@
>  #include "qemu-common.h"
>  
>  #include "hw/remote/memory.h"
> -#include "exec/address-spaces.h"
>  #include "exec/ram_addr.h"
>  #include "qapi/error.h"
>  
> diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
> index 3649919f66..901dbf1357 100644
> --- a/hw/remote/proxy-memory-listener.c
> +++ b/hw/remote/proxy-memory-listener.c
> @@ -15,7 +15,6 @@
>  #include "exec/memory.h"
>  #include "exec/cpu-common.h"
>  #include "exec/ram_addr.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "hw/remote/mpqemu-link.h"
>  #include "hw/remote/proxy-memory-listener.h"
> diff --git a/hw/riscv/opentitan.c b/hw/riscv/opentitan.c
> index e168bffe69..dc9dea117e 100644
> --- a/hw/riscv/opentitan.c
> +++ b/hw/riscv/opentitan.c
> @@ -24,7 +24,6 @@
>  #include "hw/boards.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/riscv/boot.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/units.h"
>  #include "sysemu/sysemu.h"
>  
> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
> index 97e8b0b0a2..3e8b44b2c0 100644
> --- a/hw/riscv/sifive_e.c
> +++ b/hw/riscv/sifive_e.c
> @@ -47,7 +47,6 @@
>  #include "chardev/char.h"
>  #include "sysemu/arch_init.h"
>  #include "sysemu/sysemu.h"
> -#include "exec/address-spaces.h"
>  
>  static MemMapEntry sifive_e_memmap[] = {
>      [SIFIVE_E_DEV_DEBUG] =    {        0x0,     0x1000 },
> diff --git a/hw/rtc/m48t59.c b/hw/rtc/m48t59.c
> index d54929e861..690f4e071a 100644
> --- a/hw/rtc/m48t59.c
> +++ b/hw/rtc/m48t59.c
> @@ -32,7 +32,6 @@
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/sysbus.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "qemu/bcd.h"
>  #include "qemu/module.h"
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 5d0fcacd0c..36a2dbf62f 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -42,7 +42,6 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-misc-target.h"
>  #include "qapi/visitor.h"
> -#include "exec/address-spaces.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
>  
>  #ifdef TARGET_I386
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 41f10e3ff5..8002308a11 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -13,7 +13,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "exec/ram_addr.h"
>  #include "hw/s390x/s390-virtio-hcall.h"
>  #include "hw/s390x/sclp.h"
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 443820901d..006010f30a 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -42,7 +42,6 @@
>  #include "hw/loader.h"
>  #include "hw/usb.h"
>  #include "hw/block/flash.h"
> -#include "exec/address-spaces.h"
>  
>  #define FLASH_BASE 0x00000000
>  #define FLASH_SIZE (16 * MiB)
> diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
> index 1a44378df4..b0579aa0f1 100644
> --- a/hw/sh4/shix.c
> +++ b/hw/sh4/shix.c
> @@ -34,7 +34,6 @@
>  #include "sysemu/qtest.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  
>  #define BIOS_FILENAME "shix_bios.bin"
> diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
> index 7e16eea9e6..eb5d2a6792 100644
> --- a/hw/sparc/leon3.c
> +++ b/hw/sparc/leon3.c
> @@ -40,7 +40,6 @@
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "trace.h"
> -#include "exec/address-spaces.h"
>  
>  #include "hw/sparc/grlib.h"
>  #include "hw/misc/grlib_ahb_apb_pnp.h"
> diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
> index a87d55f6bb..f3e42d0326 100644
> --- a/hw/sparc64/niagara.c
> +++ b/hw/sparc64/niagara.c
> @@ -31,7 +31,6 @@
>  #include "hw/loader.h"
>  #include "hw/sparc/sparc64.h"
>  #include "hw/rtc/sun4v-rtc.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/block-backend.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index 16addee4dc..72cb2175c5 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -29,7 +29,6 @@
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/units.h"
>  #include "trace.h"
>  
> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
> index aa9c00aad3..58ebd1469c 100644
> --- a/hw/tpm/tpm_crb.c
> +++ b/hw/tpm/tpm_crb.c
> @@ -18,7 +18,6 @@
>  
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> -#include "exec/address-spaces.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/pci/pci_ids.h"
>  #include "hw/acpi/tpm.h"
> diff --git a/hw/tricore/tc27x_soc.c b/hw/tricore/tc27x_soc.c
> index d66d6980c3..ecd92717b5 100644
> --- a/hw/tricore/tc27x_soc.c
> +++ b/hw/tricore/tc27x_soc.c
> @@ -24,7 +24,6 @@
>  #include "hw/loader.h"
>  #include "qemu/units.h"
>  #include "hw/misc/unimp.h"
> -#include "exec/address-spaces.h"
>  
>  #include "hw/tricore/tc27x_soc.h"
>  #include "hw/tricore/triboard.h"
> diff --git a/hw/tricore/triboard.c b/hw/tricore/triboard.c
> index 943f706989..4dba0259cd 100644
> --- a/hw/tricore/triboard.c
> +++ b/hw/tricore/triboard.c
> @@ -24,7 +24,6 @@
>  #include "hw/qdev-properties.h"
>  #include "net/net.h"
>  #include "hw/loader.h"
> -#include "exec/address-spaces.h"
>  #include "elf.h"
>  #include "hw/tricore/tricore.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
> index 12ea1490fd..51658d9e37 100644
> --- a/hw/tricore/tricore_testboard.c
> +++ b/hw/tricore/tricore_testboard.c
> @@ -25,7 +25,6 @@
>  #include "net/net.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> -#include "exec/address-spaces.h"
>  #include "elf.h"
>  #include "hw/tricore/tricore.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index e2163a0d63..7b7bde7657 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -21,7 +21,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/memfd.h"
>  #include "standard-headers/linux/vhost_types.h"
> -#include "exec/address-spaces.h"
>  #include "hw/virtio/virtio-bus.h"
>  #include "hw/virtio/virtio-access.h"
>  #include "migration/blocker.h"
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 07f4e60b30..9e13cb9e3a 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -15,7 +15,6 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "trace.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "qemu/log.h"
>  #include "qemu/main-loop.h"
> diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
> index a513fdd62d..232482d65f 100644
> --- a/hw/xen/xen_pt.c
> +++ b/hw/xen/xen_pt.c
> @@ -64,7 +64,6 @@
>  #include "hw/xen/xen-legacy-backend.h"
>  #include "xen_pt.h"
>  #include "qemu/range.h"
> -#include "exec/address-spaces.h"
>  
>  static bool has_igd_gfx_passthru;
>  
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index c38e522b02..2028fe793d 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -33,7 +33,6 @@
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "xtensa_memory.h"
>  #include "xtensa_sim.h"
> diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
> index 18d3c3cdb2..a18e3fc910 100644
> --- a/hw/xtensa/virt.c
> +++ b/hw/xtensa/virt.c
> @@ -34,7 +34,6 @@
>  #include "net/net.h"
>  #include "elf.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "xtensa_memory.h"
>  #include "xtensa_sim.h"
> diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
> index 7be53f1895..17f087b395 100644
> --- a/hw/xtensa/xtfpga.c
> +++ b/hw/xtensa/xtfpga.c
> @@ -35,7 +35,6 @@
>  #include "hw/qdev-properties.h"
>  #include "elf.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "hw/char/serial.h"
>  #include "net/net.h"
>  #include "hw/sysbus.h"
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index a62816647b..3bb533c0bc 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -17,7 +17,6 @@
>  #include "qemu/log.h"
>  #include "qapi/error.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "qapi/visitor.h"
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 1821882614..5232696571 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -46,7 +46,6 @@
>  #include "sysemu/dma.h"
>  #include "sysemu/hostmem.h"
>  #include "sysemu/hw_accel.h"
> -#include "exec/address-spaces.h"
>  #include "sysemu/xen-mapcache.h"
>  #include "trace/trace-root.h"
>  
> diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
> index 15f14ac69e..f044181d06 100644
> --- a/target/i386/hvf/hvf.c
> +++ b/target/i386/hvf/hvf.c
> @@ -67,7 +67,6 @@
>  #include <Hypervisor/hv_vmx.h>
>  #include <sys/sysctl.h>
>  
> -#include "exec/address-spaces.h"
>  #include "hw/i386/apic_internal.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/accel.h"
> diff --git a/target/i386/hvf/x86_mmu.c b/target/i386/hvf/x86_mmu.c
> index 882a6237ee..78fff04684 100644
> --- a/target/i386/hvf/x86_mmu.c
> +++ b/target/i386/hvf/x86_mmu.c
> @@ -24,7 +24,6 @@
>  #include "x86_mmu.h"
>  #include "vmcs.h"
>  #include "vmx.h"
> -#include "exec/address-spaces.h"
>  
>  #define pte_present(pte) (pte & PT_PRESENT)
>  #define pte_write_access(pte) (pte & PT_WRITE)
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 72b9e2ab40..9a43be11cb 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -30,7 +30,6 @@
>  #include "trace.h"
>  #include "migration/blocker.h"
>  #include "qom/object.h"
> -#include "exec/address-spaces.h"
>  #include "monitor/monitor.h"
>  #include "exec/confidential-guest-support.h"
>  #include "hw/i386/pc.h"
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index 1a48429564..d620cd4bd4 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -15,7 +15,6 @@
>  #include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "internal.h"
> -#include "exec/address-spaces.h"
>  #include "hw/watchdog/wdt_diag288.h"
>  #include "sysemu/cpus.h"
>  #include "hw/s390x/ipl.h"
> diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
> index 143476849f..d85d3516d6 100644
> --- a/target/xtensa/op_helper.c
> +++ b/target/xtensa/op_helper.c
> @@ -32,7 +32,6 @@
>  #include "qemu/host-utils.h"
>  #include "exec/exec-all.h"
>  #include "exec/cpu_ldst.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/timer.h"
>  
>  #ifndef CONFIG_USER_ONLY
> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
> index ae219540b4..cea7d4058e 100644
> --- a/tests/qtest/fuzz/generic_fuzz.c
> +++ b/tests/qtest/fuzz/generic_fuzz.c
> @@ -19,11 +19,9 @@
>  #include "tests/qtest/libqos/pci-pc.h"
>  #include "fuzz.h"
>  #include "fork_fuzz.h"
> -#include "exec/address-spaces.h"
>  #include "string.h"
>  #include "exec/memory.h"
>  #include "exec/ramblock.h"
> -#include "exec/address-spaces.h"
>  #include "hw/qdev-core.h"
>  #include "hw/pci/pci.h"
>  #include "hw/boards.h"
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index 2bc474645c..7a244c951e 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -21,7 +21,6 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "exec/memory.h"
> -#include "exec/address-spaces.h"
>  #include "qemu/main-loop.h"
>  
>  #include "tests/qtest/libqos/libqtest.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


