Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3CA6CB884
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 12:40:45 +0200 (CEST)
Received: from localhost ([::1]:45870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGL0u-0003wf-Be
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 06:40:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55729)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iGKDJ-0008Om-LD
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iGKDE-0006rg-LS
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:49:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41020)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iGKDE-0006n6-97
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 05:49:24 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7AF8C010925
 for <qemu-devel@nongnu.org>; Fri,  4 Oct 2019 09:49:22 +0000 (UTC)
Received: by mail-wm1-f72.google.com with SMTP id 4so1400804wmj.6
 for <qemu-devel@nongnu.org>; Fri, 04 Oct 2019 02:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VWTkVZPsKxlbBWEq16KWqSUHatCyL/mDFr+op7it/Hw=;
 b=rv4pvlTxg1+2Yl3ZUBisSUIhv9wxW9CDDTUfV3nvxjgqK0vYA7CHos/UnFQXQ5Md0x
 2vqm+XTphDW5wqu5m1poqcMZ+B/btaumg4FQOhHD8W6r9+udoVY2BFyHnbmL7B+uOeVL
 0XOh+I/2vbfFJ/t9sd/N4GWtZ6qTYxd7pc0aZzfCLBRNkg53lLIs3a+tDKDTFFVKv+Jb
 u5R4tdhFdupwtQMRuX9m9ZlRKndqZ7kE2/W8XtWMTCwX/0Qdu8ySvhKuAIDMz37HNar6
 YjB9owmyFm0RTthGFbWuiYawykphGC5IKwYpcZk0PdGljq5pcPyHm/eudSGrzmzTKS7A
 PUTg==
X-Gm-Message-State: APjAAAVmP6SVkRN2+vBjJzUaedHWFa+JD0nM4+8yEJiEsuifbH2R+vn6
 Rj6FA5dWZ51CH0i0LK2xctkgKFel/XyBOoVqMrD+Eq8HJdBysS699/RPVWBtX0ha/4SnCf6ATYr
 ZmPAfywouWwZiCmg=
X-Received: by 2002:a1c:3182:: with SMTP id
 x124mr10875064wmx.168.1570182560837; 
 Fri, 04 Oct 2019 02:49:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytFhcfXXEcWDOgIgbxezoqy+VQhjo/BLxQIDLH5PPonZSQLdZqJj6OkyUjFGPpRQSQ6Kl/rw==
X-Received: by 2002:a1c:3182:: with SMTP id
 x124mr10875000wmx.168.1570182559709; 
 Fri, 04 Oct 2019 02:49:19 -0700 (PDT)
Received: from [192.168.1.35] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id f17sm5585544wru.29.2019.10.04.02.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2019 02:49:19 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] hw/i386: split PCMachineState deriving
 X86MachineState from it
To: Sergio Lopez <slp@redhat.com>, qemu-devel@nongnu.org
References: <20191004093752.16564-1-slp@redhat.com>
 <20191004093752.16564-5-slp@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a1ab3b2d-471c-d910-c109-c88019d9969a@redhat.com>
Date: Fri, 4 Oct 2019 11:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191004093752.16564-5-slp@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, mst@redhat.com, kraxel@redhat.com, pbonzini@redhat.com,
 imammedo@redhat.com, sgarzare@redhat.com, lersek@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/19 11:37 AM, Sergio Lopez wrote:
> Split up PCMachineState and PCMachineClass and derive X86MachineState
> and X86MachineClass from them. This allows sharing code with non-PC
> x86 machine types.
>=20
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
>   include/hw/i386/pc.h  |  27 +------
>   include/hw/i386/x86.h |  56 ++++++++++++-

Thanks for using the git.orderfile script :)

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>   hw/acpi/cpu_hotplug.c |  10 +--
>   hw/i386/acpi-build.c  |  29 ++++---
>   hw/i386/amd_iommu.c   |   3 +-
>   hw/i386/intel_iommu.c |   3 +-
>   hw/i386/pc.c          | 178 ++++++++++++++---------------------------=
-
>   hw/i386/pc_piix.c     |  43 +++++-----
>   hw/i386/pc_q35.c      |  35 +++++----
>   hw/i386/x86.c         | 139 +++++++++++++++++++++++++++++----
>   hw/i386/xen/xen-hvm.c |  23 +++---
>   hw/intc/ioapic.c      |   2 +-
>   12 files changed, 320 insertions(+), 228 deletions(-)
>=20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 73e2847e87..d2a690d05e 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -8,6 +8,7 @@
>   #include "hw/block/flash.h"
>   #include "net/net.h"
>   #include "hw/i386/ioapic.h"
> +#include "hw/i386/x86.h"
>  =20
>   #include "qemu/range.h"
>   #include "qemu/bitmap.h"
> @@ -27,7 +28,7 @@
>    */
>   struct PCMachineState {
>       /*< private >*/
> -    MachineState parent_obj;
> +    X86MachineState parent_obj;
>  =20
>       /* <public> */
>  =20
> @@ -36,16 +37,11 @@ struct PCMachineState {
>  =20
>       /* Pointers to devices and objects: */
>       HotplugHandler *acpi_dev;
> -    ISADevice *rtc;
>       PCIBus *bus;
>       I2CBus *smbus;
> -    FWCfgState *fw_cfg;
> -    qemu_irq *gsi;
>       PFlashCFI01 *flash[2];
> -    GMappedFile *initrd_mapped_file;
>  =20
>       /* Configuration options: */
> -    uint64_t max_ram_below_4g;
>       OnOffAuto vmport;
>       OnOffAuto smm;
>  =20
> @@ -54,27 +50,13 @@ struct PCMachineState {
>       bool sata_enabled;
>       bool pit_enabled;
>  =20
> -    /* RAM information (sizes, addresses, configuration): */
> -    ram_addr_t below_4g_mem_size, above_4g_mem_size;
> -
> -    /* CPU and apic information: */
> -    bool apic_xrupt_override;
> -    unsigned apic_id_limit;
> -    uint16_t boot_cpus;
> -    unsigned smp_dies;
> -
>       /* NUMA information: */
>       uint64_t numa_nodes;
>       uint64_t *node_mem;
> -
> -    /* Address space used by IOAPIC device. All IOAPIC interrupts
> -     * will be translated to MSI messages in the address space. */
> -    AddressSpace *ioapic_as;
>   };
>  =20
>   #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
>   #define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
> -#define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
>   #define PC_MACHINE_VMPORT           "vmport"
>   #define PC_MACHINE_SMM              "smm"
>   #define PC_MACHINE_SMBUS            "smbus"
> @@ -99,7 +81,7 @@ struct PCMachineState {
>    */
>   typedef struct PCMachineClass {
>       /*< private >*/
> -    MachineClass parent_class;
> +    X86MachineClass parent_class;
>  =20
>       /*< public >*/
>  =20
> @@ -141,9 +123,6 @@ typedef struct PCMachineClass {
>  =20
>       /* use PVH to load kernels that support this feature */
>       bool pvh_enabled;
> -
> -    /* Enables contiguous-apic-ID mode */
> -    bool compat_apic_id_mode;
>   } PCMachineClass;
>  =20
>   #define TYPE_PC_MACHINE "generic-pc-machine"
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 71e2b6985d..a930a7ad9d 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -17,7 +17,61 @@
>   #ifndef HW_I386_X86_H
>   #define HW_I386_X86_H
>  =20
> +#include "qemu-common.h"
> +#include "exec/hwaddr.h"
> +#include "qemu/notify.h"
> +
>   #include "hw/boards.h"
> +#include "hw/nmi.h"
> +
> +typedef struct {
> +    /*< private >*/
> +    MachineClass parent;
> +
> +    /*< public >*/
> +
> +    /* Enables contiguous-apic-ID mode */
> +    bool compat_apic_id_mode;
> +} X86MachineClass;
> +
> +typedef struct {
> +    /*< private >*/
> +    MachineState parent;
> +
> +    /*< public >*/
> +
> +    /* Pointers to devices and objects: */
> +    ISADevice *rtc;
> +    FWCfgState *fw_cfg;
> +    qemu_irq *gsi;
> +    GMappedFile *initrd_mapped_file;
> +
> +    /* Configuration options: */
> +    uint64_t max_ram_below_4g;
> +
> +    /* RAM information (sizes, addresses, configuration): */
> +    ram_addr_t below_4g_mem_size, above_4g_mem_size;
> +
> +    /* CPU and apic information: */
> +    bool apic_xrupt_override;
> +    unsigned apic_id_limit;
> +    uint16_t boot_cpus;
> +    unsigned smp_dies;
> +
> +    /* Address space used by IOAPIC device. All IOAPIC interrupts
> +     * will be translated to MSI messages in the address space. */
> +    AddressSpace *ioapic_as;
> +} X86MachineState;
> +
> +#define X86_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
> +
> +#define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
> +#define X86_MACHINE(obj) \
> +    OBJECT_CHECK(X86MachineState, (obj), TYPE_X86_MACHINE)
> +#define X86_MACHINE_GET_CLASS(obj) \
> +    OBJECT_GET_CLASS(X86MachineClass, obj, TYPE_X86_MACHINE)
> +#define X86_MACHINE_CLASS(class) \
> +    OBJECT_CLASS_CHECK(X86MachineClass, class, TYPE_X86_MACHINE)
>  =20
>   uint32_t x86_cpu_apic_id_from_index(PCMachineState *pcms,
>                                       unsigned int cpu_index);
> @@ -30,6 +84,6 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(Machin=
eState *ms);
>  =20
>   void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw);
>  =20
> -void x86_load_linux(PCMachineState *x86ms, FWCfgState *fw_cfg);
> +void x86_load_linux(PCMachineState *pcms, FWCfgState *fw_cfg);
>  =20
>   #endif
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index 6e8293aac9..3ac2045a95 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -128,7 +128,7 @@ void build_legacy_cpu_hotplug_aml(Aml *ctx, Machine=
State *machine,
>       Aml *one =3D aml_int(1);
>       MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>       const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(machi=
ne);
> -    PCMachineState *pcms =3D PC_MACHINE(machine);
> +    X86MachineState *x86ms =3D X86_MACHINE(machine);
>  =20
>       /*
>        * _MAT method - creates an madt apic buffer
> @@ -236,9 +236,9 @@ void build_legacy_cpu_hotplug_aml(Aml *ctx, Machine=
State *machine,
>       /* The current AML generator can cover the APIC ID range [0..255]=
,
>        * inclusive, for VCPU hotplug. */
>       QEMU_BUILD_BUG_ON(ACPI_CPU_HOTPLUG_ID_LIMIT > 256);
> -    if (pcms->apic_id_limit > ACPI_CPU_HOTPLUG_ID_LIMIT) {
> +    if (x86ms->apic_id_limit > ACPI_CPU_HOTPLUG_ID_LIMIT) {
>           error_report("max_cpus is too large. APIC ID of last CPU is %=
u",
> -                     pcms->apic_id_limit - 1);
> +                     x86ms->apic_id_limit - 1);
>           exit(1);
>       }
>  =20
> @@ -315,8 +315,8 @@ void build_legacy_cpu_hotplug_aml(Aml *ctx, Machine=
State *machine,
>        * ith up to 255 elements. Windows guests up to win2k8 fail when
>        * VarPackageOp is used.
>        */
> -    pkg =3D pcms->apic_id_limit <=3D 255 ? aml_package(pcms->apic_id_l=
imit) :
> -                                       aml_varpackage(pcms->apic_id_li=
mit);
> +    pkg =3D x86ms->apic_id_limit <=3D 255 ? aml_package(x86ms->apic_id=
_limit) :
> +                                        aml_varpackage(x86ms->apic_id_=
limit);
>  =20
>       for (i =3D 0, apic_idx =3D 0; i < apic_ids->len; i++) {
>           int apic_id =3D apic_ids->cpus[i].arch_id;
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 4e0f9f425a..fc7de46533 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -361,6 +361,7 @@ static void
>   build_madt(GArray *table_data, BIOSLinker *linker, PCMachineState *pc=
ms)
>   {
>       MachineClass *mc =3D MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>       const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(MACHI=
NE(pcms));
>       int madt_start =3D table_data->len;
>       AcpiDeviceIfClass *adevc =3D ACPI_DEVICE_IF_GET_CLASS(pcms->acpi_=
dev);
> @@ -390,7 +391,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, =
PCMachineState *pcms)
>       io_apic->address =3D cpu_to_le32(IO_APIC_DEFAULT_ADDRESS);
>       io_apic->interrupt =3D cpu_to_le32(0);
>  =20
> -    if (pcms->apic_xrupt_override) {
> +    if (x86ms->apic_xrupt_override) {
>           intsrcovr =3D acpi_data_push(table_data, sizeof *intsrcovr);
>           intsrcovr->type   =3D ACPI_APIC_XRUPT_OVERRIDE;
>           intsrcovr->length =3D sizeof(*intsrcovr);
> @@ -1831,6 +1832,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>       CrsRangeSet crs_range_set;
>       PCMachineState *pcms =3D PC_MACHINE(machine);
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(machine);
> +    X86MachineState *x86ms =3D X86_MACHINE(machine);
>       AcpiMcfgInfo mcfg;
>       uint32_t nr_mem =3D machine->ram_slots;
>       int root_bus_limit =3D 0xFF;
> @@ -2098,7 +2100,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>            * with half of the 16-bit control register. Hence, the total=
 size
>            * of the i/o region used is FW_CFG_CTL_SIZE; when using DMA,=
 the
>            * DMA control register is located at FW_CFG_DMA_IO_BASE + 4 =
*/
> -        uint8_t io_size =3D object_property_get_bool(OBJECT(pcms->fw_c=
fg),
> +        uint8_t io_size =3D object_property_get_bool(OBJECT(x86ms->fw_=
cfg),
>                                                      "dma_enabled", NUL=
L) ?
>                             ROUND_UP(FW_CFG_CTL_SIZE, 4) + sizeof(dma_a=
ddr_t) :
>                             FW_CFG_CTL_SIZE;
> @@ -2331,6 +2333,7 @@ build_srat(GArray *table_data, BIOSLinker *linker=
, MachineState *machine)
>       int srat_start, numa_start, slots;
>       uint64_t mem_len, mem_base, next_base;
>       MachineClass *mc =3D MACHINE_GET_CLASS(machine);
> +    X86MachineState *x86ms =3D X86_MACHINE(machine);
>       const CPUArchIdList *apic_ids =3D mc->possible_cpu_arch_ids(machi=
ne);
>       PCMachineState *pcms =3D PC_MACHINE(machine);
>       ram_addr_t hotplugabble_address_space_size =3D
> @@ -2401,16 +2404,16 @@ build_srat(GArray *table_data, BIOSLinker *link=
er, MachineState *machine)
>           }
>  =20
>           /* Cut out the ACPI_PCI hole */
> -        if (mem_base <=3D pcms->below_4g_mem_size &&
> -            next_base > pcms->below_4g_mem_size) {
> -            mem_len -=3D next_base - pcms->below_4g_mem_size;
> +        if (mem_base <=3D x86ms->below_4g_mem_size &&
> +            next_base > x86ms->below_4g_mem_size) {
> +            mem_len -=3D next_base - x86ms->below_4g_mem_size;
>               if (mem_len > 0) {
>                   numamem =3D acpi_data_push(table_data, sizeof *numame=
m);
>                   build_srat_memory(numamem, mem_base, mem_len, i - 1,
>                                     MEM_AFFINITY_ENABLED);
>               }
>               mem_base =3D 1ULL << 32;
> -            mem_len =3D next_base - pcms->below_4g_mem_size;
> +            mem_len =3D next_base - x86ms->below_4g_mem_size;
>               next_base =3D mem_base + mem_len;
>           }
>  =20
> @@ -2629,6 +2632,7 @@ void acpi_build(AcpiBuildTables *tables, MachineS=
tate *machine)
>   {
>       PCMachineState *pcms =3D PC_MACHINE(machine);
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(machine);
>       GArray *table_offsets;
>       unsigned facs, dsdt, rsdt, fadt;
>       AcpiPmInfo pm;
> @@ -2790,7 +2794,7 @@ void acpi_build(AcpiBuildTables *tables, MachineS=
tate *machine)
>            */
>           int legacy_aml_len =3D
>               pcmc->legacy_acpi_table_size +
> -            ACPI_BUILD_LEGACY_CPU_AML_SIZE * pcms->apic_id_limit;
> +            ACPI_BUILD_LEGACY_CPU_AML_SIZE * x86ms->apic_id_limit;
>           int legacy_table_size =3D
>               ROUND_UP(tables_blob->len - aml_len + legacy_aml_len,
>                        ACPI_BUILD_ALIGN_SIZE);
> @@ -2880,13 +2884,14 @@ void acpi_setup(void)
>   {
>       PCMachineState *pcms =3D PC_MACHINE(qdev_get_machine());
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>       AcpiBuildTables tables;
>       AcpiBuildState *build_state;
>       Object *vmgenid_dev;
>       TPMIf *tpm;
>       static FwCfgTPMConfig tpm_config;
>  =20
> -    if (!pcms->fw_cfg) {
> +    if (!x86ms->fw_cfg) {
>           ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
>           return;
>       }
> @@ -2917,7 +2922,7 @@ void acpi_setup(void)
>           acpi_add_rom_blob(acpi_build_update, build_state,
>                             tables.linker->cmd_blob, "etc/table-loader"=
, 0);
>  =20
> -    fw_cfg_add_file(pcms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
> +    fw_cfg_add_file(x86ms->fw_cfg, ACPI_BUILD_TPMLOG_FILE,
>                       tables.tcpalog->data, acpi_data_len(tables.tcpalo=
g));
>  =20
>       tpm =3D tpm_find();
> @@ -2927,13 +2932,13 @@ void acpi_setup(void)
>               .tpm_version =3D tpm_get_version(tpm),
>               .tpmppi_version =3D TPM_PPI_VERSION_1_30
>           };
> -        fw_cfg_add_file(pcms->fw_cfg, "etc/tpm/config",
> +        fw_cfg_add_file(x86ms->fw_cfg, "etc/tpm/config",
>                           &tpm_config, sizeof tpm_config);
>       }
>  =20
>       vmgenid_dev =3D find_vmgenid_dev();
>       if (vmgenid_dev) {
> -        vmgenid_add_fw_cfg(VMGENID(vmgenid_dev), pcms->fw_cfg,
> +        vmgenid_add_fw_cfg(VMGENID(vmgenid_dev), x86ms->fw_cfg,
>                              tables.vmgenid);
>       }
>  =20
> @@ -2946,7 +2951,7 @@ void acpi_setup(void)
>           uint32_t rsdp_size =3D acpi_data_len(tables.rsdp);
>  =20
>           build_state->rsdp =3D g_memdup(tables.rsdp->data, rsdp_size);
> -        fw_cfg_add_file_callback(pcms->fw_cfg, ACPI_BUILD_RSDP_FILE,
> +        fw_cfg_add_file_callback(x86ms->fw_cfg, ACPI_BUILD_RSDP_FILE,
>                                    acpi_build_update, NULL, build_state=
,
>                                    build_state->rsdp, rsdp_size, true);
>           build_state->rsdp_mr =3D NULL;
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index 08884523e2..7b7e4a0bf7 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -1537,6 +1537,7 @@ static void amdvi_realize(DeviceState *dev, Error=
 **err)
>       X86IOMMUState *x86_iommu =3D X86_IOMMU_DEVICE(dev);
>       MachineState *ms =3D MACHINE(qdev_get_machine());
>       PCMachineState *pcms =3D PC_MACHINE(ms);
> +    X86MachineState *x86ms =3D X86_MACHINE(ms);
>       PCIBus *bus =3D pcms->bus;
>  =20
>       s->iotlb =3D g_hash_table_new_full(amdvi_uint64_hash,
> @@ -1565,7 +1566,7 @@ static void amdvi_realize(DeviceState *dev, Error=
 **err)
>       }
>  =20
>       /* Pseudo address space under root PCI bus. */
> -    pcms->ioapic_as =3D amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_D=
EVID);
> +    x86ms->ioapic_as =3D amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_=
DEVID);
>  =20
>       /* set up MMIO */
>       memory_region_init_io(&s->mmio, OBJECT(s), &mmio_mem_ops, s, "amd=
vi-mmio",
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index f1de8fdb75..9dc20c160e 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3731,6 +3731,7 @@ static void vtd_realize(DeviceState *dev, Error *=
*errp)
>   {
>       MachineState *ms =3D MACHINE(qdev_get_machine());
>       PCMachineState *pcms =3D PC_MACHINE(ms);
> +    X86MachineState *x86ms =3D X86_MACHINE(ms);
>       PCIBus *bus =3D pcms->bus;
>       IntelIOMMUState *s =3D INTEL_IOMMU_DEVICE(dev);
>       X86IOMMUState *x86_iommu =3D X86_IOMMU_DEVICE(dev);
> @@ -3771,7 +3772,7 @@ static void vtd_realize(DeviceState *dev, Error *=
*errp)
>       sysbus_mmio_map(SYS_BUS_DEVICE(s), 0, Q35_HOST_BRIDGE_IOMMU_ADDR)=
;
>       pci_setup_iommu(bus, vtd_host_dma_iommu, dev);
>       /* Pseudo address space under root PCI bus. */
> -    pcms->ioapic_as =3D vtd_host_dma_iommu(bus, s, Q35_PSEUDO_DEVFN_IO=
APIC);
> +    x86ms->ioapic_as =3D vtd_host_dma_iommu(bus, s, Q35_PSEUDO_DEVFN_I=
OAPIC);
>       qemu_add_machine_init_done_notifier(&vtd_machine_done_notify);
>   }
>  =20
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 094db79fb0..0dc1420a1f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -78,7 +78,6 @@
>   #include "qapi/qapi-visit-common.h"
>   #include "qapi/visitor.h"
>   #include "hw/core/cpu.h"
> -#include "hw/nmi.h"
>   #include "hw/usb.h"
>   #include "hw/i386/intel_iommu.h"
>   #include "hw/net/ne2000-isa.h"
> @@ -679,17 +678,18 @@ void pc_cmos_init(PCMachineState *pcms,
>   {
>       int val;
>       static pc_cmos_init_late_arg arg;
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
>       /* various important CMOS locations needed by PC/Bochs bios */
>  =20
>       /* memory size */
>       /* base memory (first MiB) */
> -    val =3D MIN(pcms->below_4g_mem_size / KiB, 640);
> +    val =3D MIN(x86ms->below_4g_mem_size / KiB, 640);
>       rtc_set_memory(s, 0x15, val);
>       rtc_set_memory(s, 0x16, val >> 8);
>       /* extended memory (next 64MiB) */
> -    if (pcms->below_4g_mem_size > 1 * MiB) {
> -        val =3D (pcms->below_4g_mem_size - 1 * MiB) / KiB;
> +    if (x86ms->below_4g_mem_size > 1 * MiB) {
> +        val =3D (x86ms->below_4g_mem_size - 1 * MiB) / KiB;
>       } else {
>           val =3D 0;
>       }
> @@ -700,8 +700,8 @@ void pc_cmos_init(PCMachineState *pcms,
>       rtc_set_memory(s, 0x30, val);
>       rtc_set_memory(s, 0x31, val >> 8);
>       /* memory between 16MiB and 4GiB */
> -    if (pcms->below_4g_mem_size > 16 * MiB) {
> -        val =3D (pcms->below_4g_mem_size - 16 * MiB) / (64 * KiB);
> +    if (x86ms->below_4g_mem_size > 16 * MiB) {
> +        val =3D (x86ms->below_4g_mem_size - 16 * MiB) / (64 * KiB);
>       } else {
>           val =3D 0;
>       }
> @@ -710,14 +710,14 @@ void pc_cmos_init(PCMachineState *pcms,
>       rtc_set_memory(s, 0x34, val);
>       rtc_set_memory(s, 0x35, val >> 8);
>       /* memory above 4GiB */
> -    val =3D pcms->above_4g_mem_size / 65536;
> +    val =3D x86ms->above_4g_mem_size / 65536;
>       rtc_set_memory(s, 0x5b, val);
>       rtc_set_memory(s, 0x5c, val >> 8);
>       rtc_set_memory(s, 0x5d, val >> 16);
>  =20
>       object_property_add_link(OBJECT(pcms), "rtc_state",
>                                TYPE_ISA_DEVICE,
> -                             (Object **)&pcms->rtc,
> +                             (Object **)&x86ms->rtc,
>                                object_property_allow_set_link,
>                                OBJ_PROP_LINK_STRONG, &error_abort);
>       object_property_set_link(OBJECT(pcms), OBJECT(s),
> @@ -906,7 +906,7 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, i=
nt level)
>    */
>   void pc_smp_parse(MachineState *ms, QemuOpts *opts)
>   {
> -    PCMachineState *pcms =3D PC_MACHINE(ms);
> +    X86MachineState *x86ms =3D X86_MACHINE(ms);
>  =20
>       if (opts) {
>           unsigned cpus    =3D qemu_opt_get_number(opts, "cpus", 0);
> @@ -970,7 +970,7 @@ void pc_smp_parse(MachineState *ms, QemuOpts *opts)
>           ms->smp.cpus =3D cpus;
>           ms->smp.cores =3D cores;
>           ms->smp.threads =3D threads;
> -        pcms->smp_dies =3D dies;
> +        x86ms->smp_dies =3D dies;
>       }
>  =20
>       if (ms->smp.cpus > 1) {
> @@ -1023,10 +1023,11 @@ void pc_machine_done(Notifier *notifier, void *=
data)
>   {
>       PCMachineState *pcms =3D container_of(notifier,
>                                           PCMachineState, machine_done)=
;
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>       PCIBus *bus =3D pcms->bus;
>  =20
>       /* set the number of CPUs */
> -    rtc_set_cpus_count(pcms->rtc, pcms->boot_cpus);
> +    rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
>  =20
>       if (bus) {
>           int extra_hosts =3D 0;
> @@ -1037,23 +1038,23 @@ void pc_machine_done(Notifier *notifier, void *=
data)
>                   extra_hosts++;
>               }
>           }
> -        if (extra_hosts && pcms->fw_cfg) {
> +        if (extra_hosts && x86ms->fw_cfg) {
>               uint64_t *val =3D g_malloc(sizeof(*val));
>               *val =3D cpu_to_le64(extra_hosts);
> -            fw_cfg_add_file(pcms->fw_cfg,
> +            fw_cfg_add_file(x86ms->fw_cfg,
>                       "etc/extra-pci-roots", val, sizeof(*val));
>           }
>       }
>  =20
>       acpi_setup();
> -    if (pcms->fw_cfg) {
> -        fw_cfg_build_smbios(MACHINE(pcms), pcms->fw_cfg);
> -        fw_cfg_build_feature_control(MACHINE(pcms), pcms->fw_cfg);
> +    if (x86ms->fw_cfg) {
> +        fw_cfg_build_smbios(MACHINE(pcms), x86ms->fw_cfg);
> +        fw_cfg_build_feature_control(MACHINE(pcms), x86ms->fw_cfg);
>           /* update FW_CFG_NB_CPUS to account for -device added CPUs */
> -        fw_cfg_modify_i16(pcms->fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpu=
s);
> +        fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_c=
pus);
>       }
>  =20
> -    if (pcms->apic_id_limit > 255 && !xen_enabled()) {
> +    if (x86ms->apic_id_limit > 255 && !xen_enabled()) {
>           IntelIOMMUState *iommu =3D INTEL_IOMMU_DEVICE(x86_iommu_get_d=
efault());
>  =20
>           if (!iommu || !x86_iommu_ir_supported(X86_IOMMU_DEVICE(iommu)=
) ||
> @@ -1071,8 +1072,9 @@ void pc_guest_info_init(PCMachineState *pcms)
>   {
>       int i;
>       MachineState *ms =3D MACHINE(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
> -    pcms->apic_xrupt_override =3D kvm_allows_irq0_override();
> +    x86ms->apic_xrupt_override =3D kvm_allows_irq0_override();
>       pcms->numa_nodes =3D ms->numa_state->num_nodes;
>       pcms->node_mem =3D g_malloc0(pcms->numa_nodes *
>                                       sizeof *pcms->node_mem);
> @@ -1097,11 +1099,12 @@ void xen_load_linux(PCMachineState *pcms)
>   {
>       int i;
>       FWCfgState *fw_cfg;
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
>       assert(MACHINE(pcms)->kernel_filename !=3D NULL);
>  =20
>       fw_cfg =3D fw_cfg_init_io(FW_CFG_IO_BASE);
> -    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus);
> +    fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus);
>       rom_set_fw(fw_cfg);
>  =20
>       x86_load_linux(pcms, fw_cfg);
> @@ -1112,7 +1115,7 @@ void xen_load_linux(PCMachineState *pcms)
>                  !strcmp(option_rom[i].name, "multiboot.bin"));
>           rom_add_option(option_rom[i].name, option_rom[i].bootindex);
>       }
> -    pcms->fw_cfg =3D fw_cfg;
> +    x86ms->fw_cfg =3D fw_cfg;
>   }
>  =20
>   void pc_memory_init(PCMachineState *pcms,
> @@ -1127,9 +1130,10 @@ void pc_memory_init(PCMachineState *pcms,
>       MachineState *machine =3D MACHINE(pcms);
>       MachineClass *mc =3D MACHINE_GET_CLASS(machine);
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
> -    assert(machine->ram_size =3D=3D pcms->below_4g_mem_size +
> -                                pcms->above_4g_mem_size);
> +    assert(machine->ram_size =3D=3D x86ms->below_4g_mem_size +
> +                                x86ms->above_4g_mem_size);
>  =20
>       linux_boot =3D (machine->kernel_filename !=3D NULL);
>  =20
> @@ -1143,17 +1147,17 @@ void pc_memory_init(PCMachineState *pcms,
>       *ram_memory =3D ram;
>       ram_below_4g =3D g_malloc(sizeof(*ram_below_4g));
>       memory_region_init_alias(ram_below_4g, NULL, "ram-below-4g", ram,
> -                             0, pcms->below_4g_mem_size);
> +                             0, x86ms->below_4g_mem_size);
>       memory_region_add_subregion(system_memory, 0, ram_below_4g);
> -    e820_add_entry(0, pcms->below_4g_mem_size, E820_RAM);
> -    if (pcms->above_4g_mem_size > 0) {
> +    e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
> +    if (x86ms->above_4g_mem_size > 0) {
>           ram_above_4g =3D g_malloc(sizeof(*ram_above_4g));
>           memory_region_init_alias(ram_above_4g, NULL, "ram-above-4g", =
ram,
> -                                 pcms->below_4g_mem_size,
> -                                 pcms->above_4g_mem_size);
> +                                 x86ms->below_4g_mem_size,
> +                                 x86ms->above_4g_mem_size);
>           memory_region_add_subregion(system_memory, 0x100000000ULL,
>                                       ram_above_4g);
> -        e820_add_entry(0x100000000ULL, pcms->above_4g_mem_size, E820_R=
AM);
> +        e820_add_entry(0x100000000ULL, x86ms->above_4g_mem_size, E820_=
RAM);
>       }
>  =20
>       if (!pcmc->has_reserved_memory &&
> @@ -1187,7 +1191,7 @@ void pc_memory_init(PCMachineState *pcms,
>           }
>  =20
>           machine->device_memory->base =3D
> -            ROUND_UP(0x100000000ULL + pcms->above_4g_mem_size, 1 * GiB=
);
> +            ROUND_UP(0x100000000ULL + x86ms->above_4g_mem_size, 1 * Gi=
B);
>  =20
>           if (pcmc->enforce_aligned_dimm) {
>               /* size device region assuming 1G page max alignment per =
slot */
> @@ -1222,7 +1226,7 @@ void pc_memory_init(PCMachineState *pcms,
>                                           1);
>  =20
>       fw_cfg =3D fw_cfg_arch_create(machine,
> -                                pcms->boot_cpus, pcms->apic_id_limit);
> +                                x86ms->boot_cpus, x86ms->apic_id_limit=
);
>  =20
>       rom_set_fw(fw_cfg);
>  =20
> @@ -1245,10 +1249,10 @@ void pc_memory_init(PCMachineState *pcms,
>       for (i =3D 0; i < nb_option_roms; i++) {
>           rom_add_option(option_rom[i].name, option_rom[i].bootindex);
>       }
> -    pcms->fw_cfg =3D fw_cfg;
> +    x86ms->fw_cfg =3D fw_cfg;
>  =20
>       /* Init default IOAPIC address space */
> -    pcms->ioapic_as =3D &address_space_memory;
> +    x86ms->ioapic_as =3D &address_space_memory;
>   }
>  =20
>   /*
> @@ -1260,6 +1264,7 @@ uint64_t pc_pci_hole64_start(void)
>       PCMachineState *pcms =3D PC_MACHINE(qdev_get_machine());
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
>       MachineState *ms =3D MACHINE(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>       uint64_t hole64_start =3D 0;
>  =20
>       if (pcmc->has_reserved_memory && ms->device_memory->base) {
> @@ -1268,7 +1273,7 @@ uint64_t pc_pci_hole64_start(void)
>               hole64_start +=3D memory_region_size(&ms->device_memory->=
mr);
>           }
>       } else {
> -        hole64_start =3D 0x100000000ULL + pcms->above_4g_mem_size;
> +        hole64_start =3D 0x100000000ULL + x86ms->above_4g_mem_size;
>       }
>  =20
>       return ROUND_UP(hole64_start, 1 * GiB);
> @@ -1607,6 +1612,7 @@ static void pc_cpu_plug(HotplugHandler *hotplug_d=
ev,
>       Error *local_err =3D NULL;
>       X86CPU *cpu =3D X86_CPU(dev);
>       PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
>       if (pcms->acpi_dev) {
>           hotplug_handler_plug(HOTPLUG_HANDLER(pcms->acpi_dev), dev, &l=
ocal_err);
> @@ -1616,12 +1622,12 @@ static void pc_cpu_plug(HotplugHandler *hotplug=
_dev,
>       }
>  =20
>       /* increment the number of CPUs */
> -    pcms->boot_cpus++;
> -    if (pcms->rtc) {
> -        rtc_set_cpus_count(pcms->rtc, pcms->boot_cpus);
> +    x86ms->boot_cpus++;
> +    if (x86ms->rtc) {
> +        rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
>       }
> -    if (pcms->fw_cfg) {
> -        fw_cfg_modify_i16(pcms->fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpu=
s);
> +    if (x86ms->fw_cfg) {
> +        fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_c=
pus);
>       }
>  =20
>       found_cpu =3D pc_find_cpu_slot(MACHINE(pcms), cpu->apic_id, NULL)=
;
> @@ -1667,6 +1673,7 @@ static void pc_cpu_unplug_cb(HotplugHandler *hotp=
lug_dev,
>       Error *local_err =3D NULL;
>       X86CPU *cpu =3D X86_CPU(dev);
>       PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
>       hotplug_handler_unplug(HOTPLUG_HANDLER(pcms->acpi_dev), dev, &loc=
al_err);
>       if (local_err) {
> @@ -1678,10 +1685,10 @@ static void pc_cpu_unplug_cb(HotplugHandler *ho=
tplug_dev,
>       object_property_set_bool(OBJECT(dev), false, "realized", NULL);
>  =20
>       /* decrement the number of CPUs */
> -    pcms->boot_cpus--;
> +    x86ms->boot_cpus--;
>       /* Update the number of CPUs in CMOS */
> -    rtc_set_cpus_count(pcms->rtc, pcms->boot_cpus);
> -    fw_cfg_modify_i16(pcms->fw_cfg, FW_CFG_NB_CPUS, pcms->boot_cpus);
> +    rtc_set_cpus_count(x86ms->rtc, x86ms->boot_cpus);
> +    fw_cfg_modify_i16(x86ms->fw_cfg, FW_CFG_NB_CPUS, x86ms->boot_cpus)=
;
>    out:
>       error_propagate(errp, local_err);
>   }
> @@ -1697,6 +1704,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotpl=
ug_dev,
>       CPUX86State *env =3D &cpu->env;
>       MachineState *ms =3D MACHINE(hotplug_dev);
>       PCMachineState *pcms =3D PC_MACHINE(hotplug_dev);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>       unsigned int smp_cores =3D ms->smp.cores;
>       unsigned int smp_threads =3D ms->smp.threads;
>  =20
> @@ -1706,7 +1714,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotpl=
ug_dev,
>           return;
>       }
>  =20
> -    env->nr_dies =3D pcms->smp_dies;
> +    env->nr_dies =3D x86ms->smp_dies;
>  =20
>       /*
>        * If APIC ID is not set,
> @@ -1714,13 +1722,13 @@ static void pc_cpu_pre_plug(HotplugHandler *hot=
plug_dev,
>        */
>       if (cpu->apic_id =3D=3D UNASSIGNED_APIC_ID) {
>           int max_socket =3D (ms->smp.max_cpus - 1) /
> -                                smp_threads / smp_cores / pcms->smp_di=
es;
> +                                smp_threads / smp_cores / x86ms->smp_d=
ies;
>  =20
>           /*
>            * die-id was optional in QEMU 4.0 and older, so keep it opti=
onal
>            * if there's only one die per socket.
>            */
> -        if (cpu->die_id < 0 && pcms->smp_dies =3D=3D 1) {
> +        if (cpu->die_id < 0 && x86ms->smp_dies =3D=3D 1) {
>               cpu->die_id =3D 0;
>           }
>  =20
> @@ -1735,9 +1743,9 @@ static void pc_cpu_pre_plug(HotplugHandler *hotpl=
ug_dev,
>           if (cpu->die_id < 0) {
>               error_setg(errp, "CPU die-id is not set");
>               return;
> -        } else if (cpu->die_id > pcms->smp_dies - 1) {
> +        } else if (cpu->die_id > x86ms->smp_dies - 1) {
>               error_setg(errp, "Invalid CPU die-id: %u must be in range=
 0:%u",
> -                       cpu->die_id, pcms->smp_dies - 1);
> +                       cpu->die_id, x86ms->smp_dies - 1);
>               return;
>           }
>           if (cpu->core_id < 0) {
> @@ -1761,7 +1769,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotpl=
ug_dev,
>           topo.die_id =3D cpu->die_id;
>           topo.core_id =3D cpu->core_id;
>           topo.smt_id =3D cpu->thread_id;
> -        cpu->apic_id =3D apicid_from_topo_ids(pcms->smp_dies, smp_core=
s,
> +        cpu->apic_id =3D apicid_from_topo_ids(x86ms->smp_dies, smp_cor=
es,
>                                               smp_threads, &topo);
>       }
>  =20
> @@ -1769,7 +1777,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotpl=
ug_dev,
>       if (!cpu_slot) {
>           MachineState *ms =3D MACHINE(pcms);
>  =20
> -        x86_topo_ids_from_apicid(cpu->apic_id, pcms->smp_dies,
> +        x86_topo_ids_from_apicid(cpu->apic_id, x86ms->smp_dies,
>                                    smp_cores, smp_threads, &topo);
>           error_setg(errp,
>               "Invalid CPU [socket: %u, die: %u, core: %u, thread: %u] =
with"
> @@ -1791,7 +1799,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotpl=
ug_dev,
>       /* TODO: move socket_id/core_id/thread_id checks into x86_cpu_rea=
lizefn()
>        * once -smp refactoring is complete and there will be CPU privat=
e
>        * CPUState::nr_cores and CPUState::nr_threads fields instead of =
globals */
> -    x86_topo_ids_from_apicid(cpu->apic_id, pcms->smp_dies,
> +    x86_topo_ids_from_apicid(cpu->apic_id, x86ms->smp_dies,
>                                smp_cores, smp_threads, &topo);
>       if (cpu->socket_id !=3D -1 && cpu->socket_id !=3D topo.pkg_id) {
>           error_setg(errp, "property socket-id: %u doesn't match set ap=
ic-id:"
> @@ -1973,45 +1981,6 @@ pc_machine_get_device_memory_region_size(Object =
*obj, Visitor *v,
>       visit_type_int(v, name, &value, errp);
>   }
>  =20
> -static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
> -                                            const char *name, void *op=
aque,
> -                                            Error **errp)
> -{
> -    PCMachineState *pcms =3D PC_MACHINE(obj);
> -    uint64_t value =3D pcms->max_ram_below_4g;
> -
> -    visit_type_size(v, name, &value, errp);
> -}
> -
> -static void pc_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
> -                                            const char *name, void *op=
aque,
> -                                            Error **errp)
> -{
> -    PCMachineState *pcms =3D PC_MACHINE(obj);
> -    Error *error =3D NULL;
> -    uint64_t value;
> -
> -    visit_type_size(v, name, &value, &error);
> -    if (error) {
> -        error_propagate(errp, error);
> -        return;
> -    }
> -    if (value > 4 * GiB) {
> -        error_setg(&error,
> -                   "Machine option 'max-ram-below-4g=3D%"PRIu64
> -                   "' expects size less than or equal to 4G", value);
> -        error_propagate(errp, error);
> -        return;
> -    }
> -
> -    if (value < 1 * MiB) {
> -        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB boun=
dary,"
> -                    "BIOS may not work with less than 1MiB", value);
> -    }
> -
> -    pcms->max_ram_below_4g =3D value;
> -}
> -
>   static void pc_machine_get_vmport(Object *obj, Visitor *v, const char=
 *name,
>                                     void *opaque, Error **errp)
>   {
> @@ -2117,7 +2086,6 @@ static void pc_machine_initfn(Object *obj)
>   {
>       PCMachineState *pcms =3D PC_MACHINE(obj);
>  =20
> -    pcms->max_ram_below_4g =3D 0; /* use default */
>       pcms->smm =3D ON_OFF_AUTO_AUTO;
>   #ifdef CONFIG_VMPORT
>       pcms->vmport =3D ON_OFF_AUTO_AUTO;
> @@ -2129,7 +2097,6 @@ static void pc_machine_initfn(Object *obj)
>       pcms->smbus_enabled =3D true;
>       pcms->sata_enabled =3D true;
>       pcms->pit_enabled =3D true;
> -    pcms->smp_dies =3D 1;
>  =20
>       pc_system_flash_create(pcms);
>   }
> @@ -2160,23 +2127,6 @@ static void pc_machine_wakeup(MachineState *mach=
ine)
>       cpu_synchronize_all_post_reset();
>   }
>  =20
> -static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
> -{
> -    /* cpu index isn't used */
> -    CPUState *cs;
> -
> -    CPU_FOREACH(cs) {
> -        X86CPU *cpu =3D X86_CPU(cs);
> -
> -        if (!cpu->apic_state) {
> -            cpu_interrupt(cs, CPU_INTERRUPT_NMI);
> -        } else {
> -            apic_deliver_nmi(cpu->apic_state);
> -        }
> -    }
> -}
> -
> -
>   static bool pc_hotplug_allowed(MachineState *ms, DeviceState *dev, Er=
ror **errp)
>   {
>       X86IOMMUState *iommu =3D x86_iommu_get_default();
> @@ -2201,7 +2151,6 @@ static void pc_machine_class_init(ObjectClass *oc=
, void *data)
>       MachineClass *mc =3D MACHINE_CLASS(oc);
>       PCMachineClass *pcmc =3D PC_MACHINE_CLASS(oc);
>       HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
> -    NMIClass *nc =3D NMI_CLASS(oc);
>  =20
>       pcmc->pci_enabled =3D true;
>       pcmc->has_acpi_build =3D true;
> @@ -2237,7 +2186,6 @@ static void pc_machine_class_init(ObjectClass *oc=
, void *data)
>       hc->plug =3D pc_machine_device_plug_cb;
>       hc->unplug_request =3D pc_machine_device_unplug_request_cb;
>       hc->unplug =3D pc_machine_device_unplug_cb;
> -    nc->nmi_monitor_handler =3D x86_nmi;
>       mc->default_cpu_type =3D TARGET_DEFAULT_CPU_TYPE;
>       mc->nvdimm_supported =3D true;
>       mc->numa_mem_supported =3D true;
> @@ -2246,13 +2194,6 @@ static void pc_machine_class_init(ObjectClass *o=
c, void *data)
>           pc_machine_get_device_memory_region_size, NULL,
>           NULL, NULL, &error_abort);
>  =20
> -    object_class_property_add(oc, PC_MACHINE_MAX_RAM_BELOW_4G, "size",
> -        pc_machine_get_max_ram_below_4g, pc_machine_set_max_ram_below_=
4g,
> -        NULL, NULL, &error_abort);
> -
> -    object_class_property_set_description(oc, PC_MACHINE_MAX_RAM_BELOW=
_4G,
> -        "Maximum ram below the 4G boundary (32bit boundary)", &error_a=
bort);
> -
>       object_class_property_add(oc, PC_MACHINE_SMM, "OnOffAuto",
>           pc_machine_get_smm, pc_machine_set_smm,
>           NULL, NULL, &error_abort);
> @@ -2277,7 +2218,7 @@ static void pc_machine_class_init(ObjectClass *oc=
, void *data)
>  =20
>   static const TypeInfo pc_machine_info =3D {
>       .name =3D TYPE_PC_MACHINE,
> -    .parent =3D TYPE_MACHINE,
> +    .parent =3D TYPE_X86_MACHINE,
>       .abstract =3D true,
>       .instance_size =3D sizeof(PCMachineState),
>       .instance_init =3D pc_machine_initfn,
> @@ -2285,7 +2226,6 @@ static const TypeInfo pc_machine_info =3D {
>       .class_init =3D pc_machine_class_init,
>       .interfaces =3D (InterfaceInfo[]) {
>            { TYPE_HOTPLUG_HANDLER },
> -         { TYPE_NMI },
>            { }
>       },
>   };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1396451abf..0afa8fe6ea 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -74,6 +74,7 @@ static void pc_init1(MachineState *machine,
>   {
>       PCMachineState *pcms =3D PC_MACHINE(machine);
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(machine);
>       MemoryRegion *system_memory =3D get_system_memory();
>       MemoryRegion *system_io =3D get_system_io();
>       int i;
> @@ -126,11 +127,11 @@ static void pc_init1(MachineState *machine,
>       if (xen_enabled()) {
>           xen_hvm_init(pcms, &ram_memory);
>       } else {
> -        if (!pcms->max_ram_below_4g) {
> -            pcms->max_ram_below_4g =3D 0xe0000000; /* default: 3.5G */
> +        if (!x86ms->max_ram_below_4g) {
> +            x86ms->max_ram_below_4g =3D 0xe0000000; /* default: 3.5G *=
/
>           }
> -        lowmem =3D pcms->max_ram_below_4g;
> -        if (machine->ram_size >=3D pcms->max_ram_below_4g) {
> +        lowmem =3D x86ms->max_ram_below_4g;
> +        if (machine->ram_size >=3D x86ms->max_ram_below_4g) {
>               if (pcmc->gigabyte_align) {
>                   if (lowmem > 0xc0000000) {
>                       lowmem =3D 0xc0000000;
> @@ -139,17 +140,17 @@ static void pc_init1(MachineState *machine,
>                       warn_report("Large machine and max_ram_below_4g "
>                                   "(%" PRIu64 ") not a multiple of 1G; =
"
>                                   "possible bad performance.",
> -                                pcms->max_ram_below_4g);
> +                                x86ms->max_ram_below_4g);
>                   }
>               }
>           }
>  =20
>           if (machine->ram_size >=3D lowmem) {
> -            pcms->above_4g_mem_size =3D machine->ram_size - lowmem;
> -            pcms->below_4g_mem_size =3D lowmem;
> +            x86ms->above_4g_mem_size =3D machine->ram_size - lowmem;
> +            x86ms->below_4g_mem_size =3D lowmem;
>           } else {
> -            pcms->above_4g_mem_size =3D 0;
> -            pcms->below_4g_mem_size =3D machine->ram_size;
> +            x86ms->above_4g_mem_size =3D 0;
> +            x86ms->below_4g_mem_size =3D machine->ram_size;
>           }
>       }
>  =20
> @@ -191,19 +192,19 @@ static void pc_init1(MachineState *machine,
>       gsi_state =3D g_malloc0(sizeof(*gsi_state));
>       if (kvm_ioapic_in_kernel()) {
>           kvm_pc_setup_irq_routing(pcmc->pci_enabled);
> -        pcms->gsi =3D qemu_allocate_irqs(kvm_pc_gsi_handler, gsi_state=
,
> +        x86ms->gsi =3D qemu_allocate_irqs(kvm_pc_gsi_handler, gsi_stat=
e,
>                                          GSI_NUM_PINS);
>       } else {
> -        pcms->gsi =3D qemu_allocate_irqs(gsi_handler, gsi_state, GSI_N=
UM_PINS);
> +        x86ms->gsi =3D qemu_allocate_irqs(gsi_handler, gsi_state, GSI_=
NUM_PINS);
>       }
>  =20
>       if (pcmc->pci_enabled) {
>           pci_bus =3D i440fx_init(host_type,
>                                 pci_type,
> -                              &i440fx_state, &piix3_devfn, &isa_bus, p=
cms->gsi,
> +                              &i440fx_state, &piix3_devfn, &isa_bus, x=
86ms->gsi,
>                                 system_memory, system_io, machine->ram_=
size,
> -                              pcms->below_4g_mem_size,
> -                              pcms->above_4g_mem_size,
> +                              x86ms->below_4g_mem_size,
> +                              x86ms->above_4g_mem_size,
>                                 pci_memory, ram_memory);
>           pcms->bus =3D pci_bus;
>       } else {
> @@ -213,7 +214,7 @@ static void pc_init1(MachineState *machine,
>                                 &error_abort);
>           no_hpet =3D 1;
>       }
> -    isa_bus_irqs(isa_bus, pcms->gsi);
> +    isa_bus_irqs(isa_bus, x86ms->gsi);
>  =20
>       if (kvm_pic_in_kernel()) {
>           i8259 =3D kvm_i8259_init(isa_bus);
> @@ -231,7 +232,7 @@ static void pc_init1(MachineState *machine,
>           ioapic_init_gsi(gsi_state, "i440fx");
>       }
>  =20
> -    pc_register_ferr_irq(pcms->gsi[13]);
> +    pc_register_ferr_irq(x86ms->gsi[13]);
>  =20
>       pc_vga_init(isa_bus, pcmc->pci_enabled ? pci_bus : NULL);
>  =20
> @@ -241,7 +242,7 @@ static void pc_init1(MachineState *machine,
>       }
>  =20
>       /* init basic PC hardware */
> -    pc_basic_device_init(isa_bus, pcms->gsi, &rtc_state, true,
> +    pc_basic_device_init(isa_bus, x86ms->gsi, &rtc_state, true,
>                            (pcms->vmport !=3D ON_OFF_AUTO_ON), pcms->pi=
t_enabled,
>                            0x4);
>  =20
> @@ -288,7 +289,7 @@ else {
>           smi_irq =3D qemu_allocate_irq(pc_acpi_smi_interrupt, first_cp=
u, 0);
>           /* TODO: Populate SPD eeprom data.  */
>           pcms->smbus =3D piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb10=
0,
> -                                    pcms->gsi[9], smi_irq,
> +                                    x86ms->gsi[9], smi_irq,
>                                       pc_machine_is_smm_enabled(pcms),
>                                       &piix4_pm);
>           smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
> @@ -304,7 +305,7 @@ else {
>  =20
>       if (machine->nvdimms_state->is_enabled) {
>           nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
> -                               pcms->fw_cfg, OBJECT(pcms));
> +                               x86ms->fw_cfg, OBJECT(pcms));
>       }
>   }
>  =20
> @@ -729,7 +730,7 @@ DEFINE_I440FX_MACHINE(v1_4, "pc-i440fx-1.4", pc_com=
pat_1_4_fn,
>  =20
>   static void pc_i440fx_1_3_machine_options(MachineClass *m)
>   {
> -    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> +    X86MachineClass *x86mc =3D X86_MACHINE_CLASS(m);
>       static GlobalProperty compat[] =3D {
>           PC_CPU_MODEL_IDS("1.3.0")
>           { "usb-tablet", "usb_version", "1" },
> @@ -740,7 +741,7 @@ static void pc_i440fx_1_3_machine_options(MachineCl=
ass *m)
>  =20
>       pc_i440fx_1_4_machine_options(m);
>       m->hw_version =3D "1.3.0";
> -    pcmc->compat_apic_id_mode =3D true;
> +    x86mc->compat_apic_id_mode =3D true;
>       compat_props_add(m->compat_props, compat, G_N_ELEMENTS(compat));
>   }
>  =20
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 8920bd8978..8e7beb9415 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -116,6 +116,7 @@ static void pc_q35_init(MachineState *machine)
>   {
>       PCMachineState *pcms =3D PC_MACHINE(machine);
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(machine);
>       Q35PCIHost *q35_host;
>       PCIHostState *phb;
>       PCIBus *host_bus;
> @@ -153,27 +154,27 @@ static void pc_q35_init(MachineState *machine)
>       /* Handle the machine opt max-ram-below-4g.  It is basically doin=
g
>        * min(qemu limit, user limit).
>        */
> -    if (!pcms->max_ram_below_4g) {
> -        pcms->max_ram_below_4g =3D 1ULL << 32; /* default: 4G */;
> +    if (!x86ms->max_ram_below_4g) {
> +        x86ms->max_ram_below_4g =3D 1ULL << 32; /* default: 4G */;
>       }
> -    if (lowmem > pcms->max_ram_below_4g) {
> -        lowmem =3D pcms->max_ram_below_4g;
> +    if (lowmem > x86ms->max_ram_below_4g) {
> +        lowmem =3D x86ms->max_ram_below_4g;
>           if (machine->ram_size - lowmem > lowmem &&
>               lowmem & (1 * GiB - 1)) {
>               warn_report("There is possibly poor performance as the ra=
m size "
>                           " (0x%" PRIx64 ") is more then twice the size=
 of"
>                           " max-ram-below-4g (%"PRIu64") and"
>                           " max-ram-below-4g is not a multiple of 1G.",
> -                        (uint64_t)machine->ram_size, pcms->max_ram_bel=
ow_4g);
> +                        (uint64_t)machine->ram_size, x86ms->max_ram_be=
low_4g);
>           }
>       }
>  =20
>       if (machine->ram_size >=3D lowmem) {
> -        pcms->above_4g_mem_size =3D machine->ram_size - lowmem;
> -        pcms->below_4g_mem_size =3D lowmem;
> +        x86ms->above_4g_mem_size =3D machine->ram_size - lowmem;
> +        x86ms->below_4g_mem_size =3D lowmem;
>       } else {
> -        pcms->above_4g_mem_size =3D 0;
> -        pcms->below_4g_mem_size =3D machine->ram_size;
> +        x86ms->above_4g_mem_size =3D 0;
> +        x86ms->below_4g_mem_size =3D machine->ram_size;
>       }
>  =20
>       if (xen_enabled()) {
> @@ -214,10 +215,10 @@ static void pc_q35_init(MachineState *machine)
>       gsi_state =3D g_malloc0(sizeof(*gsi_state));
>       if (kvm_ioapic_in_kernel()) {
>           kvm_pc_setup_irq_routing(pcmc->pci_enabled);
> -        pcms->gsi =3D qemu_allocate_irqs(kvm_pc_gsi_handler, gsi_state=
,
> +        x86ms->gsi =3D qemu_allocate_irqs(kvm_pc_gsi_handler, gsi_stat=
e,
>                                          GSI_NUM_PINS);
>       } else {
> -        pcms->gsi =3D qemu_allocate_irqs(gsi_handler, gsi_state, GSI_N=
UM_PINS);
> +        x86ms->gsi =3D qemu_allocate_irqs(gsi_handler, gsi_state, GSI_=
NUM_PINS);
>       }
>  =20
>       /* create pci host bus */
> @@ -232,9 +233,9 @@ static void pc_q35_init(MachineState *machine)
>                                MCH_HOST_PROP_SYSTEM_MEM, NULL);
>       object_property_set_link(OBJECT(q35_host), OBJECT(system_io),
>                                MCH_HOST_PROP_IO_MEM, NULL);
> -    object_property_set_int(OBJECT(q35_host), pcms->below_4g_mem_size,
> +    object_property_set_int(OBJECT(q35_host), x86ms->below_4g_mem_size=
,
>                               PCI_HOST_BELOW_4G_MEM_SIZE, NULL);
> -    object_property_set_int(OBJECT(q35_host), pcms->above_4g_mem_size,
> +    object_property_set_int(OBJECT(q35_host), x86ms->above_4g_mem_size=
,
>                               PCI_HOST_ABOVE_4G_MEM_SIZE, NULL);
>       /* pci */
>       qdev_init_nofail(DEVICE(q35_host));
> @@ -256,7 +257,7 @@ static void pc_q35_init(MachineState *machine)
>       ich9_lpc =3D ICH9_LPC_DEVICE(lpc);
>       lpc_dev =3D DEVICE(lpc);
>       for (i =3D 0; i < GSI_NUM_PINS; i++) {
> -        qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, pcms->g=
si[i]);
> +        qdev_connect_gpio_out_named(lpc_dev, ICH9_GPIO_GSI, i, x86ms->=
gsi[i]);
>       }
>       pci_bus_irqs(host_bus, ich9_lpc_set_irq, ich9_lpc_map_irq, ich9_l=
pc,
>                    ICH9_LPC_NB_PIRQS);
> @@ -280,7 +281,7 @@ static void pc_q35_init(MachineState *machine)
>           ioapic_init_gsi(gsi_state, "q35");
>       }
>  =20
> -    pc_register_ferr_irq(pcms->gsi[13]);
> +    pc_register_ferr_irq(x86ms->gsi[13]);
>  =20
>       assert(pcms->vmport !=3D ON_OFF_AUTO__MAX);
>       if (pcms->vmport =3D=3D ON_OFF_AUTO_AUTO) {
> @@ -288,7 +289,7 @@ static void pc_q35_init(MachineState *machine)
>       }
>  =20
>       /* init basic PC hardware */
> -    pc_basic_device_init(isa_bus, pcms->gsi, &rtc_state, !mc->no_flopp=
y,
> +    pc_basic_device_init(isa_bus, x86ms->gsi, &rtc_state, !mc->no_flop=
py,
>                            (pcms->vmport !=3D ON_OFF_AUTO_ON), pcms->pi=
t_enabled,
>                            0xff0104);
>  =20
> @@ -331,7 +332,7 @@ static void pc_q35_init(MachineState *machine)
>  =20
>       if (machine->nvdimms_state->is_enabled) {
>           nvdimm_init_acpi_state(machine->nvdimms_state, system_io,
> -                               pcms->fw_cfg, OBJECT(pcms));
> +                               x86ms->fw_cfg, OBJECT(pcms));
>       }
>   }
>  =20
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 6807bb8a22..4a8e254d69 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -64,13 +64,14 @@ uint32_t x86_cpu_apic_id_from_index(PCMachineState =
*pcms,
>                                       unsigned int cpu_index)
>   {
>       MachineState *ms =3D MACHINE(pcms);
> -    PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
> +    X86MachineClass *x86mc =3D X86_MACHINE_GET_CLASS(x86ms);
>       uint32_t correct_id;
>       static bool warned;
>  =20
> -    correct_id =3D x86_apicid_from_cpu_idx(pcms->smp_dies, ms->smp.cor=
es,
> +    correct_id =3D x86_apicid_from_cpu_idx(x86ms->smp_dies, ms->smp.co=
res,
>                                            ms->smp.threads, cpu_index);
> -    if (pcmc->compat_apic_id_mode) {
> +    if (x86mc->compat_apic_id_mode) {
>           if (cpu_index !=3D correct_id && !warned && !qtest_enabled())=
 {
>               error_report("APIC IDs set in compatibility mode, "
>                            "CPU topology won't match the configuration"=
);
> @@ -87,11 +88,12 @@ void x86_cpu_new(PCMachineState *pcms, int64_t apic=
_id, Error **errp)
>       Object *cpu =3D NULL;
>       Error *local_err =3D NULL;
>       CPUX86State *env =3D NULL;
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
>       cpu =3D object_new(MACHINE(pcms)->cpu_type);
>  =20
>       env =3D &X86_CPU(cpu)->env;
> -    env->nr_dies =3D pcms->smp_dies;
> +    env->nr_dies =3D x86ms->smp_dies;
>  =20
>       object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
>       object_property_set_bool(cpu, true, "realized", &local_err);
> @@ -107,6 +109,7 @@ void x86_cpus_init(PCMachineState *pcms)
>       MachineState *ms =3D MACHINE(pcms);
>       MachineClass *mc =3D MACHINE_GET_CLASS(pcms);
>       PCMachineClass *pcmc =3D PC_MACHINE_CLASS(mc);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>  =20
>       x86_cpu_set_default_version(pcmc->default_cpu_version);
>  =20
> @@ -117,8 +120,8 @@ void x86_cpus_init(PCMachineState *pcms)
>        *
>        * This is used for FW_CFG_MAX_CPUS. See comments on fw_cfg_arch_=
create().
>        */
> -    pcms->apic_id_limit =3D x86_cpu_apic_id_from_index(pcms,
> -                                                     ms->smp.max_cpus =
- 1) + 1;
> +    x86ms->apic_id_limit =3D x86_cpu_apic_id_from_index(pcms,
> +                                                      ms->smp.max_cpus=
 - 1) + 1;
>       possible_cpus =3D mc->possible_cpu_arch_ids(ms);
>       for (i =3D 0; i < ms->smp.cpus; i++) {
>           x86_cpu_new(pcms, possible_cpus->cpus[i].arch_id, &error_fata=
l);
> @@ -138,11 +141,11 @@ x86_cpu_index_to_props(MachineState *ms, unsigned=
 cpu_index)
>   int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
>   {
>      X86CPUTopoInfo topo;
> -   PCMachineState *pcms =3D PC_MACHINE(ms);
> +   X86MachineState *x86ms =3D X86_MACHINE(ms);
>  =20
>      assert(idx < ms->possible_cpus->len);
>      x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
> -                            pcms->smp_dies, ms->smp.cores,
> +                            x86ms->smp_dies, ms->smp.cores,
>                               ms->smp.threads, &topo);
>      return topo.pkg_id % ms->numa_state->num_nodes;
>   }
> @@ -150,6 +153,7 @@ int64_t x86_get_default_cpu_node_id(const MachineSt=
ate *ms, int idx)
>   const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
>   {
>       PCMachineState *pcms =3D PC_MACHINE(ms);
> +    X86MachineState *x86ms =3D X86_MACHINE(ms);
>       int i;
>       unsigned int max_cpus =3D ms->smp.max_cpus;
>  =20
> @@ -172,11 +176,11 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(Ma=
chineState *ms)
>           ms->possible_cpus->cpus[i].vcpus_count =3D 1;
>           ms->possible_cpus->cpus[i].arch_id =3D x86_cpu_apic_id_from_i=
ndex(pcms, i);
>           x86_topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
> -                                 pcms->smp_dies, ms->smp.cores,
> +                                 x86ms->smp_dies, ms->smp.cores,
>                                    ms->smp.threads, &topo);
>           ms->possible_cpus->cpus[i].props.has_socket_id =3D true;
>           ms->possible_cpus->cpus[i].props.socket_id =3D topo.pkg_id;
> -        if (pcms->smp_dies > 1) {
> +        if (x86ms->smp_dies > 1) {
>               ms->possible_cpus->cpus[i].props.has_die_id =3D true;
>               ms->possible_cpus->cpus[i].props.die_id =3D topo.die_id;
>           }
> @@ -188,6 +192,22 @@ const CPUArchIdList *x86_possible_cpu_arch_ids(Mac=
hineState *ms)
>       return ms->possible_cpus;
>   }
>  =20
> +static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
> +{
> +    /* cpu index isn't used */
> +    CPUState *cs;
> +
> +    CPU_FOREACH(cs) {
> +        X86CPU *cpu =3D X86_CPU(cs);
> +
> +        if (!cpu->apic_state) {
> +            cpu_interrupt(cs, CPU_INTERRUPT_NMI);
> +        } else {
> +            apic_deliver_nmi(cpu->apic_state);
> +        }
> +    }
> +}
> +
>   static long get_file_size(FILE *f)
>   {
>       long where, size;
> @@ -324,6 +344,7 @@ void x86_load_linux(PCMachineState *pcms,
>       char *vmode;
>       MachineState *machine =3D MACHINE(pcms);
>       PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>       struct setup_data *setup_data;
>       const char *kernel_filename =3D machine->kernel_filename;
>       const char *initrd_filename =3D machine->initrd_filename;
> @@ -392,11 +413,11 @@ void x86_load_linux(PCMachineState *pcms,
>                               initrd_filename, gerr->message);
>                       exit(1);
>                   }
> -                pcms->initrd_mapped_file =3D mapped_file;
> +                x86ms->initrd_mapped_file =3D mapped_file;
>  =20
>                   initrd_data =3D g_mapped_file_get_contents(mapped_fil=
e);
>                   initrd_size =3D g_mapped_file_get_length(mapped_file)=
;
> -                initrd_max =3D pcms->below_4g_mem_size - pcmc->acpi_da=
ta_size - 1;
> +                initrd_max =3D x86ms->below_4g_mem_size - pcmc->acpi_d=
ata_size - 1;
>                   if (initrd_size >=3D initrd_max) {
>                       fprintf(stderr, "qemu: initrd is too large, canno=
t support."
>                               "(max: %"PRIu32", need %"PRId64")\n",
> @@ -474,8 +495,8 @@ void x86_load_linux(PCMachineState *pcms,
>           initrd_max =3D 0x37ffffff;
>       }
>  =20
> -    if (initrd_max >=3D pcms->below_4g_mem_size - pcmc->acpi_data_size=
) {
> -        initrd_max =3D pcms->below_4g_mem_size - pcmc->acpi_data_size =
- 1;
> +    if (initrd_max >=3D x86ms->below_4g_mem_size - pcmc->acpi_data_siz=
e) {
> +        initrd_max =3D x86ms->below_4g_mem_size - pcmc->acpi_data_size=
 - 1;
>       }
>  =20
>       fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
> @@ -538,7 +559,7 @@ void x86_load_linux(PCMachineState *pcms,
>                       initrd_filename, gerr->message);
>               exit(1);
>           }
> -        pcms->initrd_mapped_file =3D mapped_file;
> +        x86ms->initrd_mapped_file =3D mapped_file;
>  =20
>           initrd_data =3D g_mapped_file_get_contents(mapped_file);
>           initrd_size =3D g_mapped_file_get_length(mapped_file);
> @@ -682,3 +703,91 @@ void x86_bios_rom_init(MemoryRegion *rom_memory, b=
ool isapc_ram_fw)
>                                   (uint32_t)(-bios_size),
>                                   bios);
>   }
> +
> +static void x86_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
> +                                             const char *name, void *o=
paque,
> +                                             Error **errp)
> +{
> +    X86MachineState *x86ms =3D X86_MACHINE(obj);
> +    uint64_t value =3D x86ms->max_ram_below_4g;
> +
> +    visit_type_size(v, name, &value, errp);
> +}
> +
> +static void x86_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
> +                                             const char *name, void *o=
paque,
> +                                             Error **errp)
> +{
> +    X86MachineState *x86ms =3D X86_MACHINE(obj);
> +    Error *error =3D NULL;
> +    uint64_t value;
> +
> +    visit_type_size(v, name, &value, &error);
> +    if (error) {
> +        error_propagate(errp, error);
> +        return;
> +    }
> +    if (value > 4 * GiB) {
> +        error_setg(&error,
> +                   "Machine option 'max-ram-below-4g=3D%"PRIu64
> +                   "' expects size less than or equal to 4G", value);
> +        error_propagate(errp, error);
> +        return;
> +    }
> +
> +    if (value < 1 * MiB) {
> +        warn_report("Only %" PRIu64 " bytes of RAM below the 4GiB boun=
dary,"
> +                    "BIOS may not work with less than 1MiB", value);
> +    }
> +
> +    x86ms->max_ram_below_4g =3D value;
> +}
> +
> +static void x86_machine_initfn(Object *obj)
> +{
> +    X86MachineState *x86ms =3D X86_MACHINE(obj);
> +
> +    x86ms->max_ram_below_4g =3D 0; /* use default */
> +    x86ms->smp_dies =3D 1;
> +}
> +
> +static void x86_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc =3D MACHINE_CLASS(oc);
> +    X86MachineClass *x86mc =3D X86_MACHINE_CLASS(oc);
> +    NMIClass *nc =3D NMI_CLASS(oc);
> +
> +    mc->cpu_index_to_instance_props =3D x86_cpu_index_to_props;
> +    mc->get_default_cpu_node_id =3D x86_get_default_cpu_node_id;
> +    mc->possible_cpu_arch_ids =3D x86_possible_cpu_arch_ids;
> +    x86mc->compat_apic_id_mode =3D false;
> +    nc->nmi_monitor_handler =3D x86_nmi;
> +
> +    object_class_property_add(oc, X86_MACHINE_MAX_RAM_BELOW_4G, "size"=
,
> +        x86_machine_get_max_ram_below_4g, x86_machine_set_max_ram_belo=
w_4g,
> +        NULL, NULL, &error_abort);
> +
> +    object_class_property_set_description(oc, X86_MACHINE_MAX_RAM_BELO=
W_4G,
> +        "Maximum ram below the 4G boundary (32bit boundary)", &error_a=
bort);
> +}
> +
> +static const TypeInfo x86_machine_info =3D {
> +    .name =3D TYPE_X86_MACHINE,
> +    .parent =3D TYPE_MACHINE,
> +    .abstract =3D true,
> +    .instance_size =3D sizeof(X86MachineState),
> +    .instance_init =3D x86_machine_initfn,
> +    .class_size =3D sizeof(X86MachineClass),
> +    .class_init =3D x86_machine_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +         { TYPE_NMI },
> +         { }
> +    },
> +};
> +
> +static void x86_machine_register_types(void)
> +{
> +    type_register_static(&x86_machine_info);
> +}
> +
> +type_init(x86_machine_register_types)
> diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
> index 6b5e5bb7f5..f14d7bba4b 100644
> --- a/hw/i386/xen/xen-hvm.c
> +++ b/hw/i386/xen/xen-hvm.c
> @@ -197,10 +197,11 @@ qemu_irq *xen_interrupt_controller_init(void)
>   static void xen_ram_init(PCMachineState *pcms,
>                            ram_addr_t ram_size, MemoryRegion **ram_memo=
ry_p)
>   {
> +    X86MachineState *x86ms =3D X86_MACHINE(pcms);
>       MemoryRegion *sysmem =3D get_system_memory();
>       ram_addr_t block_len;
>       uint64_t user_lowmem =3D object_property_get_uint(qdev_get_machin=
e(),
> -                                                    PC_MACHINE_MAX_RAM=
_BELOW_4G,
> +                                                    X86_MACHINE_MAX_RA=
M_BELOW_4G,
>                                                       &error_abort);
>  =20
>       /* Handle the machine opt max-ram-below-4g.  It is basically doin=
g
> @@ -214,20 +215,20 @@ static void xen_ram_init(PCMachineState *pcms,
>       }
>  =20
>       if (ram_size >=3D user_lowmem) {
> -        pcms->above_4g_mem_size =3D ram_size - user_lowmem;
> -        pcms->below_4g_mem_size =3D user_lowmem;
> +        x86ms->above_4g_mem_size =3D ram_size - user_lowmem;
> +        x86ms->below_4g_mem_size =3D user_lowmem;
>       } else {
> -        pcms->above_4g_mem_size =3D 0;
> -        pcms->below_4g_mem_size =3D ram_size;
> +        x86ms->above_4g_mem_size =3D 0;
> +        x86ms->below_4g_mem_size =3D ram_size;
>       }
> -    if (!pcms->above_4g_mem_size) {
> +    if (!x86ms->above_4g_mem_size) {
>           block_len =3D ram_size;
>       } else {
>           /*
>            * Xen does not allocate the memory continuously, it keeps a
>            * hole of the size computed above or passed in.
>            */
> -        block_len =3D (1ULL << 32) + pcms->above_4g_mem_size;
> +        block_len =3D (1ULL << 32) + x86ms->above_4g_mem_size;
>       }
>       memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
>                              &error_fatal);
> @@ -244,12 +245,12 @@ static void xen_ram_init(PCMachineState *pcms,
>        */
>       memory_region_init_alias(&ram_lo, NULL, "xen.ram.lo",
>                                &ram_memory, 0xc0000,
> -                             pcms->below_4g_mem_size - 0xc0000);
> +                             x86ms->below_4g_mem_size - 0xc0000);
>       memory_region_add_subregion(sysmem, 0xc0000, &ram_lo);
> -    if (pcms->above_4g_mem_size > 0) {
> +    if (x86ms->above_4g_mem_size > 0) {
>           memory_region_init_alias(&ram_hi, NULL, "xen.ram.hi",
>                                    &ram_memory, 0x100000000ULL,
> -                                 pcms->above_4g_mem_size);
> +                                 x86ms->above_4g_mem_size);
>           memory_region_add_subregion(sysmem, 0x100000000ULL, &ram_hi);
>       }
>   }
> @@ -265,7 +266,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t =
size, MemoryRegion *mr,
>           /* RAM already populated in Xen */
>           fprintf(stderr, "%s: do not alloc "RAM_ADDR_FMT
>                   " bytes of ram at "RAM_ADDR_FMT" when runstate is INM=
IGRATE\n",
> -                __func__, size, ram_addr);
> +                __func__, size, ram_addr);
>           return;
>       }
>  =20
> diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
> index 1ede055387..ead14e1888 100644
> --- a/hw/intc/ioapic.c
> +++ b/hw/intc/ioapic.c
> @@ -89,7 +89,7 @@ static void ioapic_entry_parse(uint64_t entry, struct=
 ioapic_entry_info *info)
>  =20
>   static void ioapic_service(IOAPICCommonState *s)
>   {
> -    AddressSpace *ioapic_as =3D PC_MACHINE(qdev_get_machine())->ioapic=
_as;
> +    AddressSpace *ioapic_as =3D X86_MACHINE(qdev_get_machine())->ioapi=
c_as;
>       struct ioapic_entry_info info;
>       uint8_t i;
>       uint32_t mask;
>=20

