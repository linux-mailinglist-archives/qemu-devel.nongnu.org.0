Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F30C5B81FD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 09:24:54 +0200 (CEST)
Received: from localhost ([::1]:49590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYMlR-0006Wv-G6
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 03:24:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMh4-0002Lk-QK
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:20:25 -0400
Received: from 8.mo548.mail-out.ovh.net ([46.105.45.231]:43403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1oYMh1-0003zS-EQ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 03:20:22 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.125])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 93426218D4;
 Wed, 14 Sep 2022 07:20:09 +0000 (UTC)
Received: from kaod.org (37.59.142.104) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Wed, 14 Sep
 2022 09:20:09 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005c0dfc910-1d1c-4279-9df9-c19854f88c0e,
 6464241036B73DE4A97B8AD469DDB011F00B0909) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5ea59776-186c-4a36-5c9f-11b435744fd1@kaod.org>
Date: Wed, 14 Sep 2022 09:20:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 12/20] ppc440_sdram: Rename local variable for
 readibility
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1663097286.git.balaton@eik.bme.hu>
 <4d0b81884e09ca412d3cc4de285ce2ba1c327856.1663097286.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <4d0b81884e09ca412d3cc4de285ce2ba1c327856.1663097286.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 060b27b4-d310-4443-9df1-08de273bfea3
X-Ovh-Tracer-Id: 9270941308988132259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduhedguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehgeek
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo548.mail-out.ovh.net
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.628,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/22 21:52, BALATON Zoltan wrote:
> Rename local sdram variable in ppc440_sdram_init to s for readibility.
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
> index b3f56c49b5..d8a7947196 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -729,40 +729,40 @@ static void sdram_reset(void *opaque)
>   void ppc440_sdram_init(CPUPPCState *env, int nbanks,
>                          Ppc4xxSdramBank *ram_banks)
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


