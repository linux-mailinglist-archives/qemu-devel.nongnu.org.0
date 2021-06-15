Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1793A77B7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 09:11:17 +0200 (CEST)
Received: from localhost ([::1]:58296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt3EC-0003b7-Fb
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 03:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lt3Ce-000239-NN
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:09:40 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1lt3Cb-0001x2-4f
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 03:09:40 -0400
Received: by mail-pg1-x529.google.com with SMTP id l184so10672948pgd.8
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 00:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AYcx63eHKb22A3FS2N8A1kZ9djkzXM1Fe3aLfDIJRGU=;
 b=OmN4b7eKELJPxH17fQcKQVUsVIHIn+9ex1GizRwMuerXXaii1G44E952ZPxL8Q7Txd
 8Y3X2O51a0X16jklv6WS2BAX3eJNJ5T1M0E4VRe1cRDQxr+4L7KXEOlKS7JyofFi/xpP
 JBJxTSbJr3e5tbTf0rJ+mzm3QXtXuT3Kt7nbRxaub1+FEHxKolZf5FfwU0aOlL2855AO
 mhXsYKkTBP/Pr6RK7nRc/gQAwMRRGwNg2roONo/7wHMG++iaJR9NKLtsfgEqD5/ezXMW
 Pu2KqBoQ8OYIeK56WKHIgFI2itTBtawnPYJxRnsm6LqEGtxD0z+fpJaAUaZ5DQrDXIH4
 hJpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AYcx63eHKb22A3FS2N8A1kZ9djkzXM1Fe3aLfDIJRGU=;
 b=gNtGK3OUN4vXJWlT8Umlk/UA33v/g9tCZYw7IBryg6iwYJrBVrzxWfcjSa9omQeMa6
 uCC28lfE1Zgl5p6z1M5z8TXMOf2sGO2vFDxDK2WLVopuEycUJb95kr6xwuyMOdiLntfd
 NRv/SxDzxblImyXGMLht06rk4NL2+4A0daBls5J0Vg7cb26UQen7FfQf6W8NPXm+oY0a
 wC1xqU9jmRsXLTBglmoa3ebVOZyfXe7rDVzRplIFGAjZKix1g11BBuG94BurLeH6kPqp
 aRBP10BFhhq5mDfZOK2bGrd2sEstFJtv5YBZ9Jnpregya4e/5PDEVUr1n+NoZIEpjKHB
 eVUw==
X-Gm-Message-State: AOAM531SNznYyCRZWVyLcfg8pzHnptiDJEJto4FfVuLcx74ByX79kMEF
 Cpoat+arobaT5kFexmPeBa0quA==
X-Google-Smtp-Source: ABdhPJyJpRlTvKdA5H9/V5xPq3RobyDhyQTQBeyYvzC2wZ0liEWpaeuJt4kbiQWtL83Gr+aLzO4pcA==
X-Received: by 2002:a65:6644:: with SMTP id z4mr1267623pgv.101.1623740975139; 
 Tue, 15 Jun 2021 00:09:35 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242])
 by smtp.gmail.com with UTF8SMTPSA id r207sm14997413pfc.118.2021.06.15.00.09.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 00:09:34 -0700 (PDT)
Message-ID: <55582a05-160a-ac1d-75ac-7e636fa2fd7d@ozlabs.ru>
Date: Tue, 15 Jun 2021 17:09:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [RFC PATCH 4/5] ppc/pegasos2: Use Virtual Open Firmware as
 firmware replacement
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1622994395.git.balaton@eik.bme.hu>
 <53e3f069ab536bc2d0c6b3e39418bc85357631ad.1622994395.git.balaton@eik.bme.hu>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <53e3f069ab536bc2d0c6b3e39418bc85357631ad.1622994395.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=aik@ozlabs.ru; helo=mail-pg1-x529.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.489, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 6/7/21 01:46, BALATON Zoltan wrote:
> The pegasos2 board comes with an Open Firmware compliant ROM based on
> SmartFirmware but it has some changes that are not open source
> therefore the ROM binary cannot be included in QEMU. Guests running on
> the board however depend on services provided by the firmware. The
> Virtual Open Firmware recently added to QEMU imlements a minimal set
> of these services to allow some guests to boot without the original
> firmware. This patch adds VOF as the default firmware for pegasos2
> which allows booting Linux and MorphOS via -kernel option while a ROM
> image can still be used with -bios for guests that don't run with VOF.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/Kconfig    |   1 +
>   hw/ppc/pegasos2.c | 622 +++++++++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 621 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index b895720b28..0eb48128fe 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -75,6 +75,7 @@ config PEGASOS2
>       select VT82C686
>       select IDE_VIA
>       select SMBUS_EEPROM
> +    select VOF
>   # This should come with VT82C686
>       select ACPI_X86
>   
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 07971175c9..91e5fa8fbe 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -34,13 +34,36 @@
>   #include "trace.h"
>   #include "qemu/datadir.h"
>   #include "sysemu/device_tree.h"
> +#include "hw/ppc/vof.h"
>   
> -#define PROM_FILENAME "pegasos2.rom"
> +#include <libfdt.h>
> +
> +#define PROM_FILENAME "vof.bin"
>   #define PROM_ADDR     0xfff00000
>   #define PROM_SIZE     0x80000
>   
> +#define KVMPPC_HCALL_BASE    0xf000
> +#define KVMPPC_H_VOF_CLIENT  (KVMPPC_HCALL_BASE + 0x5)
> +
> +/* Copied from SLOF, and 4K is definitely not enough for GRUB */
> +#define OF_STACK_SIZE       0x8000
> +
> +#define H_SUCCESS     0
> +#define H_PRIVILEGE  -3  /* Caller not privileged */
> +#define H_PARAMETER  -4  /* Parameter invalid, out-of-range or conflicting */
> +
>   #define BUS_FREQ_HZ 133333333
>   
> +#define PCI0_MEM_BASE 0xc0000000
> +#define PCI0_MEM_SIZE 0x20000000
> +#define PCI0_IO_BASE  0xf8000000
> +#define PCI0_IO_SIZE  0x10000
> +
> +#define PCI1_MEM_BASE 0x80000000
> +#define PCI1_MEM_SIZE 0x40000000
> +#define PCI1_IO_BASE  0xfe000000
> +#define PCI1_IO_SIZE  0x10000
> +
>   #define TYPE_PEGASOS2_MACHINE  MACHINE_TYPE_NAME("pegasos2")
>   OBJECT_DECLARE_TYPE(Pegasos2MachineState, MachineClass, PEGASOS2_MACHINE)
>   
> @@ -48,14 +71,26 @@ struct Pegasos2MachineState {
>       MachineState parent_obj;
>       PowerPCCPU *cpu;
>       DeviceState *mv;
> +    Vof *vof;
> +    void *fdt_blob;
> +    uint64_t kernel_addr;
> +    uint64_t kernel_entry;
> +    uint64_t kernel_size;
>   };
>   
> +static void *build_fdt(MachineState *machine, int *fdt_size);
> +
>   static void pegasos2_cpu_reset(void *opaque)
>   {
>       PowerPCCPU *cpu = opaque;
> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(current_machine);
>   
>       cpu_reset(CPU(cpu));
>       cpu->env.spr[SPR_HID1] = 7ULL << 28;
> +    if (pm->vof) {
> +        cpu->env.gpr[1] = 2 * OF_STACK_SIZE - 0x20;
> +        cpu->env.nip = 0x100;
> +    }
>   }
>   
>   static void pegasos2_init(MachineState *machine)
> @@ -92,18 +127,24 @@ static void pegasos2_init(MachineState *machine)
>           error_report("Could not find firmware '%s'", fwname);
>           exit(1);
>       }
> +    if (!machine->firmware && !pm->vof) {
> +        pm->vof = g_malloc0(sizeof(*pm->vof));
> +    }
>       memory_region_init_rom(rom, NULL, "pegasos2.rom", PROM_SIZE, &error_fatal);
>       memory_region_add_subregion(get_system_memory(), PROM_ADDR, rom);
>       sz = load_elf(filename, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1,
>                     PPC_ELF_MACHINE, 0, 0);
>       if (sz <= 0) {
> -        sz = load_image_targphys(filename, PROM_ADDR, PROM_SIZE);
> +        sz = load_image_targphys(filename, pm->vof ? 0 : PROM_ADDR, PROM_SIZE);
>       }
>       if (sz <= 0 || sz > PROM_SIZE) {
>           error_report("Could not load firmware '%s'", filename);
>           exit(1);
>       }
>       g_free(filename);
> +    if (pm->vof) {
> +        pm->vof->fw_size = sz;
> +    }
>   
>       /* Marvell Discovery II system controller */
>       pm->mv = DEVICE(sysbus_create_simple(TYPE_MV64361, -1,
> @@ -137,20 +178,179 @@ static void pegasos2_init(MachineState *machine)
>   
>       /* other PC hardware */
>       pci_vga_init(pci_bus);
> +
> +    if (machine->kernel_filename) {
> +        sz = load_elf(machine->kernel_filename, NULL, NULL, NULL,
> +                      &pm->kernel_entry, &pm->kernel_addr, NULL, NULL, 1,
> +                      PPC_ELF_MACHINE, 0, 0);
> +        if (sz <= 0) {
> +            error_report("Could not load kernel '%s'",
> +                         machine->kernel_filename);
> +            exit(1);
> +        }
> +        pm->kernel_size = sz;
> +        if (!pm->vof) {
> +            warn_report("Option -kernel may be ineffective with -bios.");
> +        }
> +    }
> +    if (machine->kernel_cmdline && !pm->vof) {
> +        warn_report("Option -append may be ineffective with -bios.");
> +    }
> +}
> +
> +static void pegasos2_pci_config_write(AddressSpace *as, int bus, uint32_t addr,
> +                                      uint32_t len, uint32_t val)
> +{
> +    hwaddr pcicfg = (bus ? 0xf1000c78 : 0xf1000cf8);
> +
> +    stl_le_phys(as, pcicfg, addr | BIT(31));
> +    switch (len) {
> +    case 4:
> +        stl_le_phys(as, pcicfg + 4, val);
> +        break;
> +    case 2:
> +        stw_le_phys(as, pcicfg + 4, val);
> +        break;
> +    case 1:
> +        stb_phys(as, pcicfg + 4, val);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid length\n", __func__);
> +        break;
> +    }
> +}
> +
> +static void pegasos2_machine_reset(MachineState *machine)
> +{
> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(machine);
> +    AddressSpace *as = CPU(pm->cpu)->as;
> +    void *fdt;
> +    uint64_t d[2];
> +    int sz;
> +
> +    qemu_devices_reset();
> +    if (!pm->vof) {
> +        return; /* Firmware should set up machine so nothing to do */
> +    }
> +
> +    /* Otherwise, set up devices that board firmware would normally do */
> +    stl_le_phys(as, 0xf1000000, 0x28020ff);
> +    stl_le_phys(as, 0xf1000278, 0xa31fc);
> +    stl_le_phys(as, 0xf100f300, 0x11ff0400);
> +    stl_le_phys(as, 0xf100f10c, 0x80000000);
> +    stl_le_phys(as, 0xf100001c, 0x8000000);
> +    pegasos2_pci_config_write(as, 0, PCI_COMMAND, 2, PCI_COMMAND_IO |
> +                              PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
> +    pegasos2_pci_config_write(as, 1, PCI_COMMAND, 2, PCI_COMMAND_IO |
> +                              PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
> +
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              PCI_INTERRUPT_LINE, 2, 0x9);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 0) << 8) |
> +                              0x50, 1, 0x2);
> +
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +                              PCI_INTERRUPT_LINE, 2, 0x109);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +                              PCI_CLASS_PROG, 1, 0xf);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +                              0x40, 1, 0xb);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +                              0x50, 4, 0x17171717);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 1) << 8) |
> +                              PCI_COMMAND, 2, 0x87);
> +
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 2) << 8) |
> +                              PCI_INTERRUPT_LINE, 2, 0x409);
> +
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 3) << 8) |
> +                              PCI_INTERRUPT_LINE, 2, 0x409);
> +
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +                              PCI_INTERRUPT_LINE, 2, 0x9);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +                              0x48, 4, 0xf00);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +                              0x40, 4, 0x558020);
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 4) << 8) |
> +                              0x90, 4, 0xd00);
> +
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 5) << 8) |
> +                              PCI_INTERRUPT_LINE, 2, 0x309);
> +
> +    pegasos2_pci_config_write(as, 1, (PCI_DEVFN(12, 6) << 8) |
> +                              PCI_INTERRUPT_LINE, 2, 0x309);
> +
> +    /* Device tree and VOF set up */
> +    vof_init(pm->vof, machine->ram_size, &error_fatal);
> +    if (vof_claim(pm->vof, 0, OF_STACK_SIZE, OF_STACK_SIZE) == -1) {
> +        error_report("Memory allocation for stack failed");
> +        exit(1);
> +    }
> +    if (pm->kernel_size &&
> +        vof_claim(pm->vof, pm->kernel_addr, pm->kernel_size, 0) == -1) {
> +        error_report("Memory for kernel is in use");
> +        exit(1);
> +    }
> +    fdt = build_fdt(machine, &sz);
> +    /* FIXME: VOF assumes entry is same as load address */
> +    d[0] = cpu_to_be64(pm->kernel_entry);
> +    d[1] = cpu_to_be64(pm->kernel_size - (pm->kernel_entry - pm->kernel_addr));
> +    qemu_fdt_setprop(fdt, "/chosen", "qemu,boot-kernel", d, sizeof(d));
> +
> +    qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
> +    g_free(pm->fdt_blob);
> +    pm->fdt_blob = fdt;
> +
> +    vof_build_dt(fdt, pm->vof);
> +    vof_client_open_store(fdt, pm->vof, "/chosen", "stdout", "/failsafe");
> +    pm->cpu->vhyp = PPC_VIRTUAL_HYPERVISOR(machine);
> +}
> +
> +static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
> +{
> +    Pegasos2MachineState *pm = PEGASOS2_MACHINE(vhyp);
> +    CPUPPCState *env = &cpu->env;
> +
> +    /* The TCG path should also be holding the BQL at this point */
> +    g_assert(qemu_mutex_iothread_locked());
> +
> +    if (msr_pr) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Hypercall made with MSR[PR]=1\n");
> +        env->gpr[3] = H_PRIVILEGE;
> +    } else if (env->gpr[3] == KVMPPC_H_VOF_CLIENT) {
> +        int ret = vof_client_call(MACHINE(pm), pm->vof, pm->fdt_blob,
> +                                  env->gpr[4]);
> +        env->gpr[3] = (ret ? H_PARAMETER : H_SUCCESS);
> +    } else {
> +        qemu_log_mask(LOG_GUEST_ERROR, "Unsupported hypercall " TARGET_FMT_lx
> +                      "\n", env->gpr[3]);
> +        env->gpr[3] = -1;
> +    }
> +}
> +
> +static void vhyp_nop(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
> +{
>   }
>   
>   static void pegasos2_machine_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> +    PPCVirtualHypervisorClass *vhc = PPC_VIRTUAL_HYPERVISOR_CLASS(oc);
>   
>       mc->desc = "Genesi/bPlan Pegasos II";
>       mc->init = pegasos2_init;
> +    mc->reset = pegasos2_machine_reset;
>       mc->block_default_type = IF_IDE;
>       mc->default_boot_order = "cd";
>       mc->default_display = "std";
>       mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
>       mc->default_ram_id = "pegasos2.ram";
>       mc->default_ram_size = 512 * MiB;
> +
> +    vhc->hypercall = pegasos2_hypercall;
> +    vhc->cpu_exec_enter = vhyp_nop;
> +    vhc->cpu_exec_exit = vhyp_nop;
>   }
>   
>   static const TypeInfo pegasos2_machine_info = {
> @@ -158,6 +358,10 @@ static const TypeInfo pegasos2_machine_info = {
>       .parent        = TYPE_MACHINE,
>       .class_init    = pegasos2_machine_class_init,
>       .instance_size = sizeof(Pegasos2MachineState),
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_PPC_VIRTUAL_HYPERVISOR },
> +        { }
> +    },
>   };
>   
>   static void pegasos2_machine_register_types(void)
> @@ -166,3 +370,417 @@ static void pegasos2_machine_register_types(void)
>   }
>   
>   type_init(pegasos2_machine_register_types)
> +
> +/* FDT creation for passing to firmware */
> +
> +typedef struct {
> +    void *fdt;
> +    const char *path;
> +} FDTInfo;
> +
> +/* We do everything in reverse order so it comes out right in the tree */
> +
> +static void dt_ide(PCIBus *bus, PCIDevice *d, FDTInfo *fi)
> +{
> +    qemu_fdt_setprop_string(fi->fdt, fi->path, "device_type", "spi");
> +}
> +
> +static void dt_usb(PCIBus *bus, PCIDevice *d, FDTInfo *fi)
> +{
> +    qemu_fdt_setprop_cell(fi->fdt, fi->path, "#size-cells", 0);
> +    qemu_fdt_setprop_cell(fi->fdt, fi->path, "#address-cells", 1);
> +    qemu_fdt_setprop_string(fi->fdt, fi->path, "device_type", "usb");
> +}
> +
> +static void dt_isa(PCIBus *bus, PCIDevice *d, FDTInfo *fi)
> +{
> +    GString *name = g_string_sized_new(64);
> +    uint32_t cells[3];
> +
> +    qemu_fdt_setprop_cell(fi->fdt, fi->path, "#size-cells", 1);
> +    qemu_fdt_setprop_cell(fi->fdt, fi->path, "#address-cells", 2);
> +    qemu_fdt_setprop_string(fi->fdt, fi->path, "device_type", "isa");
> +    qemu_fdt_setprop_string(fi->fdt, fi->path, "name", "isa");
> +
> +    /* addional devices */
> +    g_string_printf(name, "%s/lpt@i3bc", fi->path);
> +    qemu_fdt_add_subnode(fi->fdt, name->str);
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
> +    cells[0] = cpu_to_be32(7);
> +    cells[1] = 0;
> +    qemu_fdt_setprop(fi->fdt, name->str, "interrupts",
> +                     cells, 2 * sizeof(cells[0]));
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = cpu_to_be32(0x3bc);
> +    cells[2] = cpu_to_be32(8);
> +    qemu_fdt_setprop(fi->fdt, name->str, "reg", cells, 3 * sizeof(cells[0]));
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "device_type", "lpt");
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "name", "lpt");
> +
> +    g_string_printf(name, "%s/fdc@i3f0", fi->path);
> +    qemu_fdt_add_subnode(fi->fdt, name->str);
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
> +    cells[0] = cpu_to_be32(6);
> +    cells[1] = 0;
> +    qemu_fdt_setprop(fi->fdt, name->str, "interrupts",
> +                     cells, 2 * sizeof(cells[0]));
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = cpu_to_be32(0x3f0);
> +    cells[2] = cpu_to_be32(8);
> +    qemu_fdt_setprop(fi->fdt, name->str, "reg", cells, 3 * sizeof(cells[0]));
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "device_type", "fdc");
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "name", "fdc");
> +
> +    g_string_printf(name, "%s/timer@i40", fi->path);
> +    qemu_fdt_add_subnode(fi->fdt, name->str);
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = cpu_to_be32(0x40);
> +    cells[2] = cpu_to_be32(8);
> +    qemu_fdt_setprop(fi->fdt, name->str, "reg", cells, 3 * sizeof(cells[0]));
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "device_type", "timer");
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "name", "timer");
> +
> +    g_string_printf(name, "%s/rtc@i70", fi->path);
> +    qemu_fdt_add_subnode(fi->fdt, name->str);
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "compatible", "ds1385-rtc");
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
> +    cells[0] = cpu_to_be32(8);
> +    cells[1] = 0;
> +    qemu_fdt_setprop(fi->fdt, name->str, "interrupts",
> +                     cells, 2 * sizeof(cells[0]));
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = cpu_to_be32(0x70);
> +    cells[2] = cpu_to_be32(2);
> +    qemu_fdt_setprop(fi->fdt, name->str, "reg", cells, 3 * sizeof(cells[0]));
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "device_type", "rtc");
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "name", "rtc");
> +
> +    g_string_printf(name, "%s/keyboard@i60", fi->path);
> +    qemu_fdt_add_subnode(fi->fdt, name->str);
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = 0;
> +    qemu_fdt_setprop(fi->fdt, name->str, "interrupts",
> +                     cells, 2 * sizeof(cells[0]));
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = cpu_to_be32(0x60);
> +    cells[2] = cpu_to_be32(5);
> +    qemu_fdt_setprop(fi->fdt, name->str, "reg", cells, 3 * sizeof(cells[0]));
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "device_type", "keyboard");
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "name", "keyboard");
> +
> +    g_string_printf(name, "%s/8042@i60", fi->path);
> +    qemu_fdt_add_subnode(fi->fdt, name->str);
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "#interrupt-cells", 2);
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "#size-cells", 0);
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "#address-cells", 1);
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "interrupt-controller", "");
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = cpu_to_be32(0x60);
> +    cells[2] = cpu_to_be32(5);
> +    qemu_fdt_setprop(fi->fdt, name->str, "reg", cells, 3 * sizeof(cells[0]));
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "device_type", "");
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "name", "8042");
> +
> +    g_string_printf(name, "%s/serial@i2f8", fi->path);
> +    qemu_fdt_add_subnode(fi->fdt, name->str);
> +    qemu_fdt_setprop_cell(fi->fdt, name->str, "clock-frequency", 0);
> +    cells[0] = cpu_to_be32(3);
> +    cells[1] = 0;
> +    qemu_fdt_setprop(fi->fdt, name->str, "interrupts",
> +                     cells, 2 * sizeof(cells[0]));
> +    cells[0] = cpu_to_be32(1);
> +    cells[1] = cpu_to_be32(0x2f8);
> +    cells[2] = cpu_to_be32(8);
> +    qemu_fdt_setprop(fi->fdt, name->str, "reg", cells, 3 * sizeof(cells[0]));
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "device_type", "serial");
> +    qemu_fdt_setprop_string(fi->fdt, name->str, "name", "serial");
> +
> +    g_string_free(name, TRUE);
> +}
> +
> +static struct {
> +    const char *id;
> +    const char *name;
> +    void (*dtf)(PCIBus *bus, PCIDevice *d, FDTInfo *fi);
> +} device_map[] = {
> +    { "pci11ab,6460", "host", NULL },
> +    { "pci1106,8231", "isa", dt_isa },
> +    { "pci1106,571", "ide", dt_ide },
> +    { "pci1106,3044", "firewire", NULL },
> +    { "pci1106,3038", "usb", dt_usb },
> +    { "pci1106,8235", "other", NULL },
> +    { "pci1106,3058", "sound", NULL },
> +    { NULL, NULL }
> +};
> +
> +static void add_pci_device(PCIBus *bus, PCIDevice *d, void *opaque)
> +{
> +    FDTInfo *fi = opaque;
> +    GString *node = g_string_new(NULL);
> +    uint32_t cells[(PCI_NUM_REGIONS + 1) * 5];
> +    int i, j;
> +    const char *name = NULL;
> +    g_autofree const gchar *pn = g_strdup_printf("pci%x,%x",
> +                                     pci_get_word(&d->config[PCI_VENDOR_ID]),
> +                                     pci_get_word(&d->config[PCI_DEVICE_ID]));
> +
> +    for (i = 0; device_map[i].id; i++) {
> +        if (!strcmp(pn, device_map[i].id)) {
> +            name = device_map[i].name;
> +            break;
> +        }
> +    }
> +    g_string_printf(node, "%s/%s@%x", fi->path, (name ?: pn),
> +                    PCI_SLOT(d->devfn));
> +    if (PCI_FUNC(d->devfn)) {
> +        g_string_append_printf(node, ",%x", PCI_FUNC(d->devfn));
> +    }
> +
> +    qemu_fdt_add_subnode(fi->fdt, node->str);
> +    if (device_map[i].dtf) {
> +        FDTInfo cfi = { fi->fdt, node->str };
> +        device_map[i].dtf(bus, d, &cfi);
> +    }
> +    cells[0] = cpu_to_be32(d->devfn << 8);
> +    cells[1] = 0;
> +    cells[2] = 0;
> +    cells[3] = 0;
> +    cells[4] = 0;
> +    j = 5;
> +    for (i = 0; i < PCI_NUM_REGIONS; i++) {
> +        if (!d->io_regions[i].size) {
> +            continue;
> +        }
> +        cells[j] = cpu_to_be32(d->devfn << 8 | (PCI_BASE_ADDRESS_0 + i * 4));
> +        if (d->io_regions[i].type & PCI_BASE_ADDRESS_SPACE_IO) {
> +            cells[j] |= cpu_to_be32(1 << 24);
> +        } else {
> +            cells[j] |= cpu_to_be32(2 << 24);
> +            if (d->io_regions[i].type & PCI_BASE_ADDRESS_MEM_PREFETCH) {
> +                cells[j] |= cpu_to_be32(4 << 28);
> +            }
> +        }
> +        cells[j + 1] = 0;
> +        cells[j + 2] = 0;
> +        cells[j + 3] = cpu_to_be32(d->io_regions[i].size >> 32);
> +        cells[j + 4] = cpu_to_be32(d->io_regions[i].size);
> +        j += 5;
> +    }


btw I was wondering if Linux on pegasos2 could assign resources when 
/chosen/linux,pci-probe-only is in the FDT, could not it? Or the serial 
device does not probe and Linux does not boot?



-- 
Alexey

