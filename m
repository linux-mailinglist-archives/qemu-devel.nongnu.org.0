Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D815F986D
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 08:35:02 +0200 (CEST)
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohmNP-00011u-Ed
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 02:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ohmCr-00012U-O5; Mon, 10 Oct 2022 02:24:07 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:33039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1ohmCp-0007HV-Mr; Mon, 10 Oct 2022 02:24:05 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A8CC6130CD7AA;
 Mon, 10 Oct 2022 08:23:58 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 10 Oct
 2022 08:23:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006410a693c-1c49-4800-8236-23b0424505a9,
 8F9D85B4748BB0730094C5680DDBB13DC71FBC21) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
Date: Mon, 10 Oct 2022 08:23:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 4/8] m25p80: Add the mx25l25635f SFPD table
Content-Language: en-US
To: Francisco Iglesias <frasse.iglesias@gmail.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Iris Chen <irischenlj@fb.com>, Michael Walle <michael@walle.cc>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-5-clg@kaod.org> <20221007144431.GE20384@fralle-msi>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221007144431.GE20384@fralle-msi>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a9237edd-8eb7-4bf6-ac0a-1092e79716bc
X-Ovh-Tracer-Id: 13438178339014151090
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejvddguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepmhhitghhrggvlhesfigrlhhlvgdrtggtpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.934,
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

On 10/7/22 16:44, Francisco Iglesias wrote:
> On [2022 Jul 22] Fri 08:35:58, Cédric Le Goater wrote:
>> The mx25l25635e and mx25l25635f chips have the same JEDEC id but the
>> mx25l25635f has more capabilities reported in the SFDP table. Support
>> for 4B opcodes is of interest because it is exploited by the Linux
>> kernel.
>>
>> The SFDP table size is 0x200 bytes long. The mandatory table for basic
>> features is available at byte 0x30 and an extra Macronix specific
>> table is available at 0x60.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   hw/block/m25p80_sfdp.h |  1 +
>>   hw/block/m25p80.c      |  2 ++
>>   hw/block/m25p80_sfdp.c | 68 ++++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 71 insertions(+)
>>
>> diff --git a/hw/block/m25p80_sfdp.h b/hw/block/m25p80_sfdp.h
>> index 0c46e669b335..87690a173c78 100644
>> --- a/hw/block/m25p80_sfdp.h
>> +++ b/hw/block/m25p80_sfdp.h
>> @@ -18,6 +18,7 @@
>>   extern uint8_t m25p80_sfdp_n25q256a(uint32_t addr);
>>   
>>   extern uint8_t m25p80_sfdp_mx25l25635e(uint32_t addr);
>> +extern uint8_t m25p80_sfdp_mx25l25635f(uint32_t addr);
> (optional -extern above)
> 
>>   
>>   
>>   #endif
>> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
>> index 028b026d8ba2..6b120ce65212 100644
>> --- a/hw/block/m25p80.c
>> +++ b/hw/block/m25p80.c
>> @@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
>>       { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>       { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 0),
>>         .sfdp_read = m25p80_sfdp_mx25l25635e },
>> +    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10, 512, 0),
> 
> I think I'm not seeing the extended id part in the datasheet I've found so
> might be that you can switch to just INFO and _ext_id 0 above

This was added by commit 6bbe036f32dc ("m25p80: Return the JEDEC ID twice for
mx25l25635e") to fix a real breakage on HW.

Thanks,

C.


  (might be the
> same in the previous patch with the similar flash). Otherwise looks good to
> me:
> 
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> 
> 
>> +      .sfdp_read = m25p80_sfdp_mx25l25635f },
>>       { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
>>       { INFO("mx66l51235f", 0xc2201a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>>       { INFO("mx66u51235f", 0xc2253a,      0,  64 << 10, 1024, ER_4K | ER_32K) },
>> diff --git a/hw/block/m25p80_sfdp.c b/hw/block/m25p80_sfdp.c
>> index 6499c4c39954..70c13aea7c63 100644
>> --- a/hw/block/m25p80_sfdp.c
>> +++ b/hw/block/m25p80_sfdp.c
>> @@ -82,3 +82,71 @@ static const uint8_t sfdp_mx25l25635e[] = {
>>       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>>   };
>>   define_sfdp_read(mx25l25635e)
>> +
>> +static const uint8_t sfdp_mx25l25635f[] = {
>> +    0x53, 0x46, 0x44, 0x50, 0x00, 0x01, 0x01, 0xff,
>> +    0x00, 0x00, 0x01, 0x09, 0x30, 0x00, 0x00, 0xff,
>> +    0xc2, 0x00, 0x01, 0x04, 0x60, 0x00, 0x00, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xe5, 0x20, 0xf3, 0xff, 0xff, 0xff, 0xff, 0x0f,
>> +    0x44, 0xeb, 0x08, 0x6b, 0x08, 0x3b, 0x04, 0xbb,
>> +    0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00, 0xff,
>> +    0xff, 0xff, 0x44, 0xeb, 0x0c, 0x20, 0x0f, 0x52,
>> +    0x10, 0xd8, 0x00, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0x00, 0x36, 0x00, 0x27, 0x9d, 0xf9, 0xc0, 0x64,
>> +    0x85, 0xcb, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xc2, 0xf5, 0x08, 0x0a,
>> +    0x08, 0x04, 0x03, 0x06, 0x00, 0x00, 0x07, 0x29,
>> +    0x17, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
>> +};
>> +define_sfdp_read(mx25l25635f);
>> -- 
>> 2.35.3
>>


