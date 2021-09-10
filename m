Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E8D406C83
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:53:06 +0200 (CEST)
Received: from localhost ([::1]:53286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOg1h-0003Tr-4y
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOfzY-0001hV-8B; Fri, 10 Sep 2021 08:50:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:33560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mOfzW-0000wZ-8b; Fri, 10 Sep 2021 08:50:52 -0400
Received: by mail-wr1-x436.google.com with SMTP id t18so2526676wrb.0;
 Fri, 10 Sep 2021 05:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cX5WnvzG1NJlvodjt5tb6IiA3WzVuBCO9SAjW7T6D34=;
 b=EQqJLp8jOjZvImQ59C89dSF9UTIzlfuEo/F1t+Mv8aWFodCRMnfDBWrhXofcd8x1tn
 D/oBGSJzlBFMY94j17EkG63Brv8iNoBL5e0nNAZu/Gh03FBFGBTh/NHWN0TKeq35R9PT
 FYb5wsDgEmNxTFGdVdPQs7IyIPpTnlyqtTP2mpJ7MwO6tfwnzgoTXhC67NYOLAborm6B
 lj8YDFZGHoVpyRcDphxZYL1a76piS6dSD7YoMiK1qpPlAXJz75aLLAFyKQBoJNuaXsnx
 9sR58uObp8DVG7n2kWpSkF+RZoII8I+TCskljsR+e0QrBWQDpranReUkLjfZIZ3pHtgN
 Sdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cX5WnvzG1NJlvodjt5tb6IiA3WzVuBCO9SAjW7T6D34=;
 b=zzFW59Y7+M5qtWExY/t0zZTVY8DYh9lhIj+Mcnklb3IJx3S4g6Rkgv0DJbj+9ooEpg
 d+u050whdpCEzzLFsIKrINeFZJwRPt6c5zZse6edWRBvK3ZNi50BiZDFp7YIELcrIM3d
 ScVpIPX0jZIVf8pbdQWaXUEtMaYWvJY5VpGiVDpLnHUsayPRucPeJ+f9sVjswrQjI7oT
 vMEw/CtDbBDdWwXUBOydR01Nm1yLcBLnXPlPGNLRryQYrCfYljijMY91c+S4Hy8MRvpe
 SfcAyespPIGQAA+sfHRZmec4INKNsqKktNi5sekQ2IPi2742HKuaNNGCG//oUnftTxKN
 Z/MA==
X-Gm-Message-State: AOAM532FZqGRJ7fe4amKSUnP7+ejqQ/ON+FMuo1gSvuZe6uDizVdiWFd
 twt16OiJNd+7MEsyCwqiokcoPYxWTBg=
X-Google-Smtp-Source: ABdhPJxaemz7KSk6U8sMZokVcHaoQKAHOJDT1nBX7guNtR/nVxbbS9Y6CcdTTbHG8KpwdeBsFDTvug==
X-Received: by 2002:adf:db07:: with SMTP id s7mr9887972wri.106.1631278247938; 
 Fri, 10 Sep 2021 05:50:47 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l7sm4608953wmj.9.2021.09.10.05.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 05:50:47 -0700 (PDT)
Subject: Re: [PATCH v4] hw/arm/aspeed: Add Fuji machine type
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Joel Stanley <joel@jms.id.au>
References: <20210906133124.3674661-1-pdel@fb.com>
 <CACPK8Xdmc3i8C7gkVxsuBcPuHKzDsTZ1tKcx5R7qVAHYN=uhwQ@mail.gmail.com>
 <379704F7-86BE-4AF1-A256-58652508BD53@fb.com>
 <51d97636-65a9-8fbe-2a1f-be44992d270a@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c156a42e-e31b-da6e-b5c5-28e4f45074b7@amsat.org>
Date: Fri, 10 Sep 2021 14:50:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <51d97636-65a9-8fbe-2a1f-be44992d270a@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.349,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 9:49 AM, Cédric Le Goater wrote:
> On 9/7/21 4:05 PM, Peter Delevoryas wrote:
>>
>>> On Sep 7, 2021, at 1:59 AM, Joel Stanley <joel@jms.id.au> wrote:
>>>
>>> On Mon, 6 Sept 2021 at 13:31, <pdel@fb.com> wrote:
>>>>
>>>> From: Peter Delevoryas <pdel@fb.com>
>>>>
>>>> This adds a new machine type "fuji-bmc" based on the following device tree:
>>>>
>>>> https://github.com/torvalds/linux/blob/40cb6373b46/arch/arm/boot/dts/aspeed-bmc-facebook-fuji.dts
>>>>
>>>> Most of the i2c devices are not there, they're added here:
>>>>
>>>> https://github.com/facebook/openbmc/blob/fb2ed12002fb/meta-facebook/meta-fuji/recipes-utils/openbmc-utils/files/setup_i2c.sh
>>>>
>>>> I tested this by building a Fuji image from Facebook's OpenBMC repo,
>>>> booting, and ssh'ing from host-to-guest.
>>>>
>>>> Signed-off-by: Peter Delevoryas <pdel@fb.com>
>>>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>
>> Thanks!
>>
>>>
>>>> +static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
>>>> +{
>>>> +    AspeedSoCState *soc = &bmc->soc;
>>>> +    I2CBus *i2c[144] = {};
>>>> +
>>>> +    for (int i = 0; i < 16; i++) {
>>>> +        i2c[i] = aspeed_i2c_get_bus(&soc->i2c, i);
>>>> +    }
>>>> +    I2CBus *i2c180 = i2c[2];
>>>> +    I2CBus *i2c480 = i2c[8];
>>>> +    I2CBus *i2c600 = i2c[11];
>>>> +
>>>> +    get_pca9548_channels(i2c180, 0x70, &i2c[16]);
>>>
>>> Wow, this is interesting. How did you go about testing it? Are you
>>> sure you didn't overwrite any of the pointers?
>>>
>>> It might be worth coming up with a better way of describing all of the
>>> i2c buses for future machines.
>>>
>>> Cheers,
>>>
>>> Joel
>>
>> Ah, yes, so, I took the compiled device tree output and printed it out,
>> and it has a complete list of the i2c aliases from all of the component
>> device tree’s, like this:
>>
>> dtc openbmc/build-fuji/tmp/deploy/images/fuji/aspeed-bmc-facebook-fuji.dtb
>>
>> aliases {
>>         i2c0 = "/ahb/apb/bus@1e78a000/i2c-bus@80";
>>         i2c1 = "/ahb/apb/bus@1e78a000/i2c-bus@100";
>>         i2c2 = "/ahb/apb/bus@1e78a000/i2c-bus@180";
>>         i2c3 = "/ahb/apb/bus@1e78a000/i2c-bus@200";
>>         i2c4 = "/ahb/apb/bus@1e78a000/i2c-bus@280";
>>         i2c5 = "/ahb/apb/bus@1e78a000/i2c-bus@300";
>>         i2c6 = "/ahb/apb/bus@1e78a000/i2c-bus@380";
>>         i2c7 = "/ahb/apb/bus@1e78a000/i2c-bus@400";
>>         i2c8 = "/ahb/apb/bus@1e78a000/i2c-bus@480";
>>         i2c9 = "/ahb/apb/bus@1e78a000/i2c-bus@500";
>>         i2c10 = "/ahb/apb/bus@1e78a000/i2c-bus@580";
>>         i2c11 = "/ahb/apb/bus@1e78a000/i2c-bus@600";
>>         i2c12 = "/ahb/apb/bus@1e78a000/i2c-bus@680";
>>         i2c13 = "/ahb/apb/bus@1e78a000/i2c-bus@700";
>>         i2c14 = "/ahb/apb/bus@1e78a000/i2c-bus@780";
>>         i2c15 = "/ahb/apb/bus@1e78a000/i2c-bus@800";
>>         ...
>>         i2c16 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@0";
>>         i2c17 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@1";
>>         i2c18 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@2";
>>         i2c19 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@3";
>>         i2c20 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@4";
>>         i2c21 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@5";
>>         i2c22 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@6";
>>         i2c23 = "/ahb/apb/bus@1e78a000/i2c-bus@180/i2c-switch@70/i2c@7";
>>         i2c24 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@0";
>>         i2c25 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@1";
>>         i2c26 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@2";
>>         i2c27 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@3";
>>         i2c28 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@4";
>>         i2c29 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@5";
>>         i2c30 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@6";
>>         i2c31 = "/ahb/apb/bus@1e78a000/i2c-bus@480/i2c-switch@70/i2c@7";
>>         i2c40 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@0";
>>         i2c41 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@1";
>>         i2c42 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@2";
>>         i2c43 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@3";
>>         i2c44 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@4";
>>         i2c46 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@6";
>>         ...
>>         i2c143 = "/ahb/apb/bus@1e78a000/i2c-bus@600/i2c-switch@77/i2c@7/i2c-switch@76/i2c@7";
>> };
>>
>> And setup_i2c.sh’s first parameter is referencing these aliases:
>>
>> # # i2c-mux 2, channel 2
>> i2c_device_add 17 0x4c lm75   #SCM temp. sensor
>> i2c_device_add 17 0x4d lm75   #SCM temp. sensor
>>
>> # # i2c-mux 2, channel 3
>> i2c_device_add 19 0x52 24c64   #EEPROM
>>
>> # # i2c-mux 2, channel 4
>> i2c_device_add 20 0x50 24c02   #BMC54616S EEPROM
>>
>> # # i2c-mux 2, channel 6
>> i2c_device_add 22 0x52 24c02   #BMC54616S EEPROM
>>
>> My first idea was to make some kind of tree definition
>> describing the i2c switches and then do a breadth first
>> search/etc to enumerate all of the buses.
>>
>> I2CBus *i2c[144] = {}
>> // Initialize base set of i2c buses.
>> i2c[0] = …
>> i2c[1] = …
>> …
>> i2c[15] = …
>> // Initialize switch definitions, includes
>> // some kind of reference to its parent bus.
>> struct { … } switches[] = {…}
>> // Populate i2c buses using switch definitions.
>> for (int i = 0; i < sizeof(switches)/sizeof(switches[0]); i++) {
>>     I2CSlave *switch = find_switch(i2c, switches[i]);
>>                        ^^^^Recursive function or something
>>     for (int j = 0; j < 8; j++) {
>>         // Special case because fuji datasheet skips 32..40
>>         if (n == 32) {
>>             n = 40;
>>         }
>>         i2c[n++] = aspeed_i2c_get_bus(switch, j);
>>     }
>> }
>>
>> I’m realizing, I probably should have done this, but I also realized
>> there’s not that many switches in the system, so if you just automate
>> the get_channels() part (x8 buses for each switch) then it was
>> not unreasonable to just manually write out the locations for each switch.
>>
>> As far as testing: I didn’t do a lot, I mostly just eyeball’d it
>> more after writing it out and then I looked at the boot logs, so
>> I’m still not _absolutely_ sure that I got it right. Let me know
>> if you guys think I should refactor this!
> 
> It think it's fine. Fixes can come later on if needed.
> 
> 
> Phil, 
> 
> Are we OK with this ? I would like to include this patch in
> the v2 of the aspeed PR.

My previous comment was only about having referenced URL valid
long term. I'm not sure if Joel is asking to include the dtc
output too. I haven't looked at the patch content but am happier
with the patch description, thanks both :)

Regards,

Phil.

