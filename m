Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4BB3A0BB1
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 06:52:51 +0200 (CEST)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqqCv-0003FD-Qt
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 00:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lqqBy-0002N9-5Z
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 00:51:50 -0400
Received: from smtpout2.3005.mail-out.ovh.net ([46.105.54.81]:43915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lqqBv-0002OP-DM
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 00:51:49 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.62])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 9179D143D3C;
 Wed,  9 Jun 2021 04:51:36 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 9 Jun
 2021 06:51:35 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006df8d1a23-506e-4849-bd5e-f2701553c479,
 8962E09D3B98DEC2FB864AA05CC490E9B3FF7AA6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH v2 3/3] hw/arm: quanta-q71l add pca954x muxes
To: Patrick Venture <venture@google.com>, <hskinnemoen@google.com>,
 <kfting@nuvoton.com>, <peter.maydell@linaro.org>, <andrew@aj.id.au>,
 <joel@jms.id.au>
References: <20210608202522.2677850-1-venture@google.com>
 <20210608202522.2677850-4-venture@google.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <aa327beb-0d48-7a1e-21f4-ead4de2c8fc4@kaod.org>
Date: Wed, 9 Jun 2021 06:51:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210608202522.2677850-4-venture@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c3b6a38d-5f9b-4ff1-a47c-4ff797b884a5
X-Ovh-Tracer-Id: 5248945367453698863
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedutddgkedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout2.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 10:25 PM, Patrick Venture wrote:
> Adds the pca954x muxes expected.
> 
> Tested: Booted quanta-q71l image to userspace.
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

I guess this patchset can go through the arm tree directly.

Thanks,

C.

> ---
>  hw/arm/Kconfig  |  1 +
>  hw/arm/aspeed.c | 11 ++++++++---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 9d1c2a6f7b..4a033e81ef 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -413,6 +413,7 @@ config ASPEED_SOC
>      select PCA9552
>      select SERIAL
>      select SMBUS_EEPROM
> +    select PCA954X
>      select SSI
>      select SSI_M25P80
>      select TMP105
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 3fe6c55744..35a28b0e8b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -14,6 +14,7 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/aspeed.h"
>  #include "hw/arm/aspeed_soc.h"
> +#include "hw/i2c/i2c_mux_pca954x.h"
>  #include "hw/i2c/smbus_eeprom.h"
>  #include "hw/misc/pca9552.h"
>  #include "hw/misc/tmp105.h"
> @@ -461,14 +462,18 @@ static void quanta_q71l_bmc_i2c_init(AspeedMachineState *bmc)
>      /* TODO: i2c-1: Add Frontpanel FRU eeprom@57 24c64 */
>      /* TODO: Add Memory Riser i2c mux and eeproms. */
>  
> -    /* TODO: i2c-2: pca9546@74 */
> -    /* TODO: i2c-2: pca9548@77 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9546", 0x74);
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 2), "pca9548", 0x77);
> +
>      /* TODO: i2c-3: Add BIOS FRU eeprom@56 24c64 */
> -    /* TODO: i2c-7: Add pca9546@70 */
> +
> +    /* i2c-7 */
> +    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "pca9546", 0x70);
>      /*        - i2c@0: pmbus@59 */
>      /*        - i2c@1: pmbus@58 */
>      /*        - i2c@2: pmbus@58 */
>      /*        - i2c@3: pmbus@59 */
> +
>      /* TODO: i2c-7: Add PDB FRU eeprom@52 */
>      /* TODO: i2c-8: Add BMC FRU eeprom@50 */
>  }
> 


