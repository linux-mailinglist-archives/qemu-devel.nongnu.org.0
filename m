Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C695F198AC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 09:01:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOzWe-0000of-01
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 03:01:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hOzVb-0000My-46
	for qemu-devel@nongnu.org; Fri, 10 May 2019 02:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aravinda@linux.vnet.ibm.com>) id 1hOzVZ-0000CT-9p
	for qemu-devel@nongnu.org; Fri, 10 May 2019 02:59:55 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:60324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
	id 1hOzVZ-0000B8-0k
	for qemu-devel@nongnu.org; Fri, 10 May 2019 02:59:53 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4A6x4AX117953
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 02:59:48 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sd33431tc-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Fri, 10 May 2019 02:59:47 -0400
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <aravinda@linux.vnet.ibm.com>;
	Fri, 10 May 2019 07:59:46 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 10 May 2019 07:59:42 +0100
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
	[9.57.199.109])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x4A6wQWc28704938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 10 May 2019 06:58:26 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2AF67112063;
	Fri, 10 May 2019 06:58:26 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2F9B5112062;
	Fri, 10 May 2019 06:58:24 +0000 (GMT)
Received: from [9.199.33.229] (unknown [9.199.33.229])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2019 06:58:23 +0000 (GMT)
To: David Gibson <david@gibson.dropbear.id.au>
References: <155591636364.20338.844048953355207313.stgit@aravinda>
	<155591659639.20338.6078212293519133016.stgit@aravinda>
	<20190423065359.GF31496@umbus.fritz.box>
	<3f8435a4-0435-fb3c-6f67-446e9a090ae0@linux.vnet.ibm.com>
	<20190510063705.GJ20559@umbus.fritz.box>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Date: Fri, 10 May 2019 12:28:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190510063705.GJ20559@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051006-0064-0000-0000-000003DC9B2A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011081; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000285; SDB=6.01201181; UDB=6.00630316;
	IPR=6.00982078; 
	MB=3.00026825; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-10 06:59:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051006-0065-0000-0000-00003D6A190B
Message-Id: <8fc3b9e5-cc09-e9ff-db78-9cbc1f739902@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905100048
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH v8 3/6] target/ppc: Handle NMI
 guest exit
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
Cc: paulus@ozlabs.org, qemu-ppc@nongnu.org, aik@au1.ibm.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Friday 10 May 2019 12:07 PM, David Gibson wrote:
> On Wed, Apr 24, 2019 at 10:20:42AM +0530, Aravinda Prasad wrote:
> 65;5601;1c> 
>>
>> On Tuesday 23 April 2019 12:23 PM, David Gibson wrote:
>>> On Mon, Apr 22, 2019 at 12:33:16PM +0530, Aravinda Prasad wrote:
>>>> Memory error such as bit flips that cannot be corrected
>>>> by hardware are passed on to the kernel for handling.
>>>> If the memory address in error belongs to guest then
>>>> the guest kernel is responsible for taking suitable action.
>>>> Patch [1] enhances KVM to exit guest with exit reason
>>>> set to KVM_EXIT_NMI in such cases. This patch handles
>>>> KVM_EXIT_NMI exit.
>>>>
>>>> [1] https://www.spinics.net/lists/kvm-ppc/msg12637.html
>>>>     (e20bbd3d and related commits)
>>>>
>>>> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
>>>
>>> LGTM, apart from one detail noted below.
>>>
>>>> ---
>>>>  hw/ppc/spapr.c          |    3 +++
>>>>  hw/ppc/spapr_events.c   |   22 ++++++++++++++++++++++
>>>>  hw/ppc/spapr_rtas.c     |    5 +++++
>>>>  include/hw/ppc/spapr.h  |    6 ++++++
>>>>  target/ppc/kvm.c        |   16 ++++++++++++++++
>>>>  target/ppc/kvm_ppc.h    |    2 ++
>>>>  target/ppc/trace-events |    2 ++
>>>>  7 files changed, 56 insertions(+)
>>>>
>>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>>> index 6642cb5..2779efe 100644
>>>> --- a/hw/ppc/spapr.c
>>>> +++ b/hw/ppc/spapr.c
>>>> @@ -1806,6 +1806,7 @@ static void spapr_machine_reset(void)
>>>>  
>>>>      spapr->cas_reboot = false;
>>>>  
>>>> +    spapr->mc_status = -1;
>>>>      spapr->guest_machine_check_addr = -1;
>>>>  
>>>>      /* Signal all vCPUs waiting on this condition */
>>>> @@ -2106,6 +2107,7 @@ static const VMStateDescription vmstate_spapr_machine_check = {
>>>>      .minimum_version_id = 1,
>>>>      .fields = (VMStateField[]) {
>>>>          VMSTATE_UINT64(guest_machine_check_addr, SpaprMachineState),
>>>> +        VMSTATE_INT32(mc_status, SpaprMachineState),
>>>
>>> So, technically this is a breaking change to the migration stream.  If
>>> this is applied immediately after the earlier patch introducing the
>>> subsection it would be ok in practice, but it would still be
>>> preferable to make all the migration stream changes together.
>>
>> Do you mean that all .fields entries to vmstate_spapr_machine_check
>> should be in a single patch?
> 
> Yes, that's preferable.  If necessary you can move the migration
> support out into its own patch which goes after the implementation of
> the underlying state.

Sure..

> 
>>
>> Because this patch introduced the variable mc_status, I added it to
>> vmstate_spapr_machine_check.
>>
>> Regards,
>> Aravinda
>>
>>>
>>>>          VMSTATE_END_OF_LIST()
>>>>      },
>>>>  };
>>>> @@ -3085,6 +3087,7 @@ static void spapr_machine_init(MachineState *machine)
>>>>          kvmppc_spapr_enable_inkernel_multitce();
>>>>      }
>>>>  
>>>> +    spapr->mc_status = -1;
>>>>      qemu_cond_init(&spapr->mc_delivery_cond);
>>>>  }
>>>>  
>>>> diff --git a/hw/ppc/spapr_events.c b/hw/ppc/spapr_events.c
>>>> index ae0f093..9922a23 100644
>>>> --- a/hw/ppc/spapr_events.c
>>>> +++ b/hw/ppc/spapr_events.c
>>>> @@ -620,6 +620,28 @@ void spapr_hotplug_req_remove_by_count_indexed(SpaprDrcType drc_type,
>>>>                              RTAS_LOG_V6_HP_ACTION_REMOVE, drc_type, &drc_id);
>>>>  }
>>>>  
>>>> +void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered)
>>>> +{
>>>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>>>> +
>>>> +    while (spapr->mc_status != -1) {
>>>> +        /*
>>>> +         * Check whether the same CPU got machine check error
>>>> +         * while still handling the mc error (i.e., before
>>>> +         * that CPU called "ibm,nmi-interlock"
>>>> +         */
>>>> +        if (spapr->mc_status == cpu->vcpu_id) {
>>>> +            qemu_system_guest_panicked(NULL);
>>>> +        }
>>>> +        qemu_cond_wait_iothread(&spapr->mc_delivery_cond);
>>>> +        /* Meanwhile if the system is reset, then just return */
>>>> +        if (spapr->guest_machine_check_addr == -1) {
>>>> +            return;
>>>> +        }
>>>> +    }
>>>> +    spapr->mc_status = cpu->vcpu_id;
>>>> +}
>>>> +
>>>>  static void check_exception(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>>>                              uint32_t token, uint32_t nargs,
>>>>                              target_ulong args,
>>>> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
>>>> index c2f3991..d3499f9 100644
>>>> --- a/hw/ppc/spapr_rtas.c
>>>> +++ b/hw/ppc/spapr_rtas.c
>>>> @@ -375,6 +375,11 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>>>>          /* NMI register not called */
>>>>          rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
>>>>      } else {
>>>> +        /*
>>>> +         * vCPU issuing "ibm,nmi-interlock" is done with NMI handling,
>>>> +         * hence unset mc_status.
>>>> +         */
>>>> +        spapr->mc_status = -1;
>>>>          qemu_cond_signal(&spapr->mc_delivery_cond);
>>>>          rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>>>>      }
>>>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>>>> index ec6f33e..f7204d0 100644
>>>> --- a/include/hw/ppc/spapr.h
>>>> +++ b/include/hw/ppc/spapr.h
>>>> @@ -189,6 +189,11 @@ struct SpaprMachineState {
>>>>  
>>>>      /* State related to "ibm,nmi-register" and "ibm,nmi-interlock" calls */
>>>>      target_ulong guest_machine_check_addr;
>>>> +    /*
>>>> +     * mc_status is set to -1 if mc is not in progress, else is set to the CPU
>>>> +     * handling the mc.
>>>> +     */
>>>> +    int mc_status;
>>>>      QemuCond mc_delivery_cond;
>>>>  
>>>>      /*< public >*/
>>>> @@ -792,6 +797,7 @@ void spapr_clear_pending_events(SpaprMachineState *spapr);
>>>>  int spapr_max_server_number(SpaprMachineState *spapr);
>>>>  void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
>>>>                        uint64_t pte0, uint64_t pte1);
>>>> +void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
>>>>  
>>>>  /* DRC callbacks. */
>>>>  void spapr_core_release(DeviceState *dev);
>>>> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
>>>> index 9e86db0..5eedce8 100644
>>>> --- a/target/ppc/kvm.c
>>>> +++ b/target/ppc/kvm.c
>>>> @@ -1759,6 +1759,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>>>>          ret = 0;
>>>>          break;
>>>>  
>>>> +    case KVM_EXIT_NMI:
>>>> +        trace_kvm_handle_nmi_exception();
>>>> +        ret = kvm_handle_nmi(cpu, run);
>>>> +        break;
>>>> +
>>>>      default:
>>>>          fprintf(stderr, "KVM: unknown exit reason %d\n", run->exit_reason);
>>>>          ret = -1;
>>>> @@ -2837,6 +2842,17 @@ int kvm_arch_msi_data_to_gsi(uint32_t data)
>>>>      return data & 0xffff;
>>>>  }
>>>>  
>>>> +int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run)
>>>> +{
>>>> +    bool recovered = run->flags & KVM_RUN_PPC_NMI_DISP_FULLY_RECOV;
>>>> +
>>>> +    cpu_synchronize_state(CPU(cpu));
>>>> +
>>>> +    spapr_mce_req_event(cpu, recovered);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  int kvmppc_enable_hwrng(void)
>>>>  {
>>>>      if (!kvm_enabled() || !kvm_check_extension(kvm_state, KVM_CAP_PPC_HWRNG)) {
>>>> diff --git a/target/ppc/kvm_ppc.h b/target/ppc/kvm_ppc.h
>>>> index 2238513..6edc42f 100644
>>>> --- a/target/ppc/kvm_ppc.h
>>>> +++ b/target/ppc/kvm_ppc.h
>>>> @@ -80,6 +80,8 @@ bool kvmppc_hpt_needs_host_contiguous_pages(void);
>>>>  void kvm_check_mmu(PowerPCCPU *cpu, Error **errp);
>>>>  void kvmppc_set_reg_ppc_online(PowerPCCPU *cpu, unsigned int online);
>>>>  
>>>> +int kvm_handle_nmi(PowerPCCPU *cpu, struct kvm_run *run);
>>>> +
>>>>  #else
>>>>  
>>>>  static inline uint32_t kvmppc_get_tbfreq(void)
>>>> diff --git a/target/ppc/trace-events b/target/ppc/trace-events
>>>> index 7b3cfe1..d5691d2 100644
>>>> --- a/target/ppc/trace-events
>>>> +++ b/target/ppc/trace-events
>>>> @@ -28,3 +28,5 @@ kvm_handle_papr_hcall(void) "handle PAPR hypercall"
>>>>  kvm_handle_epr(void) "handle epr"
>>>>  kvm_handle_watchdog_expiry(void) "handle watchdog expiry"
>>>>  kvm_handle_debug_exception(void) "handle debug exception"
>>>> +kvm_handle_nmi_exception(void) "handle NMI exception"
>>>> +
>>>>
>>>
>>
> 

-- 
Regards,
Aravinda


