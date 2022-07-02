Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE67563EB8
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:04:24 +0200 (CEST)
Received: from localhost ([::1]:57548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WEw-0003LU-Nu
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WC3-00024f-AU
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:01:23 -0400
Received: from 7.mo552.mail-out.ovh.net ([188.165.59.253]:48323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o7WC0-0004ga-8b
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:01:23 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 6C66624856;
 Sat,  2 Jul 2022 06:01:16 +0000 (UTC)
Received: from kaod.org (37.59.142.110) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 2 Jul 2022
 08:01:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0041635b4ef-0324-4f2f-90f9-e91b11c1f8c2,
 FB2626423410402F5F47B43F186DFD06AD25B17E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <3b367b09-075e-a21b-8d24-3b2be091f816@kaod.org>
Date: Sat, 2 Jul 2022 08:01:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] aspeed: Create SRAM name from first CPU index
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20220701180603.38408-1-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220701180603.38408-1-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 271d87e8-5d0a-4bb2-99f6-de98edbafc89
X-Ovh-Tracer-Id: 16081228370541251366
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.59.253; envelope-from=clg@kaod.org;
 helo=7.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/1/22 20:06, Peter Delevoryas wrote:
> To support multiple SoC's running simultaneously, we need a unique name for
> each RAM region. DRAM is created by the machine, but SRAM is created by the
> SoC, since in hardware it is part of the SoC's internals.
> 
> We need a way to uniquely identify each SRAM region though, for VM
> migration. Since each of the SoC's CPU's has an index which identifies it
> uniquely from other CPU's in the machine, we can use the index of any of the
> CPU's in the SoC to uniquely identify differentiate the SRAM name from other
> SoC SRAM's. In this change, I just elected to use the index of the first CPU
> in each SoC.

hopefully the index is allocated. Did you check ?


> Signed-off-by: Peter Delevoryas <me@pjd.dev>
> ---
>   hw/arm/aspeed_ast10x0.c | 5 ++++-
>   hw/arm/aspeed_ast2600.c | 5 +++--
>   hw/arm/aspeed_soc.c     | 5 +++--
>   3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 33ef331771..b6b6f0d053 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -159,6 +159,7 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       DeviceState *armv7m;
>       Error *err = NULL;
>       int i;
> +    char name[64];
>   
>       if (!clock_has_source(s->sysclk)) {
>           error_setg(errp, "sysclk clock must be wired up by the board code");
> @@ -183,7 +184,9 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>       sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), &error_abort);
>   
>       /* Internal SRAM */
> -    memory_region_init_ram(&s->sram, NULL, "aspeed.sram", sc->sram_size, &err);
> +    snprintf(name, sizeof(name), "aspeed.sram.%d",
> +             CPU(s->armv7m.cpu)->cpu_index);
> +    memory_region_init_ram(&s->sram, NULL, name, sc->sram_size, &err);
>       if (err != NULL) {
>           error_propagate(errp, err);
>           return;
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 3f0611ac11..7efb9f888a 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -276,6 +276,7 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       Error *err = NULL;
>       qemu_irq irq;
> +    char name[64];

May be ?

      g_autofree char *sram_name =
             g_strdup_printf("aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);


Thanks,

C.


>   
>       /* IO space */
>       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> @@ -335,8 +336,8 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* SRAM */
> -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> -                           sc->sram_size, &err);
> +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
>       if (err) {
>           error_propagate(errp, err);
>           return;
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 0f675e7fcd..1ddba33d2a 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -239,6 +239,7 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       AspeedSoCState *s = ASPEED_SOC(dev);
>       AspeedSoCClass *sc = ASPEED_SOC_GET_CLASS(s);
>       Error *err = NULL;
> +    char name[64];
>   
>       /* IO space */
>       aspeed_mmio_map_unimplemented(s, SYS_BUS_DEVICE(&s->iomem), "aspeed.io",
> @@ -259,8 +260,8 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>       }
>   
>       /* SRAM */
> -    memory_region_init_ram(&s->sram, OBJECT(dev), "aspeed.sram",
> -                           sc->sram_size, &err);
> +    snprintf(name, sizeof(name), "aspeed.sram.%d", CPU(&s->cpu[0])->cpu_index);
> +    memory_region_init_ram(&s->sram, OBJECT(dev), name, sc->sram_size, &err);
>       if (err) {
>           error_propagate(errp, err);
>           return;


