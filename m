Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2B44E39FB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 08:57:06 +0100 (CET)
Received: from localhost ([::1]:39228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZO5-0003N4-0K
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 03:57:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWZKl-0001hC-Fj
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:53:39 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:57563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWZKj-0004WV-Np
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:53:39 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A8160ED90713;
 Tue, 22 Mar 2022 08:53:34 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 22 Mar
 2022 08:53:33 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R0034483a90e-00ff-4804-98b1-91246c8ba5d7,
 469EFB141CFE40B2A85C1EB4DF33FF44F3CA3D4D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <7c995ed3-fa18-1679-59e9-41d5dc36a933@kaod.org>
Date: Tue, 22 Mar 2022 08:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 5/9] aspeed/timer: Add AST1030 support.
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-6-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220322025154.3989-6-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d8b26600-e89c-4fba-8afb-1ecf4b3f2009
X-Ovh-Tracer-Id: 9258837885085649851
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 03:51, Jamin Lin wrote:
> From: Steven Lee <steven_lee@aspeedtech.com>
> 
> ast1030 tmc(timer controller) is identical to ast2600 tmc.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/timer/aspeed_timer.c         | 17 +++++++++++++++++
>   include/hw/timer/aspeed_timer.h |  1 +
>   2 files changed, 18 insertions(+)
> 
> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
> index 42c47d2ce6..9c20b3d6ad 100644
> --- a/hw/timer/aspeed_timer.c
> +++ b/hw/timer/aspeed_timer.c
> @@ -745,12 +745,29 @@ static const TypeInfo aspeed_2600_timer_info = {
>       .class_init = aspeed_2600_timer_class_init,
>   };
>   
> +static void aspeed_1030_timer_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedTimerClass *awc = ASPEED_TIMER_CLASS(klass);
> +
> +    dc->desc = "ASPEED 1030 Timer";
> +    awc->read = aspeed_2600_timer_read;
> +    awc->write = aspeed_2600_timer_write;
> +}
> +
> +static const TypeInfo aspeed_1030_timer_info = {
> +    .name = TYPE_ASPEED_1030_TIMER,
> +    .parent = TYPE_ASPEED_TIMER,
> +    .class_init = aspeed_1030_timer_class_init,
> +};
> +
>   static void aspeed_timer_register_types(void)
>   {
>       type_register_static(&aspeed_timer_info);
>       type_register_static(&aspeed_2400_timer_info);
>       type_register_static(&aspeed_2500_timer_info);
>       type_register_static(&aspeed_2600_timer_info);
> +    type_register_static(&aspeed_1030_timer_info);
>   }
>   
>   type_init(aspeed_timer_register_types)
> diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
> index d36034a10c..07dc6b6f2c 100644
> --- a/include/hw/timer/aspeed_timer.h
> +++ b/include/hw/timer/aspeed_timer.h
> @@ -31,6 +31,7 @@ OBJECT_DECLARE_TYPE(AspeedTimerCtrlState, AspeedTimerClass, ASPEED_TIMER)
>   #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
>   #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
>   #define TYPE_ASPEED_2600_TIMER TYPE_ASPEED_TIMER "-ast2600"
> +#define TYPE_ASPEED_1030_TIMER TYPE_ASPEED_TIMER "-ast1030"
>   
>   #define ASPEED_TIMER_NR_TIMERS 8
>   


