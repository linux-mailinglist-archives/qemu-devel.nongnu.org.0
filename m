Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDB4B8579
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:26:03 +0100 (CET)
Received: from localhost ([::1]:57346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHVa-0006vY-Jg
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:26:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKHTZ-0005n3-2c; Wed, 16 Feb 2022 05:23:57 -0500
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:57099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nKHTW-0004nm-FB; Wed, 16 Feb 2022 05:23:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.219])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 077EC22821;
 Wed, 16 Feb 2022 10:23:51 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 11:23:50 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001c2a51b92-b038-4d81-b2ae-1419fe6179f9,
 CB3E44AF90526EF3DA3218D7163352937EBBBEE5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <42fcc87d-dd7b-c42b-a36d-5ccd5a314348@kaod.org>
Date: Wed, 16 Feb 2022 11:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 9/9] spapr: implement nested-hv capability for the virtual
 hypervisor
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, <qemu-ppc@nongnu.org>
References: <20220215031642.1691873-1-npiggin@gmail.com>
 <20220215031642.1691873-10-npiggin@gmail.com>
 <bf41591f-e456-688e-a5be-4325a590b7be@kaod.org>
 <1644972569.qjmfk874wg.astroid@bobo.none>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1644972569.qjmfk874wg.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 90b387ac-d549-472f-b05e-ed6f2812fa93
X-Ovh-Tracer-Id: 15039208007319522272
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeeigddugecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 02:16, Nicholas Piggin wrote:
> Excerpts from Cédric Le Goater's message of February 16, 2022 4:21 am:
>> On 2/15/22 04:16, Nicholas Piggin wrote:
>>> This implements the Nested KVM HV hcall API for spapr under TCG.
>>>
>>> The L2 is switched in when the H_ENTER_NESTED hcall is made, and the
>>> L1 is switched back in returned from the hcall when a HV exception
>>> is sent to the vhyp. Register state is copied in and out according to
>>> the nested KVM HV hcall API specification.
>>>
>>> The hdecr timer is started when the L2 is switched in, and it provides
>>> the HDEC / 0x980 return to L1.
>>>
>>> The MMU re-uses the bare metal radix 2-level page table walker by
>>> using the get_pate method to point the MMU to the nested partition
>>> table entry. MMU faults due to partition scope errors raise HV
>>> exceptions and accordingly are routed back to the L1.
>>>
>>> The MMU does not tag translations for the L1 (direct) vs L2 (nested)
>>> guests, so the TLB is flushed on any L1<->L2 transition (hcall entry
>>> and exit).
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    hw/ppc/spapr.c         |  32 +++-
>>>    hw/ppc/spapr_caps.c    |  11 +-
>>>    hw/ppc/spapr_hcall.c   | 321 +++++++++++++++++++++++++++++++++++++++++
>>>    include/hw/ppc/spapr.h |  74 +++++++++-
>>>    target/ppc/cpu.h       |   3 +
>>>    5 files changed, 431 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>> index 3a5cf92c94..6988e3ec76 100644
>>> --- a/hw/ppc/spapr.c
>>> +++ b/hw/ppc/spapr.c
>>> @@ -1314,11 +1314,32 @@ static bool spapr_get_pate(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu,
>>>    {
>>>        SpaprMachineState *spapr = SPAPR_MACHINE(vhyp);
>>>    
>>> -    assert(lpid == 0);
>>> +    if (!cpu->in_spapr_nested) {
>>
>> Since 'in_spapr_nested' is a spapr CPU characteristic, I don't think
>> it belongs to PowerPCCPU. See the end of the patch, for a proposal.
> 
> SpaprCpuState. Certainly that's a better place, I must have missed it.
> 
>>
>> btw, this helps the ordering of files :
>>
>> [diff]
>> 	orderFile = /path/to/qemu/scripts/git.orderfile
>>
>>> +        assert(lpid == 0);
>>>    
>>> -    /* Copy PATE1:GR into PATE0:HR */
>>> -    entry->dw0 = spapr->patb_entry & PATE0_HR;
>>> -    entry->dw1 = spapr->patb_entry;
>>> +        /* Copy PATE1:GR into PATE0:HR */
>>> +        entry->dw0 = spapr->patb_entry & PATE0_HR;
>>> +        entry->dw1 = spapr->patb_entry;
>>> +
>>> +    } else {
>>> +        uint64_t patb, pats;
>>> +
>>> +        assert(lpid != 0);
>>> +
>>> +        patb = spapr->nested_ptcr & PTCR_PATB;
>>> +        pats = spapr->nested_ptcr & PTCR_PATS;
>>> +
>>> +        /* Calculate number of entries */
>>> +        pats = 1ull << (pats + 12 - 4);
>>> +        if (pats <= lpid) {
>>> +            return false;
>>> +        }
>>> +
>>> +        /* Grab entry */
>>> +        patb += 16 * lpid;
>>> +        entry->dw0 = ldq_phys(CPU(cpu)->as, patb);
>>> +        entry->dw1 = ldq_phys(CPU(cpu)->as, patb + 8);
>>> +    }
>>>    
>>>        return true;
>>>    }
>>> @@ -4472,7 +4493,7 @@ PowerPCCPU *spapr_find_cpu(int vcpu_id)
>>>    
>>>    static bool spapr_cpu_in_nested(PowerPCCPU *cpu)
>>>    {
>>> -    return false;
>>> +    return cpu->in_spapr_nested;
>>>    }
>>>    
>>>    static void spapr_cpu_exec_enter(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
>>> @@ -4584,6 +4605,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>>>        nc->nmi_monitor_handler = spapr_nmi;
>>>        smc->phb_placement = spapr_phb_placement;
>>>        vhc->cpu_in_nested = spapr_cpu_in_nested;
>>> +    vhc->deliver_hv_excp = spapr_exit_nested;
>>>        vhc->hypercall = emulate_spapr_hypercall;
>>>        vhc->hpt_mask = spapr_hpt_mask;
>>>        vhc->map_hptes = spapr_map_hptes;
>>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>>> index 5cc80776d0..4d8bb2ad2c 100644
>>> --- a/hw/ppc/spapr_caps.c
>>> +++ b/hw/ppc/spapr_caps.c
>>> @@ -444,19 +444,22 @@ static void cap_nested_kvm_hv_apply(SpaprMachineState *spapr,
>>>    {
>>>        ERRP_GUARD();
>>>        PowerPCCPU *cpu = POWERPC_CPU(first_cpu);
>>> +    CPUPPCState *env = &cpu->env;
>>>    
>>>        if (!val) {
>>>            /* capability disabled by default */
>>>            return;
>>>        }
>>>    
>>> -    if (tcg_enabled()) {
>>> -        error_setg(errp, "No Nested KVM-HV support in TCG");
>>
>> I don't like using KVM-HV (which is KVM-over-PowerNV) when talking about
>> KVM-over-pseries. I think the platform name is important. Anyhow, this is
>> a more global discussion but we should talk about it someday because these
>> HV mode are becoming confusing ! We have PR also :)
> 
> The cap is nested-hv and QEMU describes it nested KVM HV. Are we stuck
> with that? That could make a name change even more confusing.
> 
> It's really a new backend for the KVM HV front end. Like how POWER8 /
> POWER9 bare metal backends are completely different now.
> 
> But I guess that does not help the end user to understand. On the other
> hand, the user might not think "HV" is the HV mode of the CPU and just
> thinks of it as "hypervisor".
> 
> I like paravirt-hv but nested-hv is not too bad. Anyway I'm happy to
> change it.
> 
>>
>>
>>> +    if (!(env->insns_flags2 & PPC2_ISA300)) {
>>> +        error_setg(errp, "Nested KVM-HV only supported on POWER9 and later");
>>>            error_append_hint(errp, "Try appending -machine cap-nested-hv=off\n");
>>
>> return ?
> 
> Yep.
> 
>>> +static target_ulong h_enter_nested(PowerPCCPU *cpu,
>>> +                                   SpaprMachineState *spapr,
>>> +                                   target_ulong opcode,
>>> +                                   target_ulong *args)
>>> +{
>>> +    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
>>> +    CPUState *cs = CPU(cpu);
>>> +    CPUPPCState *env = &cpu->env;
>>> +    target_ulong hv_ptr = args[0];
>>> +    target_ulong regs_ptr = args[1];
>>> +    target_ulong hdec, now = cpu_ppc_load_tbl(env);
>>> +    target_ulong lpcr, lpcr_mask;
>>> +    struct kvmppc_hv_guest_state *hvstate;
>>> +    struct kvmppc_hv_guest_state hv_state;
>>> +    struct kvmppc_pt_regs *regs;
>>> +    hwaddr len;
>>> +    uint32_t cr;
>>> +    int i;
>>> +
>>> +    if (cpu->in_spapr_nested) {
>>> +        return H_FUNCTION;
>>
>> That would be an L3 :)
> 
> Well if the L2 makes the hcall, vhyp won't handle it but rather it
> will cause L2 exit to L1 and the L1 will handle the H_ENTER_NESTED
> hcall. So we can (and have) run an L3 guest under the L2 of this
> machine :)
>
> This is probably more of an assert(!cpu->in_spapr_nested). Actually
> that assert could go in the general spapr hypercall handler.
> 
>>
>>> +    }
>>> +    if (spapr->nested_ptcr == 0) {
>>> +        return H_NOT_AVAILABLE;
>>> +    }
>>> +
>>> +    len = sizeof(*hvstate);
>>> +    hvstate = cpu_physical_memory_map(hv_ptr, &len, true);
>>
>> When a CPU is available, I would prefer :
>>
>>       hvstate = address_space_map(CPU(cpu)->as, hv_ptr, &len, true,
>>                                 MEMTXATTRS_UNSPECIFIED);
>>       
>> like ppc_hash64_map_hptes() does. This is minor.
> 
> I'll check it out. Still not entire sure about read+write access
> though.
> 
>>
>>> +    if (!hvstate || len != sizeof(*hvstate)) {
>>> +        return H_PARAMETER;
>>> +    }
>>> +
>>> +    memcpy(&hv_state, hvstate, len);
>>> +
>>> +    cpu_physical_memory_unmap(hvstate, len, 0 /* read */, len /* access len */);
>>
>> checkpatch will complain with the above comments.
> 
> Yeah it did. Turns out I also had a bug where I missed setting write
> access further down.
> 
>>
>>> +
>>> +    /*
>>> +     * We accept versions 1 and 2. Version 2 fields are unused because TCG
>>> +     * does not implement DAWR*.
>>> +     */
>>> +    if (hv_state.version > HV_GUEST_STATE_VERSION) {
>>> +        return H_PARAMETER;
>>> +    }
>>> +
>>> +    cpu->nested_host_state = g_try_malloc(sizeof(CPUPPCState));
>>
>> I think we could preallocate this buffer once we know nested are supported,
>> or if we keep it, it could be our 'in_spapr_nested' indicator.
> 
> That's true. I kind of liked to allocate on demand, but for performance
> and robustness might be better to keep it around (could allocate when we
> see a H_SET_PARTITION_TABLE.
> 
> I'll just keep it as is for the first iteration. Probably in fact we
> would rather make a specific structure for it that only has what we
> require rather than the entire CPUPPCState so all this can be optimised
> a bit in a later round.

Sure. keep in mind that the pseries machine migrates and this is extra state
to carry on the other side. vmstate_spapr_cpu_state should be modified.

>>> +struct kvmppc_hv_guest_state {
>>> +    uint64_t version;        /* version of this structure layout, must be first */
>>> +    uint32_t lpid;
>>> +    uint32_t vcpu_token;
>>> +    /* These registers are hypervisor privileged (at least for writing) */
>>> +    uint64_t lpcr;
>>> +    uint64_t pcr;
>>> +    uint64_t amor;
>>> +    uint64_t dpdes;
>>> +    uint64_t hfscr;
>>> +    int64_t tb_offset;
>>> +    uint64_t dawr0;
>>> +    uint64_t dawrx0;
>>> +    uint64_t ciabr;
>>> +    uint64_t hdec_expiry;
>>> +    uint64_t purr;
>>> +    uint64_t spurr;
>>> +    uint64_t ic;
>>> +    uint64_t vtb;
>>> +    uint64_t hdar;
>>> +    uint64_t hdsisr;
>>> +    uint64_t heir;
>>> +    uint64_t asdr;
>>> +    /* These are OS privileged but need to be set late in guest entry */
>>> +    uint64_t srr0;
>>> +    uint64_t srr1;
>>> +    uint64_t sprg[4];
>>> +    uint64_t pidr;
>>> +    uint64_t cfar;
>>> +    uint64_t ppr;
>>> +    /* Version 1 ends here */
>>> +    uint64_t dawr1;
>>> +    uint64_t dawrx1;
>>> +    /* Version 2 ends here */
>>> +};
>>> +
>>> +/* Latest version of hv_guest_state structure */
>>> +#define HV_GUEST_STATE_VERSION  2
>>> +
>>> +/* Linux 64-bit powerpc pt_regs struct, used by nested HV */
>>> +struct kvmppc_pt_regs {
>>> +    uint64_t gpr[32];
>>> +    uint64_t nip;
>>> +    uint64_t msr;
>>> +    uint64_t orig_gpr3;    /* Used for restarting system calls */
>>> +    uint64_t ctr;
>>> +    uint64_t link;
>>> +    uint64_t xer;
>>> +    uint64_t ccr;
>>> +    uint64_t softe;        /* Soft enabled/disabled */
>>> +    uint64_t trap;         /* Reason for being here */
>>> +    uint64_t dar;          /* Fault registers */
>>> +    uint64_t dsisr;        /* on 4xx/Book-E used for ESR */
>>> +    uint64_t result;       /* Result of a system call */
>>> +};
>>
>> The above structs are shared with KVM for this QEMU implementation.
>>
>> I don't think they belong to asm-powerpc/kvm.h but how could we keep them
>> in sync ? The version should be protecting us from unexpected changes.
> 
> Not sure how we should do that. How are other PAPR API definitions kept
> in synch? I guess they just have a document spec for the upstream. Paul
> made a spec document for the nested HV stuff, not sure if he's put it up
> in public anywhere. Maybe we could maintain it in linux/Documentation/
> or similar?

yes. under linux/Documentation/virt/kvm/

> Anyway for now I guess we keep this?

Yes. May be in its own private header. Something like hw/ppc/spapr_nested.h


Thanks,

C.


>>> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
>>> index d8cc956c97..65c4401130 100644
>>> --- a/target/ppc/cpu.h
>>> +++ b/target/ppc/cpu.h
>>> @@ -1301,6 +1301,9 @@ struct PowerPCCPU {
>>>        bool pre_2_10_migration;
>>>        bool pre_3_0_migration;
>>>        int32_t mig_slb_nr;
>>> +
>>> +    bool in_spapr_nested;
>>> +    CPUPPCState *nested_host_state;
>>>    };
>>
>> These new fields belong to SpaprCpuState. I shouldn't be too hard to adapt.
> 
> Thanks for the pointer, that's what I was looking for. Must not have
> looked very hard :)
> 
> Thanks,
> Nick


