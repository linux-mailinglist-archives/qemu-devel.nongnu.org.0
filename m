Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D53D354B591
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:17:08 +0200 (CEST)
Received: from localhost ([::1]:50288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19E3-0000fm-6M
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o198v-0006j2-Kh
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:11:49 -0400
Received: from 3.mo548.mail-out.ovh.net ([188.165.32.156]:55731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o198r-0005U4-Ka
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:11:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.171])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 74E7D20811;
 Tue, 14 Jun 2022 16:11:42 +0000 (UTC)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 14 Jun
 2022 18:11:41 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001b1e2589e-c319-457c-ba7c-4e011b5975fd,
 521BD0C7D9B1F43011BF9161B4E1AE1788365C94) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9efbb63e-1c58-845c-2612-b144b13d63db@kaod.org>
Date: Tue, 14 Jun 2022 18:11:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 08/11] ppc/pnv: turn chip8->phbs[] into a PnvPHB3* array
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb@linux.ibm.com>, Frederic Barrat
 <fbarrat@linux.ibm.com>, <qemu-devel@nongnu.org>
CC: <qemu-ppc@nongnu.org>, <mark.cave-ayland@ilande.co.uk>
References: <20220613154456.359674-1-danielhb@linux.ibm.com>
 <20220613154456.359674-9-danielhb@linux.ibm.com>
 <d220e41c-a171-7263-a32c-3fc0d6c22ebd@linux.ibm.com>
 <3638290a-8bcb-699a-5304-e397853957b4@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <3638290a-8bcb-699a-5304-e397853957b4@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b55cbb8d-0bf9-43b4-ae29-844539bb51bf
X-Ovh-Tracer-Id: 12915760784630451107
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledgleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhgrrhhkrdgtrghvvgdqrgihlhgrnhgusehilhgrnhguvgdrtghordhukhdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.32.156; envelope-from=clg@kaod.org;
 helo=3.mo548.mail-out.ovh.net
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

On 6/14/22 17:39, Daniel Henrique Barboza wrote:
> 
> 
> On 6/14/22 06:53, Frederic Barrat wrote:
>>
>>
>> On 13/06/2022 17:44, Daniel Henrique Barboza wrote:
>>> When enabling user created PHBs (a change reverted by commit 9c10d86fee)
>>> we were handling PHBs created by default versus by the user in different
>>> manners. The only difference between these PHBs is that one will have a
>>> valid phb3->chip that is assigned during pnv_chip_power8_realize(),
>>> while the user created needs to search which chip it belongs to.
>>>
>>> Aside from that there shouldn't be any difference. Making the default
>>> PHBs behave in line with the user created ones will make it easier to
>>> re-introduce them later on. It will also make the code easier to follow
>>> since we are dealing with them in equal manner.
>>>
>>> The first step is to turn chip8->phbs[] into a PnvPHB3 pointer array.
>>> This will allow us to assign user created PHBs into it later on. The way
>>> we initilize the default case is now more in line with that would happen
>>> with the user created case: the object is created, parented by the chip
>>> because pnv_xscom_dt() relies on it, and then assigned to the array.
>>>
>>> Signed-off-by: Daniel Henrique Barboza <danielhb@linux.ibm.com>
>>> ---
>>
>>
>> This patch is more prep work for the user-created device instead of general cleanup like the previous ones, but I don't see anything wrong with it. So:
>>
>> Reviewed-by: Frederic Barrat <fbarrat@linux.ibm.com>
> 
> 
> I've been thinking about it and I guess I could do better with this
> and the proxy pnv-phb series that is already in v2. What I'm thinking
> is:
> 
> - crop patches 8-11 from this series. Patches 1-7 would be the prep cleanup
> series;
> 
> - split the pnv-phb series in two:
> 
>    - first series will just introduce the pnv-phb devices and consolidate the
> root ports. We're going to deal just with default devices. No consideration
> about future user-created devices will be made;

Yes. From what I have read, this looks very feasible with a v2.

Thanks,

C.

> 
>    - a second series would then re-introduce user creatable phbs and root ports.
> Patches 8-11 of this series would be handled in this second patch set since it's
> closely related to user devices.
> 
> 
> Does that sound fair?
> 
> 
> Thanks,
> 
> 
> Daniel
> 
> 
> 
> 
>>
>>    Fred
>>
>>
>>
>>>   hw/ppc/pnv.c         | 19 ++++++++++++++-----
>>>   include/hw/ppc/pnv.h |  6 +++++-
>>>   2 files changed, 19 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
>>> index 5e3323e950..6ce9e94e05 100644
>>> --- a/hw/ppc/pnv.c
>>> +++ b/hw/ppc/pnv.c
>>> @@ -660,7 +660,7 @@ static void pnv_chip_power8_pic_print_info(PnvChip *chip, Monitor *mon)
>>>       ics_pic_print_info(&chip8->psi.ics, mon);
>>>       for (i = 0; i < chip8->num_phbs; i++) {
>>> -        PnvPHB3 *phb3 = &chip8->phbs[i];
>>> +        PnvPHB3 *phb3 = chip8->phbs[i];
>>>           pnv_phb3_msi_pic_print_info(&phb3->msis, mon);
>>>           ics_pic_print_info(&phb3->lsis, mon);
>>> @@ -1149,7 +1149,16 @@ static void pnv_chip_power8_instance_init(Object *obj)
>>>       chip8->num_phbs = pcc->num_phbs;
>>>       for (i = 0; i < chip8->num_phbs; i++) {
>>> -        object_initialize_child(obj, "phb[*]", &chip8->phbs[i], TYPE_PNV_PHB3);
>>> +        PnvPHB3 *phb3 = PNV_PHB3(object_new(TYPE_PNV_PHB3));
>>> +
>>> +        /*
>>> +         * We need the chip to parent the PHB to allow the DT
>>> +         * to build correctly (via pnv_xscom_dt()).
>>> +         *
>>> +         * TODO: the PHB should be parented by a PEC device.
>>> +         */
>>> +        object_property_add_child(obj, "phb[*]", OBJECT(phb3));
>>> +        chip8->phbs[i] = phb3;
>>>       }
>>>   }
>>> @@ -1278,7 +1287,7 @@ static void pnv_chip_power8_realize(DeviceState *dev, Error **errp)
>>>       /* PHB3 controllers */
>>>       for (i = 0; i < chip8->num_phbs; i++) {
>>> -        PnvPHB3 *phb = &chip8->phbs[i];
>>> +        PnvPHB3 *phb = chip8->phbs[i];
>>>           object_property_set_int(OBJECT(phb), "index", i, &error_fatal);
>>>           object_property_set_int(OBJECT(phb), "chip-id", chip->chip_id,
>>> @@ -1963,7 +1972,7 @@ static ICSState *pnv_ics_get(XICSFabric *xi, int irq)
>>>           }
>>>           for (j = 0; j < chip8->num_phbs; j++) {
>>> -            pnv_ics_get_phb_ics(&chip8->phbs[j], &args);
>>> +            pnv_ics_get_phb_ics(chip8->phbs[j], &args);
>>>               if (args.ics) {
>>>                   return args.ics;
>>> @@ -1996,7 +2005,7 @@ static void pnv_ics_resend(XICSFabric *xi)
>>>           Pnv8Chip *chip8 = PNV8_CHIP(pnv->chips[i]);
>>>           for (j = 0; j < chip8->num_phbs; j++) {
>>> -            PnvPHB3 *phb3 = &chip8->phbs[j];
>>> +            PnvPHB3 *phb3 = chip8->phbs[j];
>>>               ics_resend(&phb3->lsis);
>>>               ics_resend(ICS(&phb3->msis));
>>> diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
>>> index 033890a23f..11f1089289 100644
>>> --- a/include/hw/ppc/pnv.h
>>> +++ b/include/hw/ppc/pnv.h
>>> @@ -80,7 +80,11 @@ struct Pnv8Chip {
>>>       PnvHomer     homer;
>>>   #define PNV8_CHIP_PHB3_MAX 4
>>> -    PnvPHB3      phbs[PNV8_CHIP_PHB3_MAX];
>>> +    /*
>>> +     * The array is used to allow quick access to the phbs by
>>> +     * pnv_ics_get_child() and pnv_ics_resend_child().
>>> +     */
>>> +    PnvPHB3      *phbs[PNV8_CHIP_PHB3_MAX];
>>>       uint32_t     num_phbs;
>>>       XICSFabric    *xics;


