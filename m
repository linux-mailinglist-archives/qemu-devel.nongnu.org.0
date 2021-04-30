Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A425736FE40
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:06:12 +0200 (CEST)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVed-0000JO-M7
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVYZ-0006kD-Fg; Fri, 30 Apr 2021 11:59:55 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:39297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVYR-0004Nc-HT; Fri, 30 Apr 2021 11:59:55 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mn2Jj-1lBwYj0qed-00k8MU; Fri, 30 Apr 2021 17:59:42 +0200
Subject: Re: [PATCH 3/4] Do not include cpu.h if it's not really necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-4-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <43c3b49d-bf74-4f36-10bf-699314b66ec2@vivier.eu>
Date: Fri, 30 Apr 2021 17:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416171314.2074665-4-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:hdWRfvlPvjiy7fnW1ovJkZoPPg5b0M35D9F0l3Jc9Ha/QrU5Y9S
 uKJh08vfKAK2P9SYetwBUk9EKlNh4uSBHNPKke+YXMdwHxKEkBe2Krl48QvuXjFltcOzqIQ
 r97BS+2RI3r5PtRSsJjy6tDn05FTs/EgBIpUEmjcFAVY/Y0U7Njg0QE4ayG1JmcrQKkZqqW
 sq5nWIxSf+X7Gbv6j5Bsw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ri/Sn6QVlrM=:dcpR5ZiiwBXadTNU3abVTa
 /B9JAbmnBBhCCoHUTKT4afeszSeifojLqmHqj75IoJJxOZQfdCu8ONEAomOT0uDFZ3qwNT/RD
 OYmnOm8KffU8W+t5biHJUDjwn394FbER0jArNF5LFPHYBiAOhoKQ/une+U4dnV0ssf6yVh56r
 EfEx49al1679Ph11bnnMP7QF8JD+4OuaeAvWoS/Hy2nCsZ7YvTHTe91JOPVE9xbOeloHVJiVt
 5kHNp0DoGEpZkmVSaSdlhbxqiq8aom2gWebZ7AfGVPj8dd2z93FfVUlsHAKBvHG34H4pskzJ3
 rpAMMyncr8S++y1838CQygZ79JVjQ6qAWMERIVqsf1efyLonJYPOgudwLURuMjFnZuIV5+uEA
 cuTvsOctkN9x8ZT+WafsY/HZfpVNWvXE/+mJ+z7Kxa7vIdaiLtqZ1vNoFiQzV4XLePkitdYvM
 uNBNxU4UXlJytecsIqH2ZRgS7Ie3BeQ48DsVMscHMOPWw2C6lAyb1OaxJ7pV2UwWNdTOsizGI
 ZdeBdX3yvbGs7M5ILZq2zQ=
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
> Stop including cpu.h in files that don't need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/stubs/kvm-stub.c            | 1 -
>  accel/stubs/tcg-stub.c            | 1 -
>  accel/tcg/cpu-exec-common.c       | 1 -
>  accel/tcg/cpu-exec.c              | 1 -
>  accel/tcg/cputlb.c                | 1 -
>  accel/tcg/plugin-gen.c            | 1 -
>  accel/tcg/translate-all.c         | 1 -
>  accel/tcg/translator.c            | 1 -
>  accel/tcg/user-exec.c             | 1 -
>  bsd-user/main.c                   | 1 -
>  disas.c                           | 1 -
>  dump/dump.c                       | 1 -
>  dump/win_dump.c                   | 1 -
>  hw/arm/allwinner-a10.c            | 1 -
>  hw/arm/allwinner-h3.c             | 1 -
>  hw/arm/armv7m.c                   | 1 -
>  hw/arm/aspeed.c                   | 1 -
>  hw/arm/aspeed_ast2600.c           | 1 -
>  hw/arm/aspeed_soc.c               | 1 -
>  hw/arm/bcm2836.c                  | 1 -
>  hw/arm/cubieboard.c               | 1 -
>  hw/arm/digic_boards.c             | 1 -
>  hw/arm/exynos4_boards.c           | 1 -
>  hw/arm/fsl-imx25.c                | 1 -
>  hw/arm/fsl-imx31.c                | 1 -
>  hw/arm/imx25_pdk.c                | 1 -
>  hw/arm/kzm.c                      | 1 -
>  hw/arm/msf2-som.c                 | 1 -
>  hw/arm/nrf51_soc.c                | 1 -
>  hw/arm/orangepi.c                 | 1 -
>  hw/arm/raspi.c                    | 1 -
>  hw/arm/stellaris.c                | 1 -
>  hw/arm/xlnx-zcu102.c              | 1 -
>  hw/arm/xlnx-zynqmp.c              | 1 -
>  hw/char/spapr_vty.c               | 1 -
>  hw/core/machine-qmp-cmds.c        | 1 -
>  hw/hppa/dino.c                    | 1 -
>  hw/hppa/lasi.c                    | 1 -
>  hw/i386/kvm/apic.c                | 1 -
>  hw/i386/kvm/clock.c               | 1 -
>  hw/i386/kvmvapic.c                | 1 -
>  hw/i386/microvm.c                 | 1 -
>  hw/i386/pc_piix.c                 | 1 -
>  hw/i386/vmport.c                  | 1 -
>  hw/intc/apic.c                    | 1 -
>  hw/intc/apic_common.c             | 1 -
>  hw/intc/arm_gic_kvm.c             | 1 -
>  hw/intc/armv7m_nvic.c             | 1 -
>  hw/intc/grlib_irqmp.c             | 1 -
>  hw/intc/openpic_kvm.c             | 1 -
>  hw/intc/s390_flic.c               | 1 -
>  hw/intc/s390_flic_kvm.c           | 1 -
>  hw/intc/xics.c                    | 1 -
>  hw/intc/xics_kvm.c                | 1 -
>  hw/intc/xics_spapr.c              | 1 -
>  hw/m68k/next-cube.c               | 1 -
>  hw/mips/loongson3_virt.c          | 1 -
>  hw/mips/malta.c                   | 1 -
>  hw/mips/mips_int.c                | 1 -
>  hw/mips/mipssim.c                 | 1 -
>  hw/misc/mips_itu.c                | 1 -
>  hw/net/spapr_llan.c               | 1 -
>  hw/nios2/10m50_devboard.c         | 1 -
>  hw/nios2/boot.c                   | 1 -
>  hw/nios2/generic_nommu.c          | 1 -
>  hw/nvram/spapr_nvram.c            | 1 -
>  hw/ppc/ppc.c                      | 1 -
>  hw/ppc/ppc440_uc.c                | 1 -
>  hw/ppc/prep.c                     | 1 -
>  hw/ppc/spapr_drc.c                | 1 -
>  hw/ppc/spapr_events.c             | 1 -
>  hw/ppc/spapr_hcall.c              | 1 -
>  hw/ppc/spapr_pci.c                | 1 -
>  hw/ppc/spapr_pci_vfio.c           | 1 -
>  hw/ppc/spapr_rng.c                | 1 -
>  hw/ppc/spapr_rtas.c               | 1 -
>  hw/ppc/spapr_rtas_ddw.c           | 1 -
>  hw/ppc/spapr_rtc.c                | 1 -
>  hw/ppc/spapr_tpm_proxy.c          | 1 -
>  hw/remote/proxy-memory-listener.c | 1 -
>  hw/rx/rx-gdbsim.c                 | 1 -
>  hw/rx/rx62n.c                     | 1 -
>  hw/s390x/3270-ccw.c               | 1 -
>  hw/s390x/css-bridge.c             | 1 -
>  hw/s390x/css.c                    | 1 -
>  hw/s390x/ipl.c                    | 1 -
>  hw/s390x/pv.c                     | 1 -
>  hw/s390x/s390-pci-bus.c           | 1 -
>  hw/s390x/s390-pci-inst.c          | 1 -
>  hw/s390x/s390-stattrib-kvm.c      | 1 -
>  hw/s390x/s390-stattrib.c          | 1 -
>  hw/s390x/s390-virtio-ccw.c        | 1 -
>  hw/s390x/sclp.c                   | 1 -
>  hw/s390x/sclpcpu.c                | 1 -
>  hw/scsi/spapr_vscsi.c             | 1 -
>  hw/sh4/sh7750.c                   | 1 -
>  hw/tricore/tc27x_soc.c            | 1 -
>  hw/tricore/triboard.c             | 1 -
>  hw/vfio/ap.c                      | 1 -
>  hw/vfio/migration.c               | 1 -
>  hw/vfio/spapr.c                   | 1 -
>  hw/xtensa/sim.c                   | 1 -
>  hw/xtensa/virt.c                  | 1 -
>  hw/xtensa/xtensa_memory.c         | 1 -
>  linux-user/main.c                 | 1 -
>  linux-user/semihost.c             | 1 -
>  migration/ram.c                   | 1 -
>  monitor/misc.c                    | 1 -
>  plugins/api.c                     | 1 -
>  plugins/core.c                    | 1 -
>  plugins/loader.c                  | 1 -
>  semihosting/arm-compat-semi.c     | 1 -
>  semihosting/console.c             | 1 -
>  softmmu/arch_init.c               | 1 -
>  softmmu/memory.c                  | 1 -
>  softmmu/memory_mapping.c          | 1 -
>  softmmu/physmem.c                 | 1 -
>  tcg/tcg-op-vec.c                  | 1 -
>  tcg/tcg-op.c                      | 1 -
>  tcg/tcg.c                         | 1 -
>  120 files changed, 120 deletions(-)
> 
> diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
> index 0f17acfac0..5b1d00a222 100644
> --- a/accel/stubs/kvm-stub.c
> +++ b/accel/stubs/kvm-stub.c
> @@ -11,7 +11,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "sysemu/kvm.h"
>  
>  #ifndef CONFIG_USER_ONLY
> diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
> index 2304606f8e..d8162673ae 100644
> --- a/accel/stubs/tcg-stub.c
> +++ b/accel/stubs/tcg-stub.c
> @@ -11,7 +11,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  
>  void tb_flush(CPUState *cpu)
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index 12c1e3e974..be6fe45aa5 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -18,7 +18,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/tcg.h"
>  #include "exec/exec-all.h"
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index f62f12e717..0dc5271715 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -20,7 +20,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "qemu/qemu-print.h"
> -#include "cpu.h"
>  #include "hw/core/tcg-cpu-ops.h"
>  #include "trace.h"
>  #include "disas/disas.h"
> diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
> index 8a7b779270..502f803e5e 100644
> --- a/accel/tcg/cputlb.c
> +++ b/accel/tcg/cputlb.c
> @@ -19,7 +19,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/main-loop.h"
> -#include "cpu.h"
>  #include "hw/core/tcg-cpu-ops.h"
>  #include "exec/exec-all.h"
>  #include "exec/memory.h"
> diff --git a/accel/tcg/plugin-gen.c b/accel/tcg/plugin-gen.c
> index c3dc3effe7..7627225aef 100644
> --- a/accel/tcg/plugin-gen.c
> +++ b/accel/tcg/plugin-gen.c
> @@ -43,7 +43,6 @@
>   * CPU's index into a TCG temp, since the first callback did it already.
>   */
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "tcg/tcg.h"
>  #include "tcg/tcg-op.h"
>  #include "trace/mem.h"
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index ba6ab09790..36057b22ce 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -22,7 +22,6 @@
>  #include "qemu-common.h"
>  
>  #define NO_CPU_IO_DEFS
> -#include "cpu.h"
>  #include "trace.h"
>  #include "disas/disas.h"
>  #include "exec/exec-all.h"
> diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
> index 2dfc27102f..1d32732198 100644
> --- a/accel/tcg/translator.c
> +++ b/accel/tcg/translator.c
> @@ -9,7 +9,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
> -#include "cpu.h"
>  #include "tcg/tcg.h"
>  #include "tcg/tcg-op.h"
>  #include "exec/exec-all.h"
> diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
> index 0d8cc27b21..fb2d43e6a9 100644
> --- a/accel/tcg/user-exec.c
> +++ b/accel/tcg/user-exec.c
> @@ -17,7 +17,6 @@
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>.
>   */
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "hw/core/tcg-cpu-ops.h"
>  #include "disas/disas.h"
>  #include "exec/exec-all.h"
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 798aba512c..36a889d084 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -32,7 +32,6 @@
>  #include "qemu/path.h"
>  #include "qemu/help_option.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "tcg/tcg.h"
>  #include "qemu/timer.h"
> diff --git a/disas.c b/disas.c
> index a61f95b580..3dab4482d1 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -4,7 +4,6 @@
>  #include "elf.h"
>  #include "qemu/qemu-print.h"
>  
> -#include "cpu.h"
>  #include "disas/disas.h"
>  #include "disas/capstone.h"
>  
> diff --git a/dump/dump.c b/dump/dump.c
> index 929138e91d..ab625909f3 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -15,7 +15,6 @@
>  #include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "elf.h"
> -#include "cpu.h"
>  #include "exec/hwaddr.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/kvm.h"
> diff --git a/dump/win_dump.c b/dump/win_dump.c
> index 652c7bad99..c5eb5a9aac 100644
> --- a/dump/win_dump.c
> +++ b/dump/win_dump.c
> @@ -12,7 +12,6 @@
>  #include "qemu-common.h"
>  #include "qemu/cutils.h"
>  #include "elf.h"
> -#include "cpu.h"
>  #include "exec/hwaddr.h"
>  #include "monitor/monitor.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
> index d404f31e02..0844a65641 100644
> --- a/hw/arm/allwinner-a10.c
> +++ b/hw/arm/allwinner-a10.c
> @@ -19,7 +19,6 @@
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/allwinner-a10.h"
>  #include "hw/misc/unimp.h"
> diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> index 88259a9c0d..bbe65d1860 100644
> --- a/hw/arm/allwinner-h3.c
> +++ b/hw/arm/allwinner-h3.c
> @@ -24,7 +24,6 @@
>  #include "qemu/module.h"
>  #include "qemu/units.h"
>  #include "hw/qdev-core.h"
> -#include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "hw/char/serial.h"
>  #include "hw/misc/unimp.h"
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 6dd10d8470..caeed29670 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -10,7 +10,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/arm/armv7m.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "hw/arm/boot.h"
>  #include "hw/loader.h"
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index b1e5bc76e4..7480533cb7 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -11,7 +11,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "exec/address-spaces.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/aspeed.h"
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 504aabf173..8e4ef07b14 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -9,7 +9,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "exec/address-spaces.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 516277800c..fc270daa57 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "exec/address-spaces.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/arm/aspeed_soc.h"
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index de7ade2878..24354338ca 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -12,7 +12,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "hw/arm/bcm2836.h"
>  #include "hw/arm/raspi_platform.h"
>  #include "hw/sysbus.h"
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 9e872135ae..d7184e5ec2 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -18,7 +18,6 @@
>  #include "qemu/osdep.h"
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/allwinner-a10.h"
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 65d3a9ba74..fdb6781567 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -27,7 +27,6 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
> -#include "cpu.h"
>  #include "hw/boards.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 8ae136bbdf..35dd9875da 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -25,7 +25,6 @@
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
> -#include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "net/net.h"
>  #include "hw/arm/boot.h"
> diff --git a/hw/arm/fsl-imx25.c b/hw/arm/fsl-imx25.c
> index 08a98f828f..dafc0bef47 100644
> --- a/hw/arm/fsl-imx25.c
> +++ b/hw/arm/fsl-imx25.c
> @@ -24,7 +24,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/arm/fsl-imx25.h"
>  #include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/arm/fsl-imx31.c b/hw/arm/fsl-imx31.c
> index 0983998bb4..def27bb913 100644
> --- a/hw/arm/fsl-imx31.c
> +++ b/hw/arm/fsl-imx31.c
> @@ -21,7 +21,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/arm/fsl-imx31.h"
>  #include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/arm/imx25_pdk.c b/hw/arm/imx25_pdk.c
> index 1c201d0d8e..9c58fbde57 100644
> --- a/hw/arm/imx25_pdk.c
> +++ b/hw/arm/imx25_pdk.c
> @@ -25,7 +25,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/fsl-imx25.h"
>  #include "hw/boards.h"
> diff --git a/hw/arm/kzm.c b/hw/arm/kzm.c
> index e3f7d4ead2..39559c44c2 100644
> --- a/hw/arm/kzm.c
> +++ b/hw/arm/kzm.c
> @@ -15,7 +15,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/arm/fsl-imx31.h"
>  #include "hw/boards.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/arm/msf2-som.c b/hw/arm/msf2-som.c
> index f9b61c36dd..343ec977c0 100644
> --- a/hw/arm/msf2-som.c
> +++ b/hw/arm/msf2-som.c
> @@ -31,7 +31,6 @@
>  #include "hw/arm/boot.h"
>  #include "exec/address-spaces.h"
>  #include "hw/arm/msf2-soc.h"
> -#include "cpu.h"
>  
>  #define DDR_BASE_ADDRESS      0xA0000000
>  #define DDR_SIZE              (64 * MiB)
> diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
> index e15981e019..71bdcf06b4 100644
> --- a/hw/arm/nrf51_soc.c
> +++ b/hw/arm/nrf51_soc.c
> @@ -15,7 +15,6 @@
>  #include "hw/misc/unimp.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/log.h"
> -#include "cpu.h"
>  
>  #include "hw/arm/nrf51.h"
>  #include "hw/arm/nrf51_soc.h"
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index 6ccb61c149..0cf9895ce7 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -21,7 +21,6 @@
>  #include "qemu/units.h"
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/allwinner-h3.h"
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 1b7e9c4cb4..b30a17871f 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -16,7 +16,6 @@
>  #include "qemu/units.h"
>  #include "qemu/cutils.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/arm/bcm2836.h"
>  #include "hw/registerfields.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
> index 27292ec411..8b4dab9b79 100644
> --- a/hw/arm/stellaris.c
> +++ b/hw/arm/stellaris.c
> @@ -27,7 +27,6 @@
>  #include "migration/vmstate.h"
>  #include "hw/misc/unimp.h"
>  #include "hw/qdev-clock.h"
> -#include "cpu.h"
>  #include "qom/object.h"
>  
>  #define GPIO_A 0
> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
> index a9db25eb99..6c6cb02e86 100644
> --- a/hw/arm/xlnx-zcu102.c
> +++ b/hw/arm/xlnx-zcu102.c
> @@ -17,7 +17,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/arm/xlnx-zynqmp.h"
>  #include "hw/boards.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 7f01284a5c..6c93dcb820 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -18,7 +18,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "hw/arm/xlnx-zynqmp.h"
>  #include "hw/intc/arm_gic_common.h"
>  #include "hw/boards.h"
> diff --git a/hw/char/spapr_vty.c b/hw/char/spapr_vty.c
> index 79eaa2fa52..91eae1a598 100644
> --- a/hw/char/spapr_vty.c
> +++ b/hw/char/spapr_vty.c
> @@ -2,7 +2,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "migration/vmstate.h"
>  #include "chardev/char-fe.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 2ad004430e..a36c96608f 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -8,7 +8,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "hw/boards.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-builtin-visit.h"
> diff --git a/hw/hppa/dino.c b/hw/hppa/dino.c
> index 5b82c9440d..bd97e0c51d 100644
> --- a/hw/hppa/dino.c
> +++ b/hw/hppa/dino.c
> @@ -14,7 +14,6 @@
>  #include "qemu/module.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/irq.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> diff --git a/hw/hppa/lasi.c b/hw/hppa/lasi.c
> index a8f5defcd0..408af9ccb7 100644
> --- a/hw/hppa/lasi.c
> +++ b/hw/hppa/lasi.c
> @@ -13,7 +13,6 @@
>  #include "qemu/units.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "trace.h"
>  #include "hw/irq.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/i386/kvm/apic.c b/hw/i386/kvm/apic.c
> index 3dbff2be2e..52ff490910 100644
> --- a/hw/i386/kvm/apic.c
> +++ b/hw/i386/kvm/apic.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "hw/i386/apic_internal.h"
>  #include "hw/pci/msi.h"
>  #include "sysemu/hw_accel.h"
> diff --git a/hw/i386/kvm/clock.c b/hw/i386/kvm/clock.c
> index 51872dd84c..efbc1e0d12 100644
> --- a/hw/i386/kvm/clock.c
> +++ b/hw/i386/kvm/clock.c
> @@ -14,7 +14,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "qemu/host-utils.h"
>  #include "qemu/module.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index 46315445d2..43f8a8f679 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -11,7 +11,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/cpus.h"
>  #include "sysemu/hw_accel.h"
> diff --git a/hw/i386/microvm.c b/hw/i386/microvm.c
> index edf2b0f061..aba0c83219 100644
> --- a/hw/i386/microvm.c
> +++ b/hw/i386/microvm.c
> @@ -49,7 +49,6 @@
>  #include "hw/pci-host/gpex.h"
>  #include "hw/usb/xhci.h"
>  
> -#include "cpu.h"
>  #include "elf.h"
>  #include "kvm/kvm_i386.h"
>  #include "hw/xen/start_info.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 541967c1b9..6d6cd65dcd 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -49,7 +49,6 @@
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
>  #include "hw/acpi/acpi.h"
> -#include "cpu.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/xen.h"
> diff --git a/hw/i386/vmport.c b/hw/i386/vmport.c
> index 490a57f52c..7cc75dbc6d 100644
> --- a/hw/i386/vmport.c
> +++ b/hw/i386/vmport.c
> @@ -37,7 +37,6 @@
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/qtest.h"
>  #include "qemu/log.h"
> -#include "cpu.h"
>  #include "trace.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> index f4f50f974e..3df11c34d6 100644
> --- a/hw/intc/apic.c
> +++ b/hw/intc/apic.c
> @@ -17,7 +17,6 @@
>   * License along with this library; if not, see <http://www.gnu.org/licenses/>
>   */
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "qemu/thread.h"
>  #include "hw/i386/apic_internal.h"
>  #include "hw/i386/apic.h"
> diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
> index 97dd96dffa..2a20982066 100644
> --- a/hw/intc/apic_common.c
> +++ b/hw/intc/apic_common.c
> @@ -22,7 +22,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "qapi/visitor.h"
>  #include "hw/i386/apic.h"
>  #include "hw/i386/apic_internal.h"
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index 49f79a8674..7d2a13273a 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -22,7 +22,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "migration/blocker.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_arm.h"
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 0d8426dafc..c4287d82d8 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> diff --git a/hw/intc/grlib_irqmp.c b/hw/intc/grlib_irqmp.c
> index 984334fa7b..3bfe2544b7 100644
> --- a/hw/intc/grlib_irqmp.c
> +++ b/hw/intc/grlib_irqmp.c
> @@ -27,7 +27,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
> -#include "cpu.h"
>  
>  #include "hw/qdev-properties.h"
>  #include "hw/sparc/grlib.h"
> diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
> index e1a39e33cb..16badace8b 100644
> --- a/hw/intc/openpic_kvm.c
> +++ b/hw/intc/openpic_kvm.c
> @@ -24,7 +24,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include <sys/ioctl.h>
>  #include "exec/address-spaces.h"
>  #include "hw/ppc/openpic.h"
> diff --git a/hw/intc/s390_flic.c b/hw/intc/s390_flic.c
> index aacdb1bbc2..74e02858d4 100644
> --- a/hw/intc/s390_flic.c
> +++ b/hw/intc/s390_flic.c
> @@ -20,7 +20,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/s390x/css.h"
>  #include "trace.h"
> -#include "cpu.h"
>  #include "qapi/error.h"
>  #include "hw/s390x/s390-virtio-ccw.h"
>  
> diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
> index d1c8fb8016..929cfa3a68 100644
> --- a/hw/intc/s390_flic_kvm.c
> +++ b/hw/intc/s390_flic_kvm.c
> @@ -11,7 +11,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "kvm_s390x.h"
>  #include <sys/ioctl.h>
>  #include "qemu/error-report.h"
> diff --git a/hw/intc/xics.c b/hw/intc/xics.c
> index 68f9d44feb..48a835eab7 100644
> --- a/hw/intc/xics.c
> +++ b/hw/intc/xics.c
> @@ -27,7 +27,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "trace.h"
>  #include "qemu/timer.h"
>  #include "hw/ppc/xics.h"
> diff --git a/hw/intc/xics_kvm.c b/hw/intc/xics_kvm.c
> index 570d635bcc..f5bfc501bc 100644
> --- a/hw/intc/xics_kvm.c
> +++ b/hw/intc/xics_kvm.c
> @@ -28,7 +28,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> -#include "cpu.h"
>  #include "trace.h"
>  #include "sysemu/kvm.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/intc/xics_spapr.c b/hw/intc/xics_spapr.c
> index 8ae4f41459..37b2d99977 100644
> --- a/hw/intc/xics_spapr.c
> +++ b/hw/intc/xics_spapr.c
> @@ -26,7 +26,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "trace.h"
>  #include "qemu/timer.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/m68k/next-cube.c b/hw/m68k/next-cube.c
> index 92b45d760f..5bd4f2d832 100644
> --- a/hw/m68k/next-cube.c
> +++ b/hw/m68k/next-cube.c
> @@ -10,7 +10,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "exec/hwaddr.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index 1d6573bc63..16f7f84d34 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -29,7 +29,6 @@
>  #include "qemu/cutils.h"
>  #include "qemu/datadir.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "elf.h"
>  #include "kvm_mips.h"
>  #include "hw/char/serial.h"
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 5adb67ad2a..459791414a 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -27,7 +27,6 @@
>  #include "qemu/bitops.h"
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
> -#include "cpu.h"
>  #include "hw/clock.h"
>  #include "hw/southbridge/piix.h"
>  #include "hw/isa/superio.h"
> diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
> index 0f9c6f07c1..2db5e10fe0 100644
> --- a/hw/mips/mips_int.c
> +++ b/hw/mips/mips_int.c
> @@ -24,7 +24,6 @@
>  #include "qemu/main-loop.h"
>  #include "hw/irq.h"
>  #include "hw/mips/cpudevs.h"
> -#include "cpu.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_mips.h"
>  
> diff --git a/hw/mips/mipssim.c b/hw/mips/mipssim.c
> index f5d0da05aa..2e0d4aceed 100644
> --- a/hw/mips/mipssim.c
> +++ b/hw/mips/mipssim.c
> @@ -29,7 +29,6 @@
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
> -#include "cpu.h"
>  #include "hw/clock.h"
>  #include "hw/mips/mips.h"
>  #include "hw/mips/cpudevs.h"
> diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
> index 133399598f..80683fed31 100644
> --- a/hw/misc/mips_itu.c
> +++ b/hw/misc/mips_itu.c
> @@ -22,7 +22,6 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "hw/misc/mips_itu.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/net/spapr_llan.c b/hw/net/spapr_llan.c
> index 10e85a4556..a6876a936d 100644
> --- a/hw/net/spapr_llan.c
> +++ b/hw/net/spapr_llan.c
> @@ -26,7 +26,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "net/net.h"
> diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
> index a14fc31e86..3d1205b8bd 100644
> --- a/hw/nios2/10m50_devboard.c
> +++ b/hw/nios2/10m50_devboard.c
> @@ -24,7 +24,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  
>  #include "hw/sysbus.h"
>  #include "hw/char/serial.h"
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index 95bdc18052..5b3e4efed5 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -32,7 +32,6 @@
>  #include "qemu/units.h"
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
> -#include "cpu.h"
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
> index b70a42dc2f..fbc18dbd04 100644
> --- a/hw/nios2/generic_nommu.c
> +++ b/hw/nios2/generic_nommu.c
> @@ -29,7 +29,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> -#include "cpu.h"
>  
>  #include "hw/char/serial.h"
>  #include "hw/boards.h"
> diff --git a/hw/nvram/spapr_nvram.c b/hw/nvram/spapr_nvram.c
> index 3bb4654c58..fbfdf47e26 100644
> --- a/hw/nvram/spapr_nvram.c
> +++ b/hw/nvram/spapr_nvram.c
> @@ -26,7 +26,6 @@
>  #include "qemu/module.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include <libfdt.h>
>  
>  #include "sysemu/block-backend.h"
> diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
> index bf28d6bfc8..7375bf4fa9 100644
> --- a/hw/ppc/ppc.c
> +++ b/hw/ppc/ppc.c
> @@ -23,7 +23,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "hw/irq.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc_e500.h"
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index f6f89058ab..96a1fe06c3 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -14,7 +14,6 @@
>  #include "qapi/error.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "hw/irq.h"
>  #include "exec/address-spaces.h"
>  #include "exec/memory.h"
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index b41570c747..e8dc128308 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -24,7 +24,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "hw/rtc/m48t59.h"
>  #include "hw/char/serial.h"
>  #include "hw/block/fdc.h"
> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
> index 9e16505fa1..b8c2f3daf7 100644
> --- a/hw/ppc/spapr_drc.c
> +++ b/hw/ppc/spapr_drc.c
> @@ -13,7 +13,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qnull.h"
> -#include "cpu.h"
>  #include "qemu/cutils.h"
>  #include "hw/ppc/spapr_drc.h"
>  #include "qom/object.h"
> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
> index d51daedfa6..0cfc19be19 100644
> --- a/hw/ppc/spapr_events.c
> +++ b/hw/ppc/spapr_events.c
> @@ -27,7 +27,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/runstate.h"
>  
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 7b5cd3553c..2a464a42e6 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -7,7 +7,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "qemu/error-report.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "helper_regs.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index feba18cb12..4effe23a18 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -25,7 +25,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/irq.h"
>  #include "hw/sysbus.h"
>  #include "migration/vmstate.h"
> diff --git a/hw/ppc/spapr_pci_vfio.c b/hw/ppc/spapr_pci_vfio.c
> index e0547b1740..7817cf72ee 100644
> --- a/hw/ppc/spapr_pci_vfio.c
> +++ b/hw/ppc/spapr_pci_vfio.c
> @@ -19,7 +19,6 @@
>  
>  #include "qemu/osdep.h"
>  #include <linux/vfio.h>
> -#include "cpu.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/pci-host/spapr.h"
>  #include "hw/pci/msix.h"
> diff --git a/hw/ppc/spapr_rng.c b/hw/ppc/spapr_rng.c
> index d14800e9de..df5c4b9687 100644
> --- a/hw/ppc/spapr_rng.c
> +++ b/hw/ppc/spapr_rng.c
> @@ -19,7 +19,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "qemu/error-report.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index fb64be1150..59dbea4e22 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -26,7 +26,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/ppc/spapr_rtas_ddw.c b/hw/ppc/spapr_rtas_ddw.c
> index 3501b05819..3e826e1308 100644
> --- a/hw/ppc/spapr_rtas_ddw.c
> +++ b/hw/ppc/spapr_rtas_ddw.c
> @@ -18,7 +18,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/ppc/spapr_rtc.c b/hw/ppc/spapr_rtc.c
> index 68cfc578a3..fba4dfca35 100644
> --- a/hw/ppc/spapr_rtc.c
> +++ b/hw/ppc/spapr_rtc.c
> @@ -27,7 +27,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
> -#include "cpu.h"
>  #include "qemu/timer.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/ppc/spapr.h"
> diff --git a/hw/ppc/spapr_tpm_proxy.c b/hw/ppc/spapr_tpm_proxy.c
> index a01f81f9e0..2454086744 100644
> --- a/hw/ppc/spapr_tpm_proxy.c
> +++ b/hw/ppc/spapr_tpm_proxy.c
> @@ -15,7 +15,6 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/reset.h"
> -#include "cpu.h"
>  #include "hw/ppc/spapr.h"
>  #include "hw/qdev-properties.h"
>  #include "trace.h"
> diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
> index af1fa6f5aa..3649919f66 100644
> --- a/hw/remote/proxy-memory-listener.c
> +++ b/hw/remote/proxy-memory-listener.c
> @@ -14,7 +14,6 @@
>  #include "qemu/range.h"
>  #include "exec/memory.h"
>  #include "exec/cpu-common.h"
> -#include "cpu.h"
>  #include "exec/ram_addr.h"
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index 1f53fdb082..b52d76b9b6 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -21,7 +21,6 @@
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
> -#include "cpu.h"
>  #include "hw/loader.h"
>  #include "hw/rx/rx62n.h"
>  #include "sysemu/qtest.h"
> diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
> index 31ddccf2cd..fa5add9f9d 100644
> --- a/hw/rx/rx62n.c
> +++ b/hw/rx/rx62n.c
> @@ -28,7 +28,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/sysemu.h"
> -#include "cpu.h"
>  #include "qom/object.h"
>  
>  /*
> diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
> index f3e7342b1e..25e628f575 100644
> --- a/hw/s390x/3270-ccw.c
> +++ b/hw/s390x/3270-ccw.c
> @@ -13,7 +13,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "hw/s390x/css.h"
>  #include "hw/s390x/css-bridge.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
> index 9d793d671e..191b29f077 100644
> --- a/hw/s390x/css-bridge.c
> +++ b/hw/s390x/css-bridge.c
> @@ -20,7 +20,6 @@
>  #include "hw/s390x/css.h"
>  #include "ccw-device.h"
>  #include "hw/s390x/css-bridge.h"
> -#include "cpu.h"
>  
>  /*
>   * Invoke device-specific unplug handler, disable the subchannel
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 4149b8e5a7..bed46f5ec3 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -15,7 +15,6 @@
>  #include "qemu/bitops.h"
>  #include "qemu/error-report.h"
>  #include "exec/address-spaces.h"
> -#include "cpu.h"
>  #include "hw/s390x/ioinst.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/s390x/css.h"
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index f12af5e35b..8c863cf386 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -19,7 +19,6 @@
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/tcg.h"
> -#include "cpu.h"
>  #include "elf.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 93eccfc05d..401b63d6cb 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -13,7 +13,6 @@
>  
>  #include <linux/kvm.h>
>  
> -#include "cpu.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> index dd138dae94..7db1c5943f 100644
> --- a/hw/s390x/s390-pci-bus.c
> +++ b/hw/s390x/s390-pci-bus.c
> @@ -14,7 +14,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qapi/visitor.h"
> -#include "cpu.h"
>  #include "hw/s390x/s390-pci-bus.h"
>  #include "hw/s390x/s390-pci-inst.h"
>  #include "hw/s390x/s390-pci-vfio.h"
> diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
> index 4b8326afa4..9ec277d50e 100644
> --- a/hw/s390x/s390-pci-inst.c
> +++ b/hw/s390x/s390-pci-inst.c
> @@ -12,7 +12,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "exec/memop.h"
>  #include "exec/memory-internal.h"
>  #include "qemu/error-report.h"
> diff --git a/hw/s390x/s390-stattrib-kvm.c b/hw/s390x/s390-stattrib-kvm.c
> index f89d8d9d16..f0b11a74e4 100644
> --- a/hw/s390x/s390-stattrib-kvm.c
> +++ b/hw/s390x/s390-stattrib-kvm.c
> @@ -16,7 +16,6 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/kvm.h"
>  #include "exec/ram_addr.h"
> -#include "cpu.h"
>  #include "kvm_s390x.h"
>  
>  Object *kvm_s390_stattrib_create(void)
> diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
> index 4441e1d331..9eda1c3b2a 100644
> --- a/hw/s390x/s390-stattrib.c
> +++ b/hw/s390x/s390-stattrib.c
> @@ -11,7 +11,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> -#include "cpu.h"
>  #include "migration/qemu-file.h"
>  #include "migration/register.h"
>  #include "hw/s390x/storage-attributes.h"
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index f0dbbc9f4c..41f10e3ff5 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -13,7 +13,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "exec/address-spaces.h"
>  #include "exec/ram_addr.h"
>  #include "hw/s390x/s390-virtio-hcall.h"
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index f57340a7d7..edb6e3ea01 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -15,7 +15,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "hw/boards.h"
>  #include "hw/s390x/sclp.h"
>  #include "hw/s390x/event-facility.h"
> diff --git a/hw/s390x/sclpcpu.c b/hw/s390x/sclpcpu.c
> index 62806d3273..f2b1a4b037 100644
> --- a/hw/s390x/sclpcpu.c
> +++ b/hw/s390x/sclpcpu.c
> @@ -17,7 +17,6 @@
>  #include "hw/s390x/sclp.h"
>  #include "qemu/module.h"
>  #include "hw/s390x/event-facility.h"
> -#include "cpu.h"
>  #include "sysemu/cpus.h"
>  
>  typedef struct ConfigMgtData {
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index ca5c13c4a8..c210262484 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -34,7 +34,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/module.h"
> -#include "cpu.h"
>  #include "hw/scsi/scsi.h"
>  #include "migration/vmstate.h"
>  #include "scsi/constants.h"
> diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
> index f8ac3ec6e3..d53a436d8c 100644
> --- a/hw/sh4/sh7750.c
> +++ b/hw/sh4/sh7750.c
> @@ -31,7 +31,6 @@
>  #include "sh7750_regnames.h"
>  #include "hw/sh4/sh_intc.h"
>  #include "hw/timer/tmu012.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  
>  #define NB_DEVICES 4
> diff --git a/hw/tricore/tc27x_soc.c b/hw/tricore/tc27x_soc.c
> index dcccdba786..d66d6980c3 100644
> --- a/hw/tricore/tc27x_soc.c
> +++ b/hw/tricore/tc27x_soc.c
> @@ -25,7 +25,6 @@
>  #include "qemu/units.h"
>  #include "hw/misc/unimp.h"
>  #include "exec/address-spaces.h"
> -#include "cpu.h"
>  
>  #include "hw/tricore/tc27x_soc.h"
>  #include "hw/tricore/triboard.h"
> diff --git a/hw/tricore/triboard.c b/hw/tricore/triboard.c
> index f8d5f7a787..943f706989 100644
> --- a/hw/tricore/triboard.c
> +++ b/hw/tricore/triboard.c
> @@ -22,7 +22,6 @@
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "hw/qdev-properties.h"
> -#include "cpu.h"
>  #include "net/net.h"
>  #include "hw/loader.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/vfio/ap.c b/hw/vfio/ap.c
> index f9dbec37da..4b32aca1a0 100644
> --- a/hw/vfio/ap.c
> +++ b/hw/vfio/ap.c
> @@ -21,7 +21,6 @@
>  #include "qemu/module.h"
>  #include "qemu/option.h"
>  #include "qemu/config-file.h"
> -#include "cpu.h"
>  #include "kvm_s390x.h"
>  #include "migration/vmstate.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 384576cfc0..201642d75e 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -15,7 +15,6 @@
>  
>  #include "sysemu/runstate.h"
>  #include "hw/vfio/vfio-common.h"
> -#include "cpu.h"
>  #include "migration/migration.h"
>  #include "migration/vmstate.h"
>  #include "migration/qemu-file.h"
> diff --git a/hw/vfio/spapr.c b/hw/vfio/spapr.c
> index 2900bd1941..ea3f70bd2f 100644
> --- a/hw/vfio/spapr.c
> +++ b/hw/vfio/spapr.c
> @@ -9,7 +9,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include <sys/ioctl.h>
>  #include <linux/vfio.h>
>  
> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
> index cbac50db2d..c38e522b02 100644
> --- a/hw/xtensa/sim.c
> +++ b/hw/xtensa/sim.c
> @@ -27,7 +27,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
> index bbf6200c49..18d3c3cdb2 100644
> --- a/hw/xtensa/virt.c
> +++ b/hw/xtensa/virt.c
> @@ -27,7 +27,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "sysemu/reset.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> diff --git a/hw/xtensa/xtensa_memory.c b/hw/xtensa/xtensa_memory.c
> index 1c5f62b014..2c1095f017 100644
> --- a/hw/xtensa/xtensa_memory.c
> +++ b/hw/xtensa/xtensa_memory.c
> @@ -27,7 +27,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "exec/memory.h"
>  #include "qemu/error-report.h"
>  #include "xtensa_memory.h"
> diff --git a/linux-user/main.c b/linux-user/main.c
> index f956afccab..57ba1b45ab 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -38,7 +38,6 @@
>  #include "qemu/help_option.h"
>  #include "qemu/module.h"
>  #include "qemu/plugin.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "tcg/tcg.h"
>  #include "qemu/timer.h"
> diff --git a/linux-user/semihost.c b/linux-user/semihost.c
> index 82013b8b48..f53ab526fb 100644
> --- a/linux-user/semihost.c
> +++ b/linux-user/semihost.c
> @@ -11,7 +11,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "semihosting/console.h"
>  #include "qemu.h"
>  #include <termios.h>
> diff --git a/migration/ram.c b/migration/ram.c
> index 9e9b7380bf..ace8ad431c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -27,7 +27,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "qemu/cutils.h"
>  #include "qemu/bitops.h"
>  #include "qemu/bitmap.h"
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 55f3744053..f3a393ea59 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -24,7 +24,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "monitor-internal.h"
> -#include "cpu.h"
>  #include "monitor/qdev.h"
>  #include "hw/usb.h"
>  #include "hw/pci/pci.h"
> diff --git a/plugins/api.c b/plugins/api.c
> index 218e1342cd..817c9b6b69 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -36,7 +36,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/plugin.h"
> -#include "cpu.h"
>  #include "tcg/tcg.h"
>  #include "exec/exec-all.h"
>  #include "exec/ram_addr.h"
> diff --git a/plugins/core.c b/plugins/core.c
> index 93b595a8d6..55d188af51 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -23,7 +23,6 @@
>  #include "hw/core/cpu.h"
>  #include "exec/cpu-common.h"
>  
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
>  #include "tcg/tcg.h"
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 8550e61184..05df40398d 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -27,7 +27,6 @@
>  #include "qemu/xxhash.h"
>  #include "qemu/plugin.h"
>  #include "hw/core/cpu.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "hw/boards.h"
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index f9c87245b8..1c29146dcf 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -33,7 +33,6 @@
>  
>  #include "qemu/osdep.h"
>  
> -#include "cpu.h"
>  #include "semihosting/semihost.h"
>  #include "semihosting/console.h"
>  #include "semihosting/common-semi.h"
> diff --git a/semihosting/console.c b/semihosting/console.c
> index a78af69387..ef6958d844 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -16,7 +16,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "semihosting/semihost.h"
>  #include "semihosting/console.h"
>  #include "exec/gdbstub.h"
> diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
> index 8471711c54..f09bab830c 100644
> --- a/softmmu/arch_init.c
> +++ b/softmmu/arch_init.c
> @@ -22,7 +22,6 @@
>   * THE SOFTWARE.
>   */
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "sysemu/arch_init.h"
>  #include "hw/pci/pci.h"
>  #include "hw/audio/soundhw.h"
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index d4493ef9e4..a62816647b 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -16,7 +16,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
>  #include "qapi/error.h"
> -#include "cpu.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
>  #include "qapi/visitor.h"
> diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
> index 18d0b8067c..e7af276546 100644
> --- a/softmmu/memory_mapping.c
> +++ b/softmmu/memory_mapping.c
> @@ -14,7 +14,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  
> -#include "cpu.h"
>  #include "sysemu/memory_mapping.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 7ed276b9b5..1821882614 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -23,7 +23,6 @@
>  
>  #include "qemu/cutils.h"
>  #include "qemu/cacheflush.h"
> -#include "cpu.h"
>  
>  #ifdef CONFIG_TCG
>  #include "hw/core/tcg-cpu-ops.h"
> diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
> index d19aa7373e..15e026ae49 100644
> --- a/tcg/tcg-op-vec.c
> +++ b/tcg/tcg-op-vec.c
> @@ -18,7 +18,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "tcg/tcg.h"
>  #include "tcg/tcg-op.h"
>  #include "tcg/tcg-mo.h"
> diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
> index 70475773f4..dcc2ed0bbc 100644
> --- a/tcg/tcg-op.c
> +++ b/tcg/tcg-op.c
> @@ -23,7 +23,6 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "tcg/tcg.h"
>  #include "tcg/tcg-op.h"
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index cc947bf6f6..db806a6658 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -41,7 +41,6 @@
>     CPU definitions. Currently they are used for qemu_ld/st
>     instructions */
>  #define NO_CPU_IO_DEFS
> -#include "cpu.h"
>  
>  #include "exec/exec-all.h"
>  
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


