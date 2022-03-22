Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230AC4E3996
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 08:28:42 +0100 (CET)
Received: from localhost ([::1]:60560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWYwb-00060O-4j
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 03:28:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWYrn-0003kJ-Gp
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:23:43 -0400
Received: from 7.mo548.mail-out.ovh.net ([46.105.33.25]:47771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nWYrk-0006VS-OH
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 03:23:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.173])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5E86724490;
 Tue, 22 Mar 2022 07:23:28 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 22 Mar
 2022 08:23:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003940a262b-0815-484e-8a4c-68b15aab91ae,
 469EFB141CFE40B2A85C1EB4DF33FF44F3CA3D4D) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <698a471b-cfb1-b2ed-54e0-84585a042214@kaod.org>
Date: Tue, 22 Mar 2022 08:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v1 3/9] aspeed/wdt: Fix ast2500/ast2600 default reload
 value.
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, Cleber Rosa
 <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Beraldo
 Leal <bleal@redhat.com>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open
 list:All patches CC here" <qemu-devel@nongnu.org>
References: <20220322025154.3989-1-jamin_lin@aspeedtech.com>
 <20220322025154.3989-4-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220322025154.3989-4-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3f7c4d56-9a7f-41f2-adea-5197fccb3084
X-Ovh-Tracer-Id: 8750494079099505595
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeigedvffekgeeftedutddttdevudeihfegudffkeeitdekkeetkefhffelveelleenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepthhrohihpghlvggvsegrshhpvggvughtvggthhdrtghomh
Received-SPF: pass client-ip=46.105.33.25; envelope-from=clg@kaod.org;
 helo=7.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Per ast2500_2520_datasheet_v1.8 and ast2600v11.pdf, the default value of
> WDT00 and WDT04 is 0x014FB180 for ast2500/ast2600.
> Add default_status and default_reload_value attributes for storing
> counter status and reload value as they are different from ast2400.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/watchdog/wdt_aspeed.c         | 10 ++++++++--
>   include/hw/watchdog/wdt_aspeed.h |  2 ++
>   2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
> index 6aa6f90b66..386928e9c0 100644
> --- a/hw/watchdog/wdt_aspeed.c
> +++ b/hw/watchdog/wdt_aspeed.c
> @@ -232,8 +232,8 @@ static void aspeed_wdt_reset(DeviceState *dev)
>       AspeedWDTState *s = ASPEED_WDT(dev);
>       AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(s);
>   
> -    s->regs[WDT_STATUS] = 0x3EF1480;
> -    s->regs[WDT_RELOAD_VALUE] = 0x03EF1480;
> +    s->regs[WDT_STATUS] = awc->default_status;
> +    s->regs[WDT_RELOAD_VALUE] = awc->default_reload_value;
>       s->regs[WDT_RESTART] = 0;
>       s->regs[WDT_CTRL] = awc->sanitize_ctrl(0);
>       s->regs[WDT_RESET_WIDTH] = 0xFF;
> @@ -319,6 +319,8 @@ static void aspeed_2400_wdt_class_init(ObjectClass *klass, void *data)
>       awc->reset_ctrl_reg = SCU_RESET_CONTROL1;
>       awc->wdt_reload = aspeed_wdt_reload;
>       awc->sanitize_ctrl = aspeed_2400_sanitize_ctrl;
> +    awc->default_status = 0x03EF1480;
> +    awc->default_reload_value = 0x03EF1480;
>   }
>   
>   static const TypeInfo aspeed_2400_wdt_info = {
> @@ -355,6 +357,8 @@ static void aspeed_2500_wdt_class_init(ObjectClass *klass, void *data)
>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
>       awc->wdt_reload = aspeed_wdt_reload_1mhz;
>       awc->sanitize_ctrl = aspeed_2500_sanitize_ctrl;
> +    awc->default_status = 0x014FB180;
> +    awc->default_reload_value = 0x014FB180;
>   }
>   
>   static const TypeInfo aspeed_2500_wdt_info = {
> @@ -376,6 +380,8 @@ static void aspeed_2600_wdt_class_init(ObjectClass *klass, void *data)
>       awc->reset_pulse = aspeed_2500_wdt_reset_pulse;
>       awc->wdt_reload = aspeed_wdt_reload_1mhz;
>       awc->sanitize_ctrl = aspeed_2600_sanitize_ctrl;
> +    awc->default_status = 0x014FB180;
> +    awc->default_reload_value = 0x014FB180;
>   }
>   
>   static const TypeInfo aspeed_2600_wdt_info = {
> diff --git a/include/hw/watchdog/wdt_aspeed.h b/include/hw/watchdog/wdt_aspeed.h
> index f945cd6c58..0e37f39f38 100644
> --- a/include/hw/watchdog/wdt_aspeed.h
> +++ b/include/hw/watchdog/wdt_aspeed.h
> @@ -45,6 +45,8 @@ struct AspeedWDTClass {
>       void (*reset_pulse)(AspeedWDTState *s, uint32_t property);
>       void (*wdt_reload)(AspeedWDTState *s);
>       uint64_t (*sanitize_ctrl)(uint64_t data);
> +    uint32_t default_status;
> +    uint32_t default_reload_value;
>   };
>   
>   #endif /* WDT_ASPEED_H */


