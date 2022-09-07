Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 365475B0536
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:35:47 +0200 (CEST)
Received: from localhost ([::1]:34178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvDV-00068s-Ka
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVv8N-0001ic-BG
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:30:36 -0400
Received: from smtpout4.mo529.mail-out.ovh.net ([217.182.185.173]:56295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVv8K-00061G-5Z
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:30:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.102])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id BA64E125D7101;
 Wed,  7 Sep 2022 15:30:20 +0200 (CEST)
Received: from kaod.org (37.59.142.110) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 7 Sep
 2022 15:30:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-110S0041f807ed8-d828-4655-8f25-70aba616371f,
 2B0902173EB74D822BE58268A8E021C7C40D5376) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <19465d5c-6411-37cf-444b-98b643682c7e@kaod.org>
Date: Wed, 7 Sep 2022 15:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 08/20] ppc4xx_sdram: Drop extra zeros for readability
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <f6d9eec237e5cc84a314d8eb67294212f93076ef.1660926381.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <f6d9eec237e5cc84a314d8eb67294212f93076ef.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.110]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 25e6699e-3299-4fca-8ddb-7dad2106bba5
X-Ovh-Tracer-Id: 11307412767042079651
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddutdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhohedvle
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout4.mo529.mail-out.ovh.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 8/19/22 18:55, BALATON Zoltan wrote:
> Constants that are written zero padded for no good reason are hard to
> read, it's easier to see what is meant if it's just 0 or 1 instead.

I would keep the 0x prefix though.

Thanks,

C.


> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/ppc4xx_devs.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
> index 375834a52b..bfe7b2d3a6 100644
> --- a/hw/ppc/ppc4xx_devs.c
> +++ b/hw/ppc/ppc4xx_devs.c
> @@ -49,31 +49,31 @@ static uint32_t sdram_ddr_bcr(hwaddr ram_base, hwaddr ram_size)
>   
>       switch (ram_size) {
>       case 4 * MiB:
> -        bcr = 0x00000000;
> +        bcr = 0;
>           break;
>       case 8 * MiB:
> -        bcr = 0x00020000;
> +        bcr = 0x20000;
>           break;
>       case 16 * MiB:
> -        bcr = 0x00040000;
> +        bcr = 0x40000;
>           break;
>       case 32 * MiB:
> -        bcr = 0x00060000;
> +        bcr = 0x60000;
>           break;
>       case 64 * MiB:
> -        bcr = 0x00080000;
> +        bcr = 0x80000;
>           break;
>       case 128 * MiB:
> -        bcr = 0x000A0000;
> +        bcr = 0xA0000;
>           break;
>       case 256 * MiB:
> -        bcr = 0x000C0000;
> +        bcr = 0xC0000;
>           break;
>       default:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "%s: invalid RAM size 0x%" HWADDR_PRIx "\n", __func__,
>                         ram_size);
> -        return 0x00000000;
> +        return 0;
>       }
>       bcr |= ram_base & 0xFF800000;
>       bcr |= 1;
> @@ -104,7 +104,7 @@ static target_ulong sdram_size(uint32_t bcr)
>   static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
>                             uint32_t bcr, int enabled)
>   {
> -    if (sdram->bank[i].bcr & 0x00000001) {
> +    if (sdram->bank[i].bcr & 1) {
>           /* Unmap RAM */
>           trace_ppc4xx_sdram_unmap(sdram_base(sdram->bank[i].bcr),
>                                    sdram_size(sdram->bank[i].bcr));
> @@ -115,7 +115,7 @@ static void sdram_set_bcr(Ppc4xxSdramDdrState *sdram, int i,
>           object_unparent(OBJECT(&sdram->bank[i].container));
>       }
>       sdram->bank[i].bcr = bcr & 0xFFDEE001;
> -    if (enabled && (bcr & 0x00000001)) {
> +    if (enabled && (bcr & 1)) {
>           trace_ppc4xx_sdram_map(sdram_base(bcr), sdram_size(bcr));
>           memory_region_init(&sdram->bank[i].container, NULL, "sdram-container",
>                              sdram_size(bcr));
> @@ -136,7 +136,7 @@ static void sdram_map_bcr(Ppc4xxSdramDdrState *sdram)
>               sdram_set_bcr(sdram, i, sdram_ddr_bcr(sdram->bank[i].base,
>                                                     sdram->bank[i].size), 1);
>           } else {
> -            sdram_set_bcr(sdram, i, 0x00000000, 0);
> +            sdram_set_bcr(sdram, i, 0, 0);
>           }
>       }
>   }
> @@ -213,7 +213,7 @@ static uint32_t sdram_ddr_dcr_read(void *opaque, int dcrn)
>           break;
>       default:
>           /* Avoid gcc warning */
> -        ret = 0x00000000;
> +        ret = 0;
>           break;
>       }
>   
> @@ -306,18 +306,18 @@ static void ppc4xx_sdram_ddr_reset(DeviceState *dev)
>   {
>       Ppc4xxSdramDdrState *sdram = PPC4xx_SDRAM_DDR(dev);
>   
> -    sdram->addr = 0x00000000;
> -    sdram->bear = 0x00000000;
> -    sdram->besr0 = 0x00000000; /* No error */
> -    sdram->besr1 = 0x00000000; /* No error */
> -    sdram->cfg = 0x00000000;
> -    sdram->ecccfg = 0x00000000; /* No ECC */
> -    sdram->eccesr = 0x00000000; /* No error */
> +    sdram->addr = 0;
> +    sdram->bear = 0;
> +    sdram->besr0 = 0; /* No error */
> +    sdram->besr1 = 0; /* No error */
> +    sdram->cfg = 0;
> +    sdram->ecccfg = 0; /* No ECC */
> +    sdram->eccesr = 0; /* No error */
>       sdram->pmit = 0x07C00000;
>       sdram->rtr = 0x05F00000;
>       sdram->tr = 0x00854009;
>       /* We pre-initialize RAM banks */
> -    sdram->status = 0x00000000;
> +    sdram->status = 0;
>       sdram->cfg = 0x00800000;
>   }
>   


