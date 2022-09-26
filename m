Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9605EADB5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:11:22 +0200 (CEST)
Received: from localhost ([::1]:57874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrdX-00082C-OZ
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocrQg-0004T6-38
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:58:02 -0400
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:55765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocrQd-0003MG-BE
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:58:01 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.240])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id DBF0E24FA3;
 Mon, 26 Sep 2022 16:57:56 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 26 Sep
 2022 18:57:56 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005e509f022-f1b9-4ecb-b516-246298a4f293,
 3F18426251CD380DC805342BE5D3F55DDA75F83F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5918d6af-ea75-3f55-98ce-2bcf67582a27@kaod.org>
Date: Mon, 26 Sep 2022 18:57:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v6 16/25] ppc440_uc.c: Move some macros to ppc4xx.h
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <74d9bf4891e2ccceb52bb6ca6b54fd3f37a9fb04.1664021647.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <74d9bf4891e2ccceb52bb6ca6b54fd3f37a9fb04.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: a72a64e0-5ce0-4be6-87cd-dc49cb2d552d
X-Ovh-Tracer-Id: 15714185001235352483
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehhedv
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 9/24/22 14:28, BALATON Zoltan wrote:
> These are used by both the SDRAM controller model and system DCRs. In
> preparation to move SDRAM controller in its own file move these macros
> to the ppc4xx.h header.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/ppc440_uc.c      | 4 ----
>   include/hw/ppc/ppc4xx.h | 4 ++++
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 46daecab19..0a41274d63 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -380,10 +380,6 @@ enum {
>       PESDR1_RSTSTA = 0x365,
>   };
>   
> -#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
> -#define SDR0_DDR0_DDRM_DDR1       0x20000000
> -#define SDR0_DDR0_DDRM_DDR2       0x40000000
> -
>   static uint32_t dcr_read_sdr(void *opaque, int dcrn)
>   {
>       ppc4xx_sdr_t *sdr = opaque;
> diff --git a/include/hw/ppc/ppc4xx.h b/include/hw/ppc/ppc4xx.h
> index ff88385ac0..10c6dd535f 100644
> --- a/include/hw/ppc/ppc4xx.h
> +++ b/include/hw/ppc/ppc4xx.h
> @@ -111,6 +111,10 @@ struct Ppc4xxEbcState {
>   };
>   
>   /* SDRAM DDR controller */
> +#define SDR0_DDR0_DDRM_ENCODE(n)  ((((unsigned long)(n)) & 0x03) << 29)
> +#define SDR0_DDR0_DDRM_DDR1       0x20000000
> +#define SDR0_DDR0_DDRM_DDR2       0x40000000
> +
>   #define TYPE_PPC4xx_SDRAM_DDR "ppc4xx-sdram-ddr"
>   OBJECT_DECLARE_SIMPLE_TYPE(Ppc4xxSdramDdrState, PPC4xx_SDRAM_DDR);
>   struct Ppc4xxSdramDdrState {


