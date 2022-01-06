Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D304868BA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:37:16 +0100 (CET)
Received: from localhost ([::1]:37320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5WhQ-0003km-0h
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:37:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Wfq-0002oQ-5j
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:35:38 -0500
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:58479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n5Wfn-000394-Ai
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:35:37 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7B4BAD607BE9;
 Thu,  6 Jan 2022 18:35:30 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 6 Jan
 2022 18:35:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002498fcceb-6131-455a-a34b-6ee59158ad18,
 49C0EA974A1AE1209641D977CC9A370E508CB387) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7c2672ec-59b6-6c97-96f7-725359ee0446@kaod.org>
Date: Thu, 6 Jan 2022 18:35:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 00/18] user creatable pnv-phb3/pnv-phb4 devices
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-devel@nongnu.org>
References: <20220105212338.49899-1-danielhb413@gmail.com>
 <9d3401ac-70d5-7635-0bce-15f7346eb8a1@kaod.org>
 <ab938e99-5937-daa9-c57e-d17adaa928d4@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <ab938e99-5937-daa9-c57e-d17adaa928d4@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 40be2827-b52c-4492-bc09-f0de84ed6105
X-Ovh-Tracer-Id: 2909888312579558368
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefledguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrvhhiugesghhisghsohhnrdgurhhophgsvggrrhdrihgurdgruh
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/6/22 13:36, Daniel Henrique Barboza wrote:
> 
> 
> On 1/6/22 05:18, Cédric Le Goater wrote:
>> On 1/5/22 22:23, Daniel Henrique Barboza wrote:
>>> Hi,
>>>
>>> This second version was rebased with upstream and includes fixed/amended
>>> versions of relevant patches that were sent to the mailing list and aren't
>>> upstream yet. In this process 4 patches from v1 were discarded, becoming
>>> either irrelevant or squashed into others.
>>>
>>> The patches are organized as follows:
>>>
>>> - patches 1-4: enable user creatable phb3/phb4 root ports
>>
>> Looking closer at models and domain files in libvirt, aren't user
>> creatable phb3/phb4 root ports enough ? Do we really need the
>> pnv-phb3/pnv-phb4 devices to be user created also ?
> 
> We need user creatable phbs for a handful of reasons.
> 
> Let's suppose we go this route and all PHBs are available all the time and user just
> adds root-ports. Using spapr-phb as the closest example of a default PHB that's always
> available, we would need to express the PHBs in the XML. For a 4 socket powernv9 domain
> we would have 24 PHBs in the XML.
> 
> No, hiding them is not an option because it would break assumptions Libvirt makes where all
> PCI controllers are expressed in the XML, and the controller relationship via controller
> indexes are awlays explicit. Having "ghost PHBs" that exists but aren't visible in the
> XML was something that I was having to deal with with user creatable PEC controllers and
> it's both complex to do and and has a good chance of getting NACKed by the community
> because it's too hard to use. So having these default PHBs expressed in the XML would be a
> must.
> 
> So right off the bat, for a 1 socket powernv9 machine, we'll have 6 phbs that will need
> to be in the XML regardless of being used or not. And for each socket added/remove we'll
> have to add/remove default PHBs available in the domain XML. So if the user starts with
> 1 sockets, and then adds a root port, the XML can look similar to this:
> 
>      <controller type='pci' index='0' model='pcie-root'/>
>      <controller type='pci' index='1' model='pcie-root'/>
>      <controller type='pci' index='2' model='pcie-root'/>
>      <controller type='pci' index='3' model='pcie-root'/>
>      <controller type='pci' index='4' model='pcie-root'/>
>      <controller type='pci' index='5' model='pcie-root'/>
>      <controller type='pci' index='6' model='pcie-root-port'/>
>      (... user adds more controllers with index=7,8 ...)
> 
> Now if the user adds another socket we have a problem. The root ports and other devices will
> be using controller indexes that the default PHBs would use. The user did a CPU topology
> change and now will have to adjust PCI topology as a result. Similar complications will
> happen if the user then removes a socket from the domain.
> 
> Now, with user creatable PHBs, the situation above will be expressed like:
> 
> 
>      <controller type='pci' index='0' model='pcie-root'/>
>        <model name='pnv-phb4'/>
>        <target index='4' chip-id='0'/>
>      </controller>
>      <controller type='pci' index='1' model='pcie-root-port'/>
>      (... user adds more controllers with index=2,3 ...)
> 
> If the user adds 4 sockets this doesn't change because Libvirt is creating a single PHB and
> renaming it to 'pcie.0' to be consistent. If the user decides, in a 2 socket pnv9 domain, to use
> the PHB that belongs to the second chip, the only change is the chip-id element:
> 
> 
>      <controller type='pci' index='0' model='pcie-root'/>
>        <model name='pnv-phb4'/>
>        <target index='4' chip-id='1'/>
>      </controller>
>      <controller type='pci' index='1' model='pcie-root-port'/>
>      (... user adds more controllers with index=2,3 ...)
> 
> If the user then removes the socket the domain will error out when starting because you're creating a
> PHB with a wrong chip-id. A simple matter of changing the chip-id value while retaining the PCI topology
> as is, without needing to reassign controller indexes all over again.
> 
> Another big deal is to able to rename buses. Libvirt uses 'pcie.N' with these controllers,
> we're using 'pnv-phb3/4-root-bus'. Without user creatable PHBs we would be signing a contract
> with Libvirt that we will never rename these buses in QEMU side again, once Libvirt starts
> support it, because now Libvirt is counting on this info to correctly assign the root ports to
> the specific PHBs. Being able to rename the buses is also crucial for the PCI topology
> consistency I commented above.
> 
> There's also a good argument about long term extensibility. We're doing a lot of work in the
> QEMU side but we'll be able to later on the road, for instance, support multiple root-ports in
> the same PHB, or even devices other than root-ports in PHBs, device hotplug and so on with
> minimal - and most important, backward friendly - Libvirt changes. Having default PHBs appearing
> all the time will force us to make several assumptions that we wouldn't be able to break later on,
> and probably will break older domains that were created before the changes.
> 
> 
> I am probably forgetting more problems that this would cause in Libvirt. But at last, but definitely
> not the least for the implementation of the Libvirt side, we (in this case, I) would need to make lots
> and lots of code to support default PHBs that can be added/removed via SMP changes, while trying to
> keep existing PCI topologies minimally consistent, with lots of documentation explaining why are we
> adding/removing default PHBs due to SMP changes, and in the end the user experience would still
> be awkward.
> 
> 
> Enabling user creatable pnv-phb3/phb4 is the way for Libvirt support, and I daresay it also makes
> for an improved QEMU experience as well. If I want a -nodefaults machine with 4 sockets but only 2 PHBs
> I can do that after this series. Decopling SMP from PCI topology has advantages outside of Libvirt
> support.
Thanks for this detailed explanation. I am convinced !
> - patches 5-10: enable user creatable pnv-phb3 devices

These are fine. No need to resend.

> - patches 11-18: enable user creatable pnv-phb4 devices

patches 11-17 need some care. 18 is fine.

>>> Here are some examples of what we're able to do with this series:
>>>
>>> * powernv8 machine with -nodefaults,2 pnv-phb3s with 'pcie.N' name,
>>> one of them with a root port and a netcard:
>>>
>>> $ qemu-system-ppc64 -m 4G -machine powernv8,accel=tcg -smp 2,cores=2,threads=1 \
>>> -bios skiboot.lid  -kernel vmlinux -initrd buildroot.rootfs.cpio \
>>> -append 'console=hvc0 ro xmon=on' \
>>> -nodefaults \
>>> -serial mon:stdio -nographic \
>>> -device pnv-phb3,chip-id=0,index=0,id=pcie.0 \
>>> -device pnv-phb3,chip-id=0,index=2,id=pcie.2 \
>>> -device pnv-phb3-root-port,bus=pcie.2,id=pcie.5 \
>>> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
>>> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=pcie.5,addr=0x0
>>>
>>> * powernv9 machine with -nodefaults, 3 of the available 12 pnv-phb4 devices
>>> created, 2 root ports, one of the port with a pcie-pci-bridge and
>>> devices connected in the bridge:
>>>
>>> $ qemu-system-ppc64 -m 4G -machine powernv9 \
>>> -smp 2,sockets=2,cores=1,threads=1 \
>>> -accel tcg,thread=multi -bios skiboot.lid \
>>> -kernel vmlinux -initrd buildroot.rootfs.cpio \
>>> -append 'console=hvc0 ro xmon=on' \
>>> -nodefaults \
>>> -serial mon:stdio -nographic \
>>> -device pnv-phb4,chip-id=0,index=0,id=pcie.0 \
>>> -device pnv-phb4,chip-id=0,index=4,id=pcie.1 \
>>> -device pnv-phb4,chip-id=1,index=3,id=pcie.2 \
>>> -device pnv-phb4-root-port,id=root0,bus=pcie.2 \
>>> -device pnv-phb4-root-port,id=root1,bus=pcie.1 \
>>> -device pcie-pci-bridge,id=bridge1,bus=root0,addr=0x0 \
>>> -device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234 \
>>> -drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none \
>>> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
>>> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
>>> -device nec-usb-xhci,bus=bridge1,addr=0x2
>>>
>>>
>>> * powernv8/9 with default settings can be used as usual. The work done
>>> in this series didn't change the name of the buses created by the
>>> default root ports (named pcie.0...N):
>>>
>>> $ qemu-system-ppc64 -m 4G \
>>> -machine powernv9 -smp 2,sockets=2,cores=1,threads=1  \
>>> -accel tcg,thread=multi -bios skiboot.lid  \
>>> -kernel vmlinux -initrd buildroot.rootfs.cpio \
>>> -append 'console=hvc0 ro xmon=on' \
>>> -serial mon:stdio -nographic \
>>> -device pcie-pci-bridge,id=bridge1,bus=pcie.0,addr=0x0 \
>>> -device nvme,bus=bridge1,addr=0x1,drive=drive0,serial=1234  \
>>> -drive file=./simics-disk.raw,if=none,id=drive0,format=raw,cache=none \
>>> -device e1000e,netdev=net0,mac=C0:ff:EE:00:01:04,bus=bridge1,addr=0x3 \
>>> -netdev bridge,helper=/usr/libexec/qemu-bridge-helper,br=virbr0,id=net0 \
>>> -device nec-usb-xhci,bus=bridge1,addr=0x2

Could we capture some of these command lines in the documentation ? with some
of the details above ?

Thanks,

C.

