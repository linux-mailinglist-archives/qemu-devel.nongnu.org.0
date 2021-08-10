Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ACD3E55E7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 10:50:45 +0200 (CEST)
Received: from localhost ([::1]:51810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDNTA-0008LX-H4
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 04:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDNS1-0006mT-NP
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:49:33 -0400
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:51900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mDNRy-0001pH-Gs
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 04:49:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.220])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id E5A1628ECC1;
 Tue, 10 Aug 2021 10:49:25 +0200 (CEST)
Received: from kaod.org (37.59.142.98) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 10 Aug
 2021 10:49:24 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R0024775d0c9-81ba-482e-b0f4-a3fece37d259,
 8F36BE46FB8773C29BD4C9A30C998E4B5B7B2B54) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] hw: arm: aspeed: Enable mac0/1 instead of mac1/2 for g220a
To: Guenter Roeck <linux@roeck-us.net>
References: <20210810035742.550391-1-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <120feac5-4b64-6f84-9ae7-e9a88aa1de98@kaod.org>
Date: Tue, 10 Aug 2021 10:49:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210810035742.550391-1-linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d69b6e85-4e99-430e-927a-2c7ee16e93b9
X-Ovh-Tracer-Id: 4437453012023937897
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeelgddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeejkeduueduveelgeduueegkeelffevledujeetffeivdelvdfgkeeufeduheehfeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvth
Received-SPF: pass client-ip=188.165.45.220; envelope-from=clg@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>,
 John Wang <wangzhiqiang.bj@bytedance.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc: John Wang

On 8/10/21 5:57 AM, Guenter Roeck wrote:
> According to its dts file in the Linux kernel, we need mac0 and mac1 enabled
> instead of mac1 and mac2. Also, g220a is based on aspeed-g5 (ast2500) which
> doesn't even have the third interface.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/arm/aspeed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index ecf0c9cfac..20e3a77160 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -997,7 +997,7 @@ static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)
>      amc->fmc_model = "n25q512a";
>      amc->spi_model = "mx25l25635e";
>      amc->num_cs    = 2;
> -    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON;
> +    amc->macs_mask  = ASPEED_MAC0_ON | ASPEED_MAC1_ON;
>      amc->i2c_init  = g220a_bmc_i2c_init;
>      mc->default_ram_size = 1024 * MiB;
>      mc->default_cpus = mc->min_cpus = mc->max_cpus =
> 


