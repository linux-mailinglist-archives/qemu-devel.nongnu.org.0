Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70EC3B16B5
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 11:20:25 +0200 (CEST)
Received: from localhost ([::1]:49154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvz3Y-00018S-Q3
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 05:20:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvz2M-0000Rt-Mm
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:19:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lvz2K-0005QE-0r
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 05:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624439947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r7o4+BjiZBGSFvSf6cb5jvvxmcHXkJREtIf0OamttDU=;
 b=DFi0l1kbdB2aepsSsGcuSSMOxqBR8ioMp3gvDXPJ2D7DqBlzmogJBchz/zQMu7/X+LdEPT
 87Ep6lB7moJyy814nXBp/eLkCKndduFhc7uj4z3S/s8+1FMUx6WMUbNzuAJ/pchSBKVehk
 kQ4ZxgUSKqID3ojHWeX0GQ5q3bszkHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-t6x3oo7qNBSUFGiPTrVL9A-1; Wed, 23 Jun 2021 05:19:06 -0400
X-MC-Unique: t6x3oo7qNBSUFGiPTrVL9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6E6910C1ADC;
 Wed, 23 Jun 2021 09:19:04 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B82F60C13;
 Wed, 23 Jun 2021 09:18:59 +0000 (UTC)
Date: Wed, 23 Jun 2021 11:18:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Joao Martins <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 6/6] i386/pc: Add a machine property for AMD-only
 enforcing of valid IOVAs
Message-ID: <20210623111858.6aaa3763@redhat.com>
In-Reply-To: <20210622154905.30858-7-joao.m.martins@oracle.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622154905.30858-7-joao.m.martins@oracle.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Jun 2021 16:49:05 +0100
Joao Martins <joao.m.martins@oracle.com> wrote:

> The added enforcing is only relevant in the case of AMD where the range
> right before the 1TB is restricted and cannot be DMA mapped by the
> kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST or possibly
> other kinds of IOMMU events in the AMD IOMMU.
> 
> Although, there's a case where it may make sense to disable the IOVA
> relocation/validation when migrating from a non-valid-IOVA-aware qemu to
> one that supports it.

we can keep old machines broken, that's what you are doing in
 *_machine_options() but for new machine it can be unconditionally
enforced.
So I miss the point of having user visible knob to disable that.
(it's not like one would be able to find a new machine type that
do not support new memory layout)
I'd drop user visible property and keep only hunks need for
*_machine_options().
 
> Relocating RAM regions to after the 1Tb hole has consequences for guest
> ABI because we are changing the memory mapping, and thus it may make
> sense to allow admin to disable the validation (e.g. upon migration) to
> either 1) Fail early when the VFIO DMA_MAP ioctl fails thus preventing
> the migration to happen 'gracefully' or 2) allow booting a guest
> unchanged from source host without risking changing the PCI mmio hole64
> or other things we consider in the valid IOVA range changing underneath
> the guest.
> 
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  hw/i386/pc.c         | 29 +++++++++++++++++++++++++++--
>  hw/i386/pc_piix.c    |  2 ++
>  hw/i386/pc_q35.c     |  2 ++
>  include/hw/i386/pc.h |  2 ++
>  4 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 65885cc16037..eb08a6d1a2b9 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -902,10 +902,14 @@ struct GPARange usable_iova_ranges[] = {
>  
>   uint32_t nb_iova_ranges = DEFAULT_NR_USABLE_IOVAS;
>  
> -static void init_usable_iova_ranges(void)
> +static void init_usable_iova_ranges(PCMachineClass *pcmc)
>  {
>      uint32_t eax, vendor[3];
>  
> +    if (!pcmc->enforce_valid_iova) {
> +        return;
> +    }
> +
>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>      if (IS_AMD_VENDOR(vendor)) {
>          usable_iova_ranges[0].end = AMD_MAX_PHYSADDR_BELOW_1TB;
> @@ -1000,7 +1004,7 @@ void pc_memory_init(PCMachineState *pcms,
>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>                                  x86ms->above_4g_mem_size);
>  
> -    init_usable_iova_ranges();
> +    init_usable_iova_ranges(pcmc);
>  
>      linux_boot = (machine->kernel_filename != NULL);
>  
> @@ -1685,6 +1689,23 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
>      pcms->hpet_enabled = value;
>  }
>  
> +static bool pc_machine_get_enforce_valid_iova(Object *obj, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +
> +    return pcmc->enforce_valid_iova;
> +}
> +
> +static void pc_machine_set_enforce_valid_iova(Object *obj, bool value,
> +                                                  Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
> +
> +    pcmc->enforce_valid_iova = value;
> +}
> +
>  static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
> @@ -1851,6 +1872,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>      pcmc->has_reserved_memory = true;
>      pcmc->kvmclock_enabled = true;
>      pcmc->enforce_aligned_dimm = true;
> +    pcmc->enforce_valid_iova = true;
>      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
>       * to be used at the moment, 32K should be enough for a while.  */
>      pcmc->acpi_data_size = 0x20000 + 0x8000;
> @@ -1913,6 +1935,9 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>          NULL, NULL);
>      object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
>          "Maximum combined firmware size");
> +
> +    object_class_property_add_bool(oc, PC_MACHINE_ENFORCE_VALID_IOVA,
> +        pc_machine_get_enforce_valid_iova, pc_machine_set_enforce_valid_iova);
>  }
>  
>  static const TypeInfo pc_machine_info = {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 30b8bd6ea92d..21a08e2f6a4c 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -427,11 +427,13 @@ DEFINE_I440FX_MACHINE(v6_1, "pc-i440fx-6.1", NULL,
>  
>  static void pc_i440fx_6_0_machine_options(MachineClass *m)
>  {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_6_1_machine_options(m);
>      m->alias = NULL;
>      m->is_default = false;
>      compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
>      compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
> +    pcmc->enforce_valid_iova = false;
>  }
>  
>  DEFINE_I440FX_MACHINE(v6_0, "pc-i440fx-6.0", NULL,
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 46a0f196f413..80bb89a9bae1 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -357,10 +357,12 @@ DEFINE_Q35_MACHINE(v6_1, "pc-q35-6.1", NULL,
>  
>  static void pc_q35_6_0_machine_options(MachineClass *m)
>  {
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_6_1_machine_options(m);
>      m->alias = NULL;
>      compat_props_add(m->compat_props, hw_compat_6_0, hw_compat_6_0_len);
>      compat_props_add(m->compat_props, pc_compat_6_0, pc_compat_6_0_len);
> +    pcmc->enforce_valid_iova = false;
>  }
>  
>  DEFINE_Q35_MACHINE(v6_0, "pc-q35-6.0", NULL,
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index b924aef3a218..7337f6f2d014 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -63,6 +63,7 @@ typedef struct PCMachineState {
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
>  #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
> +#define PC_MACHINE_ENFORCE_VALID_IOVA  "enforce-valid-iova"
>  /**
>   * PCMachineClass:
>   *
> @@ -113,6 +114,7 @@ struct PCMachineClass {
>      bool has_reserved_memory;
>      bool enforce_aligned_dimm;
>      bool broken_reserved_end;
> +    bool enforce_valid_iova;
>  
>      /* generate legacy CPU hotplug AML */
>      bool legacy_cpu_hotplug;


