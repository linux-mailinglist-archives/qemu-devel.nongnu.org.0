Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BF36FE3F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 18:06:09 +0200 (CEST)
Received: from localhost ([::1]:53782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcVea-0000Cd-Dp
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 12:06:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVYM-0006hG-DQ; Fri, 30 Apr 2021 11:59:42 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:40313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcVYH-0004Kl-CR; Fri, 30 Apr 2021 11:59:42 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mzhzd-1lPo3h2gwj-00vdlu; Fri, 30 Apr 2021 17:59:32 +0200
Subject: Re: [PATCH 2/4] Do not include hw/boards.h if it's not really
 necessary
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210416171314.2074665-1-thuth@redhat.com>
 <20210416171314.2074665-3-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <49be6bb5-e722-7019-4e31-aef0ddd77e1b@vivier.eu>
Date: Fri, 30 Apr 2021 17:59:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416171314.2074665-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0kbgMPrSCn97Mgocq65B/abyeKgwFMqK13EIOX0lguKaZLp74Nu
 aDdALepOWYhZ33yFwcNxM0HhmMDlXLuN2o6lRLMMqHlBtWSnRo2czQmUr+lB+rZsZ/3lYU1
 mfLncBbY+7w4Pv+hMyw+xfgXQRxiSI1WC7v2FZt6GfQVTFQ6hi3CM5o1Dtzkxx2pe5mNV+b
 D0yf5WK3/bRtdrUK8q3ig==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cEIL5h1KyR4=:LVoCc4N2HUixpxAkwwaOtV
 px8ik1lijEPpxzaVYrT3TJi4Qt81M8rtyiorCcZOTgS13zs1Twulf11rQ0wR0inn1AI5U2iyk
 SC8ceVu+/+pj9pXaLRb5rslIPYMtzmswoIMMh/DDLQG2FKcD6s/0a71PC9jiRchIaGUsTDIpv
 /h+lpidtJDxX1OGBRVNkQmxYjndOeEGsbBLw+Dyn6ObEDYr5znBpOpgMGoBiLZnk7q7RIYAKz
 AjYKrYHasEbGdfWmUnbhKYaDjqflVbxsqo12iHWrHJ71g0a267JTH9rHUShw22E+CLeoT5Zzl
 EAbBN596lKINFwI0KNEPe/fhJEjan+Ga2dKuvTjI32ZTmmaMpH2mE5m34ZLfpZPdbWqLxHR6s
 UiSWHOmPgIW7NHXpMX6miRXQB+/1XkivdLMyDnpp+HQ54Fv0Cg5x3IYVjKkBRiUJPMVUFyEHv
 u/fqBZFJds9Gx1aYLbsuYDvNhFnkTPdfYk+T2kM8OD5He6nuYGuOLuZxPeW9AQS61gY1l/mAu
 k61ew9BgJ1/Qk1HCyJcBEw=
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
> Stop including hw/boards.h in files that don't need it.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  accel/tcg/tcg-accel-ops-icount.c | 1 -
>  accel/tcg/tcg-accel-ops-rr.c     | 1 -
>  accel/tcg/tcg-accel-ops.c        | 1 -
>  hw/acpi/cpu.c                    | 1 -
>  hw/acpi/memory_hotplug.c         | 1 -
>  hw/alpha/typhoon.c               | 1 -
>  hw/arm/aspeed.c                  | 1 -
>  hw/arm/omap1.c                   | 1 -
>  hw/arm/omap2.c                   | 1 -
>  hw/arm/strongarm.c               | 1 -
>  hw/arm/virt.c                    | 1 -
>  hw/avr/arduino.c                 | 1 -
>  hw/avr/atmega.c                  | 1 -
>  hw/display/next-fb.c             | 1 -
>  hw/hppa/machine.c                | 1 -
>  hw/i386/acpi-build.c             | 1 -
>  hw/i386/acpi-microvm.c           | 1 -
>  hw/i386/intel_iommu.c            | 1 -
>  hw/i386/pc.c                     | 1 -
>  hw/i386/x86-iommu.c              | 1 -
>  hw/intc/sifive_plic.c            | 1 -
>  hw/mips/loongson3_virt.c         | 1 -
>  hw/ppc/e500.c                    | 1 -
>  hw/ppc/mac_newworld.c            | 1 -
>  hw/ppc/mac_oldworld.c            | 1 -
>  hw/ppc/pnv.c                     | 1 -
>  hw/ppc/ppc4xx_devs.c             | 1 -
>  hw/ppc/rs6000_mc.c               | 1 -
>  hw/ppc/spapr.c                   | 1 -
>  hw/ppc/spapr_rtas.c              | 1 -
>  hw/remote/iohub.c                | 1 -
>  hw/s390x/s390-virtio-ccw.c       | 2 --
>  hw/tricore/tc27x_soc.c           | 1 -
>  hw/tricore/triboard.c            | 1 -
>  softmmu/vl.c                     | 1 -
>  35 files changed, 36 deletions(-)
> 
> diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
> index 13b8fbeb69..ea42d1d51b 100644
> --- a/accel/tcg/tcg-accel-ops-icount.c
> +++ b/accel/tcg/tcg-accel-ops-icount.c
> @@ -30,7 +30,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/guest-random.h"
>  #include "exec/exec-all.h"
> -#include "hw/boards.h"
>  
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-icount.h"
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index 018b54c508..c02c061ecb 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -30,7 +30,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/guest-random.h"
>  #include "exec/exec-all.h"
> -#include "hw/boards.h"
>  
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-rr.h"
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index 6cdcaa2855..7191315aee 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -32,7 +32,6 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/guest-random.h"
>  #include "exec/exec-all.h"
> -#include "hw/boards.h"
>  
>  #include "tcg-accel-ops.h"
>  #include "tcg-accel-ops-mttcg.h"
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index e2317be546..f82e9512fd 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -1,5 +1,4 @@
>  #include "qemu/osdep.h"
> -#include "hw/boards.h"
>  #include "migration/vmstate.h"
>  #include "hw/acpi/cpu.h"
>  #include "qapi/error.h"
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 0bdcf15528..af37889423 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -2,7 +2,6 @@
>  #include "hw/acpi/memory_hotplug.h"
>  #include "hw/acpi/pc-hotplug.h"
>  #include "hw/mem/pc-dimm.h"
> -#include "hw/boards.h"
>  #include "hw/qdev-core.h"
>  #include "migration/vmstate.h"
>  #include "trace.h"
> diff --git a/hw/alpha/typhoon.c b/hw/alpha/typhoon.c
> index a42b319812..96c35c5fdb 100644
> --- a/hw/alpha/typhoon.c
> +++ b/hw/alpha/typhoon.c
> @@ -11,7 +11,6 @@
>  #include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "hw/boards.h"
>  #include "hw/irq.h"
>  #include "alpha_sys.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c4f85dab63..b1e5bc76e4 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -16,7 +16,6 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
> -#include "hw/boards.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
>  #include "hw/misc/tmp105.h"
> diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
> index 02c0f66431..180d3788f8 100644
> --- a/hw/arm/omap1.c
> +++ b/hw/arm/omap1.c
> @@ -24,7 +24,6 @@
>  #include "qemu-common.h"
>  #include "cpu.h"
>  #include "exec/address-spaces.h"
> -#include "hw/boards.h"
>  #include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
> diff --git a/hw/arm/omap2.c b/hw/arm/omap2.c
> index 16d388fc79..02b1aa8c97 100644
> --- a/hw/arm/omap2.c
> +++ b/hw/arm/omap2.c
> @@ -27,7 +27,6 @@
>  #include "sysemu/qtest.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> -#include "hw/boards.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/arm/boot.h"
> diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
> index c7ca54bcea..4dee791fd2 100644
> --- a/hw/arm/strongarm.c
> +++ b/hw/arm/strongarm.c
> @@ -30,7 +30,6 @@
>  #include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> -#include "hw/boards.h"
>  #include "hw/irq.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/qdev-properties-system.h"
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9c1203183a..300b3b18be 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -36,7 +36,6 @@
>  #include "monitor/qdev.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
> -#include "hw/boards.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/primecell.h"
>  #include "hw/arm/virt.h"
> diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
> index 3ff31492fa..48ef478346 100644
> --- a/hw/avr/arduino.c
> +++ b/hw/avr/arduino.c
> @@ -12,7 +12,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "hw/boards.h"
>  #include "atmega.h"
>  #include "boot.h"
>  #include "qom/object.h"
> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
> index 44c6afebbb..80b8a41cb5 100644
> --- a/hw/avr/atmega.c
> +++ b/hw/avr/atmega.c
> @@ -18,7 +18,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/sysbus.h"
>  #include "qom/object.h"
> -#include "hw/boards.h" /* FIXME memory_region_allocate_system_memory for sram */
>  #include "hw/misc/unimp.h"
>  #include "atmega.h"
>  
> diff --git a/hw/display/next-fb.c b/hw/display/next-fb.c
> index cc134c2d5b..dd6a1aa8ae 100644
> --- a/hw/display/next-fb.c
> +++ b/hw/display/next-fb.c
> @@ -24,7 +24,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "ui/console.h"
> -#include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "framebuffer.h"
>  #include "ui/pixel_ops.h"
> diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
> index f2b71db9bd..2a46af5bc9 100644
> --- a/hw/hppa/machine.c
> +++ b/hw/hppa/machine.c
> @@ -9,7 +9,6 @@
>  #include "cpu.h"
>  #include "elf.h"
>  #include "hw/loader.h"
> -#include "hw/boards.h"
>  #include "qemu/error-report.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index de98750aef..bfecb0038c 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -43,7 +43,6 @@
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/vmgenid.h"
> -#include "hw/boards.h"
>  #include "sysemu/tpm_backend.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
>  #include "migration/vmstate.h"
> diff --git a/hw/i386/acpi-microvm.c b/hw/i386/acpi-microvm.c
> index ccd3303aac..1a0f77b911 100644
> --- a/hw/i386/acpi-microvm.c
> +++ b/hw/i386/acpi-microvm.c
> @@ -30,7 +30,6 @@
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/utils.h"
> -#include "hw/boards.h"
>  #include "hw/i386/fw_cfg.h"
>  #include "hw/i386/microvm.h"
>  #include "hw/pci/pci.h"
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 6be8f32918..1c10643432 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -31,7 +31,6 @@
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/pc.h"
>  #include "hw/i386/apic-msidef.h"
> -#include "hw/boards.h"
>  #include "hw/i386/x86-iommu.h"
>  #include "hw/pci-host/q35.h"
>  #include "sysemu/kvm.h"
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8a84b25a03..b5ce3835e7 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -74,7 +74,6 @@
>  #include "qemu/cutils.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/cpu_hotplug.h"
> -#include "hw/boards.h"
>  #include "acpi-build.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/mem/nvdimm.h"
> diff --git a/hw/i386/x86-iommu.c b/hw/i386/x86-iommu.c
> index 5f4301639c..86ad03972e 100644
> --- a/hw/i386/x86-iommu.c
> +++ b/hw/i386/x86-iommu.c
> @@ -19,7 +19,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/sysbus.h"
> -#include "hw/boards.h"
>  #include "hw/i386/x86-iommu.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/i386/pc.h"
> diff --git a/hw/intc/sifive_plic.c b/hw/intc/sifive_plic.c
> index 6a53e63299..78903beb06 100644
> --- a/hw/intc/sifive_plic.c
> +++ b/hw/intc/sifive_plic.c
> @@ -25,7 +25,6 @@
>  #include "qemu/error-report.h"
>  #include "hw/sysbus.h"
>  #include "hw/pci/msi.h"
> -#include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "hw/intc/sifive_plic.h"
>  #include "target/riscv/cpu.h"
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index f9c0873a98..1d6573bc63 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -32,7 +32,6 @@
>  #include "cpu.h"
>  #include "elf.h"
>  #include "kvm_mips.h"
> -#include "hw/boards.h"
>  #include "hw/char/serial.h"
>  #include "hw/intc/loongson_liointc.h"
>  #include "hw/mips/mips.h"
> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
> index 79467ac512..03b3bd322f 100644
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -25,7 +25,6 @@
>  #include "qemu/config-file.h"
>  #include "hw/char/serial.h"
>  #include "hw/pci/pci.h"
> -#include "hw/boards.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/reset.h"
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 2175962846..9659857dba 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -58,7 +58,6 @@
>  #include "hw/pci/pci.h"
>  #include "net/net.h"
>  #include "sysemu/sysemu.h"
> -#include "hw/boards.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/char/escc.h"
>  #include "hw/misc/macio/macio.h"
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 963d247f5f..95d3d95158 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -38,7 +38,6 @@
>  #include "hw/isa/isa.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_host.h"
> -#include "hw/boards.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/char/escc.h"
>  #include "hw/misc/macio/macio.h"
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index 6faf1fe473..22b1c4f1f3 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -52,7 +52,6 @@
>  #include "hw/ppc/pnv_pnor.h"
>  
>  #include "hw/isa/isa.h"
> -#include "hw/boards.h"
>  #include "hw/char/serial.h"
>  #include "hw/rtc/mc146818rtc.h"
>  
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index fe9d4f7155..980c48944f 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -29,7 +29,6 @@
>  #include "hw/irq.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/ppc/ppc4xx.h"
> -#include "hw/boards.h"
>  #include "hw/intc/ppc-uic.h"
>  #include "hw/qdev-properties.h"
>  #include "qemu/log.h"
> diff --git a/hw/ppc/rs6000_mc.c b/hw/ppc/rs6000_mc.c
> index 4db5b51a2d..c0bc212e92 100644
> --- a/hw/ppc/rs6000_mc.c
> +++ b/hw/ppc/rs6000_mc.c
> @@ -23,7 +23,6 @@
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "exec/address-spaces.h"
> -#include "hw/boards.h"
>  #include "qapi/error.h"
>  #include "trace.h"
>  #include "qom/object.h"
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index e4be00b732..89e0e60446 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -54,7 +54,6 @@
>  #include "cpu-models.h"
>  #include "hw/core/cpu.h"
>  
> -#include "hw/boards.h"
>  #include "hw/ppc/ppc.h"
>  #include "hw/loader.h"
>  
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index 8a79f9c628..fb64be1150 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -41,7 +41,6 @@
>  #include "hw/ppc/spapr_rtas.h"
>  #include "hw/ppc/spapr_cpu_core.h"
>  #include "hw/ppc/ppc.h"
> -#include "hw/boards.h"
>  
>  #include <libfdt.h>
>  #include "hw/ppc/spapr_drc.h"
> diff --git a/hw/remote/iohub.c b/hw/remote/iohub.c
> index e4ff131a6b..547d597f0f 100644
> --- a/hw/remote/iohub.c
> +++ b/hw/remote/iohub.c
> @@ -15,7 +15,6 @@
>  #include "hw/pci/pci_ids.h"
>  #include "hw/pci/pci_bus.h"
>  #include "qemu/thread.h"
> -#include "hw/boards.h"
>  #include "hw/remote/machine.h"
>  #include "hw/remote/iohub.h"
>  #include "qemu/main-loop.h"
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 2972b607f3..f0dbbc9f4c 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -14,10 +14,8 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
> -#include "hw/boards.h"
>  #include "exec/address-spaces.h"
>  #include "exec/ram_addr.h"
> -#include "hw/boards.h"
>  #include "hw/s390x/s390-virtio-hcall.h"
>  #include "hw/s390x/sclp.h"
>  #include "hw/s390x/s390_flic.h"
> diff --git a/hw/tricore/tc27x_soc.c b/hw/tricore/tc27x_soc.c
> index dea9ba3cca..dcccdba786 100644
> --- a/hw/tricore/tc27x_soc.c
> +++ b/hw/tricore/tc27x_soc.c
> @@ -21,7 +21,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
> -#include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "qemu/units.h"
>  #include "hw/misc/unimp.h"
> diff --git a/hw/tricore/triboard.c b/hw/tricore/triboard.c
> index 16e2fd7e27..f8d5f7a787 100644
> --- a/hw/tricore/triboard.c
> +++ b/hw/tricore/triboard.c
> @@ -24,7 +24,6 @@
>  #include "hw/qdev-properties.h"
>  #include "cpu.h"
>  #include "net/net.h"
> -#include "hw/boards.h"
>  #include "hw/loader.h"
>  #include "exec/address-spaces.h"
>  #include "elf.h"
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index aadb526138..307944aef3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -27,7 +27,6 @@
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "exec/cpu-common.h"
> -#include "hw/boards.h"
>  #include "hw/qdev-properties.h"
>  #include "qapi/compat-policy.h"
>  #include "qapi/error.h"
> 

Applied to my trivial-patches branch.

Thanks,
Laurent


