Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7AA42D841
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 13:33:51 +0200 (CEST)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mayzd-0005Nh-Mn
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 07:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mayvd-0003T5-5N
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:29:41 -0400
Received: from 10.mo552.mail-out.ovh.net ([87.98.187.244]:47527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mayva-0002Ya-CR
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 07:29:40 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.210])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id EEFCB21BE3;
 Thu, 14 Oct 2021 11:29:27 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Thu, 14 Oct
 2021 13:29:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0069323e2fc-50dc-4fa2-9531-6187fafc22a7,
 B7F254A9178130F56DF3A81D7C4824236E38FE77) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2c5ec93d-d1d1-5f08-cbf0-513e101114df@kaod.org>
Date: Thu, 14 Oct 2021 13:29:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Is the ppc440 "bamboo" board in QEMU still of any use?
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Huth
 <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>
References: <fc2e00d1-2373-3223-03c8-195585face66@redhat.com>
 <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <80f727b8-9eb0-6a49-e4a7-b2616583c43f@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2ef230dc-1a59-46bf-a92f-344a81a15733
X-Ovh-Tracer-Id: 1483654602790177714
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvdduvddgfeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeefgfejheeuffdvfefgtdelffevhfevveejudevlefgjefhieeuleehueegudejnecuffhomhgrihhnpehnrghrkhhivhgvrdgtohhmpdhkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=87.98.187.244; envelope-from=clg@kaod.org;
 helo=10.mo552.mail-out.ovh.net
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, hpoussin@reactos.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/14/21 12:34, Christophe Leroy wrote:
> 
> 
> Le 14/10/2021 à 11:31, Thomas Huth a écrit :
>>
>>   Hi,
>>
>> I tried to build a current Linux kernel for the "bamboo" board and use it in QEMU, but QEMU then quickly aborts with:
>>
>>   pci.c:262: pci_bus_change_irq_level: Assertion `irq_num >= 0' failed.
>>
>> (or with a "DCR write error" if I try to use the cuImage instead).
>>
>> I googled a little bit and found this discussion:
>>
>> https://qemu-devel.nongnu.narkive.com/vYHona3u/emulating-powerpc-440ep-with-qemu-system-ppcemb#post2
>>
>> Seems like this board was used for KVM on the PPC440 only, and has never been enabled with the TCG emulation?
>>
>> Well, KVM support on the 440 has been removed years ago already:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b2677b8dd8de0dc1496ede4da09b9dfd59f15cea
>>
>> So is this "bamboo" board dead code in QEMU now? Or does anybody still have a kernel binary which could be used for testing it? Note: This board does not support "-bios", so u-boot or other firmwares are certainly also not an option here...
>> Should we mark "bamboo" as deprecated nowadays?
>>
> 
> I have the following change in QEMU to be able to run the bamboo, found it some time ago via google (can't remember where):
> 
> diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
> index 8147ba6f94..600e89e791 100644
> --- a/hw/ppc/ppc4xx_pci.c
> +++ b/hw/ppc/ppc4xx_pci.c
> @@ -246,7 +246,7 @@ static int ppc4xx_pci_map_irq(PCIDevice *pci_dev, int irq_num)
> 
>       trace_ppc4xx_pci_map_irq(pci_dev->devfn, irq_num, slot);
> 
> -    return slot - 1;
> +    return slot ? slot - 1 : slot;
>   }
> 
>   static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)

could you try to use :

static inline int ppce500_pci_map_irq_slot(int devno, int irq_num)
{
     return (devno + irq_num) % 4;
}

Thanks,

C.


