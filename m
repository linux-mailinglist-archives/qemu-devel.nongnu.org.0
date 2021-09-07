Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E74340264A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 11:41:58 +0200 (CEST)
Received: from localhost ([::1]:34450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNXc5-0004UF-Ko
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 05:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNXbA-0003ZF-Et; Tue, 07 Sep 2021 05:41:00 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:48489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mNXb8-0001gS-Jk; Tue, 07 Sep 2021 05:41:00 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.144])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 1B195BCBE9A5;
 Tue,  7 Sep 2021 11:40:54 +0200 (CEST)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 7 Sep
 2021 11:40:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R00145df95ec-ea45-4deb-b2d0-07083a893548,
 984F41D2D9692A95DAA6D5E609006558D983FB00) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 05/10] aspeed/smc: Remove the 'flash' attribute from
 AspeedSMCFlash
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
References: <20210907065822.1152443-1-clg@kaod.org>
 <20210907065822.1152443-6-clg@kaod.org>
 <497a0a23-570c-964d-80cb-e590749d20f9@amsat.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <31b33d22-6458-308d-afff-a76657824a52@kaod.org>
Date: Tue, 7 Sep 2021 11:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <497a0a23-570c-964d-80cb-e590749d20f9@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 805f946d-ff71-4e38-81c0-9b57586accba
X-Ovh-Tracer-Id: 3721380669543320425
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrudefhedgvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepfhegsghughesrghmshgrthdrohhrgh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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
Cc: Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 10:36 AM, Philippe Mathieu-Daudé wrote:
> On 9/7/21 8:58 AM, Cédric Le Goater wrote:
>> There is no use for it.
> 
> Hmmm this is not the correct justification.
> 
> This devices sits on a bus, so its state will be released when
> the bus is released. There is no need to release it manually,
> so we can remove the reference.

That's what the code is doing AFAIUI.

This is just removing the AspeedSMCFlash attribute because it is 
not used anywhere else than under aspeed_board_init_flashes().
 
Is there anything else ? I am bit lost by your comment.

Thanks,

C.

> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  include/hw/ssi/aspeed_smc.h |  1 -
>>  hw/arm/aspeed.c             | 11 +++++------
>>  2 files changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 0ea536a44c3a..f32f66f9a838 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -37,7 +37,6 @@ typedef struct AspeedSMCFlash {
>>      uint32_t size;
>>  
>>      MemoryRegion mmio;
>> -    DeviceState *flash;
>>  } AspeedSMCFlash;
>>  
>>  #define TYPE_ASPEED_SMC "aspeed.smc"
>> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
>> index 95ce4b1670ac..64c3a7fb66db 100644
>> --- a/hw/arm/aspeed.c
>> +++ b/hw/arm/aspeed.c
>> @@ -274,18 +274,17 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
>>      int i ;
>>  
>>      for (i = 0; i < s->num_cs; ++i) {
>> -        AspeedSMCFlash *fl = &s->flashes[i];
>>          DriveInfo *dinfo = drive_get_next(IF_MTD);
>>          qemu_irq cs_line;
>> +        DeviceState *dev;
>>  
>> -        fl->flash = qdev_new(flashtype);
>> +        dev = qdev_new(flashtype);
>>          if (dinfo) {
>> -            qdev_prop_set_drive(fl->flash, "drive",
>> -                                blk_by_legacy_dinfo(dinfo));
>> +            qdev_prop_set_drive(dev, "drive", blk_by_legacy_dinfo(dinfo));
>>          }
>> -        qdev_realize_and_unref(fl->flash, BUS(s->spi), &error_fatal);
>> +        qdev_realize_and_unref(dev, BUS(s->spi), &error_fatal);
>>  
>> -        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
>> +        cs_line = qdev_get_gpio_in_named(dev, SSI_GPIO_CS, 0);
>>          sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
>>      }
>>  }
>>
> 


