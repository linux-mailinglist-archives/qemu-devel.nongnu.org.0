Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7920045E989
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 09:42:10 +0100 (CET)
Received: from localhost ([::1]:48670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqWo5-0007RE-DQ
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 03:42:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqWmj-0006Ii-En
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 03:40:48 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:47637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mqWmh-0006yI-6Y
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 03:40:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E5A3BCE17C82;
 Fri, 26 Nov 2021 09:40:39 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 26 Nov
 2021 09:40:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00388691438-2b01-4b42-ac04-94ec0df47872,
 B8303126CBA279BD35B7DF0844B381DDFAFB7782) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <115484b4-63ff-a40f-050a-931ba988688e@kaod.org>
Date: Fri, 26 Nov 2021 09:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 0/2] QEMU/openbios: PPC Software TLB support in the G4
 family
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Fabiano Rosas
 <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211119134431.406753-1-farosas@linux.ibm.com>
 <87pmqpqknn.fsf@linux.ibm.com>
 <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4fe55b44-6549-04d7-b381-aee88499d6a3@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 02fe6cd2-6fb9-4220-8caf-04155c6ef85d
X-Ovh-Tracer-Id: 11351041386973334377
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrhedugdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekkeefheefvdefhefgjeelveekheeileehudevkeefvdfhleetiedvffdtudeknecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/26/21 09:01, Mark Cave-Ayland wrote:
> On 24/11/2021 22:00, Fabiano Rosas wrote:
> 
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
>>>    $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7410
>>>
>>>    >> =============================================================
>>>    >> OpenBIOS 1.1 [Nov 1 2021 20:36]
>>>    ...
>>>
>>> NOK:
>>>    $ ./qemu-system-ppc -serial mon:stdio -nographic -cpu 7450 -d int
>>>    Raise exception at fff08cc4 => 0000004e (00)
>>>    QEMU: Terminated
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
>>>    ppc: Add support for MPC7450 software TLB miss interrupts
>>>    ppc: Add PVRs for the MPC7450 family
>>>
>>>   arch/ppc/qemu/init.c  |  52 ++++++++++
>>>   arch/ppc/qemu/start.S | 236 +++++++++++++++++++++++++++++++++++++++++-
>>>   2 files changed, 285 insertions(+), 3 deletions(-)
>>
>> (Adding Mark because his email got somehow dropped from the original
>> message)
> 
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
> 
> My experience of anything other than the default CPUs used on the PPC Mac machines is basically zero, so you're certainly in new territory :)
> 
> I could live with your proposed solution c) although it would be nice to guard the extra vectors so that they remain uninitialised for the non-7450 CPUs. My main question is if the kernel itself doesn't support software TLBs then does adding the new code help at all? 

yes, it helps to boot Linux and MacOS (9 and 10) on those CPUs but you still
need to replace the mmu model to POWERPC_MMU_32B in QEMU.

> Or are you eventually planning for solution b) to improve QEMU's 7450 CPU 
> emulation for developers without real hardware?

b) would be nice to have but since we don't have any images using it, may
be it's time to drop support from QEMU.

Thanks

C.

