Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806F36FE41
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:06:19 +0200 (CEST)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVek-0000YV-66
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVYC-0006e6-AK; Fri, 30 Apr 2021 11:59:32 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:60127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVY8-0004Hd-Cg; Fri, 30 Apr 2021 11:59:32 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N4eOd-1lTbws34Wl-011m3a; Fri, 30 Apr 2021 17:59:22 +0200
Subject: Re: [PATCH 1/4] Do not include sysemu/sysemu.h if it's not really
 necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-2-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <0a9c49b4-8b73-be47-48a0-d3e087adbbd0@vivier.eu>
Date: Fri, 30 Apr 2021 17:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416171314.2074665-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jbXI3C+vRwiT33EPivA6/9dvU7JF2gn6eDKmNZ0JXnA8Wn434GV
 lS6WAkrML4lAjIcGnrOKsS2WviDpk4DYVSnMMlYsVIkeE9EnIHot80JkkIMnucR0Q4Uq0bE
 Fwv/rS/ISFA8TFstKfyHVyBh6BLwUZ6yJFEnzxkvpxzug8evleTeXdXbHXRUHti0QF962Kl
 LPfUYRWXKNEEchw+BENfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nWu5bsDahGs=:eIVFxFEC+vM0SPfoazU2G5
 bOvzvVeHdRhFMfANqdjwjfvKAiaB8dZFlDlua6uopj3hDzmANtDqDwBFVrgNSKsapIj3QYh57
 jv+LI8nOh6uEH+apEtVtGOHeMcO2o3GzRLw8AKBFMWmifZ4DvgkhXp1t5F1674u7zVCX9VYwe
 5Rf5g6mhM7EDLQtwm840LsqaAx7Gt4OrO6et/GL6I3WeyN65E110QBH/RlU7yLm63DFFofue9
 GwNMDY2ybxK7r/Wr4D6dk8SEU98Auez1q1Ra2AsZ0c7CFAFnJ4ad4VQD5ONFK9Qz8SEuqK1iJ
 6ZZFO4TpUn2hVkMdmzHyH5QaGySj1Ell5dxD8BJSu669iqradvGETaWJDm2Lu7JNeMWaWy8Id
 dcEqySzmaaZ3lLACaNh9G284k72Bc7g8lD6X2aUHHKpILA9BAZPJ76b5+LjRaEaT7C8u3Gtyk
 U0pxglrx2WKilPtJwRiHcyqHTnYwYROs59Bb5COT0EIIPYRxRJELCCkxo7grKiES6wQnabaOq
 qbkk8o8eqx8bf5jWnCGyYs=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
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
> Stop including sysemu/sysemu.h in files that don't need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/kvm/kvm-all.c          | 1 -
>  accel/tcg/user-exec-stub.c   | 1 -
>  backends/hostmem-file.c      | 1 -
>  backends/hostmem-memfd.c     | 1 -
>  backends/hostmem.c           | 1 -
>  block.c                      | 1 -
>  block/block-backend.c        | 1 -
>  block/nfs.c                  | 1 -
>  chardev/char-mux.c           | 1 -
>  chardev/char.c               | 1 -
>  gdbstub.c                    | 1 -
>  hw/alpha/dp264.c             | 1 -
>  hw/arm/aspeed.c              | 1 -
>  hw/arm/cubieboard.c          | 1 -
>  hw/arm/digic_boards.c        | 1 -
>  hw/arm/exynos4_boards.c      | 1 -
>  hw/arm/mcimx6ul-evk.c        | 1 -
>  hw/arm/mcimx7d-sabre.c       | 1 -
>  hw/arm/npcm7xx_boards.c      | 1 -
>  hw/arm/orangepi.c            | 1 -
>  hw/arm/raspi.c               | 1 -
>  hw/arm/sabrelite.c           | 1 -
>  hw/arm/virt.c                | 1 -
>  hw/block/nvme-subsys.c       | 1 -
>  hw/core/machine-qmp-cmds.c   | 1 -
>  hw/core/null-machine.c       | 1 -
>  hw/core/numa.c               | 1 -
>  hw/i386/pc_piix.c            | 1 -
>  hw/i386/pc_sysfw.c           | 1 -
>  hw/input/lasips2.c           | 1 -
>  hw/intc/sifive_plic.c        | 1 -
>  hw/isa/isa-superio.c         | 1 -
>  hw/isa/piix3.c               | 1 -
>  hw/m68k/next-kbd.c           | 1 -
>  hw/microblaze/boot.c         | 1 -
>  hw/mips/malta.c              | 1 -
>  hw/misc/macio/macio.c        | 1 -
>  hw/net/can/xlnx-zynqmp-can.c | 1 -
>  hw/net/i82596.c              | 1 -
>  hw/net/lasi_i82596.c         | 1 -
>  hw/nios2/boot.c              | 1 -
>  hw/ppc/ppc405_boards.c       | 1 -
>  hw/ppc/prep.c                | 1 -
>  hw/rx/rx-gdbsim.c            | 1 -
>  hw/s390x/ipl.c               | 1 -
>  hw/s390x/sclp.c              | 1 -
>  hw/sh4/shix.c                | 1 -
>  hw/ssi/sifive_spi.c          | 1 -
>  hw/vfio/display.c            | 1 -
>  hw/vfio/pci.c                | 1 -
>  hw/xtensa/virt.c             | 1 -
>  migration/ram.c              | 1 -
>  monitor/monitor.c            | 1 -
>  net/net.c                    | 2 --
>  net/netmap.c                 | 1 -
>  plugins/api.c                | 1 -
>  plugins/core.c               | 1 -
>  semihosting/config.c         | 1 -
>  semihosting/console.c        | 1 -
>  softmmu/arch_init.c          | 1 -
>  softmmu/device_tree.c        | 1 -
>  softmmu/physmem.c            | 1 -
>  softmmu/qdev-monitor.c       | 1 -
>  stubs/semihost.c             | 1 -
>  target/arm/cpu.c             | 1 -
>  target/openrisc/sys_helper.c | 1 -
>  target/rx/helper.c           | 1 -
>  target/s390x/cpu.c           | 1 -
>  target/s390x/excp_helper.c   | 1 -
>  tcg/tcg.c                    | 1 -
>  tests/qtest/fuzz/fuzz.c      | 1 -
>  tests/qtest/fuzz/qos_fuzz.c  | 1 -
>  util/oslib-win32.c           | 1 -
>  73 files changed, 74 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index b6d9f92f15..f42b743977 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -30,7 +30,6 @@
>  #include "sysemu/kvm_int.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/cpus.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/bswap.h"
>  #include "exec/memory.h"
>  #include "exec/ram_addr.h"
> diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
> index b876f5c1e4..968cd3ca60 100644
> --- a/accel/tcg/user-exec-stub.c
> +++ b/accel/tcg/user-exec-stub.c
> @@ -1,7 +1,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/core/cpu.h"
>  #include "sysemu/replay.h"
> -#include "sysemu/sysemu.h"
>  
>  bool enable_cpu_pm = false;
>  
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index b683da9daf..9b1b9f0a56 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -15,7 +15,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "sysemu/hostmem.h"
> -#include "sysemu/sysemu.h"
>  #include "qom/object_interfaces.h"
>  #include "qom/object.h"
>  
> diff --git a/backends/hostmem-memfd.c b/backends/hostmem-memfd.c
> index 69b0ae30bb..da75e27057 100644
> --- a/backends/hostmem-memfd.c
> +++ b/backends/hostmem-memfd.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "sysemu/hostmem.h"
> -#include "sysemu/sysemu.h"
>  #include "qom/object_interfaces.h"
>  #include "qemu/memfd.h"
>  #include "qemu/module.h"
> diff --git a/backends/hostmem.c b/backends/hostmem.c
> index c6c1ff5b99..aab3de8408 100644
> --- a/backends/hostmem.c
> +++ b/backends/hostmem.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "sysemu/hostmem.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-builtin-visit.h"
> diff --git a/block.c b/block.c
> index c5b887cec1..7261f714bf 100644
> --- a/block.c
> +++ b/block.c
> @@ -41,7 +41,6 @@
>  #include "qapi/qobject-output-visitor.h"
>  #include "qapi/qapi-visit-block-core.h"
>  #include "sysemu/block-backend.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/notify.h"
>  #include "qemu/option.h"
>  #include "qemu/coroutine.h"
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 413af51f3b..5f43a71a1d 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c
> @@ -18,7 +18,6 @@
>  #include "hw/qdev-core.h"
>  #include "sysemu/blockdev.h"
>  #include "sysemu/runstate.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/replay.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-block.h"
> diff --git a/block/nfs.c b/block/nfs.c
> index 8c1968bb41..7dff64f489 100644
> --- a/block/nfs.c
> +++ b/block/nfs.c
> @@ -39,7 +39,6 @@
>  #include "qemu/option.h"
>  #include "qemu/uri.h"
>  #include "qemu/cutils.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/replay.h"
>  #include "qapi/qapi-visit-block-core.h"
>  #include "qapi/qmp/qdict.h"
> diff --git a/chardev/char-mux.c b/chardev/char-mux.c
> index 72beef29d2..5baf419010 100644
> --- a/chardev/char-mux.c
> +++ b/chardev/char-mux.c
> @@ -28,7 +28,6 @@
>  #include "qemu/option.h"
>  #include "chardev/char.h"
>  #include "sysemu/block-backend.h"
> -#include "sysemu/sysemu.h"
>  #include "chardev-internal.h"
>  
>  /* MUX driver for serial I/O splitting */
> diff --git a/chardev/char.c b/chardev/char.c
> index 398f09df19..a4ebfcc5ac 100644
> --- a/chardev/char.c
> +++ b/chardev/char.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/cutils.h"
>  #include "monitor/monitor.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
>  #include "qemu/qemu-print.h"
> diff --git a/gdbstub.c b/gdbstub.c
> index 054665e93e..9103ffc902 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -37,7 +37,6 @@
>  #include "monitor/monitor.h"
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
> -#include "sysemu/sysemu.h"
>  #include "exec/gdbstub.h"
>  #include "hw/cpu/cluster.h"
>  #include "hw/boards.h"
> diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
> index c8e300d93f..1017ecf330 100644
> --- a/hw/alpha/dp264.c
> +++ b/hw/alpha/dp264.c
> @@ -13,7 +13,6 @@
>  #include "hw/loader.h"
>  #include "alpha_sys.h"
>  #include "qemu/error-report.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/rtc/mc146818rtc.h"
>  #include "hw/ide/pci.h"
>  #include "hw/timer/i8254.h"
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c3345fce53..c4f85dab63 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -23,7 +23,6 @@
>  #include "hw/misc/led.h"
>  #include "hw/qdev-properties.h"
>  #include "sysemu/block-backend.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
>  #include "qemu/units.h"
> diff --git a/hw/arm/cubieboard.c b/hw/arm/cubieboard.c
> index 3ec30ca5af..9e872135ae 100644
> --- a/hw/arm/cubieboard.c
> +++ b/hw/arm/cubieboard.c
> @@ -19,7 +19,6 @@
>  #include "exec/address-spaces.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/allwinner-a10.h"
> diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
> index 6cdc1d83fc..65d3a9ba74 100644
> --- a/hw/arm/digic_boards.c
> +++ b/hw/arm/digic_boards.c
> @@ -34,7 +34,6 @@
>  #include "hw/arm/digic.h"
>  #include "hw/block/flash.h"
>  #include "hw/loader.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "qemu/units.h"
>  #include "qemu/cutils.h"
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index 56b729141b..8ae136bbdf 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -26,7 +26,6 @@
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "cpu.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/sysbus.h"
>  #include "net/net.h"
>  #include "hw/arm/boot.h"
> diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
> index ed69a7b037..ce16b6b317 100644
> --- a/hw/arm/mcimx6ul-evk.c
> +++ b/hw/arm/mcimx6ul-evk.c
> @@ -15,7 +15,6 @@
>  #include "hw/arm/fsl-imx6ul.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
>  
> diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
> index e57d52b344..e896222c34 100644
> --- a/hw/arm/mcimx7d-sabre.c
> +++ b/hw/arm/mcimx7d-sabre.c
> @@ -17,7 +17,6 @@
>  #include "hw/arm/fsl-imx7.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
>  
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index e22fe4bf8f..d91d687700 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -27,7 +27,6 @@
>  #include "qemu-common.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
> -#include "sysemu/sysemu.h"
>  
>  #define NPCM750_EVB_POWER_ON_STRAPS 0x00001ff7
>  #define QUANTA_GSJ_POWER_ON_STRAPS 0x00001fff
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index b8d38c9e8d..6ccb61c149 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -25,7 +25,6 @@
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/allwinner-h3.h"
> -#include "sysemu/sysemu.h"
>  
>  static struct arm_boot_info orangepi_binfo = {
>      .nb_cpus = AW_H3_NUM_CPUS,
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 990509d385..1b7e9c4cb4 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -23,7 +23,6 @@
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/arm/boot.h"
> -#include "sysemu/sysemu.h"
>  #include "qom/object.h"
>  
>  #define SMPBOOT_ADDR    0x300 /* this should leave enough space for ATAGS */
> diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
> index a3dbf85e0e..42348e5cb1 100644
> --- a/hw/arm/sabrelite.c
> +++ b/hw/arm/sabrelite.c
> @@ -15,7 +15,6 @@
>  #include "hw/arm/fsl-imx6.h"
>  #include "hw/boards.h"
>  #include "hw/qdev-properties.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
>  
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f01d9041b..9c1203183a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -48,7 +48,6 @@
>  #include "sysemu/device_tree.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/tpm.h"
>  #include "sysemu/kvm.h"
>  #include "hw/loader.h"
> diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
> index 283a97b79d..9604c19117 100644
> --- a/hw/block/nvme-subsys.c
> +++ b/hw/block/nvme-subsys.c
> @@ -17,7 +17,6 @@
>  #include "hw/block/block.h"
>  #include "block/aio.h"
>  #include "block/accounting.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/pci/pci.h"
>  #include "nvme.h"
>  #include "nvme-subsys.h"
> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index 68a942595a..2ad004430e 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -22,7 +22,6 @@
>  #include "sysemu/hw_accel.h"
>  #include "sysemu/numa.h"
>  #include "sysemu/runstate.h"
> -#include "sysemu/sysemu.h"
>  
>  static void cpustate_to_cpuinfo_s390(CpuInfoS390 *info, const CPUState *cpu)
>  {
> diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
> index 7e693523d7..f586a4bef5 100644
> --- a/hw/core/null-machine.c
> +++ b/hw/core/null-machine.c
> @@ -14,7 +14,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/error-report.h"
>  #include "hw/boards.h"
> -#include "sysemu/sysemu.h"
>  #include "exec/address-spaces.h"
>  #include "hw/core/cpu.h"
>  
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 68cee65f61..ac6bed5817 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -26,7 +26,6 @@
>  #include "qemu/units.h"
>  #include "sysemu/hostmem.h"
>  #include "sysemu/numa.h"
> -#include "sysemu/sysemu.h"
>  #include "exec/cpu-common.h"
>  #include "exec/ramlist.h"
>  #include "qemu/bitmap.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 46cc951073..541967c1b9 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -42,7 +42,6 @@
>  #include "hw/irq.h"
>  #include "sysemu/kvm.h"
>  #include "hw/kvm/clock.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/arch_init.h"
>  #include "hw/i2c/smbus_eeprom.h"
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index 9fe72b370e..6ce37a2b05 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -35,7 +35,6 @@
>  #include "hw/i386/pc.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/block/flash.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/sev.h"
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index 275737842e..e7faf24058 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -27,7 +27,6 @@
>  #include "hw/input/ps2.h"
>  #include "hw/input/lasips2.h"
>  #include "exec/hwaddr.h"
> -#include "sysemu/sysemu.h"
>  #include "trace.h"
>  #include "exec/address-spaces.h"
>  #include "migration/vmstate.h"
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 97a1a27a9a..6a53e63299 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -29,7 +29,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "target/riscv/cpu.h"
> -#include "sysemu/sysemu.h"
>  #include "migration/vmstate.h"
>  
>  #define RISCV_DEBUG_PLIC 0
> diff --git a/hw/isa/isa-superio.c b/hw/isa/isa-superio.c
> index 179c185695..c81bfe58ef 100644
> --- a/hw/isa/isa-superio.c
> +++ b/hw/isa/isa-superio.c
> @@ -14,7 +14,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qapi/error.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/blockdev.h"
>  #include "chardev/char.h"
>  #include "hw/block/fdc.h"
> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
> index f46ccae25c..dab901c9ad 100644
> --- a/hw/isa/piix3.c
> +++ b/hw/isa/piix3.c
> @@ -29,7 +29,6 @@
>  #include "hw/isa/isa.h"
>  #include "hw/xen/xen.h"
>  #include "sysemu/xen.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
>  #include "migration/vmstate.h"
> diff --git a/hw/m68k/next-kbd.c b/hw/m68k/next-kbd.c
> index bee40e25bc..30a8c9fbfa 100644
> --- a/hw/m68k/next-kbd.c
> +++ b/hw/m68k/next-kbd.c
> @@ -33,7 +33,6 @@
>  #include "hw/sysbus.h"
>  #include "hw/m68k/next-cube.h"
>  #include "ui/console.h"
> -#include "sysemu/sysemu.h"
>  #include "migration/vmstate.h"
>  #include "qom/object.h"
>  
> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> index caaba1aa4c..8821d009f1 100644
> --- a/hw/microblaze/boot.c
> +++ b/hw/microblaze/boot.c
> @@ -33,7 +33,6 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/reset.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 26e7b1bd9f..5adb67ad2a 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -39,7 +39,6 @@
>  #include "hw/mips/mips.h"
>  #include "hw/mips/cpudevs.h"
>  #include "hw/pci/pci.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/arch_init.h"
>  #include "qemu/log.h"
>  #include "hw/mips/bios.h"
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index e6eeb575d5..4515296e66 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -35,7 +35,6 @@
>  #include "hw/char/escc.h"
>  #include "hw/misc/macio/macio.h"
>  #include "hw/intc/heathrow_pic.h"
> -#include "sysemu/sysemu.h"
>  #include "trace.h"
>  
>  /* Note: this code is strongly inspirated from the corresponding code
> diff --git a/hw/net/can/xlnx-zynqmp-can.c b/hw/net/can/xlnx-zynqmp-can.c
> index affa21a5ed..22bb8910fa 100644
> --- a/hw/net/can/xlnx-zynqmp-can.c
> +++ b/hw/net/can/xlnx-zynqmp-can.c
> @@ -37,7 +37,6 @@
>  #include "qemu/bitops.h"
>  #include "qemu/log.h"
>  #include "qemu/cutils.h"
> -#include "sysemu/sysemu.h"
>  #include "migration/vmstate.h"
>  #include "hw/qdev-properties.h"
>  #include "net/can_emu.h"
> diff --git a/hw/net/i82596.c b/hw/net/i82596.c
> index 055c3a1470..ec21e2699a 100644
> --- a/hw/net/i82596.c
> +++ b/hw/net/i82596.c
> @@ -12,7 +12,6 @@
>  #include "qemu/timer.h"
>  #include "net/net.h"
>  #include "net/eth.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
> diff --git a/hw/net/lasi_i82596.c b/hw/net/lasi_i82596.c
> index 820b63f350..e37f7fabe9 100644
> --- a/hw/net/lasi_i82596.c
> +++ b/hw/net/lasi_i82596.c
> @@ -18,7 +18,6 @@
>  #include "hw/net/lasi_82596.h"
>  #include "hw/net/i82596.h"
>  #include "trace.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  
> diff --git a/hw/nios2/boot.c b/hw/nios2/boot.c
> index d9969ac148..95bdc18052 100644
> --- a/hw/nios2/boot.c
> +++ b/hw/nios2/boot.c
> @@ -38,7 +38,6 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/reset.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index f4e804cdb5..8da7bc7af9 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -34,7 +34,6 @@
>  #include "ppc405.h"
>  #include "hw/rtc/m48t59.h"
>  #include "hw/block/flash.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/block-backend.h"
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index af4ccb9f43..b41570c747 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -29,7 +29,6 @@
>  #include "hw/char/serial.h"
>  #include "hw/block/fdc.h"
>  #include "net/net.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/isa/isa.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> diff --git a/hw/rx/rx-gdbsim.c b/hw/rx/rx-gdbsim.c
> index 9b82feff52..1f53fdb082 100644
> --- a/hw/rx/rx-gdbsim.c
> +++ b/hw/rx/rx-gdbsim.c
> @@ -24,7 +24,6 @@
>  #include "cpu.h"
>  #include "hw/loader.h"
>  #include "hw/rx/rx62n.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/device_tree.h"
>  #include "hw/boards.h"
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index ff6b55e816..f12af5e35b 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -18,7 +18,6 @@
>  #include "qapi/error.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/tcg.h"
>  #include "cpu.h"
>  #include "elf.h"
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index 0cf2290826..f57340a7d7 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -16,7 +16,6 @@
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/s390x/sclp.h"
>  #include "hw/s390x/event-facility.h"
> diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
> index d9a9fcbc59..1a44378df4 100644
> --- a/hw/sh4/shix.c
> +++ b/hw/sh4/shix.c
> @@ -31,7 +31,6 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "hw/sh4/sh.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/qtest.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
> index 0c9ebca3c8..03540cf5ca 100644
> --- a/hw/ssi/sifive_spi.c
> +++ b/hw/ssi/sifive_spi.c
> @@ -24,7 +24,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "hw/ssi/ssi.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/fifo8.h"
>  #include "qemu/log.h"
>  #include "qemu/module.h"
> diff --git a/hw/vfio/display.c b/hw/vfio/display.c
> index f04473e3ce..89bc90508f 100644
> --- a/hw/vfio/display.c
> +++ b/hw/vfio/display.c
> @@ -14,7 +14,6 @@
>  #include <linux/vfio.h>
>  #include <sys/ioctl.h>
>  
> -#include "sysemu/sysemu.h"
>  #include "hw/display/edid.h"
>  #include "ui/console.h"
>  #include "qapi/error.h"
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 5c65aa0a98..ab4077aad2 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -37,7 +37,6 @@
>  #include "qemu/units.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/runstate.h"
> -#include "sysemu/sysemu.h"
>  #include "pci.h"
>  #include "trace.h"
>  #include "qapi/error.h"
> diff --git a/hw/xtensa/virt.c b/hw/xtensa/virt.c
> index e47e1de676..bbf6200c49 100644
> --- a/hw/xtensa/virt.c
> +++ b/hw/xtensa/virt.c
> @@ -29,7 +29,6 @@
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "sysemu/reset.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "hw/pci-host/gpex.h"
> diff --git a/migration/ram.c b/migration/ram.c
> index 4682f3625c..9e9b7380bf 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -51,7 +51,6 @@
>  #include "qemu/rcu_queue.h"
>  #include "migration/colo.h"
>  #include "block.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/cpu-throttle.h"
>  #include "savevm.h"
>  #include "qemu/iov.h"
> diff --git a/monitor/monitor.c b/monitor/monitor.c
> index 636bcc81c5..b90c0f4051 100644
> --- a/monitor/monitor.c
> +++ b/monitor/monitor.c
> @@ -32,7 +32,6 @@
>  #include "qemu/error-report.h"
>  #include "qemu/option.h"
>  #include "sysemu/qtest.h"
> -#include "sysemu/sysemu.h"
>  #include "trace.h"
>  
>  /*
> diff --git a/net/net.c b/net/net.c
> index edf9b95418..2a472604ec 100644
> --- a/net/net.c
> +++ b/net/net.c
> @@ -51,9 +51,7 @@
>  #include "qemu/option.h"
>  #include "qapi/error.h"
>  #include "qapi/opts-visitor.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/runstate.h"
> -#include "sysemu/sysemu.h"
>  #include "net/filter.h"
>  #include "qapi/string-output-visitor.h"
>  
> diff --git a/net/netmap.c b/net/netmap.c
> index 350f097f91..9e0cec58d3 100644
> --- a/net/netmap.c
> +++ b/net/netmap.c
> @@ -33,7 +33,6 @@
>  #include "net/net.h"
>  #include "net/tap.h"
>  #include "clients.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
>  #include "qemu/iov.h"
> diff --git a/plugins/api.c b/plugins/api.c
> index b22998cd7c..218e1342cd 100644
> --- a/plugins/api.c
> +++ b/plugins/api.c
> @@ -37,7 +37,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu/plugin.h"
>  #include "cpu.h"
> -#include "sysemu/sysemu.h"
>  #include "tcg/tcg.h"
>  #include "exec/exec-all.h"
>  #include "exec/ram_addr.h"
> diff --git a/plugins/core.c b/plugins/core.c
> index 87b823bbc4..93b595a8d6 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -26,7 +26,6 @@
>  #include "cpu.h"
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
> -#include "sysemu/sysemu.h"
>  #include "tcg/tcg.h"
>  #include "tcg/tcg-op.h"
>  #include "trace/mem-internal.h" /* mem_info macros */
> diff --git a/semihosting/config.c b/semihosting/config.c
> index 3548e0f627..137171b717 100644
> --- a/semihosting/config.c
> +++ b/semihosting/config.c
> @@ -24,7 +24,6 @@
>  #include "qemu/error-report.h"
>  #include "semihosting/semihost.h"
>  #include "chardev/char.h"
> -#include "sysemu/sysemu.h"
>  
>  QemuOptsList qemu_semihosting_config_opts = {
>      .name = "semihosting-config",
> diff --git a/semihosting/console.c b/semihosting/console.c
> index c9ebd6fdd0..a78af69387 100644
> --- a/semihosting/console.c
> +++ b/semihosting/console.c
> @@ -24,7 +24,6 @@
>  #include "qemu/log.h"
>  #include "chardev/char.h"
>  #include "chardev/char-fe.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/main-loop.h"
>  #include "qapi/error.h"
>  #include "qemu/fifo8.h"
> diff --git a/softmmu/arch_init.c b/softmmu/arch_init.c
> index 7fd5c09b2b..8471711c54 100644
> --- a/softmmu/arch_init.c
> +++ b/softmmu/arch_init.c
> @@ -23,7 +23,6 @@
>   */
>  #include "qemu/osdep.h"
>  #include "cpu.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/arch_init.h"
>  #include "hw/pci/pci.h"
>  #include "hw/audio/soundhw.h"
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 2691c58cf6..b621f63fba 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -23,7 +23,6 @@
>  #include "qemu/bswap.h"
>  #include "qemu/cutils.h"
>  #include "sysemu/device_tree.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/loader.h"
>  #include "hw/boards.h"
>  #include "qemu/config-file.h"
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 85034d9c11..7ed276b9b5 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -36,7 +36,6 @@
>  #include "hw/boards.h"
>  #include "hw/xen/xen.h"
>  #include "sysemu/kvm.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/qtest.h"
>  #include "qemu/timer.h"
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index a9955b97a0..721dec2d82 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -35,7 +35,6 @@
>  #include "qemu/qemu-print.h"
>  #include "qemu/option_int.h"
>  #include "sysemu/block-backend.h"
> -#include "sysemu/sysemu.h"
>  #include "migration/misc.h"
>  #include "migration/migration.h"
>  #include "qemu/cutils.h"
> diff --git a/stubs/semihost.c b/stubs/semihost.c
> index 1b30f38b03..4bf2cf71b9 100644
> --- a/stubs/semihost.c
> +++ b/stubs/semihost.c
> @@ -12,7 +12,6 @@
>  #include "qemu/option.h"
>  #include "qemu/error-report.h"
>  #include "semihosting/semihost.h"
> -#include "sysemu/sysemu.h"
>  
>  /* Empty config */
>  QemuOptsList qemu_semihosting_config_opts = {
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 0dd623e590..4eb0d2f85c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -36,7 +36,6 @@
>  #include "hw/loader.h"
>  #include "hw/boards.h"
>  #endif
> -#include "sysemu/sysemu.h"
>  #include "sysemu/tcg.h"
>  #include "sysemu/hw_accel.h"
>  #include "kvm_arm.h"
> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
> index 41390d046f..48674231e7 100644
> --- a/target/openrisc/sys_helper.c
> +++ b/target/openrisc/sys_helper.c
> @@ -23,7 +23,6 @@
>  #include "exec/exec-all.h"
>  #include "exec/helper-proto.h"
>  #include "exception.h"
> -#include "sysemu/sysemu.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "hw/boards.h"
>  #endif
> diff --git a/target/rx/helper.c b/target/rx/helper.c
> index 3e380a94fe..db6b07e389 100644
> --- a/target/rx/helper.c
> +++ b/target/rx/helper.c
> @@ -21,7 +21,6 @@
>  #include "cpu.h"
>  #include "exec/log.h"
>  #include "exec/cpu_ldst.h"
> -#include "sysemu/sysemu.h"
>  #include "hw/irq.h"
>  
>  void rx_cpu_unpack_psw(CPURXState *env, uint32_t psw, int rte)
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index d35eb39a1b..64455cf309 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -40,7 +40,6 @@
>  #include "hw/s390x/pv.h"
>  #include "hw/boards.h"
>  #include "sysemu/arch_init.h"
> -#include "sysemu/sysemu.h"
>  #include "sysemu/tcg.h"
>  #endif
>  #include "fpu/softfloat-helpers.h"
> diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
> index c48cd6b46f..20625c2c8f 100644
> --- a/target/s390x/excp_helper.c
> +++ b/target/s390x/excp_helper.c
> @@ -29,7 +29,6 @@
>  #include "exec/address-spaces.h"
>  #include "tcg_s390x.h"
>  #ifndef CONFIG_USER_ONLY
> -#include "sysemu/sysemu.h"
>  #include "hw/s390x/s390_flic.h"
>  #include "hw/boards.h"
>  #endif
> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index 1fbe0b686d..cc947bf6f6 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -64,7 +64,6 @@
>  
>  #include "elf.h"
>  #include "exec/log.h"
> -#include "sysemu/sysemu.h"
>  
>  /* Forward declarations for functions declared in tcg-target.c.inc and
>     used here. */
> diff --git a/tests/qtest/fuzz/fuzz.c b/tests/qtest/fuzz/fuzz.c
> index 496d11a231..04b70e114b 100644
> --- a/tests/qtest/fuzz/fuzz.c
> +++ b/tests/qtest/fuzz/fuzz.c
> @@ -18,7 +18,6 @@
>  #include "qemu/datadir.h"
>  #include "sysemu/qtest.h"
>  #include "sysemu/runstate.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/main-loop.h"
>  #include "qemu/rcu.h"
>  #include "tests/qtest/libqos/libqtest.h"
> diff --git a/tests/qtest/fuzz/qos_fuzz.c b/tests/qtest/fuzz/qos_fuzz.c
> index cee1a2a60f..2bc474645c 100644
> --- a/tests/qtest/fuzz/qos_fuzz.c
> +++ b/tests/qtest/fuzz/qos_fuzz.c
> @@ -22,7 +22,6 @@
>  #include "qemu-common.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/main-loop.h"
>  
>  #include "tests/qtest/libqos/libqtest.h"
> diff --git a/util/oslib-win32.c b/util/oslib-win32.c
> index f68b8012bb..1fc42ec0e3 100644
> --- a/util/oslib-win32.c
> +++ b/util/oslib-win32.c
> @@ -34,7 +34,6 @@
>  #include <windows.h>
>  #include "qemu-common.h"
>  #include "qapi/error.h"
> -#include "sysemu/sysemu.h"
>  #include "qemu/main-loop.h"
>  #include "trace.h"
>  #include "qemu/sockets.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


