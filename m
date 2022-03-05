Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF704CE38E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 09:10:34 +0100 (CET)
Received: from localhost ([::1]:42900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQPUn-0000td-Hn
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 03:10:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPRB-0007kL-7s
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 03:06:49 -0500
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:51517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPR8-00025W-UV
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 03:06:48 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.102])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id E7F482162B;
 Sat,  5 Mar 2022 08:06:43 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 5 Mar
 2022 09:06:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00273a03bb3-bf53-42b8-8168-eb733ea596c4,
 A4EA2D8AEBB64B4F793E8EC0AE0C67A6646D724C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <29750476-1a33-25b2-bad5-eb24fb8edd14@kaod.org>
Date: Sat, 5 Mar 2022 09:06:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/block: m25p80: Add support for w25q01jvq
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
References: <20220304180920.1780992-1-patrick@stwcx.xyz>
 <9b9b0251-2698-61b9-b4b1-5e5e54fea5a1@gmail.com>
 <7827c791b7f91f4eb216b33473dd6103@walle.cc>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <7827c791b7f91f4eb216b33473dd6103@walle.cc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fd44a8e4-c92e-4a70-b3a2-096dbd193a5b
X-Ovh-Tracer-Id: 1878845471445060530
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddujedmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeevudffffehtedtgfeikeeivdevvdfgkeegfeelffefleejheelvdehtdetjeetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpohiilhgrsghsrdhorhhgpdhgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepfhhrrghsshgvrdhighhlvghsihgrshesghhmrghilhdrtghomh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Potin Lai <potin.lai@quantatw.com>, Alistair Francis <alistair@alistair23.me>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Patrick Williams <patrick@stwcx.xyz>, Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 20:47, Michael Walle wrote:
> Am 2022-03-04 20:30, schrieb Philippe Mathieu-Daudé:
>> On 4/3/22 19:09, Patrick Williams wrote:
>>> The w25q01jvq is a 128MB part.  Support is being added to the kernel[1]
>>> and the two have been tested together.
>>>
>>> 1. https://lore.kernel.org/lkml/20220222092222.23108-1-potin.lai@quantatw.com/
>>>
>>> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
>>> Cc: Potin Lai <potin.lai@quantatw.com>
>>> ---
>>>   hw/block/m25p80.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>>> index c6bf3c6bfa..7d3d8b12e0 100644
>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -340,6 +340,7 @@ static const FlashPartInfo known_devices[] = {
>>>       { INFO("w25q80bl",    0xef4014,      0,  64 << 10,  16, ER_4K) },
>>>       { INFO("w25q256",     0xef4019,      0,  64 << 10, 512, ER_4K) },
>>>       { INFO("w25q512jv",   0xef4020,      0,  64 << 10, 1024, ER_4K) },
>>> +    { INFO("w25q01jvq",   0xef4021,      0,  64 << 10, 2048, ER_4K) },
>>>   };
>>>     typedef enum {
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> FWIW, the linux spi nor subsystem will rely more and more on the SFDP
> for newer flashes. I had a quick look at qemu's source and command
> RDSFDP (0x5a) isn't emulated. Might be worth implementing ;)

Indeed. I really pulled my hair out when mx25l25635_post_bfpt_fixups was
introduced for the MX25L25635F to activate 4B opcodes.

I have sent a patchset adding SFDP support :

   http://patchwork.ozlabs.org/project/qemu-devel/list/?series=199024

but Francisco had comments I didn't have time to address.

Anyhow, the series is still in use in the aspeed branch :

   https://github.com/legoater/qemu/commits/aspeed-7.0

I can respin.

Thanks,

C.

