Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8CB5E0F5
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 11:24:12 +0200 (CEST)
Received: from localhost ([::1]:34118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hibUq-00014P-5d
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 05:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57012)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1hibA9-0001So-Dr
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 05:02:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aravinda@linux.vnet.ibm.com>) id 1hibA2-0003Bi-KR
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 05:02:45 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:16050
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <aravinda@linux.vnet.ibm.com>)
 id 1hibA2-0007eY-Au
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 05:02:42 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x638vWwG092410
 for <qemu-devel@nongnu.org>; Wed, 3 Jul 2019 05:00:40 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tgrdrte0n-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 03 Jul 2019 05:00:40 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <aravinda@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 10:00:37 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 10:00:35 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6390YpS37945830
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 09:00:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7FBDC605B;
 Wed,  3 Jul 2019 09:00:34 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFC09C6063;
 Wed,  3 Jul 2019 09:00:32 +0000 (GMT)
Received: from [9.124.31.179] (unknown [9.124.31.179])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 09:00:32 +0000 (GMT)
To: David Gibson <david@gibson.dropbear.id.au>
References: <156033104292.26635.15759339817253067370.stgit@aravinda>
 <156033129836.26635.3348706829139659071.stgit@aravinda>
 <20190702041129.GJ6779@umbus.fritz.box>
 <89a68bbd-801e-876c-3105-877790a3189b@linux.vnet.ibm.com>
 <20190703032027.GI9442@umbus.fritz.box>
From: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Date: Wed, 3 Jul 2019 14:30:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20190703032027.GI9442@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070309-0012-0000-0000-0000174BC7D9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011370; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01226765; UDB=6.00645867; IPR=6.01007992; 
 MB=3.00027566; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-03 09:00:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070309-0013-0000-0000-000057ECD3BC
Message-Id: <c8f78a4c-d4a0-10e9-e0c9-0e37e3415b5c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030108
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH v10 6/6] ppc: spapr: Handle "ibm,
 nmi-register" and "ibm, nmi-interlock" RTAS calls
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
Cc: aik@au1.ibm.com, qemu-devel@nongnu.org, groug@kaod.org, paulus@ozlabs.org,
 qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wednesday 03 July 2019 08:50 AM, David Gibson wrote:
> On Tue, Jul 02, 2019 at 04:10:08PM +0530, Aravinda Prasad wrote:
>>
>>
>> On Tuesday 02 July 2019 09:41 AM, David Gibson wrote:
>>> On Wed, Jun 12, 2019 at 02:51:38PM +0530, Aravinda Prasad wrote:
>>>> This patch adds support in QEMU to handle "ibm,nmi-register"
>>>> and "ibm,nmi-interlock" RTAS calls and sets the default
>>>> value of SPAPR_CAP_FWNMI_MCE to SPAPR_CAP_ON for machine
>>>> type 4.0.
>>>>
>>>> The machine check notification address is saved when the
>>>> OS issues "ibm,nmi-register" RTAS call.
>>>>
>>>> This patch also handles the case when multiple processors
>>>> experience machine check at or about the same time by
>>>> handling "ibm,nmi-interlock" call. In such cases, as per
>>>> PAPR, subsequent processors serialize waiting for the first
>>>> processor to issue the "ibm,nmi-interlock" call. The second
>>>> processor that also received a machine check error waits
>>>> till the first processor is done reading the error log.
>>>> The first processor issues "ibm,nmi-interlock" call
>>>> when the error log is consumed.
>>>>
>>>> Signed-off-by: Aravinda Prasad <aravinda@linux.vnet.ibm.com>
>>>> ---
>>>>  hw/ppc/spapr.c         |    6 ++++-
>>>>  hw/ppc/spapr_rtas.c    |   63 ++++++++++++++++++++++++++++++++++++++++++++++++
>>>>  include/hw/ppc/spapr.h |    5 +++-
>>>>  3 files changed, 72 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
>>>> index 3d6d139..213d493 100644
>>>> --- a/hw/ppc/spapr.c
>>>> +++ b/hw/ppc/spapr.c
>>>> @@ -2946,6 +2946,9 @@ static void spapr_machine_init(MachineState *machine)
>>>>          /* Create the error string for live migration blocker */
>>>>          error_setg(&spapr->fwnmi_migration_blocker,
>>>>                  "Live migration not supported during machine check handling");
>>>> +
>>>> +        /* Register ibm,nmi-register and ibm,nmi-interlock RTAS calls */
>>>> +        spapr_fwnmi_register();
>>>>      }
>>>>  
>>>>      spapr->rtas_blob = g_malloc(spapr->rtas_size);
>>>> @@ -4408,7 +4411,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
>>>>      smc->default_caps.caps[SPAPR_CAP_NESTED_KVM_HV] = SPAPR_CAP_OFF;
>>>>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
>>>>      smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_OFF;
>>>> -    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_OFF;
>>>> +    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_ON;
>>>
>>> Turning this on by default really isn't ok if it stops you running TCG
>>> guests at all.
>>
>> If so this can be "off" by default until TCG is supported.
>>
>>>
>>>>      spapr_caps_add_properties(smc, &error_abort);
>>>>      smc->irq = &spapr_irq_dual;
>>>>      smc->dr_phb_enabled = true;
>>>> @@ -4512,6 +4515,7 @@ static void spapr_machine_3_1_class_options(MachineClass *mc)
>>>>      smc->default_caps.caps[SPAPR_CAP_SBBC] = SPAPR_CAP_BROKEN;
>>>>      smc->default_caps.caps[SPAPR_CAP_IBS] = SPAPR_CAP_BROKEN;
>>>>      smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_OFF;
>>>> +    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_OFF;
>>>
>>> We're now well past 4.0, and in fact we're about to go into soft
>>> freeze for 4.1, so we're going to miss that too.  So 4.1 and earlier
>>> will need to retain the old default.
>>
>> ok.
>>
>>>
>>>>  }
>>>>  
>>>>  DEFINE_SPAPR_MACHINE(3_1, "3.1", false);
>>>> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
>>>> index a015a80..e010cb2 100644
>>>> --- a/hw/ppc/spapr_rtas.c
>>>> +++ b/hw/ppc/spapr_rtas.c
>>>> @@ -49,6 +49,7 @@
>>>>  #include "hw/ppc/fdt.h"
>>>>  #include "target/ppc/mmu-hash64.h"
>>>>  #include "target/ppc/mmu-book3s-v3.h"
>>>> +#include "migration/blocker.h"
>>>>  
>>>>  static void rtas_display_character(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>>>                                     uint32_t token, uint32_t nargs,
>>>> @@ -352,6 +353,60 @@ static void rtas_get_power_level(PowerPCCPU *cpu, SpaprMachineState *spapr,
>>>>      rtas_st(rets, 1, 100);
>>>>  }
>>>>  
>>>> +static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>>>> +                                  SpaprMachineState *spapr,
>>>> +                                  uint32_t token, uint32_t nargs,
>>>> +                                  target_ulong args,
>>>> +                                  uint32_t nret, target_ulong rets)
>>>> +{
>>>> +    int ret;
>>>> +    hwaddr rtas_addr = spapr_get_rtas_addr();
>>>> +
>>>> +    if (!rtas_addr) {
>>>> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) == SPAPR_CAP_OFF) {
>>>> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>>>> +        return;
>>>> +    }
>>>> +
>>>> +    ret = kvmppc_fwnmi_enable(cpu);
>>>> +    if (ret == 1) {
>>>> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>>>
>>> I don't understand this case separate from the others.  We've already
>>> set the cap, so fwnmi support should be checked and available.
>>
>> But we have not enabled fwnmi in KVM. kvmppc_fwnmi_enable() returns 1 if
>> cap_ppc_fwnmi is not available in KVM.
> 
> But you've checked for the presence of the extension, yes?  So a
> failure to enable the cap would be unexpected.  In which case how does
> this case differ from.. 

No, this is the function where I check for the presence of the
extension. In kvm_arch_init() we just set cap_ppc_fwnmi to 1 if KVM
support is available, but don't take any action if unavailable.

So this case is when we are running an old version of KVM with no
cap_ppc_fwnmi support.

> 
>>
>>>
>>>> +        return;
>>>> +    } else if (ret < 0) {
>>>> +        error_report("Couldn't enable KVM FWNMI capability");
>>>> +        rtas_st(rets, 0, RTAS_OUT_HW_ERROR);
>>>> +        return;
> 
> ..this case.

And this is when we have the KVM support but due to some problem with
either KVM or QEMU we are unable to enable cap_ppc_fwnmi.

> 
>>>> +    }
>>>> +
>>>> +    spapr->guest_machine_check_addr = rtas_ld(args, 1);
>>>> +    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>>>> +}
>>>> +
>>>> +static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>>>> +                                   SpaprMachineState *spapr,
>>>> +                                   uint32_t token, uint32_t nargs,
>>>> +                                   target_ulong args,
>>>> +                                   uint32_t nret, target_ulong rets)
>>>> +{
>>>> +    if (spapr->guest_machine_check_addr == -1) {
>>>> +        /* NMI register not called */
>>>> +        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
>>>> +    } else {
>>>> +        /*
>>>> +         * vCPU issuing "ibm,nmi-interlock" is done with NMI handling,
>>>> +         * hence unset mc_status.
>>>> +         */
>>>> +        spapr->mc_status = -1;
>>>> +        qemu_cond_signal(&spapr->mc_delivery_cond);
>>>> +        migrate_del_blocker(spapr->fwnmi_migration_blocker);
>>>
>>> Hrm.  We add the blocker at the mce request point.  First, that's in
>>> another patch, which isn't great.  Second, does that mean we could add
>>> multiple times if we get an MCE on multiple CPUs?  Will that work and
>>> correctly match adds and removes properly?
>>
>> If it is fine to move the migration patch as the last patch in the
>> sequence, then we will have add and del blocker in the same patch.
>>
>> And yes we could add multiple times if we get MCE on multiple CPUs and
>> as all those cpus call interlock there should be matching number of
>> delete blockers.
> 
> Ok, and I think adding the same pointer to the list multiple times
> will work ok.

I think so

> 
> Btw, add_blocker() can fail - have you handled failure conditions?

yes, I am handling it.

> 

-- 
Regards,
Aravinda


