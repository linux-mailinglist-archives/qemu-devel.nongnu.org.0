Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EF3A63DC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 10:30:39 +0200 (CEST)
Received: from localhost ([::1]:42800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i54D0-0001A8-2O
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 04:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50717)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1i54BY-00009G-RJ
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 04:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1i54BX-0003KU-8M
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 04:29:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59474
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
 id 1i54BT-0003Gx-Ot; Tue, 03 Sep 2019 04:29:03 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x838Si7c057665; Tue, 3 Sep 2019 04:28:52 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uskbgax2s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 04:28:50 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x838Of0F022871;
 Tue, 3 Sep 2019 08:28:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 2uqgh6wh17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 08:28:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x838S2oN27394410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 08:28:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE783124054;
 Tue,  3 Sep 2019 08:28:01 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B258124052;
 Tue,  3 Sep 2019 08:28:00 +0000 (GMT)
Received: from [9.85.70.152] (unknown [9.85.70.152])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 08:27:59 +0000 (GMT)
To: Greg Kurz <groug@kaod.org>
References: <156715632966.27761.8190459106519248668.stgit@aravinda>
 <156715642090.27761.17328167484986424722.stgit@aravinda>
 <20190830155856.6b4ede14@bahia.lan>
 <f4e53c2c-12ac-5422-a7dc-26cb28b087af@linux.vnet.ibm.com>
 <20190903095605.5d272049@bahia.lan>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Message-ID: <c9829dd5-afd6-5dda-c7bd-0d28756988ef@linux.vnet.ibm.com>
Date: Tue, 3 Sep 2019 13:57:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190903095605.5d272049@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030091
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH v12 2/6] ppc: spapr: Introduce FWNMI
 capability
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
Cc: aik@ozlabs.ru, qemu-devel@nongnu.org, paulus@ozlabs.org,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tuesday 03 September 2019 01:26 PM, Greg Kurz wrote:
> On Tue, 3 Sep 2019 12:52:39 +0530
> Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:
> 
>>
>>
>> On Friday 30 August 2019 07:28 PM, Greg Kurz wrote:
>>> On Fri, 30 Aug 2019 14:43:40 +0530
>>> Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:
>>>
>>>> Introduce the KVM capability KVM_CAP_PPC_FWNMI so that
>>>> the KVM causes guest exit with NMI as exit reason
>>>> when it encounters a machine check exception on the
>>>> address belonging to a guest. Without this capability
>>>> enabled, KVM redirects machine check exceptions to
>>>> guest's 0x200 vector.
>>>>
>>>> This patch also introduces fwnmi-mce capability to
>>>> deal with the case when a guest with the
>>>> KVM_CAP_PPC_FWNMI capability enabled is attempted
>>>> to migrate to a host that does not support this
>>>> capability.
>>>>
>>>> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
>>>> ---
>>>>  hw/ppc/spapr.c         |    1 +
>>>>  hw/ppc/spapr_caps.c    |   29 +++++++++++++++++++++++++++++
>>>>  include/hw/ppc/spapr.h |    4 +++-
>>>>  target/ppc/kvm.c       |   22 ++++++++++++++++++++++
>>>>  target/ppc/kvm_ppc.h   |   11 +++++++++++
>>>>  5 files changed, 66 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>>> index ea56499..8288e8b 100644
>>>> --- a/hw/ppc/spapr.c
>>>> +++ b/hw/ppc/spapr.c
>>>> @@ -4487,6 +4487,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>>>>      smc->default_caps.caps[SPAPR_CAP_NESTED_KVM_HV] = SPAPR_CAP_OFF;
>>>>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
>>>>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_OFF;
>>>> +    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_OFF;
>>>>      spapr_caps_add_properties(smc, &error_abort);
>>>>      smc->irq = &spapr_irq_dual;
>>>>      smc->dr_phb_enabled = true;
>>>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>>>> index 481dfd2..c11ff87 100644
>>>> --- a/hw/ppc/spapr_caps.c
>>>> +++ b/hw/ppc/spapr_caps.c
>>>> @@ -496,6 +496,25 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
>>>>      }
>>>>  }
>>>>  
>>>> +static void cap_fwnmi_mce_apply(SpaprMachineState *spapr, uint8_t val,
>>>> +                                Error **errp)
>>>> +{
>>>> +    if (!val) {
>>>> +        return; /* Disabled by default */
>>>> +    }
>>>> +
>>>> +    if (tcg_enabled()) {
>>>> +        /*
>>>> +         * TCG support may not be correct in some conditions (e.g., in case
>>>> +         * of software injected faults like duplicate SLBs).
>>>> +         */
>>>> +        warn_report("Firmware Assisted Non-Maskable Interrupts not supported in TCG");
>>>> +    } else if (kvm_enabled() && !kvmppc_has_cap_ppc_fwnmi()) {
>>>> +        error_setg(errp,
>>>> +"Firmware Assisted Non-Maskable Interrupts not supported by KVM, try cap-fwnmi-mce=off");
>>>> +    }
>>>> +}
>>>> +
>>>>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>>>>      [SPAPR_CAP_HTM] = {
>>>>          .name = "htm",
>>>> @@ -595,6 +614,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>>>>          .type = "bool",
>>>>          .apply = cap_ccf_assist_apply,
>>>>      },
>>>> +    [SPAPR_CAP_FWNMI_MCE] = {
>>>> +        .name = "fwnmi-mce",
>>>> +        .description = "Handle fwnmi machine check exceptions",
>>>> +        .index = SPAPR_CAP_FWNMI_MCE,
>>>> +        .get = spapr_cap_get_bool,
>>>> +        .set = spapr_cap_set_bool,
>>>> +        .type = "bool",
>>>> +        .apply = cap_fwnmi_mce_apply,
>>>> +    },
>>>>  };
>>>>  
>>>>  static SpaprCapabilities default_caps_with_cpu(SpaprMachineState *spapr,
>>>> @@ -734,6 +762,7 @@ SPAPR_CAP_MIG_STATE(hpt_maxpagesize, SPAPR_CAP_HPT_MAXPAGESIZE);
>>>>  SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_KVM_HV);
>>>>  SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
>>>>  SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
>>>> +SPAPR_CAP_MIG_STATE(fwnmi, SPAPR_CAP_FWNMI_MCE);
>>>>  
>>>>  void spapr_caps_init(SpaprMachineState *spapr)
>>>>  {
>>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>>> index 03111fd..66049ac 100644
>>>> --- a/include/hw/ppc/spapr.h
>>>> +++ b/include/hw/ppc/spapr.h
>>>> @@ -79,8 +79,10 @@ typedef enum {
>>>>  #define SPAPR_CAP_LARGE_DECREMENTER     0x08
>>>>  /* Count Cache Flush Assist HW Instruction */
>>>>  #define SPAPR_CAP_CCF_ASSIST            0x09
>>>> +/* FWNMI machine check handling */
>>>> +#define SPAPR_CAP_FWNMI_MCE             0x0A
>>>>  /* Num Caps */
>>>> -#define SPAPR_CAP_NUM                   (SPAPR_CAP_CCF_ASSIST + 1)
>>>> +#define SPAPR_CAP_NUM                   (SPAPR_CAP_FWNMI_MCE + 1)
>>>>  
>>>>  /*
>>>>   * Capability Values
>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>> index 8c5b1f2..c055fc1 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -85,6 +85,7 @@ static int cap_ppc_safe_indirect_branch;
>>>>  static int cap_ppc_count_cache_flush_assist;
>>>>  static int cap_ppc_nested_kvm_hv;
>>>>  static int cap_large_decr;
>>>> +static int cap_ppc_fwnmi;
>>>>  
>>>>  static uint32_t debug_inst_opcode;
>>>>  
>>>> @@ -2055,6 +2056,22 @@ void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy)
>>>>      }
>>>>  }
>>>>  
>>>> +int kvmppc_set_fwnmi(void)
>>>> +{
>>>> +    PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
>>>> +    CPUState *cs = CPU(cpu);
>>>> +    int ret;
>>>> +
>>>> +    ret = kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_FWNMI, 0);
>>>> +    if (ret) {
>>>> +        error_report("This KVM version does not support FWNMI");
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    cap_ppc_fwnmi = 1;
>>>
>>> Hmm... AFAICT the meaning of cap_ppc_fwnmi should just be "KVM knows about
>>> FWNMI", not "FWNMI was successfully enabled in KVM". Your v10 used to set
>>> cap_ppc_fwnmi in kvm_arch_init() just like the other guys... why this change ?
>>
>> Even I thought that cap_* is for that, but cap_papr uses it the other
>> way. So I decided to use a similar convention for cap_ppc_fwnmi.
>>
>> In v10, cap_ppc_fwnmi is set in kvm_arch_init() if FWNMI is available in
>> KVM and we try to enable FWNMI later in the boot phase when
>> rtas_ibm_nmi_register() is called. It's possible that
>> SPAPR_CAP_FWNMI_MCE is set and we may fail to enable FWNMI due to errors
>> in KVM or QEMU.
>>
>> To avoid this, in v12, FWNMI is enabled if SPAPR_CAP_FWNMI_MCE is set
>> irrespective of rtas_ibm_nmi_register() is called or not. This way we
>> fail early if we are not able to enable FWNMI.
>>
> 
> Ok. Then maybe you should add a comment in kvm_arch_init(), similar to the
> cap_papr one ?

Sure..

Regards,
Aravinda

> 
>> So, when SPAPR_CAP_FWNMI_MCE is set with FWNMI enabled in KVM, a machine
>> check error will always cause a guest exit. If the guest has registered
>> a handler by calling rtas_ibm_nmi_register(), then we will invoke the
>> guest registered handler else we will jump to 0x200 interrupt vector in
>> the guest.
>>
> 
> Yeah, this seems to be handled in patch 4... which I haven't read in detail
> yet.
> 
> +    if (spapr->guest_machine_check_addr == -1) {
> +        /*
> +         * This implies that we have hit a machine check between system
> +         * reset and "ibm,nmi-register". Fall back to the old machine
> +         * check behavior in such cases.
> +         */
> +        cs->exception_index = POWERPC_EXCP_MCHECK;
> +        ppc_cpu_do_interrupt(cs);
> +        return;
> +    }
> 
> Thanks for the clarification.
> 
>> With this change we don't need "KVM knows about FWNMI" information. So I
>> removed that part and used cap_ppc_fwnmi to track if FWNMI is enabled or
>> disabled in KVM. This also simplifies spapr_fwnmi_post_load() to avoid
>> enabling FWNMI multiple times (see patch 6).
>>
>>>
>>>> +    return ret;
>>>> +}
>>>> +
>>>>  int kvmppc_smt_threads(void)
>>>>  {
>>>>      return cap_ppc_smt ? cap_ppc_smt : 1;
>>>> @@ -2355,6 +2372,11 @@ bool kvmppc_has_cap_mmu_hash_v3(void)
>>>>      return cap_mmu_hash_v3;
>>>>  }
>>>>  
>>>> +bool kvmppc_has_cap_ppc_fwnmi(void)
>>>> +{
>>>> +    return cap_ppc_fwnmi;
>>>> +}
>>>> +
>>>>  static bool kvmppc_power8_host(void)
>>>>  {
>>>>      bool ret = false;
>>>> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
>>>> index 98bd7d5..2990898 100644
>>>> --- a/target/ppc/kvm_ppc.h
>>>> +++ b/target/ppc/kvm_ppc.h
>>>> @@ -27,6 +27,8 @@ void kvmppc_enable_h_page_init(void);
>>>>  void kvmppc_set_papr(PowerPCCPU *cpu);
>>>>  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
>>>>  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
>>>> +int kvmppc_set_fwnmi(void);
>>>> +bool kvmppc_has_cap_ppc_fwnmi(void);
>>>>  int kvmppc_smt_threads(void);
>>>>  void kvmppc_hint_smt_possible(Error **errp);
>>>>  int kvmppc_set_smt_threads(int smt);
>>>> @@ -159,6 +161,15 @@ static inline void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy)
>>>>  {
>>>>  }
>>>>  
>>>> +static inline int kvmppc_set_fwnmi(void)
>>>> +{
>>>
>>> Missing return -1;
>>
>> Hmm.. missed it.
>>
>> Regards,
>> Aravinda
>>
>>>
>>>> +}
>>>> +
>>>> +static inline bool kvmppc_has_cap_ppc_fwnmi(void)
>>>> +{
>>>> +    return false;
>>>> +}
>>>> +
>>>>  static inline int kvmppc_smt_threads(void)
>>>>  {
>>>>      return 1;
>>>>
>>>
>>
> 

-- 
Regards,
Aravinda

