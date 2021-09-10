Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947684067FC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:51:09 +0200 (CEST)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObJU-0006ug-ME
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:51:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mObI8-0005zQ-UU
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:49:44 -0400
Received: from smtpout1.mo3005.mail-out.ovh.net ([79.137.123.220]:57983
 helo=smtpout1.3005.mail-out.ovh.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mObI6-0008Th-Ng
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:49:44 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 4537813FA97;
 Fri, 10 Sep 2021 07:49:38 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 09:49:37 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005523ff09e-6696-4585-a9c8-be0b29e3c16c,
 7E3151BA03BDFE499776E315E3312AC0A00E288C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v4] hw/arm/aspeed: Add Fuji machine type
To: Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
References: <20210906133124.3674661-1-pdel@fb.com>
 <CACPK8Xdmc3i8C7gkVxsuBcPuHKzDsTZ1tKcx5R7qVAHYN=uhwQ@mail.gmail.com>
 <379704F7-86BE-4AF1-A256-58652508BD53@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <51d97636-65a9-8fbe-2a1f-be44992d270a@kaod.org>
Date: Fri, 10 Sep 2021 09:49:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <379704F7-86BE-4AF1-A256-58652508BD53@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 0e3876a8-9e3b-4cc5-8b76-f2491785e6ff
X-Ovh-Tracer-Id: 1013872868269001635
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudegtddguddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehuedtheeghfdvhedtueelteegvdefueektdefiefhffffieduuddtudfhgfevtdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehpuggvlhesfhgsrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout1.3005.mail-out.ovh.net
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.975,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 4:05 PM, Peter Delevoryas wrote:
> 
> 
>> On Sep 7, 2021, at 1:59 AM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Mon, 6 Sept 2021 at 13:31, <pdel@fb.com> wrote:
>>>
>>> From: Peter Delevoryas <pdel@fb.com>
>>>
>>> This adds a new machine type "fuji-bmc" based on the following device tree:
>>>
>>> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
>>>
>>> Most of the i2c devices are not there, they're added here:
>>>
>>> https://github.com/facebook/openbmc/blob/fb2ed12002fb/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh
>>>
>>> I tested this by building a Fuji image from Facebook's OpenBMC repo,
>>> booting, and ssh'ing from host-to-guest.
>>>
>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> Thanks!
> 
>>
>>> +static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>>> +{
>>> +    AspeedSoCState *soc = &bmc->soc;
>>> +    I2CBus *i2c[144] = {};
>>> +
>>> +    for (int i = 0; i < 16; i++) {
>>> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
>>> +    }
>>> +    I2CBus *i2c180 = i2c[2];
>>> +    I2CBus *i2c480 = i2c[8];
>>> +    I2CBus *i2c600 = i2c[11];
>>> +
>>> +    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
>>
>> Wow, this is interesting. How did you go about testing it? Are you
>> sure you didn't overwrite any of the pointers?
>>
>> It might be worth coming up with a better way of describing all of the
>> i2c buses for future machines.
>>
>> Cheers,
>>
>> Joel
> 
> Ah, yes, so, I took the compiled device tree output and printed it out,
> and it has a complete list of the i2c aliases from all of the component
> device tree’s, like this:
> 
> dtc openbmc/build-fuji/tmp/deploy/images/fuji/aspeed-bmc-facebook-fuji.dtb
> 
> aliases {
>         i2c0 = "/ahb/apb/bus@1e78a000/i2c-bus@80";
>         i2c1 = "/ahb/apb/bus@1e78a000/i2c-bus@100";
>         i2c2 = "/ahb/apb/bus@1e78a000/i2c-bus@180";
>         i2c3 = "/ahb/apb/bus@1e78a000/i2c-bus@200";
>         i2c4 = "/ahb/apb/bus@1e78a000/i2c-bus@280";
>         i2c5 = "/ahb/apb/bus@1e78a000/i2c-bus@300";
>         i2c6 = "/ahb/apb/bus@1e78a000/i2c-bus@380";
>         i2c7 = "/ahb/apb/bus@1e78a000/i2c-bus@400";
>         i2c8 = "/ahb/apb/bus@1e78a000/i2c-bus@480";
>         i2c9 = "/ahb/apb/bus@1e78a000/i2c-bus@500";
>         i2c10 = "/ahb/apb/bus@1e78a000/i2c-bus@580";
>         i2c11 = "/ahb/apb/bus@1e78a000/i2c-bus@600";
>         i2c12 = "/ahb/apb/bus@1e78a000/i2c-bus@680";
>         i2c13 = "/ahb/apb/bus@1e78a000/i2c-bus@700";
>         i2c14 = "/ahb/apb/bus@1e78a000/i2c-bus@780";
>         i2c15 = "/ahb/apb/bus@1e78a000/i2c-bus@800";
>         ...
>         i2c16 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@0";
>         i2c17 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@1";
>         i2c18 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@2";
>         i2c19 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@3";
>         i2c20 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@4";
>         i2c21 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@5";
>         i2c22 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@6";
>         i2c23 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@7";
>         i2c24 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@0";
>         i2c25 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@1";
>         i2c26 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@2";
>         i2c27 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@3";
>         i2c28 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@4";
>         i2c29 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@5";
>         i2c30 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@6";
>         i2c31 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@7";
>         i2c40 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@0";
>         i2c41 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@1";
>         i2c42 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@2";
>         i2c43 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@3";
>         i2c44 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@4";
>         i2c46 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@6";
>         ...
>         i2c143 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@7/i2c-switch@76/i2c@7";
> };
> 
> And setup_i2c.sh’s first parameter is referencing these aliases:
> 
> # # i2c-mux 2, channel 2
> i2c_device_add 17 0x4c lm75   #SCM temp. sensor
> i2c_device_add 17 0x4d lm75   #SCM temp. sensor
> 
> # # i2c-mux 2, channel 3
> i2c_device_add 19 0x52 24c64   #EEPROM
> 
> # # i2c-mux 2, channel 4
> i2c_device_add 20 0x50 24c02   #BMC54616S EEPROM
> 
> # # i2c-mux 2, channel 6
> i2c_device_add 22 0x52 24c02   #BMC54616S EEPROM
> 
> My first idea was to make some kind of tree definition
> describing the i2c switches and then do a breadth first
> search/etc to enumerate all of the buses.
> 
> I2CBus *i2c[144] = {}
> // Initialize base set of i2c buses.
> i2c[0] = …
> i2c[1] = …
> …
> i2c[15] = …
> // Initialize switch definitions, includes
> // some kind of reference to its parent bus.
> struct { … } switches[] = {…}
> // Populate i2c buses using switch definitions.
> for (int i = 0; i < sizeof(switches)/sizeof(switches[0]); i++) {
>     I2CSlave *switch = find_switch(i2c, switches[i]);
>                        ^^^^Recursive function or something
>     for (int j = 0; j < 8; j++) {
>         // Special case because fuji datasheet skips 32..40
>         if (n == 32) {
>             n = 40;
>         }
>         i2c[n++] = aspeed_i2c_get_bus(switch, j);
>     }
> }
> 
> I’m realizing, I probably should have done this, but I also realized
> there’s not that many switches in the system, so if you just automate
> the get_channels() part (x8 buses for each switch) then it was
> not unreasonable to just manually write out the locations for each switch.
> 
> As far as testing: I didn’t do a lot, I mostly just eyeball’d it
> more after writing it out and then I looked at the boot logs, so
> I’m still not _absolutely_ sure that I got it right. Let me know
> if you guys think I should refactor this!

It think it's fine. Fixes can come later on if needed.


Phil, 

Are we OK with this ? I would like to include this patch in
the v2 of the aspeed PR.

Thanks,

C.

