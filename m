Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4226512D5B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 09:52:31 +0200 (CEST)
Received: from localhost ([::1]:44434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njywx-00066g-1O
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 03:52:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njydA-0002je-LY
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:32:04 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:38199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1njyd8-0002Gn-I5
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 03:32:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id D511EFAE5D5A;
 Thu, 28 Apr 2022 09:31:58 +0200 (CEST)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 28 Apr
 2022 09:31:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S00115ceae69-2165-434f-922c-4a1f581a6dfa,
 964B4B5EE68C69CB799E8147BBEA8F01A3367603) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bb63dd32-587e-7f44-6558-aecee086f1a6@kaod.org>
Date: Thu, 28 Apr 2022 09:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH qemu] spapr_pci: Disable IRQFD resampling on XIVE
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, <qemu-ppc@nongnu.org>
References: <20220427043651.1162403-1-aik@ozlabs.ru>
 <880cdd91-3a4a-8c35-1357-d3858950db44@kaod.org>
 <5fa3c59b-de8e-c428-43f1-eb4d698e835a@ozlabs.ru>
 <fcb5a8c0-385b-29c6-4573-6ee09f36a9e4@kaod.org>
 <b490310d-debb-fd92-73cd-de9558157098@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <b490310d-debb-fd92-73cd-de9558157098@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 054d719e-f45d-4590-af75-bf925d0d05a5
X-Ovh-Tracer-Id: 4822792253408709481
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdduvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 09:26, Alexey Kardashevskiy wrote:
> 
> 
> On 4/28/22 16:25, Cédric Le Goater wrote:
>> On 4/28/22 07:32, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 4/27/22 17:36, Cédric Le Goater wrote:
>>>> Hello Alexey,
>>>>
>>>> On 4/27/22 06:36, Alexey Kardashevskiy wrote:
>>>>> VFIO-PCI has an "KVM_IRQFD_FLAG_RESAMPLE" optimization for INTx EOI
>>>>> handling when KVM can unmask PCI INTx (level triggered interrupt) without
>>>>> switching to the userspace (==QEMU).
>>>>>
>>>>> Unfortunately XIVE does not support level interrupts, 
>>>>
>>>> That's not correctly phrased I think.
>>>
>>>
>>> My bad, I meant "XIVE hardware".
>>
>> ok. It makes more sense.
>>
>> PSIHB and PHBs have internal latches to maintain the assertion level.
>> XIVE has none.
>>
>>
>>>
>>>>
>>>> The QEMU XIVE device support LSIs but the POWER9 kernel-irqchips,
>>>> KVM XICS-on-XIVE and XIVE native devices, are broken with respect
>>>> to passthrough adapters using INTx.
>>>>
>>>>
>>>>> QEMU emulates them
>>>>> and therefore there is no existing code path to kick the resamplefd.
>>>>> The problem appears when passing through a PCI adapter with
>>>>> the "pci=nomsi" kernel parameter - the adapter's interrupt interrupt
>>>>> count in /proc/interrupts will stuck at "1".
>>>>>
>>>>> This disables resampler when the XIVE interrupt controller is configured.
>>>>> This should not be very visible though KVM already exits to QEMU for INTx
>>>>> and XIVE-capable boxes (POWER9 and newer) do not seem to have
>>>>> performance-critical INTx-only capable devices.
>>>>>
>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>> ---
>>>>>
>>>>>
>>>>> Cédric, this is what I meant when I said that spapr_pci.c was unaware of
>>>>> the interrupt controller type, neither xics nor xive was mentioned
>>>>> in the file before.
>>>>>
>>>>>
>>>>> ---
>>>>>   hw/ppc/spapr_pci.c | 14 +++++++++++---
>>>>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
>>>>> index 5bfd4aa9e5aa..2675052601db 100644
>>>>> --- a/hw/ppc/spapr_pci.c
>>>>> +++ b/hw/ppc/spapr_pci.c
>>>>> @@ -729,11 +729,19 @@ static void pci_spapr_set_irq(void *opaque, int irq_num, int level)
>>>>>   static PCIINTxRoute spapr_route_intx_pin_to_irq(void *opaque, int pin)
>>>>>   {
>>>>> +    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
>>>>>       SpaprPhbState *sphb = SPAPR_PCI_HOST_BRIDGE(opaque);
>>>>> -    PCIINTxRoute route;
>>>>> +    PCIINTxRoute route = { .mode = PCI_INTX_DISABLED };
>>>>> -    route.mode = PCI_INTX_ENABLED;
>>>>> -    route.irq = sphb->lsi_table[pin].irq;
>>>>> +    /*
>>>>> +     * Disable IRQFD resampler on XIVE as it does not support LSI and QEMU
>>>>> +     * emulates those so the KVM kernel resamplefd kick is skipped and EOI
>>>>> +     * is not delivered to VFIO-PCI.
>>>>> +     */
>>>>> +    if (!spapr->xive) {
>>>>
>>>> This is testing the availability of the XIVE interrupt mode, but not
>>>> the activate controller. See spapr_irq_init() which is called very
>>>> early in the machine initialization.
>>>>
>>>> Is that what we want ? Is everything fine if we start the machine with
>>>> ic-mode=xics ? On a POWER9 host, this would use the KVM XICS-on-XIVE
>>>> device which is broken also AFAICT.
>>>
>>> I should probably fix that in KVM, just not quite sure yet how for the realmode handlers, or just drop those on P9 and then the fix is trivial.
>>>
>>>
>>>> You should extend the SpaprInterruptControllerClass (for a routine) or
>>>> simply SpaprIrq (for a bool) if you need to handle IRQ matters from a
>>>> device model.
>>>
>>> It is a property of KVM rather than the interrupt controller so it probably makes more sense to just stop advertising KVM_CAP_IRQFD_RESAMPLE. Hmmm...
>>
>> I would fix the realmode handlers of the the KVM XICS-on-XIVE device
>> first. The problem has been there for a while.
> 
> 
> Are they really used on POWER9? TCE ones are not.

The HCALLs should be.

>> Then, for the XIVE native mode, I would simply handle it at the QEMU
>> level with a 'resample' bool in SpaprIrq. It  would be tested in spapr
>> pci when configuring the INTx routing.
> 
> 
> But there is a dedicated CAP advertised by the KVM already which is not correct as we know that KVM won't resample.

You know more that I do in that area now.

C.

  
> 
>>
>>
>> Thanks,
>>
>> C.
>>


