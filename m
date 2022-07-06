Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30245567E38
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 08:09:38 +0200 (CEST)
Received: from localhost ([::1]:32972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8yEC-0005Ty-LW
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 02:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o8yBV-0004TN-TS; Wed, 06 Jul 2022 02:06:49 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:48027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o8yBS-0004Bv-Eh; Wed, 06 Jul 2022 02:06:48 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.13])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id E2699114CB920;
 Wed,  6 Jul 2022 08:06:40 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 6 Jul 2022
 08:06:39 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S004c221394a-1df9-47aa-92fd-bab45b3ca464,
 47F7137101B2C04A6823BD3360DFE7E7FE0821A2) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3fd5d954-4909-cd45-aa58-789618423ab2@kaod.org>
Date: Wed, 6 Jul 2022 08:06:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/9] hw/i2c/pca954x: Add method to get channels
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>, Corey Minyard <minyard@acm.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, Patrick Venture
 <venture@google.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220705191400.41632-1-peter@pjd.dev>
 <20220705191400.41632-2-peter@pjd.dev> <20220705200624.GK908082@minyard.net>
 <YsSv0NU8WfU6APoN@pdel-mbp.dhcp.thefacebook.com>
 <YsSwzVXXS5u3GH3j@pdel-mbp.dhcp.thefacebook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YsSwzVXXS5u3GH3j@pdel-mbp.dhcp.thefacebook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 524174ef-3ee4-4c0c-9dd2-70c9e1fc0ca8
X-Ovh-Tracer-Id: 2769713770933357420
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeivddguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueehveehtefhudevtddvffejkeehgfegtdfhiefhhfefgefhgeehfeehieetleejnecuffhomhgrihhnpehoiihlrggsshdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 7/5/22 23:44, Peter Delevoryas wrote:
> On Tue, Jul 05, 2022 at 02:40:32PM -0700, Peter Delevoryas wrote:
>> On Tue, Jul 05, 2022 at 03:06:24PM -0500, Corey Minyard wrote:
>>> On Tue, Jul 05, 2022 at 12:13:52PM -0700, Peter Delevoryas wrote:
>>>> I added this helper in the Aspeed machine file a while ago to help
>>>> initialize fuji-bmc i2c devices. This moves it to the official pca954x
>>>> file so that other files can use it.
>>>>
>>>> This does something very similar to pca954x_i2c_get_bus, but I think
>>>> this is useful when you have a very complicated dts with a lot of
>>>> switches, like the fuji dts.
>>>>
>>>> This convenience method lets you write code that produces a flat array
>>>> of I2C buses that matches the naming in the dts. After that you can just
>>>> add individual sensors using the flat array of I2C buses.
>>>
>>> This is an improvment, I think.  But it really needs to be two patches,
>>> one with the I2C portion, and one with the aspeed portion.
>>>
>>> Also, the name is a little misleading, you might want to name it
>>> pca954x_i2c_create_get_channels
>>
>> You're right: Cedric, you can just ignore the pca954x patch then if you'd like,
>> I can resubmit it with the future I2C series that uses it. I probably shouldn't
>> have submitted it quite yet.
>>
>> I can also resubmit the series with that patch removed, not sure if that's
>> necessary or not.
> 
> This was hastily written, what I meant to say was:
> 
> Cedric, feel free to remove this patch from the series. If you'd like, I can
> also resubmit this series as v3 with the patch removed.


I moved it at the end of the series to come just before the other patches
needing it, the last three patches of :

   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=307305

You can resend all of them when fixed.


I think we are done with the initial fby35.

Next time, please add a cover letter and keep the Reviewed-by tags
of the previous version. It helps the reviewers. I re-added them
manually for this spin.

Thanks,

C.

> 
>>
>>>
>>> -corey
>>>
>>>>
>>>> See fuji_bmc_i2c_init to understand this point further.
>>>>
>>>> The fuji dts is here for reference:
>>>>
>>>> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
>>>>
>>>> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
>>>> ---
>>>>   hw/arm/aspeed.c                  | 29 +++++++++--------------------
>>>>   hw/i2c/i2c_mux_pca954x.c         | 10 ++++++++++
>>>>   include/hw/i2c/i2c_mux_pca954x.h | 13 +++++++++++++
>>>>   3 files changed, 32 insertions(+), 20 deletions(-)
>>>>
>>>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>>>> index 6fe9b13548..bee8a748ec 100644
>>>> --- a/hw/arm/aspeed.c
>>>> +++ b/hw/arm/aspeed.c
>>>> @@ -793,15 +793,6 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>>>>       create_pca9552(soc, 15, 0x60);
>>>>   }
>>>>   
>>>> -static void get_pca9548_channels(I2CBus *bus, uint8_t mux_addr,
>>>> -                                 I2CBus **channels)
>>>> -{
>>>> -    I2CSlave *mux = i2c_slave_create_simple(bus, "pca9548", mux_addr);
>>>> -    for (int i = 0; i < 8; i++) {
>>>> -        channels[i] = pca954x_i2c_get_bus(mux, i);
>>>> -    }
>>>> -}
>>>> -
>>>>   #define TYPE_LM75 TYPE_TMP105
>>>>   #define TYPE_TMP75 TYPE_TMP105
>>>>   #define TYPE_TMP422 "tmp422"
>>>> @@ -814,20 +805,18 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>>>>       for (int i = 0; i < 16; i++) {
>>>>           i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
>>>>       }
>>>> -    I2CBus *i2c180 = i2c[2];
>>>> -    I2CBus *i2c480 = i2c[8];
>>>> -    I2CBus *i2c600 = i2c[11];
>>>>   
>>>> -    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
>>>> -    get_pca9548_channels(i2c480, 0x70, &i2c[24]);
>>>> +    pca954x_i2c_get_channels(i2c[2], 0x70, "pca9548", &i2c[16]);
>>>> +    pca954x_i2c_get_channels(i2c[8], 0x70, "pca9548", &i2c[24]);
>>>>       /* NOTE: The device tree skips [32, 40) in the alias numbering */
>>>> -    get_pca9548_channels(i2c600, 0x77, &i2c[40]);
>>>> -    get_pca9548_channels(i2c[24], 0x71, &i2c[48]);
>>>> -    get_pca9548_channels(i2c[25], 0x72, &i2c[56]);
>>>> -    get_pca9548_channels(i2c[26], 0x76, &i2c[64]);
>>>> -    get_pca9548_channels(i2c[27], 0x76, &i2c[72]);
>>>> +    pca954x_i2c_get_channels(i2c[11], 0x77, "pca9548", &i2c[40]);
>>>> +    pca954x_i2c_get_channels(i2c[24], 0x71, "pca9548", &i2c[48]);
>>>> +    pca954x_i2c_get_channels(i2c[25], 0x72, "pca9548", &i2c[56]);
>>>> +    pca954x_i2c_get_channels(i2c[26], 0x76, "pca9548", &i2c[64]);
>>>> +    pca954x_i2c_get_channels(i2c[27], 0x76, "pca9548", &i2c[72]);
>>>>       for (int i = 0; i < 8; i++) {
>>>> -        get_pca9548_channels(i2c[40 + i], 0x76, &i2c[80 + i * 8]);
>>>> +        pca954x_i2c_get_channels(i2c[40 + i], 0x76, "pca9548",
>>>> +                                 &i2c[80 + i * 8]);
>>>>       }
>>>>   
>>>>       i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
>>>> diff --git a/hw/i2c/i2c_mux_pca954x.c b/hw/i2c/i2c_mux_pca954x.c
>>>> index 3945de795c..6b07804546 100644
>>>> --- a/hw/i2c/i2c_mux_pca954x.c
>>>> +++ b/hw/i2c/i2c_mux_pca954x.c
>>>> @@ -169,6 +169,16 @@ I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel)
>>>>       return pca954x->bus[channel];
>>>>   }
>>>>   
>>>> +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
>>>> +                              const char *type_name, I2CBus **channels)
>>>> +{
>>>> +    I2CSlave *mux = i2c_slave_create_simple(bus, type_name, address);
>>>> +    Pca954xClass *pc = PCA954X_GET_CLASS(mux);
>>>> +    Pca954xState *pca954x = PCA954X(mux);
>>>> +
>>>> +    memcpy(channels, pca954x->bus, pc->nchans * sizeof(channels[0]));
>>>> +}
>>>> +
>>>>   static void pca9546_class_init(ObjectClass *klass, void *data)
>>>>   {
>>>>       Pca954xClass *s = PCA954X_CLASS(klass);
>>>> diff --git a/include/hw/i2c/i2c_mux_pca954x.h b/include/hw/i2c/i2c_mux_pca954x.h
>>>> index 3dd25ec983..3a676a30a9 100644
>>>> --- a/include/hw/i2c/i2c_mux_pca954x.h
>>>> +++ b/include/hw/i2c/i2c_mux_pca954x.h
>>>> @@ -16,4 +16,17 @@
>>>>    */
>>>>   I2CBus *pca954x_i2c_get_bus(I2CSlave *mux, uint8_t channel);
>>>>   
>>>> +/**
>>>> + * Creates an i2c mux and retrieves all of the channels associated with it.
>>>> + *
>>>> + * @bus: the i2c bus where the i2c mux resides.
>>>> + * @address: the address of the i2c mux on the aforementioned i2c bus.
>>>> + * @type_name: name of the i2c mux type to create.
>>>> + * @channels: an output parameter specifying where to return the channels.
>>>> + *
>>>> + * Returns: None
>>>> + */
>>>> +void pca954x_i2c_get_channels(I2CBus *bus, uint8_t address,
>>>> +                              const char *type_name, I2CBus **channels);
>>>> +
>>>>   #endif
>>>> -- 
>>>> 2.37.0
>>>>
>>>>
>>


