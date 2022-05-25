Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFCD533F4E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 16:35:07 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nts6M-0001Dq-4S
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 10:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntrr9-0005Iy-At
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:19:23 -0400
Received: from 10.mo548.mail-out.ovh.net ([46.105.77.235]:33387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ntrr7-0001HE-56
 for qemu-devel@nongnu.org; Wed, 25 May 2022 10:19:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.102])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6358120E96;
 Wed, 25 May 2022 14:19:17 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 25 May
 2022 16:19:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001a83b4016-6d22-4fcd-990d-c5d7d53a019d,
 D6A97ED6E11FF164423AFC60B0B43C9491D8EECB) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5d57d89f-05c5-d248-4fae-ff6d484bdb8c@kaod.org>
Date: Wed, 25 May 2022 16:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] hw/arm/aspeed: Add i2c devices for AST2600 EVB
Content-Language: en-US
To: Howard Chiu <howard_chiu@aspeedtech.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Steven Lee
 <steven_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>
References: <SG2PR06MB2315A0711B0DC6903A0291BAE6D69@SG2PR06MB2315.apcprd06.prod.outlook.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <SG2PR06MB2315A0711B0DC6903A0291BAE6D69@SG2PR06MB2315.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c4e98ebc-24a3-4cad-82ff-65565c9c4a78
X-Ovh-Tracer-Id: 4243798224019295023
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgdejgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehjrghmihhnpghlihhnsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=46.105.77.235; envelope-from=clg@kaod.org;
 helo=10.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 5/25/22 12:00, Howard Chiu wrote:
> Add EEPROM and LM75 temperature sensor according to hardware schematic
> 
> Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index a74c13ab0f..df74d3e955 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -526,8 +526,15 @@ static void ast2500_evb_i2c_init(AspeedMachineState *bmc)
>   
>   static void ast2600_evb_i2c_init(AspeedMachineState *bmc)
>   {
> -    /* Start with some devices on our I2C busses */
> -    ast2500_evb_i2c_init(bmc);
> +    AspeedSoCState *soc = &bmc->soc;
> +    uint8_t *eeprom_buf = g_malloc0(8 * 1024);
> +
> +    smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50,
> +                          eeprom_buf);
> +
> +    /* LM75 is compatible with TMP105 driver */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 8),
> +                     TYPE_TMP105, 0x4d);
>   }
>   
>   static void romulus_bmc_i2c_init(AspeedMachineState *bmc)


