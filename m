Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 465D72F4FD8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 17:24:20 +0100 (CET)
Received: from localhost ([::1]:41516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziwV-0007m5-9i
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 11:24:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzivK-0007FL-N1
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:23:06 -0500
Received: from 3.mo51.mail-out.ovh.net ([188.165.32.156]:39766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kzivG-0006rB-Hw
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 11:23:06 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.41])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 56A63253400;
 Wed, 13 Jan 2021 17:22:58 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 13 Jan
 2021 17:22:57 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0027c148829-e373-4088-a1b9-a3f67c97c667,
 87373C232FD81A0C2A6A5091B5FAE526A42BEBB1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Wed, 13 Jan 2021 17:22:56 +0100
From: Greg Kurz <groug@kaod.org>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [RFC PATCH v0 1/1] target/ppc: Support for H_RPT_INVALIDATE hcall
Message-ID: <20210113172256.0d32dc5d@bahia.lan>
In-Reply-To: <20210106085910.2200795-1-bharata@linux.ibm.com>
References: <20210106085910.2200795-1-bharata@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 722bf741-9a2f-43e3-9ea1-127a6e83a9c8
X-Ovh-Tracer-Id: 2189312368975649187
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedukedrtdefgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeegffehgeejgedvjeeuveelieffkeehgefhieejteevudekheduteelhfetfefgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=188.165.32.156; envelope-from=groug@kaod.org;
 helo=3.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Bharata,

On Wed,  6 Jan 2021 14:29:10 +0530
Bharata B Rao <bharata@linux.ibm.com> wrote:

> If KVM_CAP_RPT_INVALIDATE KVM capability is enabled, then
> 
> - indicate the availability of H_RPT_INVALIDATE hcall to the guest via
>   ibm,hypertas-functions property.
> - Enable the hcall
> 
> Both the above are done only if the new sPAPR machine capability
> cap-rpt-invalidate is set.
> 
> Note: The KVM implementation of the hcall has been posted for upstream
> review here:
> https://lore.kernel.org/linuxppc-dev/20210105090557.2150104-1-bharata@linux.ibm.com/T/#t
> 
> Update to linux-headers/linux/kvm.h here is temporary, will be
> done via header updates once the kernel change is accepted upstream.
> 
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> ---

Patch looks mostly fine. A few remarks below.

>  hw/ppc/spapr.c            |  7 ++++++
>  hw/ppc/spapr_caps.c       | 49 +++++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h    |  8 +++++--
>  linux-headers/linux/kvm.h |  1 +
>  target/ppc/kvm.c          | 12 ++++++++++
>  target/ppc/kvm_ppc.h      | 11 +++++++++
>  6 files changed, 86 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 489cefcb81..0228083800 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -890,6 +890,11 @@ static void spapr_dt_rtas(SpaprMachineState *spapr, void *fdt)
>      add_str(hypertas, "hcall-copy");
>      add_str(hypertas, "hcall-debug");
>      add_str(hypertas, "hcall-vphn");
> +    if (kvm_enabled() &&

You shouldn't check KVM here. The capability is enough to decide if we
should expose "hcall-rpt-invalidate" or not. FWIW we won't even reach
this code when running with anything but KVM.

> +        (spapr_get_cap(spapr, SPAPR_CAP_RPT_INVALIDATE) == SPAPR_CAP_ON)) {
> +        add_str(hypertas, "hcall-rpt-invalidate");
> +    }
> +
>      add_str(qemu_hypertas, "hcall-memop1");
>  
>      if (!kvm_enabled() || kvmppc_spapr_use_multitce()) {
> @@ -2021,6 +2026,7 @@ static const VMStateDescription vmstate_spapr = {
>          &vmstate_spapr_cap_ccf_assist,
>          &vmstate_spapr_cap_fwnmi,
>          &vmstate_spapr_fwnmi,
> +        &vmstate_spapr_cap_rpt_invalidate,
>          NULL
>      }
>  };
> @@ -4478,6 +4484,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_ON;
>      smc->default_caps.caps[SPAPR_CAP_FWNMI] = SPAPR_CAP_ON;
> +    smc->default_caps.caps[SPAPR_CAP_RPT_INVALIDATE] = SPAPR_CAP_OFF;

Any reason for not enabling this for the default machine type and
disabling it for existing machine types only ?

>      spapr_caps_add_properties(smc);
>      smc->irq = &spapr_irq_dual;
>      smc->dr_phb_enabled = true;
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 9341e9782a..ebf81e3b23 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -524,6 +524,45 @@ static void cap_fwnmi_apply(SpaprMachineState *spapr, uint8_t val,
>      }
>  }
>  
> +static void cap_rpt_invalidate_apply(SpaprMachineState *spapr,
> +                                     uint8_t val, Error **errp)
> +{
> +    ERRP_GUARD();
> +    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
> +
> +    if (!val) {
> +        /* capability disabled by default */
> +        return;
> +    }
> +
> +    if (tcg_enabled()) {
> +        error_setg(errp, "No H_RPT_INVALIDATE support in TCG");
> +        error_append_hint(errp, "Try appending -machine cap-rpt-invalidate=off\n");
> +    } else if (kvm_enabled()) {
> +        if (!ppc_check_compat(cpu, CPU_POWERPC_LOGICAL_3_00, 0,
> +                              spapr->max_compat_pvr)) {
> +            error_setg(errp, "H_RPT_INVALIDATE only supported on POWER9");
> +            error_append_hint(errp,
> +                              "Try appending -machine max-cpu-compat=power9\n");
> +            return;
> +        }
> +
> +        if (!kvmppc_has_cap_mmu_radix()) {
> +            error_setg(errp, "H_RPT_INVALIDATE only supported on Radix");
> +            return;
> +        }
> +
> +        if (!kvmppc_has_cap_rpt_invalidate()) {
> +            error_setg(errp,
> +                       "KVM implementation does not support H_RPT_INVALIDATE");
> +            error_append_hint(errp,
> +                              "Try appending -machine cap-rpt-invalidate=off\n");
> +        } else {
> +            kvmppc_enable_h_rpt_invalidate();
> +        }
> +    }
> +}
> +
>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>      [SPAPR_CAP_HTM] = {
>          .name = "htm",
> @@ -632,6 +671,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>          .type = "bool",
>          .apply = cap_fwnmi_apply,
>      },
> +    [SPAPR_CAP_RPT_INVALIDATE] = {
> +        .name = "rpt-invalidate",
> +        .description = "Allow H_RPT_INVALIDATE",
> +        .index = SPAPR_CAP_RPT_INVALIDATE,
> +        .get = spapr_cap_get_bool,
> +        .set = spapr_cap_set_bool,
> +        .type = "bool",
> +        .apply = cap_rpt_invalidate_apply,
> +    },
>  };
>  
>  static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
> @@ -772,6 +820,7 @@ SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_KVM_HV);
>  SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
>  SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
>  SPAPR_CAP_MIG_STATE(fwnmi, SPAPR_CAP_FWNMI);
> +SPAPR_CAP_MIG_STATE(rpt_invalidate, SPAPR_CAP_RPT_INVALIDATE);
>  
>  void spapr_caps_init(SpaprMachineState *spapr)
>  {
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index e0f10f252c..0931b5b8e8 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -74,8 +74,10 @@ typedef enum {
>  #define SPAPR_CAP_CCF_ASSIST            0x09
>  /* Implements PAPR FWNMI option */
>  #define SPAPR_CAP_FWNMI                 0x0A
> +/* Support H_RPT_INVALIDATE */
> +#define SPAPR_CAP_RPT_INVALIDATE        0x0B
>  /* Num Caps */
> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_FWNMI + 1)
> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_RPT_INVALIDATE + 1)
>  
>  /*
>   * Capability Values
> @@ -535,8 +537,9 @@ struct SpaprMachineState {
>  #define H_SCM_BIND_MEM          0x3EC
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_UNBIND_ALL        0x3FC
> +#define H_RPT_INVALIDATE        0x448
>  
> -#define MAX_HCALL_OPCODE        H_SCM_UNBIND_ALL
> +#define MAX_HCALL_OPCODE        H_RPT_INVALIDATE
>  
>  /* The hcalls above are standardized in PAPR and implemented by pHyp
>   * as well.
> @@ -923,6 +926,7 @@ extern const VMStateDescription vmstate_spapr_cap_nested_kvm_hv;
>  extern const VMStateDescription vmstate_spapr_cap_large_decr;
>  extern const VMStateDescription vmstate_spapr_cap_ccf_assist;
>  extern const VMStateDescription vmstate_spapr_cap_fwnmi;
> +extern const VMStateDescription vmstate_spapr_cap_rpt_invalidate;
>  
>  static inline uint8_t spapr_get_cap(SpaprMachineState *spapr, int cap)
>  {
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index 56ce14ad20..2b762157e0 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1053,6 +1053,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_X86_USER_SPACE_MSR 188
>  #define KVM_CAP_X86_MSR_FILTER 189
>  #define KVM_CAP_ENFORCE_PV_FEATURE_CPUID 190
> +#define KVM_CAP_PPC_RPT_INVALIDATE 193
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index daf690a678..1c51951ae2 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -89,6 +89,7 @@ static int cap_ppc_count_cache_flush_assist;
>  static int cap_ppc_nested_kvm_hv;
>  static int cap_large_decr;
>  static int cap_fwnmi;
> +static int cap_rpt_invalidate;
>  
>  static uint32_t debug_inst_opcode;
>  
> @@ -152,6 +153,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>          exit(1);
>      }
>  
> +    cap_rpt_invalidate = kvm_vm_check_extension(s, KVM_CAP_PPC_RPT_INVALIDATE);
>      kvm_ppc_register_host_cpu_type();
>  
>      return 0;
> @@ -2027,6 +2029,11 @@ void kvmppc_enable_h_page_init(void)
>      kvmppc_enable_hcall(kvm_state, H_PAGE_INIT);
>  }
>  
> +void kvmppc_enable_h_rpt_invalidate(void)
> +{
> +    kvmppc_enable_hcall(kvm_state, H_RPT_INVALIDATE);
> +}
> +
>  void kvmppc_set_papr(PowerPCCPU *cpu)
>  {
>      CPUState *cs = CPU(cpu);
> @@ -2538,6 +2545,11 @@ int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>      return 0;
>  }
>  
> +int kvmppc_has_cap_rpt_invalidate(void)
> +{
> +    return cap_rpt_invalidate;
> +}
> +
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void)
>  {
>      uint32_t host_pvr = mfpvr();
> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
> index 73ce2bc951..8e27f8421f 100644
> --- a/target/ppc/kvm_ppc.h
> +++ b/target/ppc/kvm_ppc.h
> @@ -24,6 +24,7 @@ void kvmppc_enable_logical_ci_hcalls(void);
>  void kvmppc_enable_set_mode_hcall(void);
>  void kvmppc_enable_clear_ref_mod_hcalls(void);
>  void kvmppc_enable_h_page_init(void);
> +void kvmppc_enable_h_rpt_invalidate(void);
>  void kvmppc_set_papr(PowerPCCPU *cpu);
>  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
>  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
> @@ -72,6 +73,7 @@ bool kvmppc_has_cap_nested_kvm_hv(void);
>  int kvmppc_set_cap_nested_kvm_hv(int enable);
>  int kvmppc_get_cap_large_decr(void);
>  int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable);
> +int kvmppc_has_cap_rpt_invalidate(void);
>  int kvmppc_enable_hwrng(void);
>  int kvmppc_put_books_sregs(PowerPCCPU *cpu);
>  PowerPCCPUClass *kvm_ppc_get_host_cpu_class(void);
> @@ -151,6 +153,10 @@ static inline void kvmppc_enable_h_page_init(void)
>  {
>  }
>  
> +static inline void kvmppc_enable_h_rpt_invalidate(void)
> +{

g_assert_not_reached() ?

> +}
> +
>  static inline void kvmppc_set_papr(PowerPCCPU *cpu)
>  {
>  }
> @@ -387,6 +393,11 @@ static inline int kvmppc_enable_cap_large_decr(PowerPCCPU *cpu, int enable)
>      return -1;
>  }
>  
> +static inline int kvmppc_has_cap_rpt_invalidate(void)
> +{
> +    return false;
> +}
> +
>  static inline int kvmppc_enable_hwrng(void)
>  {
>      return -1;


