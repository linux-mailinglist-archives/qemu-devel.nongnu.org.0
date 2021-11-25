Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545E245D62D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:28:49 +0100 (CET)
Received: from localhost ([::1]:53478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqA7b-0007Kb-Tb
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:28:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mq9rC-000768-1S
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:11:50 -0500
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:34881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mq9r9-000160-6u
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:11:49 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.28])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 3256021C5D;
 Thu, 25 Nov 2021 08:11:36 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 25 Nov
 2021 09:11:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004136db5b4-9d29-4649-a746-f2fca314216d,
 AF2EA5E2EB7DD02CCE15CE75BB525ABEFFBF2660) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.17
Message-ID: <68bd9d8a-b46b-b2a9-f48b-54a962e173a7@kaod.org>
Date: Thu, 25 Nov 2021 09:11:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the G4
 family
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Fabiano Rosas <farosas@linux.ibm.com>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <48c4262-ff7d-2897-9764-cadd98683e97@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bdfc57d2-d873-41c4-9eb9-37a3835e484f
X-Ovh-Tracer-Id: 4987455113657944937
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrgeelgdduudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepffekuddvgfeigfffuefgueevledutefhhfetvdejleefvddvkeehueegudehtdffnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhdpfihikhhiphgvughirgdrohhrghdpnhhonhhgnhhurdhorhhgpdgsmhgvrdhhuhdpohhsughnrdhnvghtpdhrvggrughthhgvughotghsrdhiohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: openbios@openbios.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 01:45, BALATON Zoltan wrote:
> On Wed, 24 Nov 2021, Fabiano Rosas wrote:
>> Fabiano Rosas <farosas@linux.ibm.com> writes:
>>
>>> Hi all,
>>>
>>> We have this bug in QEMU which indicates that we haven't been able to
>>> run openbios on a 7450 cpu for quite a long time:
>>>
>>> https://gitlab.com/qemu-project/qemu/-/issues/86
>>>
>>> OK:
>>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410
>>>
>>>  >> =============================================================
>>>  >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>>   ...
>>>
>>> NOK:
>>>   $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int
> 
> This CPU appears in PowerMac G4 so maybe better use -machine mac99,via=pmu with it as it's strange to put it in a g3beige but that may not matter for reproducing the problem.
> 
> As for guests, those running on the said PowerMac G4 should have support for these CPUs so maybe you can try some Mac OS X versions (or maybe MorphOS but that is not the best for debugging as there's no source available nor any help from its owners but just to see if it boots it may be sufficient, it should work on real PowerMac G4). According to <https://en.wikipedia.org/wiki/PowerPC_G4#PowerPC_7450> this CPU was used in <https://en.wikipedia.org/wiki/Power_Mac_G4#Digital_Audio/Quicksilver> and it runs up to Mac OS 10.4.11. (Although OpenBIOS sets the device tree according to a PowerMac3,1 so not sure it's entirely correct for the PowerMac3,5 that has a 7450 CPU and if it matters for Mac OS X.)
> 
> I asked about this before but got no reply back then:
> https://lists.nongnu.org/archive/html/qemu-ppc/2020-03/msg00292.html
> 
> This was because pegasos2 should have 7447 but it did not work so currently I've set it to 7400 which also works. The original board firmware had some problem detecting it but I think that only results in wrong CPU speed shown which is only a cosmetic problem, otherwise it seems to work. Since pegasos2 does not use OpenBIOS but either VOF or the board's original firmware it may be an alternative way to test at least 7447 which the firmware and guests running on that board should work with. At least Debian 8.11 powerpc version had support for pegasos2 and should boot, I'm not sure newer versions still work. More info on pegasos2 can be found at:
> http://zero.eik.bme.hu/~balaton/qemu/amiga/#morphos and
> https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2

I would be nice to add some documentation for these machines under :

   https://qemu.readthedocs.io/en/latest/system/target-ppc.html

Thanks

C.

> 
> I don't remember what problem I had with 7447 but if it does not work with pegasos2 then maybe there's some other problem with it too. I think it was maybe related to TLBs but I don't know and had no time to try again so I could be entirely wrong about this.
> 
> Regards,
> BALATON Zoltan
> 
>>>   Raise exception at fff08cc4 => 0000004e (00)
>>>   QEMU: Terminated
>>>
>>> The actual issue is straightforward. There is a non-architected
>>> feature that QEMU has enabled by default that openbios doesn't know
>>> about. From the user manual:
>>>
>>> "The MPC7540 has a set of implementation-specific registers,
>>> exceptions, and instructions that facilitate very efficient software
>>> searching of the page tables in memory for when software table
>>> searching is enabled (HID0[STEN] = 1). This section describes those
>>> resources and provides three example code sequences that can be used
>>> in a MPC7540 system for an efficient search of the translation tables
>>> in software. These three code sequences can be used as handlers for
>>> the three exceptions requiring access to the PTEs in the page tables
>>> in memory in this case-instruction TLB miss, data TLB miss on load,
>>> and data TLB miss on store exceptions."
>>>
>>> The current state:
>>>
>>> 1) QEMU does not check HID0[STEN] and makes the feature always enabled
>>> by setting these cpus with the POWERPC_MMU_SOFT_74xx MMU model,
>>> instead of the generic POWERPC_MMU_32B.
>>>
>>> 2) openbios does not recognize the PVRs for those cpus and also does
>>> not have any handlers for the software TLB exceptions (vectors 0x1000,
>>> 0x1100, 0x1200).
>>>
>>> Some assumptions (correct me if I'm wrong please):
>>>
>>> - openbios is the only firmware we use for the following cpus: 7441,
>>> 7445, 7450, 7451, 7455, 7457, 7447, 7447a, 7448.
>>> - without openbios, we cannot have a guest running on these cpus.
>>>
>>> So to bring 7450 back to life we would need to either:
>>>
>>> a) find another firmware/guest OS code that supports the feature;
>>>
>>> b) implement the switching of the feature in QEMU and have the guest
>>> code enable it only when supported. That would take some fiddling with
>>> the MMU code to: merge POWERPC_MMU_SOFT_74xx into POWERPC_MMU_32B,
>>> check the HID0[STEN] bit, figure out how to switch from HW TLB miss to
>>> SW TLB miss on demand, block access to the TLBMISS register (and
>>> others) when the feature is off, and so on;
>>>
>>> c) leave the feature enabled in QEMU and implement the software TLB
>>> miss handlers in openbios. The UM provides sample code, so this is
>>> easy;
>>>
>>> d) remove support for software TLB search for the 7450 family and
>>> switch the cpus to the POWERPC_MMU_32B model. This is by far the
>>> easiest solution, but could cause problems for any (which?) guest OS
>>> code that actually uses the feature. All of the existing code for the
>>> POWERPC_MMU_SOFT_74xx MMU model would probably be removed since it
>>> would be dead code then;
>>>
>>> Option (c) seemed to me like a good compromise so this is a patch
>>> series for openbios doing that and also adding the necessary PVRs so
>>> we can get a working guest with these cpus without too much effort.
>>>
>>> I have also a patch for QEMU adding basic sanity check tests for the
>>> 7400 and 7450 families. I'll send that separately to the QEMU ml.
>>>
>>> Fabiano Rosas (2):
>>>   ppc: Add support for MPC7450 software TLB miss interrupts
>>>   ppc: Add PVRs for the MPC7450 family
>>>
>>>  arch/ppc/qemu/init.c  |  52 ++++++++++
>>>  arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
>>>  2 files changed, 285 insertions(+), 3 deletions(-)
>>
>> (Adding Mark because his email got somehow dropped from the original
>> message)
>>
>> So with these patches in OpenBIOS we could get a bit further and call
>> into the Linux kernel using the same image as the one used for the
>> 7400. However there seems to be no support for the 7450 software TLB in
>> the kernel. There are only handlers for the 4xx, 8xx and 603 which are
>> different code altogether. There's no mention of the TLBMISS and
>> PTEHI/LO registers in the code as well.
>>
>> Do we know of any guest OS that implements the 7450 software TLB at
>> vectors 0x1000, 0x1100 and 0x1200? Otherwise replacing the
>> POWERPC_MMU_SOFT_74xx model with POWERPC_MMU_32B might be the only way
>> of getting an OS to run in the 7450 family.
>>
>>


