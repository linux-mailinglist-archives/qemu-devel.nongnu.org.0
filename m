Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57A20B08D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jun 2020 13:32:15 +0200 (CEST)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jomab-0006kN-JM
	for lists+qemu-devel@lfdr.de; Fri, 26 Jun 2020 07:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1jomYv-0005n7-Gx
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 07:30:29 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:33730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenhuacai@gmail.com>)
 id 1jomYr-0004Sh-Je
 for qemu-devel@nongnu.org; Fri, 26 Jun 2020 07:30:29 -0400
Received: by mail-il1-x12d.google.com with SMTP id z2so8169427ilq.0
 for <qemu-devel@nongnu.org>; Fri, 26 Jun 2020 04:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0DzkC+8v8hfsCi//eX439ULLOIZhUfv7zDAWFb0Ugbo=;
 b=So9vOCoyyK52OhwgiE3otjfbzfbiVzf9S+UqtLx633zOnvi47gXD2pYrTZS7P+VHQi
 K9jNBpPnKOHn8+YK2A/ebXMqDkHWwj8Iqs2O7g7yef8ng8MpnzE1SHyvF8VqwCfEenbY
 zciLhD0GEFoP4lk1VH1swdt+yuIfxBg/OTZrF51/hRHxcfuzwuKTtc456v3bpkV1gN+w
 fRfq/XjRX/cxG/izLEiZxIcyUNfPq5UBkEnEKAtK7aUWfuRQfYRzZpeTk/5SbFCZxoJz
 DI3OJRuB0EaTht396KRLlD4lnnNjYP4vZbsV/TprtbnFlJKljtfjW5NSm6tRtUoBw5EH
 6Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0DzkC+8v8hfsCi//eX439ULLOIZhUfv7zDAWFb0Ugbo=;
 b=tI56I7GdcedFTmb+99M31ljuVkWVpacWxu1XTdVZYADDq4bc95o5Bi89YWFd8YWl2R
 PzXtNVAj5JE+2BBxPHfHF4Eew8e+ssbve+EPe2JTZxqnDJE6vBixjudVBq6BVdIGgWoD
 APvFyoGiBBO72Du6hrJzCJD3l3I+ioZtoi0kILNwIbYTvJ4Vi7Fgkt1EgqEQRRMFbrUo
 PfqQeMHZ8J/7ies12uHHNGlNq/y5442zZpXXeUw1PrZdzyi4+oe6gHQBLzH29YcBswwV
 HA2g7aJ5NGtSPHsgmMT/b76m2YaW1/APoyQx5RyV51JOXuyS9J5GwMEI0Fnc8xkPm0x5
 ecqg==
X-Gm-Message-State: AOAM530u9qscMLD7I6wCLVPx9ws4XOpO9FXwnhhGLQdx4FTaBxf4c4Sq
 SMi79l37rwAcUAHjKH7AeJES6NNHrGcUMecZfkg=
X-Google-Smtp-Source: ABdhPJwJk2sKLRasvJ7QyEGVyn6fc9CQXwOGfehUrk8a6soyeOFOqofGrHK2lXNaqCJPtnnvOrnXBOlsE2F0zn+dJKI=
X-Received: by 2002:a92:4a08:: with SMTP id m8mr2567620ilf.208.1593171024017; 
 Fri, 26 Jun 2020 04:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <1592995531-32600-1-git-send-email-chenhc@lemote.com>
 <1592995531-32600-4-git-send-email-chenhc@lemote.com>
 <CAHiYmc5GDUjx1V_OaPpaByDv9VJEdcTNv3+OiaOjAPngDU-xnw@mail.gmail.com>
In-Reply-To: <CAHiYmc5GDUjx1V_OaPpaByDv9VJEdcTNv3+OiaOjAPngDU-xnw@mail.gmail.com>
From: Huacai Chen <chenhuacai@gmail.com>
Date: Fri, 26 Jun 2020 19:30:11 +0800
Message-ID: <CAAhV-H6NAD=EHO4rW9MWgJDpZz4+HK4-wZeaLKqXECdVzfYCqg@mail.gmail.com>
Subject: Re: [PATCH V6 3/4] hw/mips: Add Loongson-3 machine support (with KVM)
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=chenhuacai@gmail.com; helo=mail-il1-x12d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Aleksandar,

On Wed, Jun 24, 2020 at 7:50 PM Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
>
> =D1=81=D1=80=D0=B5, 24. =D1=98=D1=83=D0=BD 2020. =D1=83 12:45 Huacai Chen=
 <zltjiangshi@gmail.com> =D1=98=D0=B5 =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=
=D0=BE/=D0=BB=D0=B0:
> >
> > Add Loongson-3 based machine support, it use liointc as the interrupt
> > controler and use GPEX as the pci controller. Currently it can only wor=
k
> > with KVM, but we will add TCG support in future.
> >
> > As the machine model is not based on any exiting physical hardware, the
> > name of the machine is "loongson3-virt". It may be superseded in future
> > by a real machine model. If this happens, then a regular deprecation
> > procedure shall occur for "loongson3-virt" machine.
> >
> > We now already have a full functional Linux kernel (based on Linux-5.4.=
x
> > LTS, the kvm host side has been upstream in Linux-5.8, but the kvm gues=
t
> > side has not been upstream yet) here:
> >
>
> Hi, Huacai,
>
> Can you please enumerate here links to all patches in your kernel
> repository that are not yet upstreamed, but are necessary for the
> scenario below to work?
The code structure is different between Linux-5.4 and upstream,
because Jiaxun has been making effort to modernize Loongson64 since
5.5 (and will be mostly completed in 5.9).

For Linux-5.4, the necessary commit for guest side is
https://github.com/chenhuacai/linux/commit/f31b7c1284eb7cbeaa7728454ec67490=
65c12075
For upstream (mips-next), the necessary commit for guest side is
https://github.com/chenhuacai/linux/commit/56e7c7ea8eb2a6cab7037b64383e2e8f=
aca88c02
>
> Thanks,
> Aleksandar
>
>
> > https://github.com/chenhuacai/linux
> >
> > How to use QEMU/Loongson-3?
> > 1, Download kernel source from the above URL;
> > 2, Build a kernel with arch/mips/configs/loongson3_{def,hpc}config;
> > 3, Boot the a Loongson-3A4000 host with this kernel;
> > 4, Build QEMU-master with this patchset;
> > 5, modprobe kvm;
> > 6, Use QEMU with TCG (available in future):
> >        qemu-system-mips64el -M loongson3-virt,accel=3Dtcg -cpu Loongson=
-3A1000 -kernel <path_to_kernel> -append ...
> >    Use QEMU with KVM (available at present):
> >        qemu-system-mips64el -M loongson3-virt,accel=3Dkvm -cpu Loongson=
-3A4000 -kernel <path_to_kernel> -append ...
> >
> >    The "-cpu" parameter is optional here and QEMU will use the correct =
type for TCG/KVM automatically.
> >
> > Signed-off-by: Huacai Chen <chenhc@lemote.com>
> > Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> > ---
> >  default-configs/mips64el-softmmu.mak |   1 +
> >  hw/mips/Kconfig                      |  11 +
> >  hw/mips/Makefile.objs                |   1 +
> >  hw/mips/loongson3_virt.c             | 978 +++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 991 insertions(+)
> >  create mode 100644 hw/mips/loongson3_virt.c
> >
> > diff --git a/default-configs/mips64el-softmmu.mak b/default-configs/mip=
s64el-softmmu.mak
> > index 9f8a3ef..26c660a 100644
> > --- a/default-configs/mips64el-softmmu.mak
> > +++ b/default-configs/mips64el-softmmu.mak
> > @@ -3,6 +3,7 @@
> >  include mips-softmmu-common.mak
> >  CONFIG_IDE_VIA=3Dy
> >  CONFIG_FULOONG=3Dy
> > +CONFIG_LOONGSON3V=3Dy
> >  CONFIG_ATI_VGA=3Dy
> >  CONFIG_RTL8139_PCI=3Dy
> >  CONFIG_JAZZ=3Dy
> > diff --git a/hw/mips/Kconfig b/hw/mips/Kconfig
> > index 67d39c5..cc5609b 100644
> > --- a/hw/mips/Kconfig
> > +++ b/hw/mips/Kconfig
> > @@ -45,6 +45,17 @@ config FULOONG
> >      bool
> >      select PCI_BONITO
> >
> > +config LOONGSON3V
> > +    bool
> > +    select PCKBD
> > +    select SERIAL
> > +    select GOLDFISH_RTC
> > +    select LOONGSON_LIOINTC
> > +    select PCI_EXPRESS_GENERIC_BRIDGE
> > +    select VIRTIO_VGA
> > +    select QXL if SPICE
> > +    select MSI_NONBROKEN
> > +
> >  config MIPS_CPS
> >      bool
> >      select PTIMER
> > diff --git a/hw/mips/Makefile.objs b/hw/mips/Makefile.objs
> > index 739e2b7..0993852 100644
> > --- a/hw/mips/Makefile.objs
> > +++ b/hw/mips/Makefile.objs
> > @@ -4,5 +4,6 @@ obj-$(CONFIG_MALTA) +=3D gt64xxx_pci.o malta.o
> >  obj-$(CONFIG_MIPSSIM) +=3D mipssim.o
> >  obj-$(CONFIG_JAZZ) +=3D jazz.o
> >  obj-$(CONFIG_FULOONG) +=3D fuloong2e.o
> > +obj-$(CONFIG_LOONGSON3V) +=3D loongson3_virt.o
> >  obj-$(CONFIG_MIPS_CPS) +=3D cps.o
> >  obj-$(CONFIG_MIPS_BOSTON) +=3D boston.o
> > diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> > new file mode 100644
> > index 0000000..e0e1939
> > --- /dev/null
> > +++ b/hw/mips/loongson3_virt.c
> > @@ -0,0 +1,978 @@
> > +/*
> > + * Generic Loongson-3 Platform support
> > + *
> > + * Copyright (c) 2016-2020 Huacai Chen (chenhc@lemote.com)
> > + *
> > + * This program is free software: you can redistribute it and/or modif=
y
> > + * it under the terms of the GNU General Public License as published b=
y
> > + * the Free Software Foundation, either version 2 of the License, or
> > + * (at your option) any later version.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program. If not, see <https://www.gnu.org/licenses/=
>.
> > + */
> > +
> > +/*
> > + * Generic virtualized PC Platform based on Loongson-3 CPU (MIPS64R2 w=
ith
> > + * extensions, 800~2000MHz)
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu-common.h"
> > +#include "qemu/units.h"
> > +#include "qapi/error.h"
> > +#include "cpu.h"
> > +#include "elf.h"
> > +#include "kvm_mips.h"
> > +#include "hw/boards.h"
> > +#include "hw/char/serial.h"
> > +#include "hw/mips/mips.h"
> > +#include "hw/mips/cpudevs.h"
> > +#include "hw/misc/empty_slot.h"
> > +#include "hw/intc/i8259.h"
> > +#include "hw/loader.h"
> > +#include "hw/isa/superio.h"
> > +#include "hw/pci/msi.h"
> > +#include "hw/pci/pci.h"
> > +#include "hw/pci/pci_host.h"
> > +#include "hw/pci-host/gpex.h"
> > +#include "hw/rtc/mc146818rtc.h"
> > +#include "hw/usb.h"
> > +#include "net/net.h"
> > +#include "exec/address-spaces.h"
> > +#include "sysemu/kvm.h"
> > +#include "sysemu/qtest.h"
> > +#include "sysemu/reset.h"
> > +#include "sysemu/runstate.h"
> > +#include "qemu/log.h"
> > +#include "qemu/error-report.h"
> > +
> > +#define PM_CNTL_MODE          0x10
> > +
> > +/* Overall MMIO & Memory layout */
> > +enum {
> > +    VIRT_LOWMEM,
> > +    VIRT_PM,
> > +    VIRT_FW_CFG,
> > +    VIRT_RTC,
> > +    VIRT_PCIE_PIO,
> > +    VIRT_PCIE_ECAM,
> > +    VIRT_BIOS_ROM,
> > +    VIRT_UART,
> > +    VIRT_LIOINTC,
> > +    VIRT_PCIE_MMIO,
> > +    VIRT_HIGHMEM
> > +};
> > +
> > +/* Low MEM layout for QEMU kernel loader */
> > +enum {
> > +    LOADER_KERNEL,
> > +    LOADER_INITRD,
> > +    LOADER_CMDLINE
> > +};
> > +
> > +/* BIOS ROM layout for QEMU kernel loader */
> > +enum {
> > +    LOADER_BOOTROM,
> > +    LOADER_PARAM,
> > +};
> > +
> > +struct MemmapEntry {
> > +    hwaddr base;
> > +    hwaddr size;
> > +};
> > +
> > +/* Data for BIOS to identify machine */
> > +#define FW_CFG_MACHINE_VERSION  (FW_CFG_ARCH_LOCAL + 0)
> > +#define FW_CFG_CPU_FREQ         (FW_CFG_ARCH_LOCAL + 1)
> > +
> > +/*
> > + * LEFI (a UEFI-like interface for BIOS-Kernel boot parameters) data s=
tructrues
> > + * defined at arch/mips/include/asm/mach-loongson64/boot_param.h in Li=
nux kernel
> > + */
> > +struct efi_memory_map_loongson {
> > +    uint16_t vers;               /* version of efi_memory_map */
> > +    uint32_t nr_map;             /* number of memory_maps */
> > +    uint32_t mem_freq;           /* memory frequence */
> > +    struct mem_map {
> > +        uint32_t node_id;        /* node_id which memory attached to *=
/
> > +        uint32_t mem_type;       /* system memory, pci memory, pci io,=
 etc. */
> > +        uint64_t mem_start;      /* memory map start address */
> > +        uint32_t mem_size;       /* each memory_map size, not the tota=
l size */
> > +    } map[128];
> > +} __attribute__((packed));
> > +
> > +enum loongson_cpu_type {
> > +    Legacy_2E =3D 0x0,
> > +    Legacy_2F =3D 0x1,
> > +    Legacy_3A =3D 0x2,
> > +    Legacy_3B =3D 0x3,
> > +    Legacy_1A =3D 0x4,
> > +    Legacy_1B =3D 0x5,
> > +    Legacy_2G =3D 0x6,
> > +    Legacy_2H =3D 0x7,
> > +    Loongson_1A =3D 0x100,
> > +    Loongson_1B =3D 0x101,
> > +    Loongson_2E =3D 0x200,
> > +    Loongson_2F =3D 0x201,
> > +    Loongson_2G =3D 0x202,
> > +    Loongson_2H =3D 0x203,
> > +    Loongson_3A =3D 0x300,
> > +    Loongson_3B =3D 0x301
> > +};
> > +
> > +/*
> > + * Capability and feature descriptor structure for MIPS CPU
> > + */
> > +struct efi_cpuinfo_loongson {
> > +    uint16_t vers;               /* version of efi_cpuinfo_loongson */
> > +    uint32_t processor_id;       /* PRID, e.g. 6305, 6306 */
> > +    uint32_t cputype;            /* Loongson_3A/3B, etc. */
> > +    uint32_t total_node;         /* num of total numa nodes */
> > +    uint16_t cpu_startup_core_id;   /* Boot core id */
> > +    uint16_t reserved_cores_mask;
> > +    uint32_t cpu_clock_freq;     /* cpu_clock */
> > +    uint32_t nr_cpus;
> > +    char cpuname[64];
> > +} __attribute__((packed));
> > +
> > +#define MAX_UARTS 64
> > +struct uart_device {
> > +    uint32_t iotype;
> > +    uint32_t uartclk;
> > +    uint32_t int_offset;
> > +    uint64_t uart_base;
> > +} __attribute__((packed));
> > +
> > +#define MAX_SENSORS 64
> > +#define SENSOR_TEMPER  0x00000001
> > +#define SENSOR_VOLTAGE 0x00000002
> > +#define SENSOR_FAN     0x00000004
> > +struct sensor_device {
> > +    char name[32];  /* a formal name */
> > +    char label[64]; /* a flexible description */
> > +    uint32_t type;       /* SENSOR_* */
> > +    uint32_t id;         /* instance id of a sensor-class */
> > +    uint32_t fan_policy; /* step speed or constant speed */
> > +    uint32_t fan_percent;/* only for constant speed policy */
> > +    uint64_t base_addr;  /* base address of device registers */
> > +} __attribute__((packed));
> > +
> > +struct system_loongson {
> > +    uint16_t vers;               /* version of system_loongson */
> > +    uint32_t ccnuma_smp;         /* 0: no numa; 1: has numa */
> > +    uint32_t sing_double_channel;/* 1: single; 2: double */
> > +    uint32_t nr_uarts;
> > +    struct uart_device uarts[MAX_UARTS];
> > +    uint32_t nr_sensors;
> > +    struct sensor_device sensors[MAX_SENSORS];
> > +    char has_ec;
> > +    char ec_name[32];
> > +    uint64_t ec_base_addr;
> > +    char has_tcm;
> > +    char tcm_name[32];
> > +    uint64_t tcm_base_addr;
> > +    uint64_t workarounds;
> > +    uint64_t of_dtb_addr; /* NULL if not support */
> > +} __attribute__((packed));
> > +
> > +struct irq_source_routing_table {
> > +    uint16_t vers;
> > +    uint16_t size;
> > +    uint16_t rtr_bus;
> > +    uint16_t rtr_devfn;
> > +    uint32_t vendor;
> > +    uint32_t device;
> > +    uint32_t PIC_type;           /* conform use HT or PCI to route to =
CPU-PIC */
> > +    uint64_t ht_int_bit;         /* 3A: 1<<24; 3B: 1<<16 */
> > +    uint64_t ht_enable;          /* irqs used in this PIC */
> > +    uint32_t node_id;            /* node id: 0x0-0; 0x1-1; 0x10-2; 0x1=
1-3 */
> > +    uint64_t pci_mem_start_addr;
> > +    uint64_t pci_mem_end_addr;
> > +    uint64_t pci_io_start_addr;
> > +    uint64_t pci_io_end_addr;
> > +    uint64_t pci_config_addr;
> > +    uint16_t dma_mask_bits;
> > +    uint16_t dma_noncoherent;
> > +} __attribute__((packed));
> > +
> > +struct interface_info {
> > +    uint16_t vers;               /* version of the specificition */
> > +    uint16_t size;
> > +    uint8_t  flag;
> > +    char description[64];
> > +} __attribute__((packed));
> > +
> > +#define MAX_RESOURCE_NUMBER 128
> > +struct resource_loongson {
> > +    uint64_t start;              /* resource start address */
> > +    uint64_t end;                /* resource end address */
> > +    char name[64];
> > +    uint32_t flags;
> > +};
> > +
> > +struct archdev_data {};          /* arch specific additions */
> > +
> > +struct board_devices {
> > +    char name[64];               /* hold the device name */
> > +    uint32_t num_resources;      /* number of device_resource */
> > +    /* for each device's resource */
> > +    struct resource_loongson resource[MAX_RESOURCE_NUMBER];
> > +    /* arch specific additions */
> > +    struct archdev_data archdata;
> > +};
> > +
> > +struct loongson_special_attribute {
> > +    uint16_t vers;               /* version of this special */
> > +    char special_name[64];       /* special_atribute_name */
> > +    uint32_t loongson_special_type; /* type of special device */
> > +    /* for each device's resource */
> > +    struct resource_loongson resource[MAX_RESOURCE_NUMBER];
> > +};
> > +
> > +struct loongson_params {
> > +    uint64_t memory_offset;      /* efi_memory_map_loongson struct off=
set */
> > +    uint64_t cpu_offset;         /* efi_cpuinfo_loongson struct offset=
 */
> > +    uint64_t system_offset;      /* system_loongson struct offset */
> > +    uint64_t irq_offset;         /* irq_source_routing_table struct of=
fset */
> > +    uint64_t interface_offset;   /* interface_info struct offset */
> > +    uint64_t special_offset;     /* loongson_special_attribute struct =
offset */
> > +    uint64_t boarddev_table_offset;  /* board_devices offset */
> > +};
> > +
> > +struct smbios_tables {
> > +    uint16_t vers;               /* version of smbios */
> > +    uint64_t vga_bios;           /* vga_bios address */
> > +    struct loongson_params lp;
> > +};
> > +
> > +struct efi_reset_system_t {
> > +    uint64_t ResetCold;
> > +    uint64_t ResetWarm;
> > +    uint64_t ResetType;
> > +    uint64_t Shutdown;
> > +    uint64_t DoSuspend; /* NULL if not support */
> > +};
> > +
> > +struct efi_loongson {
> > +    uint64_t mps;                /* MPS table */
> > +    uint64_t acpi;               /* ACPI table (IA64 ext 0.71) */
> > +    uint64_t acpi20;             /* ACPI table (ACPI 2.0) */
> > +    struct smbios_tables smbios; /* SM BIOS table */
> > +    uint64_t sal_systab;         /* SAL system table */
> > +    uint64_t boot_info;          /* boot info table */
> > +};
> > +
> > +struct boot_params {
> > +    struct efi_loongson efi;
> > +    struct efi_reset_system_t reset_system;
> > +};
> > +
> > +#define LOONGSON_MAX_VCPUS      16
> > +
> > +#define LOONGSON3_BIOSNAME "bios_loongson3.bin"
> > +
> > +#define UART_IRQ            0
> > +#define RTC_IRQ             1
> > +#define PCIE_IRQ_BASE       2
> > +
> > +#define align(x) (((x) + 63) & ~63)
> > +
> > +static const struct MemmapEntry virt_memmap[] =3D {
> > +    [VIRT_LOWMEM] =3D      { 0x00000000,    0x10000000 },
> > +    [VIRT_PM] =3D          { 0x10080000,         0x100 },
> > +    [VIRT_FW_CFG] =3D      { 0x10080100,         0x100 },
> > +    [VIRT_RTC] =3D         { 0x10081000,        0x1000 },
> > +    [VIRT_PCIE_PIO] =3D    { 0x18000000,       0xc0000 },
> > +    [VIRT_PCIE_ECAM] =3D   { 0x1a000000,     0x2000000 },
> > +    [VIRT_BIOS_ROM] =3D    { 0x1fc00000,      0x200000 },
> > +    [VIRT_UART] =3D        { 0x1fe001e0,           0x8 },
> > +    [VIRT_LIOINTC] =3D     { 0x3ff01400,          0x64 },
> > +    [VIRT_PCIE_MMIO] =3D   { 0x40000000,    0x40000000 },
> > +    [VIRT_HIGHMEM] =3D     { 0x80000000,           0x0 }, /* Variable =
*/
> > +};
> > +
> > +static const struct MemmapEntry loader_memmap[] =3D {
> > +    [LOADER_KERNEL] =3D    { 0x00000000,     0x4000000 },
> > +    [LOADER_INITRD] =3D    { 0x04000000,           0x0 }, /* Variable =
*/
> > +    [LOADER_CMDLINE] =3D   { 0x0ff00000,      0x100000 },
> > +};
> > +
> > +static const struct MemmapEntry loader_rommap[] =3D {
> > +    [LOADER_BOOTROM] =3D   { 0x1fc00000,        0x1000 },
> > +    [LOADER_PARAM] =3D     { 0x1fc01000,       0x10000 },
> > +};
> > +
> > +static struct _loaderparams {
> > +    uint64_t ram_size;
> > +    const char *kernel_cmdline;
> > +    const char *kernel_filename;
> > +    const char *initrd_filename;
> > +    uint64_t kernel_entry;
> > +    uint64_t a0, a1, a2;
> > +} loaderparams;
> > +
> > +static uint64_t loongson3_pm_read(void *opaque, hwaddr addr, unsigned =
size)
> > +{
> > +    return 0;
> > +}
> > +
> > +static void loongson3_pm_write(void *opaque, hwaddr addr, uint64_t val=
, unsigned size)
> > +{
> > +    if (addr !=3D PM_CNTL_MODE) {
> > +        return;
> > +    }
> > +
> > +    switch (val) {
> > +    case 0x00:
> > +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> > +        return;
> > +    case 0xff:
> > +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +        return;
> > +    default:
> > +        return;
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps loongson3_pm_ops =3D {
> > +    .read  =3D loongson3_pm_read,
> > +    .write =3D loongson3_pm_write,
> > +    .endianness =3D DEVICE_NATIVE_ENDIAN,
> > +};
> > +
> > +static struct efi_memory_map_loongson *init_memory_map(void *g_map)
> > +{
> > +    struct efi_memory_map_loongson *emap =3D g_map;
> > +
> > +    emap->nr_map =3D 2;
> > +    emap->mem_freq =3D 300000000;
> > +
> > +    emap->map[0].node_id =3D 0;
> > +    emap->map[0].mem_type =3D 1;
> > +    emap->map[0].mem_start =3D 0x0;
> > +    emap->map[0].mem_size =3D (loaderparams.ram_size > 0x10000000
> > +                            ? 256 : (loaderparams.ram_size >> 20)) - 1=
6;
> > +
> > +    emap->map[1].node_id =3D 0;
> > +    emap->map[1].mem_type =3D 2;
> > +    emap->map[1].mem_start =3D 0x90000000;
> > +    emap->map[1].mem_size =3D (loaderparams.ram_size > 0x10000000
> > +                            ? (loaderparams.ram_size >> 20) - 256 : 0)=
;
> > +
> > +    return emap;
> > +}
> > +
> > +#define BUFLEN 1024
> > +
> > +static uint32_t get_cpu_freq(void)
> > +{
> > +    int fd =3D 0, freq =3D 0;
> > +    char buf[BUFLEN], *buf_p;
> > +
> > +    fd =3D open("/proc/cpuinfo", O_RDONLY);
> > +    if (fd =3D=3D -1) {
> > +        fprintf(stderr, "Failed to open /proc/cpuinfo!\n");
> > +        return 0;
> > +    }
> > +
> > +    if (read(fd, buf, BUFLEN) < 0) {
> > +        close(fd);
> > +        fprintf(stderr, "Failed to read /proc/cpuinfo!\n");
> > +        return 0;
> > +    }
> > +    close(fd);
> > +
> > +    buf_p =3D strstr(buf, "model name");
> > +    while (*buf_p !=3D '@') {
> > +        buf_p++;
> > +    }
> > +
> > +    buf_p +=3D 2;
> > +    memcpy(buf, buf_p, 12);
> > +    buf_p =3D buf;
> > +    while ((*buf_p >=3D '0') && (*buf_p <=3D '9')) {
> > +        buf_p++;
> > +    }
> > +    *buf_p =3D '\0';
> > +
> > +    freq =3D atoi(buf);
> > +
> > +    return freq * 1000 * 1000;
> > +}
> > +
> > +static struct efi_cpuinfo_loongson *init_cpu_info(void *g_cpuinfo_loon=
gson)
> > +{
> > +    struct efi_cpuinfo_loongson *c =3D g_cpuinfo_loongson;
> > +
> > +    c->cputype =3D Loongson_3A;
> > +    c->processor_id =3D MIPS_CPU(first_cpu)->env.CP0_PRid;
> > +    c->cpu_clock_freq =3D get_cpu_freq();
> > +    if (!c->cpu_clock_freq) {
> > +        c->cpu_clock_freq =3D 500000000;
> > +    }
> > +
> > +    c->cpu_startup_core_id =3D 0;
> > +    c->nr_cpus =3D current_machine->smp.cpus;
> > +    c->total_node =3D (current_machine->smp.cpus + 3) / 4;
> > +
> > +    return c;
> > +}
> > +
> > +static struct system_loongson *init_system_loongson(void *g_system)
> > +{
> > +    struct system_loongson *s =3D g_system;
> > +
> > +    s->ccnuma_smp =3D 0;
> > +    s->sing_double_channel =3D 1;
> > +    s->nr_uarts =3D 1;
> > +    s->uarts[0].iotype =3D 2;
> > +    s->uarts[0].int_offset =3D 2;
> > +    s->uarts[0].uartclk =3D 25000000; /* Random value */
> > +    s->uarts[0].uart_base =3D virt_memmap[VIRT_UART].base;
> > +
> > +    return s;
> > +}
> > +
> > +static struct irq_source_routing_table *init_irq_source(void *g_irq_so=
urce)
> > +{
> > +    struct irq_source_routing_table *irq_info =3D g_irq_source;
> > +
> > +    irq_info->node_id =3D 0;
> > +    irq_info->PIC_type =3D 0;
> > +    irq_info->dma_mask_bits =3D 64;
> > +    irq_info->pci_mem_start_addr =3D virt_memmap[VIRT_PCIE_MMIO].base;
> > +    irq_info->pci_mem_end_addr   =3D virt_memmap[VIRT_PCIE_MMIO].base =
+
> > +                                   virt_memmap[VIRT_PCIE_MMIO].size - =
1;
> > +    irq_info->pci_io_start_addr  =3D virt_memmap[VIRT_PCIE_PIO].base;
> > +
> > +    return irq_info;
> > +}
> > +
> > +static struct interface_info *init_interface_info(void *g_interface)
> > +{
> > +    struct interface_info *interface =3D g_interface;
> > +
> > +    interface->vers =3D 0x01;
> > +    strcpy(interface->description, "UEFI_Version_v1.0");
> > +
> > +    return interface;
> > +}
> > +
> > +static struct board_devices *board_devices_info(void *g_board)
> > +{
> > +    struct board_devices *bd =3D g_board;
> > +
> > +    strcpy(bd->name, "Loongson-3A-VIRT-1w-V1.00-demo");
> > +
> > +    return bd;
> > +}
> > +
> > +static struct loongson_special_attribute *init_special_info(void *g_sp=
ecial)
> > +{
> > +    struct loongson_special_attribute *special =3D g_special;
> > +
> > +    strcpy(special->special_name, "2016-08-01");
> > +
> > +    return special;
> > +}
> > +
> > +static void init_loongson_params(struct loongson_params *lp, void *p)
> > +{
> > +    lp->memory_offset =3D (unsigned long long)init_memory_map(p)
> > +                        - (unsigned long long)lp;
> > +    p +=3D align(sizeof(struct efi_memory_map_loongson));
> > +
> > +    lp->cpu_offset =3D (unsigned long long)init_cpu_info(p)
> > +                     - (unsigned long long)lp;
> > +    p +=3D align(sizeof(struct efi_cpuinfo_loongson));
> > +
> > +    lp->system_offset =3D (unsigned long long)init_system_loongson(p)
> > +                        - (unsigned long long)lp;
> > +    p +=3D align(sizeof(struct system_loongson));
> > +
> > +    lp->irq_offset =3D (unsigned long long)init_irq_source(p)
> > +                     - (unsigned long long)lp;
> > +    p +=3D align(sizeof(struct irq_source_routing_table));
> > +
> > +    lp->interface_offset =3D (unsigned long long)init_interface_info(p=
)
> > +                           - (unsigned long long)lp;
> > +    p +=3D align(sizeof(struct interface_info));
> > +
> > +    lp->boarddev_table_offset =3D (unsigned long long)board_devices_in=
fo(p)
> > +                                - (unsigned long long)lp;
> > +    p +=3D align(sizeof(struct board_devices));
> > +
> > +    lp->special_offset =3D (unsigned long long)init_special_info(p)
> > +                         - (unsigned long long)lp;
> > +    p +=3D align(sizeof(struct loongson_special_attribute));
> > +}
> > +
> > +static void init_reset_system(struct efi_reset_system_t *reset)
> > +{
> > +    reset->Shutdown =3D 0xffffffffbfc000a8;
> > +    reset->ResetCold =3D 0xffffffffbfc00080;
> > +    reset->ResetWarm =3D 0xffffffffbfc00080;
> > +}
> > +
> > +static void init_boot_param(void)
> > +{
> > +    void *p;
> > +    struct boot_params *bp;
> > +
> > +    p =3D g_malloc0(loader_rommap[LOADER_PARAM].size);
> > +    bp =3D p;
> > +
> > +    bp->efi.smbios.vers =3D 1;
> > +    init_reset_system(&(bp->reset_system));
> > +    p +=3D align(sizeof(struct boot_params));
> > +    init_loongson_params(&(bp->efi.smbios.lp), p);
> > +
> > +    rom_add_blob_fixed("params_rom", bp,
> > +                       loader_rommap[LOADER_PARAM].size,
> > +                       loader_rommap[LOADER_PARAM].base);
> > +
> > +    g_free(bp);
> > +
> > +    loaderparams.a2 =3D cpu_mips_phys_to_kseg0(NULL,
> > +                                             loader_rommap[LOADER_PARA=
M].base);
> > +}
> > +
> > +static void init_boot_rom(void)
> > +{
> > +    const unsigned int boot_code[] =3D {
> > +        0x40086000,   /* mfc0    t0, CP0_STATUS                       =
        */
> > +        0x240900E4,   /* li      t1, 0xe4         #set kx, sx, ux, erl=
        */
> > +        0x01094025,   /* or      t0, t0, t1                           =
        */
> > +        0x3C090040,   /* lui     t1, 0x40         #set bev            =
        */
> > +        0x01094025,   /* or      t0, t0, t1                           =
        */
> > +        0x40886000,   /* mtc0    t0, CP0_STATUS                       =
        */
> > +        0x00000000,
> > +        0x40806800,   /* mtc0    zero, CP0_CAUSE                      =
        */
> > +        0x00000000,
> > +        0x400A7801,   /* mfc0    t2, $15, 1                           =
        */
> > +        0x314A00FF,   /* andi    t2, 0x0ff                            =
        */
> > +        0x3C089000,   /* dli     t0, 0x900000003ff01000               =
        */
> > +        0x00084438,
> > +        0x35083FF0,
> > +        0x00084438,
> > +        0x35081000,
> > +        0x314B0003,   /* andi    t3, t2, 0x3      #local cpuid        =
        */
> > +        0x000B5A00,   /* sll     t3, 8                                =
        */
> > +        0x010B4025,   /* or      t0, t0, t3                           =
        */
> > +        0x314C000C,   /* andi    t4, t2, 0xc      #node id            =
        */
> > +        0x000C62BC,   /* dsll    t4, 42                               =
        */
> > +        0x010C4025,   /* or      t0, t0, t4                           =
        */
> > +                      /* WaitForInit:                                 =
        */
> > +        0xDD020020,   /* ld      v0, FN_OFF(t0)   #FN_OFF 0x020       =
        */
> > +        0x1040FFFE,   /* beqz    v0, WaitForInit                      =
        */
> > +        0x00000000,   /* nop                                          =
        */
> > +        0xDD1D0028,   /* ld      sp, SP_OFF(t0)   #FN_OFF 0x028       =
        */
> > +        0xDD1C0030,   /* ld      gp, GP_OFF(t0)   #FN_OFF 0x030       =
        */
> > +        0xDD050038,   /* ld      a1, A1_OFF(t0)   #FN_OFF 0x038       =
        */
> > +        0x00400008,   /* jr      v0               #byebye             =
        */
> > +        0x00000000,   /* nop                                          =
        */
> > +        0x1000FFFF,   /* 1:  b   1b                                   =
        */
> > +        0x00000000,   /* nop                                          =
        */
> > +
> > +                      /* Reset                                        =
        */
> > +        0x3C0C9000,   /* dli     t0, 0x9000000010080010               =
        */
> > +        0x358C0000,
> > +        0x000C6438,
> > +        0x358C1008,
> > +        0x000C6438,
> > +        0x358C0010,
> > +        0x240D0000,   /* li      t1, 0x00                             =
        */
> > +        0xA18D0000,   /* sb      t1, (t0)                             =
        */
> > +        0x1000FFFF,   /* 1:  b   1b                                   =
        */
> > +        0x00000000,   /* nop                                          =
        */
> > +
> > +                      /* Shutdown                                     =
        */
> > +        0x3C0C9000,   /* dli     t0, 0x9000000010080010               =
        */
> > +        0x358C0000,
> > +        0x000C6438,
> > +        0x358C1008,
> > +        0x000C6438,
> > +        0x358C0010,
> > +        0x240D00FF,   /* li      t1, 0xff                             =
        */
> > +        0xA18D0000,   /* sb      t1, (t0)                             =
        */
> > +        0x1000FFFF,   /* 1:  b   1b                                   =
        */
> > +        0x00000000    /* nop                                          =
        */
> > +    };
> > +
> > +    rom_add_blob_fixed("boot_rom", boot_code, sizeof(boot_code),
> > +                        loader_rommap[LOADER_BOOTROM].base);
> > +}
> > +
> > +static void fw_cfg_boot_set(void *opaque, const char *boot_device,
> > +                            Error **errp)
> > +{
> > +    fw_cfg_modify_i16(opaque, FW_CFG_BOOT_DEVICE, boot_device[0]);
> > +}
> > +
> > +static void fw_conf_init(unsigned long ram_size)
> > +{
> > +    FWCfgState *fw_cfg;
> > +    hwaddr cfg_addr =3D virt_memmap[VIRT_FW_CFG].base;
> > +
> > +    fw_cfg =3D fw_cfg_init_mem_wide(cfg_addr, cfg_addr + 8, 8, 0, NULL=
);
> > +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, (uint16_t)current_machine->=
smp.cpus);
> > +    fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, (uint16_t)current_machine-=
>smp.max_cpus);
> > +    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, (uint64_t)ram_size);
> > +    fw_cfg_add_i32(fw_cfg, FW_CFG_MACHINE_VERSION, 1);
> > +    fw_cfg_add_i32(fw_cfg, FW_CFG_CPU_FREQ, get_cpu_freq());
> > +    qemu_register_boot_set(fw_cfg_boot_set, fw_cfg);
> > +}
> > +
> > +static int set_prom_cmdline(ram_addr_t initrd_offset, long initrd_size=
)
> > +{
> > +    hwaddr cmdline_vaddr;
> > +    char memenv[32];
> > +    char highmemenv[32];
> > +    void *cmdline_buf;
> > +    unsigned int *parg_env;
> > +    int ret =3D 0;
> > +
> > +    /* Allocate cmdline_buf for command line. */
> > +    cmdline_buf =3D g_malloc0(loader_memmap[LOADER_CMDLINE].size);
> > +    cmdline_vaddr =3D cpu_mips_phys_to_kseg0(NULL,
> > +                                           loader_memmap[LOADER_CMDLIN=
E].base);
> > +
> > +    /*
> > +     * Layout of cmdline_buf looks like this:
> > +     * argv[0], argv[1], 0, env[0], env[1], ... env[i], 0,
> > +     * argv[0]'s data, argv[1]'s data, env[0]'data, ..., env[i]'s data=
, 0
> > +     */
> > +    parg_env =3D (void *)cmdline_buf;
> > +
> > +    ret =3D (3 + 1) * 4;
> > +    *parg_env++ =3D cmdline_vaddr + ret;
> > +    ret +=3D (1 + snprintf(cmdline_buf + ret, 256 - ret, "g"));
> > +
> > +    /* argv1 */
> > +    *parg_env++ =3D cmdline_vaddr + ret;
> > +    if (initrd_size > 0)
> > +        ret +=3D (1 + snprintf(cmdline_buf + ret, 256 - ret,
> > +                "rd_start=3D0x" TARGET_FMT_lx " rd_size=3D%li %s",
> > +                cpu_mips_phys_to_kseg0(NULL, initrd_offset),
> > +                initrd_size, loaderparams.kernel_cmdline));
> > +    else
> > +        ret +=3D (1 + snprintf(cmdline_buf + ret, 256 - ret, "%s",
> > +                loaderparams.kernel_cmdline));
> > +
> > +    /* argv2 */
> > +    *parg_env++ =3D cmdline_vaddr + 4 * ret;
> > +
> > +    /* env */
> > +    sprintf(memenv, "%ld", loaderparams.ram_size > 0x10000000
> > +            ? 256 : (loaderparams.ram_size >> 20));
> > +    sprintf(highmemenv, "%ld", loaderparams.ram_size > 0x10000000
> > +            ? (loaderparams.ram_size >> 20) - 256 : 0);
> > +
> > +    rom_add_blob_fixed("cmdline", cmdline_buf,
> > +                       loader_memmap[LOADER_CMDLINE].size,
> > +                       loader_memmap[LOADER_CMDLINE].base);
> > +
> > +    g_free(cmdline_buf);
> > +
> > +    loaderparams.a0 =3D 2;
> > +    loaderparams.a1 =3D cmdline_vaddr;
> > +
> > +    return 0;
> > +}
> > +
> > +static uint64_t load_kernel(CPUMIPSState *env)
> > +{
> > +    long kernel_size;
> > +    ram_addr_t initrd_offset;
> > +    uint64_t kernel_entry, kernel_low, kernel_high, initrd_size;
> > +
> > +    kernel_size =3D load_elf(loaderparams.kernel_filename, NULL,
> > +                           cpu_mips_kseg0_to_phys, NULL,
> > +                           (uint64_t *)&kernel_entry,
> > +                           (uint64_t *)&kernel_low, (uint64_t *)&kerne=
l_high,
> > +                           NULL, 0, EM_MIPS, 1, 0);
> > +    if (kernel_size < 0) {
> > +        error_report("could not load kernel '%s': %s",
> > +                     loaderparams.kernel_filename,
> > +                     load_elf_strerror(kernel_size));
> > +        exit(1);
> > +    }
> > +
> > +    /* load initrd */
> > +    initrd_size =3D 0;
> > +    initrd_offset =3D 0;
> > +    if (loaderparams.initrd_filename) {
> > +        initrd_size =3D get_image_size(loaderparams.initrd_filename);
> > +        if (initrd_size > 0) {
> > +            initrd_offset =3D (kernel_high + ~INITRD_PAGE_MASK) &
> > +                            INITRD_PAGE_MASK;
> > +            initrd_offset =3D MAX(initrd_offset,
> > +                                loader_memmap[LOADER_INITRD].base);
> > +
> > +            if (initrd_offset + initrd_size > ram_size) {
> > +                error_report("memory too small for initial ram disk '%=
s'",
> > +                             loaderparams.initrd_filename);
> > +                exit(1);
> > +            }
> > +
> > +            initrd_size =3D load_image_targphys(loaderparams.initrd_fi=
lename,
> > +                                              initrd_offset,
> > +                                              ram_size - initrd_offset=
);
> > +        }
> > +
> > +        if (initrd_size =3D=3D (target_ulong) -1) {
> > +            error_report("could not load initial ram disk '%s'",
> > +                         loaderparams.initrd_filename);
> > +            exit(1);
> > +        }
> > +    }
> > +
> > +    /* Setup prom cmdline. */
> > +    set_prom_cmdline(initrd_offset, initrd_size);
> > +
> > +    return kernel_entry;
> > +}
> > +
> > +static void main_cpu_reset(void *opaque)
> > +{
> > +    MIPSCPU *cpu =3D opaque;
> > +    CPUMIPSState *env =3D &cpu->env;
> > +
> > +    cpu_reset(CPU(cpu));
> > +
> > +    /* Loongson-3 reset stuff */
> > +    if (loaderparams.kernel_filename) {
> > +        if (cpu =3D=3D MIPS_CPU(first_cpu)) {
> > +            env->active_tc.gpr[4] =3D loaderparams.a0;
> > +            env->active_tc.gpr[5] =3D loaderparams.a1;
> > +            env->active_tc.gpr[6] =3D loaderparams.a2;
> > +            env->active_tc.PC =3D loaderparams.kernel_entry;
> > +        }
> > +        env->CP0_Status &=3D ~((1 << CP0St_BEV) | (1 << CP0St_ERL));
> > +    }
> > +}
> > +
> > +static inline void loongson3_virt_devices_init(MachineState *machine, =
DeviceState *pic)
> > +{
> > +    int i;
> > +    qemu_irq irq;
> > +    PCIBus *pci_bus;
> > +    DeviceState *dev;
> > +    MemoryRegion *pio_alias;
> > +    MemoryRegion *mmio_alias, *mmio_reg;
> > +    MemoryRegion *ecam_alias, *ecam_reg;
> > +
> > +    dev =3D qdev_new(TYPE_GPEX_HOST);
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> > +    pci_bus =3D PCI_HOST_BRIDGE(dev)->bus;
> > +
> > +    ecam_alias =3D g_new0(MemoryRegion, 1);
> > +    ecam_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 0);
> > +    memory_region_init_alias(ecam_alias, OBJECT(dev), "pcie-ecam",
> > +                             ecam_reg, 0, virt_memmap[VIRT_PCIE_ECAM].=
size);
> > +    memory_region_add_subregion(get_system_memory(),
> > +                                virt_memmap[VIRT_PCIE_ECAM].base, ecam=
_alias);
> > +
> > +    mmio_alias =3D g_new0(MemoryRegion, 1);
> > +    mmio_reg =3D sysbus_mmio_get_region(SYS_BUS_DEVICE(dev), 1);
> > +    memory_region_init_alias(mmio_alias, OBJECT(dev), "pcie-mmio",
> > +                             mmio_reg, virt_memmap[VIRT_PCIE_MMIO].bas=
e,
> > +                             virt_memmap[VIRT_PCIE_MMIO].size);
> > +    memory_region_add_subregion(get_system_memory(),
> > +                                virt_memmap[VIRT_PCIE_MMIO].base, mmio=
_alias);
> > +
> > +    pio_alias =3D g_new0(MemoryRegion, 1);
> > +    memory_region_init_alias(pio_alias, OBJECT(dev), "pcie-pio",
> > +                             get_system_io(), 0, virt_memmap[VIRT_PCIE=
_PIO].size);
> > +    memory_region_add_subregion(get_system_memory(),
> > +                                virt_memmap[VIRT_PCIE_PIO].base, pio_a=
lias);
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 2, virt_memmap[VIRT_PCIE_PIO]=
.base);
> > +
> > +    for (i =3D 0; i < GPEX_NUM_IRQS; i++) {
> > +        irq =3D qdev_get_gpio_in(pic, PCIE_IRQ_BASE + i);
> > +        sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, irq);
> > +        gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ_BASE + i);
> > +    }
> > +
> > +    pci_vga_init(pci_bus);
> > +
> > +    if (defaults_enabled()) {
> > +        pci_create_simple(pci_bus, -1, "pci-ohci");
> > +        usb_create_simple(usb_bus_find(-1), "usb-kbd");
> > +        usb_create_simple(usb_bus_find(-1), "usb-tablet");
> > +    }
> > +
> > +    for (i =3D 0; i < nb_nics; i++) {
> > +        NICInfo *nd =3D &nd_table[i];
> > +
> > +        if (!nd->model) {
> > +            nd->model =3D g_strdup("virtio");
> > +        }
> > +
> > +        pci_nic_init_nofail(nd, pci_bus, nd->model, NULL);
> > +    }
> > +}
> > +
> > +static void mips_loongson3_virt_init(MachineState *machine)
> > +{
> > +    int i;
> > +    long bios_size;
> > +    MIPSCPU *cpu;
> > +    CPUMIPSState *env;
> > +    DeviceState *liointc;
> > +    char *filename;
> > +    const char *kernel_cmdline =3D machine->kernel_cmdline;
> > +    const char *kernel_filename =3D machine->kernel_filename;
> > +    const char *initrd_filename =3D machine->initrd_filename;
> > +    ram_addr_t ram_size =3D machine->ram_size;
> > +    MemoryRegion *address_space_mem =3D get_system_memory();
> > +    MemoryRegion *ram =3D g_new(MemoryRegion, 1);
> > +    MemoryRegion *bios =3D g_new(MemoryRegion, 1);
> > +    MemoryRegion *iomem =3D g_new(MemoryRegion, 1);
> > +
> > +    /* TODO: TCG will support all CPU types */
> > +    if (!kvm_enabled()) {
> > +        if (!machine->cpu_type) {
> > +            machine->cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-3A1000"=
);
> > +        }
> > +        if (!strstr(machine->cpu_type, "Loongson-3A1000")) {
> > +            error_report("Loongson-3/TCG need cpu type Loongson-3A1000=
");
> > +            exit(1);
> > +        }
> > +    } else {
> > +        if (!machine->cpu_type) {
> > +            machine->cpu_type =3D MIPS_CPU_TYPE_NAME("Loongson-3A4000"=
);
> > +        }
> > +        if (!strstr(machine->cpu_type, "Loongson-3A4000")) {
> > +            error_report("Loongson-3/KVM need cpu type Loongson-3A4000=
");
> > +            exit(1);
> > +        }
> > +    }
> > +
> > +    if (ram_size < 512 * 0x100000) {
> > +        error_report("Loongson-3 need at least 512MB memory");
> > +        exit(1);
> > +    }
> > +
> > +    /*
> > +     * The whole MMIO range among configure registers doesn't generate
> > +     * exception when accessing invalid memory. Create an empty slot t=
o
> > +     * emulate this feature.
> > +     */
> > +    empty_slot_init("fallback", 0, 0x80000000);
> > +
> > +    liointc =3D qdev_new("loongson.liointc");
> > +    sysbus_realize_and_unref(SYS_BUS_DEVICE(liointc), &error_fatal);
> > +
> > +    sysbus_mmio_map(SYS_BUS_DEVICE(liointc), 0, virt_memmap[VIRT_LIOIN=
TC].base);
> > +
> > +    for (i =3D 0; i < machine->smp.cpus; i++) {
> > +        int ip;
> > +
> > +        /* init CPUs */
> > +        cpu =3D MIPS_CPU(cpu_create(machine->cpu_type));
> > +
> > +        /* Init internal devices */
> > +        cpu_mips_irq_init_cpu(cpu);
> > +        cpu_mips_clock_init(cpu);
> > +        qemu_register_reset(main_cpu_reset, cpu);
> > +
> > +        if (i >=3D 4) {
> > +            continue; /* Only node-0 can be connected to LIOINTC */
> > +        }
> > +
> > +        for (ip =3D 0; ip < 4 ; ip++) {
> > +            int pin =3D i * 4 + ip;
> > +            sysbus_connect_irq(SYS_BUS_DEVICE(liointc),
> > +                               pin, cpu->env.irq[ip + 2]);
> > +        }
> > +    }
> > +    env =3D &MIPS_CPU(first_cpu)->env;
> > +
> > +    /* Allocate RAM/BIOS, 0x00000000~0x10000000 is alias of 0x80000000=
~0x90000000 */
> > +    memory_region_init_rom(bios, NULL, "loongson3.bios",
> > +                           virt_memmap[VIRT_BIOS_ROM].size, &error_fat=
al);
> > +    memory_region_init_alias(ram, NULL, "loongson3.lowmem",
> > +                           machine->ram, 0, virt_memmap[VIRT_LOWMEM].s=
ize);
> > +    memory_region_init_io(iomem, NULL, &loongson3_pm_ops,
> > +                           NULL, "loongson3_pm", virt_memmap[VIRT_PM].=
size);
> > +
> > +    memory_region_add_subregion(address_space_mem,
> > +                      virt_memmap[VIRT_LOWMEM].base, ram);
> > +    memory_region_add_subregion(address_space_mem,
> > +                      virt_memmap[VIRT_BIOS_ROM].base, bios);
> > +    memory_region_add_subregion(address_space_mem,
> > +                      virt_memmap[VIRT_HIGHMEM].base, machine->ram);
> > +    memory_region_add_subregion(address_space_mem,
> > +                      virt_memmap[VIRT_PM].base, iomem);
> > +
> > +    /*
> > +     * We do not support flash operation, just loading bios.bin as raw=
 BIOS.
> > +     * Please use -L to set the BIOS path and -bios to set bios name.
> > +     */
> > +
> > +    if (kernel_filename) {
> > +        loaderparams.ram_size =3D ram_size;
> > +        loaderparams.kernel_filename =3D kernel_filename;
> > +        loaderparams.kernel_cmdline =3D kernel_cmdline;
> > +        loaderparams.initrd_filename =3D initrd_filename;
> > +        loaderparams.kernel_entry =3D load_kernel(env);
> > +
> > +        init_boot_rom();
> > +        init_boot_param();
> > +    } else {
> > +        if (bios_name =3D=3D NULL) {
> > +                bios_name =3D LOONGSON3_BIOSNAME;
> > +        }
> > +        filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
> > +        if (filename) {
> > +            bios_size =3D load_image_targphys(filename,
> > +                                            virt_memmap[VIRT_BIOS_ROM]=
.base,
> > +                                            virt_memmap[VIRT_BIOS_ROM]=
.size);
> > +            g_free(filename);
> > +        } else {
> > +            bios_size =3D -1;
> > +        }
> > +
> > +        if ((bios_size < 0 || bios_size > virt_memmap[VIRT_BIOS_ROM].s=
ize) &&
> > +            !kernel_filename && !qtest_enabled()) {
> > +            error_report("Could not load MIPS bios '%s'", bios_name);
> > +            exit(1);
> > +        }
> > +
> > +        fw_conf_init(ram_size);
> > +    }
> > +
> > +    msi_nonbroken =3D true;
> > +    loongson3_virt_devices_init(machine, liointc);
> > +
> > +    sysbus_create_simple("goldfish_rtc", virt_memmap[VIRT_RTC].base,
> > +                         qdev_get_gpio_in(liointc, RTC_IRQ));
> > +
> > +    if (serial_hd(0)) {
> > +        serial_mm_init(address_space_mem, virt_memmap[VIRT_UART].base,=
 0,
> > +                       qdev_get_gpio_in(liointc, UART_IRQ), 115200,
> > +                       serial_hd(0), DEVICE_NATIVE_ENDIAN);
> > +    }
> > +}
> > +
> > +static void mips_loongson3_virt_machine_init(MachineClass *mc)
> > +{
> > +    mc->desc =3D "Loongson-3 Virtualization Platform";
> > +    mc->init =3D mips_loongson3_virt_init;
> > +    mc->block_default_type =3D IF_IDE;
> > +    mc->max_cpus =3D LOONGSON_MAX_VCPUS;
> > +    mc->default_ram_id =3D "loongson3.highram";
> > +    /* 1500MB is the requirement of distros for Loongson-3 */
> > +    mc->default_ram_size =3D 1500 * MiB;
> > +    mc->kvm_type =3D mips_kvm_type;
> > +    mc->minimum_page_bits =3D 14;
> > +}
> > +
> > +DEFINE_MACHINE("loongson3-virt", mips_loongson3_virt_machine_init)
> > --
> > 2.7.0
> >

