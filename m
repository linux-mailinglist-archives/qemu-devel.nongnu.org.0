Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE3332F36
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 20:43:45 +0100 (CET)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJiGd-0001e8-N9
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 14:43:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lJg87-0008Lw-5f
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:26:53 -0500
Received: from 7.mo52.mail-out.ovh.net ([188.165.59.253]:33906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lJg81-0004oh-BF
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 12:26:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.76])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id E80162476F6;
 Tue,  9 Mar 2021 18:26:36 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 9 Mar 2021
 18:26:36 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005b3342e94-a8ab-4258-a199-b306ceb08c64,
 8C9061D2296CFEABF2D52E5F4F8F8063DC0B97BF) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 1/8] powerpc/xive: Use cpu_to_node() instead of
 ibm,chip-id property
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, Greg Kurz
 <groug@kaod.org>
References: <20210303174857.1760393-1-clg@kaod.org>
 <20210303174857.1760393-2-clg@kaod.org> <20210308181359.789c143b@bahia.lan>
 <8dd98e22-1f10-e87b-3fe3-e786bc9a8d71@kaod.org>
 <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <92edbc26-4cb5-6e2f-00ff-43a3dca43759@kaod.org>
Date: Tue, 9 Mar 2021 18:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3180b5c6-e61f-9c5f-3c80-f10e69dc5785@linux.ibm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 36be80d9-9d5e-489e-a97b-459db706a6b2
X-Ovh-Tracer-Id: 12667499853954255721
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 QEMU Developers <qemu-devel@nongnu.org>, David Gibson <dgibson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 6:08 PM, Daniel Henrique Barboza wrote:
> 
> 
> On 3/9/21 12:33 PM, Cédric Le Goater wrote:
>> On 3/8/21 6:13 PM, Greg Kurz wrote:
>>> On Wed, 3 Mar 2021 18:48:50 +0100
>>> Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>>> The 'chip_id' field of the XIVE CPU structure is used to choose a
>>>> target for a source located on the same chip when possible. This field
>>>> is assigned on the PowerNV platform using the "ibm,chip-id" property
>>>> on pSeries under KVM when NUMA nodes are defined but it is undefined
>>>
>>> This sentence seems to have a syntax problem... like it is missing an
>>> 'and' before 'on pSeries'.
>>
>> ah yes, or simply a comma.
>>
>>>> under PowerVM. The XIVE source structure has a similar field
>>>> 'src_chip' which is only assigned on the PowerNV platform.
>>>>
>>>> cpu_to_node() returns a compatible value on all platforms, 0 being the
>>>> default node. It will also give us the opportunity to set the affinity
>>>> of a source on pSeries when we can localize them.
>>>>
>>>
>>> IIUC this relies on the fact that the NUMA node id is == to chip id
>>> on PowerNV, i.e. xc->chip_id which is passed to OPAL remain stable
>>> with this change.
>>
>> Linux sets the NUMA node in numa_setup_cpu(). On pseries, the hcall
>> H_HOME_NODE_ASSOCIATIVITY returns the node id if I am correct (Daniel
>> in Cc:)
> 
> That's correct. H_HOME_NODE_ASSOCIATIVITY returns not only the node_id, but
> a list with the ibm,associativity domains of the CPU that "proc-no" (processor
> identifier) is mapped to inside QEMU.
> 
> node_id in this case, considering that we're working with a reference-points
> of size 4, is the 4th element of the returned list. The last element is
> "procno" itself.
> 
> 
>>
>> On PowerNV, Linux uses "ibm,associativity" property of the CPU to find
>> the node id. This value is built from the chip id in OPAL, so the
>> value returned by cpu_to_node(cpu) and the value of the "ibm,chip-id"
>> property are unlikely to be different.
>>
>> cpu_to_node(cpu) is used in many places to allocate the structures
>> locally to the owning node. XIVE is not an exception (see below in the
>> same patch), it is better to be consistent and get the same information
>> (node id) using the same routine.
>>
>>
>> In Linux, "ibm,chip-id" is only used in low level PowerNV drivers :
>> LPC, XSCOM, RNG, VAS, NX. XIVE should be in that list also but skiboot
>> unifies the controllers of the system to only expose one the OS. This
>> is problematic and should be changed but it's another topic.
>>
>>
>>> On the other hand, you have the pSeries case under PowerVM that
>>> doesn't xc->chip_id, which isn't passed to any hcall AFAICT.
>>
>> yes "ibm,chip-id" is an OPAL concept unfortunately and it has no meaning
>> under PAPR. xc->chip_id on pseries (PowerVM) will contains an invalid
>> chip id.
>>
>> QEMU/KVM exposes "ibm,chip-id" but it's not used. (its value is not
>> always correct btw)
> 
> 
> If you have a way to reliably reproduce this, let me know and I'll fix it
> up in QEMU.

with :

   -smp 4,cores=1,maxcpus=8 -object memory-backend-ram,id=ram-node0,size=2G -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=2G -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1

# dmesg | grep numa
[    0.013106] numa: Node 0 CPUs: 0-1
[    0.013136] numa: Node 1 CPUs: 2-3

# dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
		ibm,chip-id = <0x01>;
		ibm,chip-id = <0x02>;
		ibm,chip-id = <0x00>;
		ibm,chip-id = <0x03>;

with :

  -smp 4,cores=4,maxcpus=8,threads=1 -object memory-backend-ram,id=ram-node0,size=2G -numa node,nodeid=0,cpus=0-1,cpus=4-5,memdev=ram-node0 -object memory-backend-ram,id=ram-node1,size=2G -numa node,nodeid=1,cpus=2-3,cpus=6-7,memdev=ram-node1

# dmesg | grep numa
[    0.013106] numa: Node 0 CPUs: 0-1
[    0.013136] numa: Node 1 CPUs: 2-3

# dtc -I fs /proc/device-tree/cpus/ -f | grep ibm,chip-id
		ibm,chip-id = <0x00>;
		ibm,chip-id = <0x00>;
		ibm,chip-id = <0x00>;
		ibm,chip-id = <0x00>;

I think we should simply remove "ibm,chip-id" since it's not used and
not in the PAPR spec.

Thanks,

C.

 

> 
> Thanks,
> 
> 
> DHB
> 
> 
>>
>>> It looks like the chip id is only used for localization purpose in
>>> this case, right ?
>>
>> Yes and PAPR sources are not localized. So it's not used. MSI sources
>> could be if we rewrote the MSI driver.
>>
>>> In this case, what about doing this change for pSeries only,
>>> somewhere in spapr.c ?
>>
>> The IPI code is common to all platforms and all have the same issue.
>> I rather not.
>>
>> Thanks,
>>
>> C.
>>  
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>   arch/powerpc/sysdev/xive/common.c | 7 +------
>>>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
>>>> index 595310e056f4..b8e456da28aa 100644
>>>> --- a/arch/powerpc/sysdev/xive/common.c
>>>> +++ b/arch/powerpc/sysdev/xive/common.c
>>>> @@ -1335,16 +1335,11 @@ static int xive_prepare_cpu(unsigned int cpu)
>>>>         xc = per_cpu(xive_cpu, cpu);
>>>>       if (!xc) {
>>>> -        struct device_node *np;
>>>> -
>>>>           xc = kzalloc_node(sizeof(struct xive_cpu),
>>>>                     GFP_KERNEL, cpu_to_node(cpu));
>>>>           if (!xc)
>>>>               return -ENOMEM;
>>>> -        np = of_get_cpu_node(cpu, NULL);
>>>> -        if (np)
>>>> -            xc->chip_id = of_get_ibm_chip_id(np);
>>>> -        of_node_put(np);
>>>> +        xc->chip_id = cpu_to_node(cpu);
>>>>           xc->hw_ipi = XIVE_BAD_IRQ;
>>>>             per_cpu(xive_cpu, cpu) = xc;
>>>
>>

