Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5FA34D3FE
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 17:34:00 +0200 (CEST)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQttt-0004tP-Ns
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 11:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lQtsb-0004Lc-Ux; Mon, 29 Mar 2021 11:32:38 -0400
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:53391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lQtsY-0002Gc-2Y; Mon, 29 Mar 2021 11:32:37 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.235])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 601AB279A59;
 Mon, 29 Mar 2021 17:32:27 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 29 Mar
 2021 17:32:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006fb642d15-ef6f-4878-8c55-dc93f6b6befe,
 8BF819BD6DA5614ACA9E0FB600EB83BC0C5CC0F8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 1/2] spapr: number of SMP sockets must be equal to NUMA
 nodes
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210319183453.4466-1-danielhb413@gmail.com>
 <20210319183453.4466-2-danielhb413@gmail.com>
 <YFk+fkK6KVN8ZiQK@yekko.fritz.box>
 <2025f26f-5883-4e86-02af-5b83a8d52465@gmail.com>
 <YFvxAW3l4t+YznEm@yekko.fritz.box>
 <d13d3c70-6f12-713e-6995-070292cb30c6@kaod.org>
 <YGFVc2lBhvzm5CSa@yekko.fritz.box>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9870aaba-9921-5c5d-113c-5be6cd098cf2@kaod.org>
Date: Mon, 29 Mar 2021 17:32:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YGFVc2lBhvzm5CSa@yekko.fritz.box>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 27deb79f-ce3a-41f0-bbc0-29fa7441c958
X-Ovh-Tracer-Id: 17513091576397466546
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudehkedgleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieelfeduteegjefgfeevvdegkedtledukeelhefhudfgudehffehfeetgeetuddvnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/29/21 6:20 AM, David Gibson wrote:
> On Thu, Mar 25, 2021 at 09:56:04AM +0100, Cédric Le Goater wrote:
>> On 3/25/21 3:10 AM, David Gibson wrote:
>>> On Tue, Mar 23, 2021 at 02:21:33PM -0300, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 3/22/21 10:03 PM, David Gibson wrote:
>>>>> On Fri, Mar 19, 2021 at 03:34:52PM -0300, Daniel Henrique Barboza wrote:
>>>>>> Kernel commit 4bce545903fa ("powerpc/topology: Update
>>>>>> topology_core_cpumask") cause a regression in the pseries machine when
>>>>>> defining certain SMP topologies [1]. The reasoning behind the change is
>>>>>> explained in kernel commit 4ca234a9cbd7 ("powerpc/smp: Stop updating
>>>>>> cpu_core_mask"). In short, cpu_core_mask logic was causing troubles with
>>>>>> large VMs with lots of CPUs and was changed by cpu_cpu_mask because, as
>>>>>> far as the kernel understanding of SMP topologies goes, both masks are
>>>>>> equivalent.
>>>>>>
>>>>>> Further discussions in the kernel mailing list [2] shown that the
>>>>>> powerpc kernel always considered that the number of sockets were equal
>>>>>> to the number of NUMA nodes. The claim is that it doesn't make sense,
>>>>>> for Power hardware at least, 2+ sockets being in the same NUMA node. The
>>>>>> immediate conclusion is that all SMP topologies the pseries machine were
>>>>>> supplying to the kernel, with more than one socket in the same NUMA node
>>>>>> as in [1], happened to be correctly represented in the kernel by
>>>>>> accident during all these years.
>>>>>>
>>>>>> There's a case to be made for virtual topologies being detached from
>>>>>> hardware constraints, allowing maximum flexibility to users. At the same
>>>>>> time, this freedom can't result in unrealistic hardware representations
>>>>>> being emulated. If the real hardware and the pseries kernel don't
>>>>>> support multiple chips/sockets in the same NUMA node, neither should we.
>>>>>>
>>>>>> Starting in 6.0.0, all sockets must match an unique NUMA node in the
>>>>>> pseries machine. qtest changes were made to adapt to this new
>>>>>> condition.
>>>>>
>>>>> Oof.  I really don't like this idea.  It means a bunch of fiddly work
>>>>> for users to match these up, for no real gain.  I'm also concerned
>>>>> that this will require follow on changes in libvirt to not make this a
>>>>> really cryptic and irritating point of failure.
>>>>
>>>> Haven't though about required Libvirt changes, although I can say that there
>>>> will be some amount to be mande and it will probably annoy existing users
>>>> (everyone that has a multiple socket per NUMA node topology).
>>>>
>>>> There is not much we can do from the QEMU layer aside from what I've proposed
>>>> here. The other alternative is to keep interacting with the kernel folks to
>>>> see if there is a way to keep our use case untouched.
>>>
>>> Right.  Well.. not necessarily untouched, but I'm hoping for more
>>> replies from Cédric to my objections and mpe's.  Even with sockets
>>> being a kinda meaningless concept in PAPR, I don't think tying it to
>>> NUMA nodes makes sense.
>>
>> I did a couple of replies in different email threads but maybe not 
>> to all. I felt it was going nowhere :/ Couple of thoughts,
> 
> I think I saw some of those, but maybe not all.
> 
>> Shouldn't we get rid of the socket concept, die also, under pseries 
>> since they don't exist under PAPR ? We only have numa nodes, cores, 
>> threads AFAICT.
> 
> Theoretically, yes.  I'm not sure it's really practical, though, since
> AFAICT, both qemu and the kernel have the notion of sockets (though
> not dies) built into generic code.

Yes. But, AFAICT, these topology notions have not reached "arch/powerpc" 
and PPC Linux only has a NUMA node id, on pseries and powernv.

> It does mean that one possible approach here - maybe the best one - is
> to simply declare that sockets are meaningless under, so we simply
> don't expect what the guest kernel reports to match what's given to
> qemu.
> 
> It'd be nice to avoid that if we can: in a sense it's just cosmetic,
> but it is likely to surprise and confuse people.
> 
>> Should we diverged from PAPR and add extra DT properties "qemu,..." ?
>> There are a couple of places where Linux checks for the underlying 
>> hypervisor already.
>>
>>>> This also means that
>>>> 'ibm,chip-id' will probably remain in use since it's the only place where
>>>> we inform cores per socket information to the kernel.
>>>
>>> Well.. unless we can find some other sensible way to convey that
>>> information.  I haven't given up hope for that yet.
>>
>> Well, we could start by fixing the value in QEMU. It is broken
>> today.
> 
> Fixing what value, exactly?

The value of the "ibm,chip-id" since we are keeping the property under
QEMU.

>> This is all coming from some work we did last year to evaluate our HW 
>> (mostly for XIVE) on 2s, 4s, 16s systems on baremetal, KVM and PowerVM. 
>> We saw some real problems because Linux did not have a clear view of the 
>> topology. See the figures here : 
>>
>> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210303174857.1760393-9-clg@kaod.org/
>>
>> The node id is a key parameter for system resource management, memory 
>> allocation, interrupt affinity, etc. Linux scales much better if used
>> correctly.
> 
> Well, sure.  And we have all the ibm,associativity stuff to convey the
> node ids to the guest (which has its own problems, but not that are
> relevant here).  What's throwing me is why getting node IDs correct
> has anything to do with socket numbers.



