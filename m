Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B25336DF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 08:46:11 +0200 (CEST)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntkmX-0000xh-Tu
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 02:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntkU0-0004ns-00
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:27:01 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:52499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntkTx-0003BH-Ju
 for qemu-devel@nongnu.org; Wed, 25 May 2022 02:26:59 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 3817C1039B842;
 Wed, 25 May 2022 08:26:53 +0200 (CEST)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 25 May
 2022 08:26:53 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004db140786-3551-460d-b50a-7f33736346c7,
 D6A97ED6E11FF164423AFC60B0B43C9491D8EECB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <690b6f4c-f596-0c64-1b19-47af1d32a9ba@kaod.org>
Date: Wed, 25 May 2022 08:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 4/4] hw/gpio: replace HWADDR_PRIx with PRIx64
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
CC: <steven_lee@aspeedtech.com>, <troy_lee@aspeedtech.com>
References: <20220525053444.27228-1-jamin_lin@aspeedtech.com>
 <20220525053444.27228-5-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220525053444.27228-5-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 1fa6baee-4d56-49eb-8018-4b6f47d536df
X-Ovh-Tracer-Id: 14712415560385661804
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjeeggddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/25/22 07:34, Jamin Lin wrote:
> 1. replace HWADDR_PRIx with PRIx64
> 2. fix indent issue
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.




> ---
>   hw/gpio/aspeed_gpio.c         | 8 ++++----
>   include/hw/gpio/aspeed_gpio.h | 2 +-
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index c834bf19f5..a62a673857 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -561,7 +561,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
>       reg = &agc->reg_table[idx];
>       if (reg->set_idx >= agc->nr_gpio_sets) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return 0;
>       }
>   
> @@ -611,7 +611,7 @@ static uint64_t aspeed_gpio_read(void *opaque, hwaddr offset, uint32_t size)
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no getter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return 0;
>       }
>   
> @@ -787,7 +787,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>       reg = &agc->reg_table[idx];
>       if (reg->set_idx >= agc->nr_gpio_sets) {
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return;
>       }
>   
> @@ -872,7 +872,7 @@ static void aspeed_gpio_write(void *opaque, hwaddr offset, uint64_t data,
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR, "%s: no setter for offset 0x%"
> -                      HWADDR_PRIx"\n", __func__, offset);
> +                      PRIx64"\n", __func__, offset);
>           return;
>       }
>       aspeed_gpio_update(s, set, set->data_value);
> diff --git a/include/hw/gpio/aspeed_gpio.h b/include/hw/gpio/aspeed_gpio.h
> index 41b36524d0..904eecf62c 100644
> --- a/include/hw/gpio/aspeed_gpio.h
> +++ b/include/hw/gpio/aspeed_gpio.h
> @@ -67,7 +67,7 @@ enum GPIORegIndexType {
>   typedef struct AspeedGPIOReg {
>       uint16_t set_idx;
>       enum GPIORegType type;
> - } AspeedGPIOReg;
> +} AspeedGPIOReg;
>   
>   struct AspeedGPIOClass {
>       SysBusDevice parent_obj;


