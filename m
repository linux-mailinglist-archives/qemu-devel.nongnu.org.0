Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055236DCB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jun 2019 09:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56095 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYnCP-0002kS-De
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 03:52:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hYnBN-0002OD-1c
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 03:51:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hYnBL-00034V-3I
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 03:51:32 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
	id 1hYnBI-0002tl-Su
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 03:51:31 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x567gxLi139796
	for <qemu-devel@nongnu.org>; Thu, 6 Jun 2019 03:51:16 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sxw50vjy3-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 03:51:16 -0400
Received: from localhost
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <aravinda@linux.vnet.ibm.com>;
	Thu, 6 Jun 2019 08:51:15 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 6 Jun 2019 08:51:13 +0100
Received: from b03ledav003.gho.boulder.ibm.com
	(b03ledav003.gho.boulder.ibm.com [9.17.130.234])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x567pCX323396734
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 6 Jun 2019 07:51:12 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E4346A057;
	Thu,  6 Jun 2019 07:51:12 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3CA56A054;
	Thu,  6 Jun 2019 07:51:09 +0000 (GMT)
Received: from [9.85.82.46] (unknown [9.85.82.46])
	by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jun 2019 07:51:09 +0000 (GMT)
To: David Gibson <david@gibson.dropbear.id.au>
References: <155910829070.13149.5215948335633966328.stgit@aravinda>
	<155910844950.13149.6460514692958589700.stgit@aravinda>
	<20190603172544.277d0183@bahia.lab.toulouse-stg.fr.ibm.com>
	<0ddfc208-b23a-917c-a155-d2e9666eedde@linux.vnet.ibm.com>
	<20190606030207.GJ10319@umbus.fritz.box>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Date: Thu, 6 Jun 2019 13:21:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190606030207.GJ10319@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19060607-0020-0000-0000-00000EF4E60F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011223; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000286; SDB=6.01213954; UDB=6.00638087;
	IPR=6.00995034; 
	MB=3.00027204; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 07:51:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060607-0021-0000-0000-00006620190E
Message-Id: <38ff428a-c2c3-e2e2-65e7-e77706d1efcd@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906060056
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH v9 5/6] ppc: spapr: Enable FWNMI
 capability
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: aik@au1.ibm.com, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org,
	paulus@ozlabs.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thursday 06 June 2019 08:32 AM, David Gibson wrote:
> On Tue, Jun 04, 2019 at 12:15:26PM +0530, Aravinda Prasad wrote:
>>
>>
>> On Monday 03 June 2019 08:55 PM, Greg Kurz wrote:
>>> On Wed, 29 May 2019 11:10:49 +0530
>>> Aravinda Prasad <aravinda@linux.vnet.ibm.com> wrote:
>>>
>>>> Enable the KVM capability KVM_CAP_PPC_FWNMI so that
>>>> the KVM causes guest exit with NMI as exit reason
>>>> when it encounters a machine check exception on the
>>>> address belonging to a guest. Without this capability
>>>> enabled, KVM redirects machine check exceptions to
>>>> guest's 0x200 vector.
>>>>
>>>> This patch also deals with the case when a guest with
>>>> the KVM_CAP_PPC_FWNMI capability enabled is attempted
>>>> to migrate to a host that does not support this
>>>> capability.
>>>>
>>>> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
>>>> ---
>>>
>>> As suggested in another mail, it may be worth introducing the sPAPR cap
>>> in its own patch, earlier in the series.
>>
>> Sure, also as a workaround mentioned in the reply to that mail, I am
>> thinking of returning RTAS_OUT_NOT_SUPPORTED to rtas nmi register call
>> until the entire functionality is implemented. This will help solve
>> spapr cap issue as well.
> 
> Not registering the RTAS call at all is the correct way to handle that
> case.
> 
>>
>>>
>>> Anyway, I have some comments below.
>>>
>>>>  hw/ppc/spapr.c         |    1 +
>>>>  hw/ppc/spapr_caps.c    |   24 ++++++++++++++++++++++++
>>>>  hw/ppc/spapr_rtas.c    |   18 ++++++++++++++++++
>>>>  include/hw/ppc/spapr.h |    4 +++-
>>>>  target/ppc/kvm.c       |   19 +++++++++++++++++++
>>>>  target/ppc/kvm_ppc.h   |   12 ++++++++++++
>>>>  6 files changed, 77 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>>> index c97f6a6..e8a77636 100644
>>>> --- a/hw/ppc/spapr.c
>>>> +++ b/hw/ppc/spapr.c
>>>> @@ -4364,6 +4364,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>>>>      smc->default_caps.caps[SPAPR_CAP_NESTED_KVM_HV] = SPAPR_CAP_OFF;
>>>>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
>>>>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_OFF;
>>>> +    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_ON;
>>>>      spapr_caps_add_properties(smc, &error_abort);
>>>>      smc->irq = &spapr_irq_dual;
>>>>      smc->dr_phb_enabled = true;
>>>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>>>> index 31b4661..ef9e612 100644
>>>> --- a/hw/ppc/spapr_caps.c
>>>> +++ b/hw/ppc/spapr_caps.c
>>>> @@ -479,6 +479,20 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
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
>>>> +            error_setg(errp, "No fwnmi support in TCG, try cap-fwnmi-mce=off");
>>>
>>> Maybe expand "fwnmi" to "Firmware Assisted Non-Maskable Interrupts" ?
>>
>> sure..
>>
>>>
>>>> +    } else if (kvm_enabled() && !kvmppc_has_cap_ppc_fwnmi()) {
>>>> +            error_setg(errp, "Requested fwnmi capability not support by KVM");
>>>
>>> Maybe reword and add a hint:
>>>
>>> "KVM implementation does not support Firmware Assisted Non-Maskable Interrupts, try cap-fwnmi-mce=off"
>>
>> sure..
>>
>>>
>>>
>>>> +    }
>>>> +}
>>>> +
>>>>  SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
>>>>      [SPAPR_CAP_HTM] = {
>>>>          .name = "htm",
>>>> @@ -578,6 +592,15 @@ SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] = {
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
>>>> @@ -717,6 +740,7 @@ SPAPR_CAP_MIG_STATE(hpt_maxpagesize, SPAPR_CAP_HPT_MAXPAGESIZE);
>>>>  SPAPR_CAP_MIG_STATE(nested_kvm_hv, SPAPR_CAP_NESTED_KVM_HV);
>>>>  SPAPR_CAP_MIG_STATE(large_decr, SPAPR_CAP_LARGE_DECREMENTER);
>>>>  SPAPR_CAP_MIG_STATE(ccf_assist, SPAPR_CAP_CCF_ASSIST);
>>>> +SPAPR_CAP_MIG_STATE(fwnmi, SPAPR_CAP_FWNMI_MCE);
>>>>  
>>>>  void spapr_caps_init(SpaprMachineState *spapr)
>>>>  {
>>>> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
>>>> index e0bdfc8..91a7ab9 100644
>>>> --- a/hw/ppc/spapr_rtas.c
>>>> +++ b/hw/ppc/spapr_rtas.c
>>>> @@ -49,6 +49,7 @@
>>>>  #include "hw/ppc/fdt.h"
>>>>  #include "target/ppc/mmu-hash64.h"
>>>>  #include "target/ppc/mmu-book3s-v3.h"
>>>> +#include "kvm_ppc.h"
>>>>  
>>>>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>>>                                     uint32_t token, uint32_t nargs,
>>>> @@ -358,6 +359,7 @@ static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>>>>                                    target_ulong args,
>>>>                                    uint32_t nret, target_ulong rets)
>>>>  {
>>>> +    int ret;
>>>>      hwaddr rtas_addr = spapr_get_rtas_addr();
>>>>  
>>>>      if (!rtas_addr) {
>>>> @@ -365,6 +367,22 @@ static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>>>>          return;
>>>>      }
>>>>  
>>>> +    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) == 0) {
>>>> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    ret = kvmppc_fwnmi_enable(cpu);
>>>> +    if (ret == 1) {
>>>
>>> I have the impression that this should really not happen,
>>> otherwise something has gone terribly wrong in QEMU or
>>> in KVM... this maybe deserves an error message as well ?
>>> No big deal.
>>
>> I think so..  will add an error message.
> 
> Right, and because this is essentially a host side error,
> RTAS_OUT_HW_ERROR would be more appropriate.

In fact I am already doing that. If ret == 1 I set it to
RTAS_OUT_NOT_SUPPORTE else if ret < 0 than I set the error to
RTAS_OUT_HW_ERROR.

> 
>>
>> Also I should check for non zero return value, not just ret == 1, as
>> kvmppc_fwnmi_enable() returns the error value from ioctl().
>>
>>
>>>
>>>> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (ret < 0) {
>>>> +        rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
>>>> +        return;
>>>> +    }
>>>> +
>>>>      spapr->guest_machine_check_addr = rtas_ld(args, 1);
>>>>      rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>>>>  }
>>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>>> index c717ab2..bd75d4b 100644
>>>> --- a/include/hw/ppc/spapr.h
>>>> +++ b/include/hw/ppc/spapr.h
>>>> @@ -78,8 +78,10 @@ typedef enum {
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
>>>> index 39f1a73..368ec6e 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -84,6 +84,7 @@ static int cap_ppc_safe_indirect_branch;
>>>>  static int cap_ppc_count_cache_flush_assist;
>>>>  static int cap_ppc_nested_kvm_hv;
>>>>  static int cap_large_decr;
>>>> +static int cap_ppc_fwnmi;
>>>>  
>>>>  static uint32_t debug_inst_opcode;
>>>>  
>>>> @@ -152,6 +153,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
>>>>      kvmppc_get_cpu_characteristics(s);
>>>>      cap_ppc_nested_kvm_hv = kvm_vm_check_extension(s, KVM_CAP_PPC_NESTED_HV);
>>>>      cap_large_decr = kvmppc_get_dec_bits();
>>>> +    cap_ppc_fwnmi = kvm_check_extension(s, KVM_CAP_PPC_FWNMI);
>>>>      /*
>>>>       * Note: setting it to false because there is not such capability
>>>>       * in KVM at this moment.
>>>> @@ -2119,6 +2121,18 @@ void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy)
>>>>      }
>>>>  }
>>>>  
>>>> +int kvmppc_fwnmi_enable(PowerPCCPU *cpu)
>>>> +{
>>>> +    CPUState *cs = CPU(cpu);
>>>> +
>>>> +    if (!cap_ppc_fwnmi) {
>>>> +        return 1;
>>>> +    }
>>>> +
>>>> +    return kvm_vcpu_enable_cap(cs, KVM_CAP_PPC_FWNMI, 0);
>>>> +}
>>>> +
>>>> +
>>>>  int kvmppc_smt_threads(void)
>>>>  {
>>>>      return cap_ppc_smt ? cap_ppc_smt : 1;
>>>> @@ -2419,6 +2433,11 @@ bool kvmppc_has_cap_mmu_hash_v3(void)
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
>>>> index 18693f1..3d9f0b4 100644
>>>> --- a/target/ppc/kvm_ppc.h
>>>> +++ b/target/ppc/kvm_ppc.h
>>>> @@ -27,6 +27,8 @@ void kvmppc_enable_h_page_init(void);
>>>>  void kvmppc_set_papr(PowerPCCPU *cpu);
>>>>  int kvmppc_set_compat(PowerPCCPU *cpu, uint32_t compat_pvr);
>>>>  void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy);
>>>> +int kvmppc_fwnmi_enable(PowerPCCPU *cpu);
>>>> +bool kvmppc_has_cap_ppc_fwnmi(void);
>>>>  int kvmppc_smt_threads(void);
>>>>  void kvmppc_hint_smt_possible(Error **errp);
>>>>  int kvmppc_set_smt_threads(int smt);
>>>> @@ -160,6 +162,16 @@ static inline void kvmppc_set_mpic_proxy(PowerPCCPU *cpu, int mpic_proxy)
>>>>  {
>>>>  }
>>>>  
>>>> +static inline int kvmppc_fwnmi_enable(PowerPCCPU *cpu)
>>>> +{
>>>> +    return 1;
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
>>>>
>>>
>>>
>>
> 

-- 
Regards,
Aravinda


