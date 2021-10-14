Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F172942DEDF
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 18:06:32 +0200 (CEST)
Received: from localhost ([::1]:60640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb3FY-0006QX-2O
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 12:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mb39f-0001RE-RR
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:00:27 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:48807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mb39d-0004pY-GL
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 12:00:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.56])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5DE8E228BB;
 Thu, 14 Oct 2021 16:00:20 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 14 Oct
 2021 18:00:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00305132254-4606-4574-bea5-d57867074eae,
 B7F254A9178130F56DF3A81D7C4824236E38FE77) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <944ad2d1-2a59-689a-2e87-531ca101c7d3@kaod.org>
Date: Thu, 14 Oct 2021 18:00:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Thomas Huth <thuth@redhat.com>, David
 Gibson <david@gibson.dropbear.id.au>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
 <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
 <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <836a36f7-936b-ec36-f8e8-472bcec3970f@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ce319d04-7ba9-46e2-b931-1efa0fcb6b91
X-Ovh-Tracer-Id: 6058467401879161845
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduvddgleegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 17:26, Philippe Mathieu-Daudé wrote:
> On 10/14/21 13:29, Cédric Le Goater wrote:
>> On 10/14/21 12:34, Christophe Leroy wrote:
> 
>>> I have the following change in QEMU to be able to run the bamboo,
>>> found it some time ago via google (can't remember where):
>>>
>>> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
>>> index 8147ba6f94..600e89e791 100644
>>> --- a/hw/ppc/ppc4xx_pci.c
>>> +++ b/hw/ppc/ppc4xx_pci.c
>>> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev,
>>> int irq_num)
>>>
>>>        trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
>>>
>>> -    return slot - 1;
>>> +    return slot ? slot - 1 : slot;
>>>    }
>>>
>>>    static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
>>
>> could you try to use :
>>
>> static inline int ppce500_pci_map_irq_slot(int devno, int irq_num)
>> {
>>      return (devno + irq_num) % 4;
>> }
> 
> Is this pci_swizzle()?

Hey it's a pre pci_swizzle() version :)

I guess all these PPC PCI models should be using this pci_swizzle()
routine.

Thanks Philippe.

C.



