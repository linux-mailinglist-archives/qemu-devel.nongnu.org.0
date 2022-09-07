Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5225B05B0
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 15:50:57 +0200 (CEST)
Received: from localhost ([::1]:45838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVvSC-0005fq-Hc
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 09:50:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvNs-0000SH-Gm
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:46:28 -0400
Received: from 1.mo548.mail-out.ovh.net ([178.32.121.110]:56795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oVvNl-0000ht-BQ
 for qemu-devel@nongnu.org; Wed, 07 Sep 2022 09:46:27 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.51])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 6B7C723605;
 Wed,  7 Sep 2022 13:46:16 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 7 Sep
 2022 15:46:15 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004deac4c6a-e560-42a5-ae21-cc45bc920677,
 2B0902173EB74D822BE58268A8E021C7C40D5376) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <bfe932bc-1053-9284-786b-393a55daea3c@kaod.org>
Date: Wed, 7 Sep 2022 15:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 12/20] ppc440_sdram: Rename local variable for readibility
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1660926381.git.balaton@eik.bme.hu>
 <e6d3affa5b0c014acf68fabea0ab40aa4ec38f48.1660926381.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <e6d3affa5b0c014acf68fabea0ab40aa4ec38f48.1660926381.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 9a8bede0-25a5-4034-a586-c602d22a381d
X-Ovh-Tracer-Id: 11576502843576716195
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfedttddgieekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpoffvtefjohhsthepmhhoheegke
Received-SPF: pass client-ip=178.32.121.110; envelope-from=clg@kaod.org;
 helo=1.mo548.mail-out.ovh.net
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-4.199,
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

On 8/19/22 18:55, BALATON Zoltan wrote:
> Rename local sdram variable in ppc440_sdram_init to s for readibility.

readability

> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/ppc/ppc440_uc.c | 36 ++++++++++++++++++------------------
>   1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index bd3d60f278..72eb75d3d2 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -729,40 +729,40 @@ static void sdram_reset(void *opaque)
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>                          Ppc4xxSdramBank ram_banks[])
>   {
> -    ppc440_sdram_t *sdram;
> +    ppc440_sdram_t *s;
>       int i;
>   
> -    sdram = g_malloc0(sizeof(*sdram));
> -    sdram->nbanks = nbanks;
> +    s = g_malloc0(sizeof(*s));
> +    s->nbanks = nbanks;
>       for (i = 0; i < nbanks; i++) {
> -        sdram->bank[i].ram = ram_banks[i].ram;
> -        sdram->bank[i].base = ram_banks[i].base;
> -        sdram->bank[i].size = ram_banks[i].size;
> +        s->bank[i].ram = ram_banks[i].ram;
> +        s->bank[i].base = ram_banks[i].base;
> +        s->bank[i].size = ram_banks[i].size;
>       }
> -    qemu_register_reset(&sdram_reset, sdram);
> +    qemu_register_reset(&sdram_reset, s);
>       ppc_dcr_register(env, SDRAM0_CFGADDR,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM0_CFGDATA,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>   
>       ppc_dcr_register(env, SDRAM_R0BAS,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_R1BAS,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_R2BAS,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_R3BAS,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_CONF1HB,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_PLBADDULL,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_CONF1LL,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_CONFPATHB,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>       ppc_dcr_register(env, SDRAM_PLBADDUHB,
> -                     sdram, &dcr_read_sdram, &dcr_write_sdram);
> +                     s, &dcr_read_sdram, &dcr_write_sdram);
>   }
>   
>   /*****************************************************************************/


