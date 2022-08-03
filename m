Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C7588811
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 09:38:06 +0200 (CEST)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ8xB-0000Jy-K6
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 03:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oJ8u4-0005sm-Kd; Wed, 03 Aug 2022 03:34:52 -0400
Received: from 5.mo552.mail-out.ovh.net ([188.165.45.220]:38563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1oJ8u2-0000wD-5a; Wed, 03 Aug 2022 03:34:52 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.233])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 0793522B45;
 Wed,  3 Aug 2022 07:34:47 +0000 (UTC)
Received: from kaod.org (37.59.142.109) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 3 Aug 2022
 09:34:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-109S00398f634fc-5bbd-430d-85a4-87577f7bdac6,
 CC7AE06ED68251E997EA4638F74AFDA4D8EEB002) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <95648a1a-eb90-c02a-a84e-58c448e50e07@kaod.org>
Date: Wed, 3 Aug 2022 09:34:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/19] ppc/ppc405: Introduce a PPC405 generic machine
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>
CC: <qemu-devel@nongnu.org>, BALATON Zoltan <balaton@eik.bme.hu>
References: <20220801131039.1693913-1-clg@kaod.org>
 <20220801131039.1693913-3-clg@kaod.org>
 <f7842a60-3aaf-6a8d-4abb-ede45fd2c381@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f7842a60-3aaf-6a8d-4abb-ede45fd2c381@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.109]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6047d459-546d-4c78-a4a0-c5d76f0ef5cc
X-Ovh-Tracer-Id: 2672323430969347040
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddviedguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhupdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/22 21:07, Daniel Henrique Barboza wrote:
> 
> 
> On 8/1/22 10:10, Cédric Le Goater wrote:
>> We will use this machine as a base to define the ref405ep and possibly
>> the PPC405 hotfoot board as found in the Linux kernel.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
>>   1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 1a4e7588c584..4c269b6526a5 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -50,6 +50,15 @@
>>   #define USE_FLASH_BIOS
>> +struct Ppc405MachineState {
>> +    /* Private */
>> +    MachineState parent_obj;
>> +    /* Public */
>> +};
>> +
>> +#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
>> +
>>   /*****************************************************************************/
>>   /* PPC405EP reference board (IBM) */
>>   /* Standalone board with:
>> @@ -332,18 +341,34 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>>       mc->desc = "ref405ep";
>>       mc->init = ref405ep_init;
>> -    mc->default_ram_size = 0x08000000;
>> -    mc->default_ram_id = "ef405ep.ram";
>>   }
>>   static const TypeInfo ref405ep_type = {
>>       .name = MACHINE_TYPE_NAME("ref405ep"),
>> -    .parent = TYPE_MACHINE,
>> +    .parent = TYPE_PPC405_MACHINE,
>>       .class_init = ref405ep_class_init,
>>   };
>> +static void ppc405_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>> +    mc->desc = "PPC405 generic machine";
>> +    mc->default_ram_size = 0x08000000;
>> +    mc->default_ram_id = "ppc405.ram";
> 
> 
> I don't mind changing the default_ram_id from "ef405ep.ram" to "ppc405.ram",
> but since we're renaming it, might as well rename the remaining instances
> of ef405ep.ram:
> 
> $ git grep 'ef405ep.ram'
> hw/ppc/ppc405_uc.c:                             "ef405ep.ram.alias", s->dram_mr, 0, s->ram_size);
> hw/ppc/ppc405_uc.c:    memory_region_init(&s->ram_memories[1], OBJECT(s), "ef405ep.ram1", 0);

Sure. I will clean that up also.

Thanks,

C.


> 
> I believe these can be renamed to "ppc405.ram.alias" and "ppc405.ram1" in
> patch 05.
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
>> +}
>> +
>> +static const TypeInfo ppc405_machine_type = {
>> +    .name = TYPE_PPC405_MACHINE,
>> +    .parent = TYPE_MACHINE,
>> +    .instance_size = sizeof(Ppc405MachineState),
>> +    .class_init = ppc405_machine_class_init,
>> +    .abstract = true,
>> +};
>> +
>>   static void ppc405_machine_init(void)
>>   {
>> +    type_register_static(&ppc405_machine_type);
>>       type_register_static(&ref405ep_type);
>>   }


