Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7072DB3D1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:36:31 +0100 (CET)
Received: from localhost ([::1]:53634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpFBW-0004WY-Od
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:36:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kpEwo-0005ag-P5; Tue, 15 Dec 2020 13:21:18 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:33676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1kpEwf-0004lI-13; Tue, 15 Dec 2020 13:21:17 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFHxujQ043217;
 Tue, 15 Dec 2020 18:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 in-reply-to : references : sender : from : date : message-id :
 mime-version : content-type; s=corp-2020-01-29;
 bh=YBAa7dGX6yNBygZl0zWZApHtogBU71XZW6+1WXq6WHE=;
 b=vRoOgkVIcSzgiuYzFJjR91T17zVogOl2mk3uGkX8NC1AaR9UefgJmw2M3JIiU1c3zb/w
 5cIPJep41nm/V3TpS2P+INIrZxrVawnBRoucvu0GkuHzydiIQRXyPV9xHfLO5a7scqEa
 +hC8Q8fgY1mWOIQaESkSqUOoNIi79woITzAOEbT7Vbx/Xfr7V1Uuz5zVcJAhvBEcvKq0
 ToMewCHi+3K9nK2tDj3YJrKXpBbTG5kTS2vWPJxWRlCIhT7tynT/PX0kQaa9mW1YbGCh
 5/nxOnpTR878K2RQGgua+4P7Y+olgyqDNNr/gFvN70g5em7xAqYk7V4V81ffjYZ4Q64U IA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2130.oracle.com with ESMTP id 35ckcbc9vk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 15 Dec 2020 18:20:57 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BFI1Bkj054021;
 Tue, 15 Dec 2020 18:20:56 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 35d7endes3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Dec 2020 18:20:56 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BFIKs8K013315;
 Tue, 15 Dec 2020 18:20:55 GMT
Received: from disaster-area.hh.sledj.net (/81.187.26.238)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 15 Dec 2020 10:20:52 -0800
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 637f617c;
 Tue, 15 Dec 2020 18:20:49 +0000 (UTC)
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/virt: Remove virt machine state 'smp_cpus'
In-Reply-To: <20201215174815.51520-1-drjones@redhat.com>
References: <20201215174815.51520-1-drjones@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <david.edmondson@oracle.com>
Date: Tue, 15 Dec 2020 18:20:48 +0000
Message-ID: <cun8s9zorr3.fsf@zarquon.hh.sledj.net>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012150120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9836
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012150120
Received-SPF: pass client-ip=141.146.126.79;
 envelope-from=david.edmondson@oracle.com; helo=aserp2130.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: fangying1@huawei.com, peter.maydell@linaro.org, salil.mehta@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2020-12-15 at 18:48:15 +01, Andrew Jones wrote:

> virt machine's 'smp_cpus' and machine->smp.cpus must always have the
> same value. And, anywhere we have virt machine state we have machine
> state. So let's remove the redundancy. Also, to make it easier to see
> that machine->smp is the true source for "smp_cpus" and "max_cpus",
> avoid passing them in function parameters, preferring instead to get
> them from the state.
>
> No functional change intended.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>

Minor question below...

Reviewed-by: David Edmondson <david.edmondson@oracle.com>

> ---
>  hw/arm/virt-acpi-build.c |  9 +++++----
>  hw/arm/virt.c            | 24 +++++++++++-------------
>  include/hw/arm/virt.h    |  3 +--
>  3 files changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 711cf2069fe8..9d9ee2405345 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -59,11 +59,12 @@
>  
>  #define ACPI_BUILD_TABLE_SIZE             0x20000
>  
> -static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> +static void acpi_dsdt_add_cpus(Aml *scope, VirtMachineState *vms)
>  {
> +    MachineState *ms = MACHINE(vms);
>      uint16_t i;
>  
> -    for (i = 0; i < smp_cpus; i++) {
> +    for (i = 0; i < ms->smp.cpus; i++) {
>          Aml *dev = aml_device("C%.03X", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> @@ -484,7 +485,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>      gicd->version = vms->gic_version;
>  
> -    for (i = 0; i < vms->smp_cpus; i++) {
> +    for (i = 0; i < MACHINE(vms)->smp.cpus; i++) {
>          AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>                                                             sizeof(*gicc));
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> @@ -603,7 +604,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       * the RTC ACPI device at all when using UEFI.
>       */
>      scope = aml_scope("\\_SB");
> -    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> +    acpi_dsdt_add_cpus(scope, vms);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      if (vmc->acpi_expose_flash) {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 556592012ee0..534d306f3104 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -323,7 +323,7 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
>      if (vms->gic_version == VIRT_GIC_VERSION_2) {
>          irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
> -                             (1 << vms->smp_cpus) - 1);
> +                             (1 << MACHINE(vms)->smp.cpus) - 1);
>      }
>  
>      qemu_fdt_add_subnode(vms->fdt, "/timer");
> @@ -347,9 +347,9 @@ static void fdt_add_timer_nodes(const VirtMachineState *vms)
>  
>  static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>  {
> -    int cpu;
> -    int addr_cells = 1;
>      const MachineState *ms = MACHINE(vms);
> +    int smp_cpus = ms->smp.cpus, cpu;

Is it house-style to have initialised and un-initialised local variables
declared on the same line?

> +    int addr_cells = 1;
>  
>      /*
>       * From Documentation/devicetree/bindings/arm/cpus.txt
> @@ -364,7 +364,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>       *  The simplest way to go is to examine affinity IDs of all our CPUs. If
>       *  at least one of them has Aff3 populated, we set #address-cells to 2.
>       */
> -    for (cpu = 0; cpu < vms->smp_cpus; cpu++) {
> +    for (cpu = 0; cpu < smp_cpus; cpu++) {
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
>  
>          if (armcpu->mp_affinity & ARM_AFF3_MASK) {
> @@ -377,7 +377,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>      qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#address-cells", addr_cells);
>      qemu_fdt_setprop_cell(vms->fdt, "/cpus", "#size-cells", 0x0);
>  
> -    for (cpu = vms->smp_cpus - 1; cpu >= 0; cpu--) {
> +    for (cpu = smp_cpus - 1; cpu >= 0; cpu--) {
>          char *nodename = g_strdup_printf("/cpus/cpu@%d", cpu);
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(cpu));
>          CPUState *cs = CPU(armcpu);
> @@ -387,8 +387,7 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>          qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
>                                      armcpu->dtb_compatible);
>  
> -        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
> -            && vms->smp_cpus > 1) {
> +        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED && smp_cpus > 1) {
>              qemu_fdt_setprop_string(vms->fdt, nodename,
>                                          "enable-method", "psci");
>          }
> @@ -534,7 +533,7 @@ static void fdt_add_pmu_nodes(const VirtMachineState *vms)
>      if (vms->gic_version == VIRT_GIC_VERSION_2) {
>          irqflags = deposit32(irqflags, GIC_FDT_IRQ_PPI_CPU_START,
>                               GIC_FDT_IRQ_PPI_CPU_WIDTH,
> -                             (1 << vms->smp_cpus) - 1);
> +                             (1 << MACHINE(vms)->smp.cpus) - 1);
>      }
>  
>      qemu_fdt_add_subnode(vms->fdt, "/pmu");
> @@ -1673,9 +1672,9 @@ static void finalize_gic_version(VirtMachineState *vms)
>   * virt_cpu_post_init() must be called after the CPUs have
>   * been realized and the GIC has been created.
>   */
> -static void virt_cpu_post_init(VirtMachineState *vms, int max_cpus,
> -                               MemoryRegion *sysmem)
> +static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysmem)
>  {
> +    int max_cpus = MACHINE(vms)->smp.max_cpus;
>      bool aarch64, pmu, steal_time;
>      CPUState *cpu;
>  
> @@ -1828,8 +1827,6 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>  
> -    vms->smp_cpus = smp_cpus;
> -
>      if (vms->virt && kvm_enabled()) {
>          error_report("mach-virt: KVM does not support providing "
>                       "Virtualization extensions to the guest CPU");
> @@ -1845,6 +1842,7 @@ static void machvirt_init(MachineState *machine)
>      create_fdt(vms);
>  
>      possible_cpus = mc->possible_cpu_arch_ids(machine);
> +    assert(possible_cpus->len == max_cpus);
>      for (n = 0; n < possible_cpus->len; n++) {
>          Object *cpuobj;
>          CPUState *cs;
> @@ -1965,7 +1963,7 @@ static void machvirt_init(MachineState *machine)
>  
>      create_gic(vms);
>  
> -    virt_cpu_post_init(vms, possible_cpus->len, sysmem);
> +    virt_cpu_post_init(vms, sysmem);
>  
>      fdt_add_pmu_nodes(vms);
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index abf54fab4981..e4a2d216420f 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -151,7 +151,6 @@ struct VirtMachineState {
>      MemMapEntry *memmap;
>      char *pciehb_nodename;
>      const int *irqmap;
> -    int smp_cpus;
>      void *fdt;
>      int fdt_size;
>      uint32_t clock_phandle;
> @@ -182,7 +181,7 @@ static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
>  
>      assert(vms->gic_version == VIRT_GIC_VERSION_3);
>  
> -    return vms->smp_cpus > redist0_capacity ? 2 : 1;
> +    return MACHINE(vms)->smp.cpus > redist0_capacity ? 2 : 1;
>  }
>  
>  #endif /* QEMU_ARM_VIRT_H */
> -- 
> 2.26.2

dme.
-- 
Why does it have to be like this? I can never tell.

