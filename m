Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 358FE5EAE1E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:23:46 +0200 (CEST)
Received: from localhost ([::1]:52214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrpY-00017C-Vg
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocrQZ-0004G5-3j
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:57:58 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:55865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ocrQV-0003Ku-69
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:57:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.118])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A2A8912C2CFAF;
 Mon, 26 Sep 2022 18:57:39 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 26 Sep
 2022 18:57:38 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004c9e2c711-379d-4036-b3cc-329380574077,
 3F18426251CD380DC805342BE5D3F55DDA75F83F) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <e441dce8-6031-e6db-51a1-7574f9060a54@kaod.org>
Date: Mon, 26 Sep 2022 18:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v6 17/25] ppc440_uc.c: Remove unneeded parenthesis
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, <qemu-devel@nongnu.org>,
 <qemu-ppc@nongnu.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>
References: <cover.1664021647.git.balaton@eik.bme.hu>
 <19db326bea989c03e08f2853f789315bbe806fe9.1664021647.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <19db326bea989c03e08f2853f789315bbe806fe9.1664021647.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG2EX1.mxp5.local (172.16.2.11) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: dd513a40-3444-45cd-9306-5142d365112c
X-Ovh-Tracer-Id: 15709399929200085923
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegvddguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
> Remove unneeded parenthesis around case labels.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/ppc/ppc440_uc.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/ppc/ppc440_uc.c b/hw/ppc/ppc440_uc.c
> index 0a41274d63..24623ebe0c 100644
> --- a/hw/ppc/ppc440_uc.c
> +++ b/hw/ppc/ppc440_uc.c
> @@ -499,34 +499,34 @@ static uint32_t sdram_ddr2_bcr(hwaddr ram_base, hwaddr ram_size)
>       uint32_t bcr;
>   
>       switch (ram_size) {
> -    case (8 * MiB):
> +    case 8 * MiB:
>           bcr = 0xffc0;
>           break;
> -    case (16 * MiB):
> +    case 16 * MiB:
>           bcr = 0xff80;
>           break;
> -    case (32 * MiB):
> +    case 32 * MiB:
>           bcr = 0xff00;
>           break;
> -    case (64 * MiB):
> +    case 64 * MiB:
>           bcr = 0xfe00;
>           break;
> -    case (128 * MiB):
> +    case 128 * MiB:
>           bcr = 0xfc00;
>           break;
> -    case (256 * MiB):
> +    case 256 * MiB:
>           bcr = 0xf800;
>           break;
> -    case (512 * MiB):
> +    case 512 * MiB:
>           bcr = 0xf000;
>           break;
> -    case (1 * GiB):
> +    case 1 * GiB:
>           bcr = 0xe000;
>           break;
> -    case (2 * GiB):
> +    case 2 * GiB:
>           bcr = 0xc000;
>           break;
> -    case (4 * GiB):
> +    case 4 * GiB:
>           bcr = 0x8000;
>           break;
>       default:


