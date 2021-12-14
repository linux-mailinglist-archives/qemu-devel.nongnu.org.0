Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748B473E40
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:28:57 +0100 (CET)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx3BA-00080r-4m
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:28:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mx31v-0002Ru-Un
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:19:23 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mx31t-0002MB-Ue
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:19:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.131])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 50F3ED1C4156;
 Tue, 14 Dec 2021 09:19:18 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 14 Dec
 2021 09:19:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0013cdc15bf-f9c6-4289-b750-975969568bc7,
 38CAC366F57D933321BFAD7EF233B756AABE9985) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7011fa88-dfa5-5676-e6c7-950a788add44@kaod.org>
Date: Tue, 14 Dec 2021 09:19:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
Content-Language: en-US
To: Troy Lee <leetroy@gmail.com>
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
 <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
 <CAN9Jwz3ytV3ogztQrcL+YKGdgKYdNjypeMFbKfyqMiwvWhnMEw@mail.gmail.com>
 <e96aa35b-a8d9-41fa-ae0f-5e89fe6b1cfa@kaod.org>
 <CAN9Jwz0fhYELCkiZ16PSd4WXye5EPVrBSvLEq8r5SCigPW6-zg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAN9Jwz0fhYELCkiZ16PSd4WXye5EPVrBSvLEq8r5SCigPW6-zg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6ecb7223-7f14-42d6-9fc6-d03cb7861bbe
X-Ovh-Tracer-Id: 6018497955375516521
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrkeelgdduvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.962,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Troy Lee <troy_lee@aspeedtech.com>, qemu-devel@nongnu.org,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/21 08:57, Troy Lee wrote:
> On Fri, Dec 10, 2021 at 11:13 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 12/10/21 15:33, Troy Lee wrote:
>>> On Fri, Dec 10, 2021 at 10:05 PM Cédric Le Goater <clg@kaod.org> wrote:
>>>>
>>>> On 12/10/21 09:30, Troy Lee wrote:
>>>>> AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memory
>>>>> and io address. If guest machine try to access DPMCU memory, it will
>>>>> cause a fatal error.
>>>>
>>>> The Aspeed SoCs have an "aspeed_soc.io" region for unimplemented devices
>>>> but it's too small. Anyhow, it is better to have per logic unit. We should
>>>> change that one day.
>>>>
>>> Good idea!
>>>
>>>> For my information, which FW image are you using ?
>>>>
>>>
>>> We're using Aspeed's SDK image, I tested with ast2600-default machine.
>>> Prebuilt image can be download from:
>>> https://github.com/AspeedTech-BMC/openbmc/releases/tag/v07.02
>>
>> Excellent ! Is there one I could try in particular ?
> You could use ast2600-default-obmc.tgz, but we will send another patch
> for HACE engine.
> 
>>
>>
>> Once correctly supported, we should include one of these SDK images in :
>>
>>     tests/avocado/boot_linux_console.py
>>
>> to complete our tests of the device models.
> Sure, once the image successfully boots into rootfs, I'll add a test
> case for it.

yeah. No hurries.

>> QEMU is not making much difference between the revision. You might need
>> to improve that.
>>
>>> Without declaring the DPMCU memory, the image will hangs in u-boot.
>>
>> yeah. You can use -d guest_errors,unimp to catch accesses done on AHB
>> windows not covered by the QEMU models. There are plenty of ways to
>> move past U-Boot when models are not implemented yet. Don't waste
>> too much time, just ask.
>>
>> eMMC is only on these branches :
>>
>>     https://github.com/openbmc/qemu/
>>     https://github.com/legoater/qemu/
> These two branches are very useful!

One day, we should try to upstream eMMC support.
  
>> Same for SBC and support is primitive.
>>
>>> We're still working on I3C and SPI issue to be resolved to get into rootfs.
>>
>> I3C has not much support in Linux and none in QEMU. You will have to
>> add dummy models.
> Can I submit a dummy model that only responds to the RESET control register?

yes.

> Or it has to be well implemented like i2c/core.c and i2c/aspeed_i2c.c?

No it can be dummy to start with.

>> SPI as a non-SPI flash driver ? The SPI flash controller models should
>> be quite well covered today. What's the issue ?
> I need some more investigation, because we're using a different spi
> driver for fmc-spi.

Is that the one written by Chin-Ting Kuo in 2020 ? If so, I did send
some adjustment of the model for it, such as address lane disablement,
but there might be more to it.

Thanks,

C.

