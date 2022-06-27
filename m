Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C663A55B9D4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:18:32 +0200 (CEST)
Received: from localhost ([::1]:56570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5odL-0007ON-LU
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o5oZQ-0002U0-El; Mon, 27 Jun 2022 09:14:28 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:55917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1o5oZL-0004YF-IS; Mon, 27 Jun 2022 09:14:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.68])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 60993282FF;
 Mon, 27 Jun 2022 13:14:18 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 27 Jun
 2022 15:14:18 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006667ce887-29b3-47ff-b4d9-2dbed898d180,
 659C98CE65B422D4D127A36693B7EAD6442F0B22) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <24a7020e-10b8-7a46-65be-a24054de2d93@kaod.org>
Date: Mon, 27 Jun 2022 15:14:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aspeed/hace: Accumulative mode supported
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
CC: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Steven Lee <steven_lee@aspeedtech.com>
References: <20220627100816.125956-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220627100816.125956-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c8a64324-f8ac-4563-ab4b-3602f4fa58e0
X-Ovh-Tracer-Id: 12477785720702077859
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeghedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehsthgvvhgvnhgplhgvvgesrghsphgvvgguthgvtghhrdgtohhmpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
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

On 6/27/22 12:08, Joel Stanley wrote:
> While the HMAC mode is not modelled, the accumulative mode is.
> 
> Accumulative mode is enabled by setting one of the bits in the HMAC
> engine command mode part of the register, so fix the unimplemented check
> to only look at the upper of the two bits.
> 
> Fixes: 5cd7d8564a8b ("aspeed/hace: Support AST2600 HACE")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

>   hw/misc/aspeed_hace.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 731234b78c4c..ac21be306c69 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -338,10 +338,10 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>           int algo;
>           data &= ahc->hash_mask;
>   
> -        if ((data & HASH_HMAC_MASK)) {
> +        if ((data & HASH_DIGEST_HMAC)) {
>               qemu_log_mask(LOG_UNIMP,
> -                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
> -                          __func__, (data & HASH_HMAC_MASK) >> 8);
> +                          "%s: HMAC mode not implemented\n",
> +                          __func__);
>           }
>           if (data & BIT(1)) {
>               qemu_log_mask(LOG_UNIMP,


