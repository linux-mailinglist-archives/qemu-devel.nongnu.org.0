Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B45866BC9D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 12:15:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHNS8-00052J-P6; Mon, 16 Jan 2023 06:15:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNS0-0004tO-RS; Mon, 16 Jan 2023 06:14:53 -0500
Received: from smtpout2.mo529.mail-out.ovh.net ([79.137.123.220])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1pHNRy-0005Zd-TK; Mon, 16 Jan 2023 06:14:52 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.177])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 36698154B7BA9;
 Mon, 16 Jan 2023 12:14:45 +0100 (CET)
Received: from kaod.org (37.59.142.106) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Mon, 16 Jan
 2023 12:14:45 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00671f4950b-a78c-4c07-8f02-718a5419738b,
 9562F276D9C9043C19838F7BDA7B87DE9C964FD3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <47e263df-5053-31be-38b3-51f08c0f82fa@kaod.org>
Date: Mon, 16 Jan 2023 12:14:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 4/6] hw/arm/npcm7xx: Remove local copy of at24c_eeprom_init
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <patrick@stwcx.xyz>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>, <hskinnemoen@google.com>, <kfting@nuvoton.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-5-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20230114170151.87833-5-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9cf531f7-0b60-4da2-b17a-aa2f44b542d5
X-Ovh-Tracer-Id: 3577265482235611951
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtgedgvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeffudefleeiudejfeffhfejffeigffhhffhvdekieejheelvdeufffhjedtheeggeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoegtlhhgsehkrghougdrohhrgheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhesphhjugdruggvvhdpphgrthhrihgtkhesshhtfigtgidrgiihiidpphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdgrnhgurhgvfiesrghjrdhiugdrrghupdhjohgvlhesjhhmshdrihgurdgruhdphhhskhhinhhnvghmohgvnhesghhoohhglhgvrdgtohhmpdhkfhhtihhnghesnhhuvhhothhonhdrtghomhdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmh
 hohedvledpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=79.137.123.220; envelope-from=clg@kaod.org;
 helo=smtpout2.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/14/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/arm/npcm7xx_boards.c | 20 +++++---------------
>   1 file changed, 5 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> index 6bc6f5d2fe29..9b31207a06e9 100644
> --- a/hw/arm/npcm7xx_boards.c
> +++ b/hw/arm/npcm7xx_boards.c
> @@ -21,6 +21,7 @@
>   #include "hw/i2c/i2c_mux_pca954x.h"
>   #include "hw/i2c/smbus_eeprom.h"
>   #include "hw/loader.h"
> +#include "hw/nvram/eeprom_at24c.h"
>   #include "hw/qdev-core.h"
>   #include "hw/qdev-properties.h"
>   #include "qapi/error.h"
> @@ -140,17 +141,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
>       return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
>   }
>   
> -static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
> -                              uint32_t rsize)
> -{
> -    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
> -    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
> -    DeviceState *dev = DEVICE(i2c_dev);
> -
> -    qdev_prop_set_uint32(dev, "rom-size", rsize);
> -    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
> -}
> -
>   static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
>                                         NPCM7xxState *soc, const int *fan_counts)
>   {
> @@ -253,8 +243,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
>       i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
>       i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
>   
> -    at24c_eeprom_init(soc, 9, 0x55, 8192);
> -    at24c_eeprom_init(soc, 10, 0x55, 8192);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 9), 0x55, 8192);
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 10), 0x55, 8192);
>   
>       /*
>        * i2c-11:
> @@ -360,7 +350,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
>   
>       i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), TYPE_PCA9548, 0x77);
>   
> -    at24c_eeprom_init(soc, 4, 0x50, 8192); /* mbfru */
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 4), 0x50, 8192); /* mbfru */
>   
>       i2c_mux = i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 13),
>                                         TYPE_PCA9548, 0x77);
> @@ -371,7 +361,7 @@ static void kudo_bmc_i2c_init(NPCM7xxState *soc)
>       i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 4), "tmp105", 0x48);
>       i2c_slave_create_simple(pca954x_i2c_get_bus(i2c_mux, 5), "tmp105", 0x49);
>   
> -    at24c_eeprom_init(soc, 14, 0x55, 8192); /* bmcfru */
> +    at24c_eeprom_init(npcm7xx_i2c_get_bus(soc, 14), 0x55, 8192); /* bmcfru */
>   
>       /* TODO: Add remaining i2c devices. */
>   }


