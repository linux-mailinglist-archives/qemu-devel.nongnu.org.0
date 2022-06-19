Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D30550AB4
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 14:57:21 +0200 (CEST)
Received: from localhost ([::1]:46502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2uUS-0005Lw-4N
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 08:57:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uSY-0003h2-68
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 08:55:22 -0400
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:59173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o2uSW-00009t-C4
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 08:55:21 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.216])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 2AE4921F3B;
 Sun, 19 Jun 2022 12:55:17 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sun, 19 Jun
 2022 14:54:46 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00468795994-786a-4724-8a21-67fd54e8fb38,
 F3BB28978D5D33C371BBBD2B34D0F30B2C684C62) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <82ad0e87-01ce-4ce0-81b3-5d3ac5425245@kaod.org>
Date: Sun, 19 Jun 2022 14:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aspeed/hace: Add missing newlines to unimp messages
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220618090114.3158904-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220618090114.3158904-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 470eaaa9-f44a-459a-82b7-eb2d388c78c9
X-Ovh-Tracer-Id: 2060115355252394976
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddvledgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
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

On 6/18/22 11:01, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/misc/aspeed_hace.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 4b5997e18fad..731234b78c4c 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -340,12 +340,12 @@ static void aspeed_hace_write(void *opaque, hwaddr addr, uint64_t data,
>   
>           if ((data & HASH_HMAC_MASK)) {
>               qemu_log_mask(LOG_UNIMP,
> -                          "%s: HMAC engine command mode %"PRIx64" not implemented",
> +                          "%s: HMAC engine command mode %"PRIx64" not implemented\n",
>                             __func__, (data & HASH_HMAC_MASK) >> 8);
>           }
>           if (data & BIT(1)) {
>               qemu_log_mask(LOG_UNIMP,
> -                          "%s: Cascaded mode not implemented",
> +                          "%s: Cascaded mode not implemented\n",
>                             __func__);
>           }
>           algo = hash_algo_lookup(data);


