Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EDB3A7605
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 06:39:22 +0200 (CEST)
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt0rB-0004LY-EB
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 00:39:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lt0qQ-0003Uw-IZ
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:38:34 -0400
Received: from 4.mo51.mail-out.ovh.net ([188.165.42.229]:37565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lt0qO-0005vT-SX
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 00:38:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.7])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 43C382A8D27;
 Tue, 15 Jun 2021 06:38:21 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Tue, 15 Jun
 2021 06:38:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00630d288eb-b628-4195-a1d9-eac07ced5816,
 C0A23537F2FFB9D7AAC434AAD4F3C11B0BA66CE8) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH 2/2] arm/aspeed: Add DPS310 to Witherspoon and Rainier
To: Joel Stanley <joel@jms.id.au>
References: <20210609105802.17015-1-joel@jms.id.au>
 <20210609105802.17015-3-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d6b6bc7c-a938-ee1b-e315-e2b434604f8e@kaod.org>
Date: Tue, 15 Jun 2021 06:38:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210609105802.17015-3-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8d2ad73c-02fc-4b6d-ad1d-1e4c9e4a4c69
X-Ovh-Tracer-Id: 3367566622460513248
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedviedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo51.mail-out.ovh.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/21 12:58 PM, Joel Stanley wrote:
> Witherspoon uses the DPS310 as a temperature sensor. Rainier uses it as
> a temperature and humidity sensor.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C. 

> ---
>  hw/arm/aspeed.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 0eafc791540d..619ad869dd71 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -597,7 +597,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>  
>      /* Bus 3: TODO bmp280@77 */
>      /* Bus 3: TODO max31785@52 */
> -    /* Bus 3: TODO dps310@76 */
>      dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
>      qdev_prop_set_string(dev, "description", "pca1");
>      i2c_slave_realize_and_unref(I2C_SLAVE(dev),
> @@ -612,6 +611,7 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
>          qdev_connect_gpio_out(dev, pca1_leds[i].gpio_id,
>                                qdev_get_gpio_in(DEVICE(led), 0));
>      }
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", 0x76);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
>  
> @@ -693,9 +693,9 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 6), TYPE_TMP105,
>                       0x4b);
>  
> -    /* Bus 7: TODO dps310@76 */
>      /* Bus 7: TODO max31785@52 */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9552", 0x61);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", 0x76);
>      /* Bus 7: TODO si7021-a20@20 */
>      i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
>                       0x48);
> 


