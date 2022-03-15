Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834304D98A7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 11:24:44 +0100 (CET)
Received: from localhost ([::1]:44984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU4M7-00085g-Jg
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 06:24:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU2ok-0003RK-4D
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:46:10 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:40533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nU2og-0005VQ-Ui
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:46:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.180])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DC209EA19B91;
 Tue, 15 Mar 2022 09:46:02 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 15 Mar
 2022 09:46:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003976f5711-98e0-4acb-b8f3-43dc6153c14e,
 5DBA5639B77BD7FE35D3F16CFE7686729AB21D01) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <39ab9dc0-8581-8c27-698c-51ec2c65d104@kaod.org>
Date: Tue, 15 Mar 2022 09:46:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 2/2] hw: aspeed_scu: Introduce clkin_25Mhz attribute
Content-Language: en-US
To: Steven Lee <steven_lee@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220315075753.8591-1-steven_lee@aspeedtech.com>
 <20220315075753.8591-3-steven_lee@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220315075753.8591-3-steven_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: b168ada6-2129-4559-9348-38f960535b95
X-Ovh-Tracer-Id: 5929551860001573740
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddvledguddvvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepjhgrmhhinhgplhhinhesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: troy_lee@aspeedtech.com, jamin_lin@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/22 08:57, Steven Lee wrote:
> AST2600 clkin is always 25MHz, introduce clkin_25Mhz attribute
> for aspeed_scu_get_clkin() to return the correct clkin for ast2600.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/misc/aspeed_scu.c         | 6 +++++-
>   include/hw/misc/aspeed_scu.h | 1 +
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
> index d65f86df3d..150567f98a 100644
> --- a/hw/misc/aspeed_scu.c
> +++ b/hw/misc/aspeed_scu.c
> @@ -371,7 +371,8 @@ static const MemoryRegionOps aspeed_ast2500_scu_ops = {
>   
>   static uint32_t aspeed_scu_get_clkin(AspeedSCUState *s)
>   {
> -    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN) {
> +    if (s->hw_strap1 & SCU_HW_STRAP_CLK_25M_IN ||
> +        ASPEED_SCU_GET_CLASS(s)->clkin_25Mhz) {
>           return 25000000;
>       } else if (s->hw_strap1 & SCU_HW_STRAP_CLK_48M_IN) {
>           return 48000000;
> @@ -562,6 +563,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
>       asc->get_apb = aspeed_2400_scu_get_apb_freq;
>       asc->apb_divider = 2;
>       asc->nr_regs = ASPEED_SCU_NR_REGS;
> +    asc->clkin_25Mhz = false;
>       asc->ops = &aspeed_ast2400_scu_ops;
>   }
>   
> @@ -583,6 +585,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
>       asc->get_apb = aspeed_2400_scu_get_apb_freq;
>       asc->apb_divider = 4;
>       asc->nr_regs = ASPEED_SCU_NR_REGS;
> +    asc->clkin_25Mhz = false;
>       asc->ops = &aspeed_ast2500_scu_ops;
>   }
>   
> @@ -756,6 +759,7 @@ static void aspeed_2600_scu_class_init(ObjectClass *klass, void *data)
>       asc->get_apb = aspeed_2600_scu_get_apb_freq;
>       asc->apb_divider = 4;
>       asc->nr_regs = ASPEED_AST2600_SCU_NR_REGS;
> +    asc->clkin_25Mhz = true;
>       asc->ops = &aspeed_ast2600_scu_ops;
>   }
>   
> diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
> index 6bf67589e8..fdc721846c 100644
> --- a/include/hw/misc/aspeed_scu.h
> +++ b/include/hw/misc/aspeed_scu.h
> @@ -59,6 +59,7 @@ struct AspeedSCUClass {
>       uint32_t (*get_apb)(AspeedSCUState *s);
>       uint32_t apb_divider;
>       uint32_t nr_regs;
> +    bool clkin_25Mhz;
>       const MemoryRegionOps *ops;
>   };
>   


