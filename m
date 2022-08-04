Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D73589762
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 07:45:32 +0200 (CEST)
Received: from localhost ([::1]:39902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJTfn-0001ut-4G
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 01:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTbF-0007Q0-Vk
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:40:49 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:40115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oJTbD-0004Rr-I4
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 01:40:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.220])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B016123462;
 Thu,  4 Aug 2022 05:40:43 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 4 Aug 2022
 07:40:42 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0010b5cefe1-38b3-4b3e-ae3d-badc0e2e89fa,
 E459FF07681E7C706565AD81A8193C11BE0AA2AA) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <223ec8d3-eafd-80e2-d33c-ddb3366900d5@kaod.org>
Date: Thu, 4 Aug 2022 07:40:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/20] ppc/ppc405: Introduce a PPC405 generic machine
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: <qemu-ppc@nongnu.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 <qemu-devel@nongnu.org>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-3-clg@kaod.org>
 <d694b960-6db5-933-3d63-23ad6efc4856@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d694b960-6db5-933-3d63-23ad6efc4856@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 141e28ce-f6b6-47d3-b2ca-25fea252886d
X-Ovh-Tracer-Id: 6618884078481476576
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvkedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/4/22 00:07, BALATON Zoltan wrote:
> On Wed, 3 Aug 2022, Cédric Le Goater wrote:
>> We will use this machine as a base to define the ref405ep and possibly
>> the PPC405 hotfoot board as found in the Linux kernel.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>> hw/ppc/ppc405_boards.c | 31 ++++++++++++++++++++++++++++---
>> 1 file changed, 28 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
>> index 1a4e7588c584..4c269b6526a5 100644
>> --- a/hw/ppc/ppc405_boards.c
>> +++ b/hw/ppc/ppc405_boards.c
>> @@ -50,6 +50,15 @@
>>
>> #define USE_FLASH_BIOS
>>
>> +struct Ppc405MachineState {
>> +    /* Private */
>> +    MachineState parent_obj;
>> +    /* Public */
>> +};
>> +
>> +#define TYPE_PPC405_MACHINE MACHINE_TYPE_NAME("ppc405")
>> +OBJECT_DECLARE_SIMPLE_TYPE(Ppc405MachineState, PPC405_MACHINE);
>> +
>> /*****************************************************************************/
>> /* PPC405EP reference board (IBM) */
>> /* Standalone board with:
>> @@ -332,18 +341,34 @@ static void ref405ep_class_init(ObjectClass *oc, void *data)
>>
>>     mc->desc = "ref405ep";
>>     mc->init = ref405ep_init;
>> -    mc->default_ram_size = 0x08000000;
>> -    mc->default_ram_id = "ef405ep.ram";
>> }
>>
>> static const TypeInfo ref405ep_type = {
>>     .name = MACHINE_TYPE_NAME("ref405ep"),
>> -    .parent = TYPE_MACHINE,
>> +    .parent = TYPE_PPC405_MACHINE,
>>     .class_init = ref405ep_class_init,
>> };
>>
>> +static void ppc405_machine_class_init(ObjectClass *oc, void *data)
>> +{
>> +    MachineClass *mc = MACHINE_CLASS(oc);
>> +
>> +    mc->desc = "PPC405 generic machine";
>> +    mc->default_ram_size = 0x08000000;
>> +    mc->default_ram_id = "ppc405.ram";
> 
> Is the default RAM size a property of specific boards or the PPC405? I think it could be different for different boards so don't see why it's moved to the generic machine but maybe it has something to do with how other parts of QEMU handles this or I'm not getting what the generic PPC405 machine is for.

Well, the two QEMU PPC405 machines had 128M, so they were sharing the same
definition. This can be overridden in a child class if needed but I doubt
there will be any new PPC405 machines in QEMU. Let's keep it here.
  
> 
> Would it be clearer to just write 128 * MiB instead of a long hex number with extra zeros that's hard to read? It would be a good opportunity to change it here.

agree.

Thanks,

C.

> 
> Regards,
> BALATON Zoltan
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
>> static void ppc405_machine_init(void)
>> {
>> +    type_register_static(&ppc405_machine_type);
>>     type_register_static(&ref405ep_type);
>> }
>>
>>


