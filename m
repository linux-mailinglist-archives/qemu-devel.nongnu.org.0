Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0265716F1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 12:14:17 +0200 (CEST)
Received: from localhost ([::1]:58210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCuG-0006Yy-Lm
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 06:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBCrI-0001IH-1L
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:11:13 -0400
Received: from 6.mo548.mail-out.ovh.net ([188.165.58.48]:49563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oBCrF-0008Ou-E8
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 06:11:11 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 92E302181D;
 Tue, 12 Jul 2022 10:10:57 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 12 Jul
 2022 12:10:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G00207753fc6-92c4-4791-9777-de1138a73027,
 45D3CB73ADAA424D805A6DB9B8EE1C960B0FAC85) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <2b0cff90-1b42-f95e-8278-ddfcd89e4619@kaod.org>
Date: Tue, 12 Jul 2022 12:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] aspeed: Add fby35-bmc slot GPIO's
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <thuth@redhat.com>, <lvivier@redhat.com>, <pbonzini@redhat.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220712023219.41065-1-peter@pjd.dev>
 <20220712023219.41065-4-peter@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220712023219.41065-4-peter@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a3b339b5-cd15-4ef2-8456-f74a9b92b659
X-Ovh-Tracer-Id: 5237967845722000175
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudejhedgvdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=188.165.58.48; envelope-from=clg@kaod.org;
 helo=6.mo548.mail-out.ovh.net
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

On 7/12/22 04:32, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 6fe9b13548..0ce9a42c2b 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1343,11 +1343,23 @@ static void fby35_reset(MachineState *state)
>   
>       qemu_devices_reset();
>   
> -    /* Board ID */
> +    /* Board ID: 7 (Class-1, 4 slots) */
>       object_property_set_bool(OBJECT(gpio), "gpioV4", true, &error_fatal);
>       object_property_set_bool(OBJECT(gpio), "gpioV5", true, &error_fatal);
>       object_property_set_bool(OBJECT(gpio), "gpioV6", true, &error_fatal);
>       object_property_set_bool(OBJECT(gpio), "gpioV7", false, &error_fatal);
> +
> +    /* Slot presence pins, inverse polarity. (False means present) */
> +    object_property_set_bool(OBJECT(gpio), "gpioH4", false, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioH5", true, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioH6", true, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioH7", true, &error_fatal);
> +
> +    /* Slot 12v power pins, normal polarity. (True means powered-on) */
> +    object_property_set_bool(OBJECT(gpio), "gpioB2", true, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
> +    object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
>   }
>   
>   static void aspeed_machine_fby35_class_init(ObjectClass *oc, void *data)


