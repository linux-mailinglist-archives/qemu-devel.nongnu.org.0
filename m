Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB7455FABD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 10:38:42 +0200 (CEST)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6TDd-0007VH-Bf
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 04:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6T6l-0002bn-C3
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:31:35 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:47893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6T6i-00048E-O7
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 04:31:34 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.12])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A334023110;
 Wed, 29 Jun 2022 08:31:28 +0000 (UTC)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Wed, 29 Jun
 2022 10:31:27 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002c5854063-82b0-4495-927c-b826231f9140,
 74A1F81DE4F8936248B5873BB0AED4007818FEC6) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1861be2b-9f62-4201-ed8b-33b9c6bbb41b@kaod.org>
Date: Wed, 29 Jun 2022 10:31:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 03/13] hw/i2c/aspeed: Fix MASTER_EN missing error
 message
Content-Language: en-US
To: Peter Delevoryas <peterdelevoryas@gmail.com>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220629033634.3850922-1-pdel@fb.com>
 <20220629033634.3850922-4-pdel@fb.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220629033634.3850922-4-pdel@fb.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c8d8c18a-d1e6-4ad7-95e5-e4591ff3df58
X-Ovh-Tracer-Id: 999799118366346162
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudegledgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/22 05:36, Peter Delevoryas wrote:
> aspeed_i2c_bus_is_master is checking if master mode is enabled in the I2C
> bus controller's function-control register, not that slave mode is enabled
> or something.  The error here is that the guest is trying to trigger an I2C
> master mode command while master mode is not enabled.
> 
> Fixes: ba2cccd64e90f342 ("aspeed: i2c: Add new mode support")
> Signed-off-by: Peter Delevoryas <pdel@fb.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>   hw/i2c/aspeed_i2c.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
> index cbaa7c96fc..c153a1a942 100644
> --- a/hw/i2c/aspeed_i2c.c
> +++ b/hw/i2c/aspeed_i2c.c
> @@ -601,7 +601,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
>           }
>   
>           if (!aspeed_i2c_bus_is_master(bus)) {
> -            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Master mode is not enabled\n",
>                             __func__);
>               break;
>           }
> @@ -744,7 +744,7 @@ static void aspeed_i2c_bus_old_write(AspeedI2CBus *bus, hwaddr offset,
>           }
>   
>           if (!aspeed_i2c_bus_is_master(bus)) {
> -            qemu_log_mask(LOG_UNIMP, "%s: slave mode not implemented\n",
> +            qemu_log_mask(LOG_GUEST_ERROR, "%s: Master mode is not enabled\n",
>                             __func__);
>               break;
>           }


