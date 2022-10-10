Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7155FA11C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 17:27:37 +0200 (CEST)
Received: from localhost ([::1]:51190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohugq-0000Mg-90
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 11:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ohuQw-0004Lo-MV; Mon, 10 Oct 2022 11:11:10 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:43277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ohuQu-0003no-QS; Mon, 10 Oct 2022 11:11:10 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.148])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 88A93130FE308;
 Mon, 10 Oct 2022 17:11:02 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 10 Oct
 2022 17:11:01 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R0052322d493-305b-47ac-9133-413b70511c08,
 8F9D85B4748BB0730094C5680DDBB13DC71FBC21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <2ef00fda-ee4f-38b1-e1b1-f182c1640c7b@kaod.org>
Date: Mon, 10 Oct 2022 17:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 4/8] m25p80: Add the mx25l25635f SFPD table
Content-Language: en-US
To: Francisco Iglesias <frasse.iglesias@gmail.com>, Michael Walle
 <michael@walle.cc>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-5-clg@kaod.org> <20221007144431.GE20384@fralle-msi>
 <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
 <d6d2575b520fedb47a5fa7c1031c4ff7@walle.cc>
 <20221010105120.GA30024@fralle-msi>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221010105120.GA30024@fralle-msi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 96501a66-d026-4a98-8ead-fbf5b46c8bca
X-Ovh-Tracer-Id: 3892798931107941298
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejgedgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehirhhishgthhgvnhhljhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.007,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/10/22 12:51, Francisco Iglesias wrote:
> Hi  Cedric,
> 
> On [2022 Oct 10] Mon 11:58:40, Michael Walle wrote:
>> Am 2022-10-10 08:23, schrieb Cédric Le Goater:
>>> On 10/7/22 16:44, Francisco Iglesias wrote:
>>
>>>>> --- a/hw/block/m25p80.c
>>>>> +++ b/hw/block/m25p80.c
>>>>> @@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
>>>>>        { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>>>>        { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10,
>>>>> 512, 0),
>>>>>          .sfdp_read = m25p80_sfdp_mx25l25635e },
>>>>> +    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10,
>>>>> 512, 0),
> 
> I think I missed the (ER_4K | ER_32K) flags above (in case we go for a v4 we
> can add it in).

sure.

>>>>
>>>> I think I'm not seeing the extended id part in the datasheet I've
>>>> found so
>>>> might be that you can switch to just INFO and _ext_id 0 above
>>>
>>> This was added by commit 6bbe036f32dc ("m25p80: Return the JEDEC ID
>>> twice for
>>> mx25l25635e") to fix a real breakage on HW.
>>
>>  From my experience, the ID has a particular length, at least three bytes
>> and if you read past that length for some (all?) devices the id bytes just
>> get repeated. I.e. the counter in the device will just wrap to offset 0
>> again. If you want to emulate the hardware correctly, you would have to
>> take that into consideration.
> 
> If we decide to go with Michael's proposal above you can use '0' on the
> 'extended_id' and enable 's->data_read_loop = true' when reading the ID.

This part :

             for (; i < SPI_NOR_MAX_ID_LEN; i++) {
                 s->data[i] = 0;
             }

will fill the remaining JEDEC ID bytes with zeros which is not what we
want for the mx25l25635e chip.

Thanks,
C.

> Best regards,
> Francisco
> 
>> But I don't think it's worth it, OTOH there seems to be some broken
>> software which rely on that (undefined?) behavior.
>>
>> -michael
> 


