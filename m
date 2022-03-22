Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CF94E39EE
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 08:54:45 +0100 (CET)
Received: from localhost ([::1]:37354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZLo-00027M-Aw
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 03:54:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWZKH-00010d-B3; Tue, 22 Mar 2022 03:53:09 -0400
Received: from 2.mo548.mail-out.ovh.net ([178.33.255.19]:60981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1nWZKF-0004Su-CT; Tue, 22 Mar 2022 03:53:09 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.227])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id D53FB23F35;
 Tue, 22 Mar 2022 07:53:02 +0000 (UTC)
Received: from kaod.org (37.59.142.107) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 22 Mar
 2022 08:53:01 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-107S001a1fdc2ca-cc46-4e1e-9321-078b62af6524,
 469EFB141CFE40B2A85C1EB4DF33FF44F3CA3D4D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <599d3dc3-7c2d-9e52-7c32-82c6802ae801@kaod.org>
Date: Tue, 22 Mar 2022 08:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 1/9] aspeed/adc: Add AST1030 support
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-2-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220322025154.3989-2-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.107]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: a02ce098-9d4e-421a-b3d7-46c8ae30db26
X-Ovh-Tracer-Id: 9249830686498589627
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehtrhhohigplhgvvgesrghsphgvvgguthgvtghhrdgtohhm
Received-SPF: pass client-ip=178.33.255.19; envelope-from=clg@kaod.org;
 helo=2.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 03:51, Jamin Lin wrote:
> From: Steven Lee <steven_lee@aspeedtech.com>
> 
> Per ast1030_v7.pdf, AST1030 ADC engine is identical to AST2600's ADC.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.



> ---
>   hw/adc/aspeed_adc.c         | 16 ++++++++++++++++
>   include/hw/adc/aspeed_adc.h |  1 +
>   2 files changed, 17 insertions(+)
> 
> diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
> index c5fcae29f6..0d29663129 100644
> --- a/hw/adc/aspeed_adc.c
> +++ b/hw/adc/aspeed_adc.c
> @@ -389,6 +389,15 @@ static void aspeed_2600_adc_class_init(ObjectClass *klass, void *data)
>       aac->nr_engines = 2;
>   }
>   
> +static void aspeed_1030_adc_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    AspeedADCClass *aac = ASPEED_ADC_CLASS(klass);
> +
> +    dc->desc = "ASPEED 1030 ADC Controller";
> +    aac->nr_engines = 2;
> +}
> +
>   static const TypeInfo aspeed_adc_info = {
>       .name = TYPE_ASPEED_ADC,
>       .parent = TYPE_SYS_BUS_DEVICE,
> @@ -415,6 +424,12 @@ static const TypeInfo aspeed_2600_adc_info = {
>       .class_init = aspeed_2600_adc_class_init,
>   };
>   
> +static const TypeInfo aspeed_1030_adc_info = {
> +    .name = TYPE_ASPEED_1030_ADC,
> +    .parent = TYPE_ASPEED_ADC,
> +    .class_init = aspeed_1030_adc_class_init, /* No change since AST2600 */
> +};
> +
>   static void aspeed_adc_register_types(void)
>   {
>       type_register_static(&aspeed_adc_engine_info);
> @@ -422,6 +437,7 @@ static void aspeed_adc_register_types(void)
>       type_register_static(&aspeed_2400_adc_info);
>       type_register_static(&aspeed_2500_adc_info);
>       type_register_static(&aspeed_2600_adc_info);
> +    type_register_static(&aspeed_1030_adc_info);
>   }
>   
>   type_init(aspeed_adc_register_types);
> diff --git a/include/hw/adc/aspeed_adc.h b/include/hw/adc/aspeed_adc.h
> index 2f166e8be1..ff1d06ea91 100644
> --- a/include/hw/adc/aspeed_adc.h
> +++ b/include/hw/adc/aspeed_adc.h
> @@ -17,6 +17,7 @@
>   #define TYPE_ASPEED_2400_ADC TYPE_ASPEED_ADC "-ast2400"
>   #define TYPE_ASPEED_2500_ADC TYPE_ASPEED_ADC "-ast2500"
>   #define TYPE_ASPEED_2600_ADC TYPE_ASPEED_ADC "-ast2600"
> +#define TYPE_ASPEED_1030_ADC TYPE_ASPEED_ADC "-ast1030"
>   OBJECT_DECLARE_TYPE(AspeedADCState, AspeedADCClass, ASPEED_ADC)
>   
>   #define TYPE_ASPEED_ADC_ENGINE "aspeed.adc.engine"


