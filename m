Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC39A4DD74E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 10:46:49 +0100 (CET)
Received: from localhost ([::1]:43360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV9C4-00039m-F8
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 05:46:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nV98u-000870-8e
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:43:32 -0400
Received: from smtpout3.mo529.mail-out.ovh.net ([46.105.54.81]:58171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nV98s-000631-D2
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 05:43:31 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.128])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id A569DEBAAA41;
 Fri, 18 Mar 2022 10:43:25 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 18 Mar
 2022 10:43:24 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003b056fdca-40f2-4950-b4b6-586802939021,
 A43A455C90FA63737E525AF0A4C953B58FB527D9) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <9bbce8d0-b2f4-686a-7123-46ca172f6c38@kaod.org>
Date: Fri, 18 Mar 2022 10:43:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] aspeed: Add eMMC Boot Controller stub
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20220318092211.723938-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220318092211.723938-1-joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 8f02b347-1f57-4e2e-a860-986ec87c28bd
X-Ovh-Tracer-Id: 6070007876593355683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudefiedgtdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=46.105.54.81; envelope-from=clg@kaod.org;
 helo=smtpout3.mo529.mail-out.ovh.net
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/22 10:22, Joel Stanley wrote:
> Guest code (u-boot) pokes at this on boot. No functionality is required
> for guest code to work correctly, but it helps to document the region
> being read from.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   include/hw/arm/aspeed_soc.h | 1 +
>   hw/arm/aspeed_ast2600.c     | 6 ++++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index cf484eae0e60..b9cd51119608 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -119,6 +119,7 @@ enum {
>       ASPEED_DEV_SCU,
>       ASPEED_DEV_ADC,
>       ASPEED_DEV_SBC,
> +    ASPEED_DEV_EMMC_BC,
>       ASPEED_DEV_VIDEO,
>       ASPEED_DEV_SRAM,
>       ASPEED_DEV_SDHCI,
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 25ae916e31ae..11cb6cf86bd2 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -48,6 +48,7 @@ static const hwaddr aspeed_soc_ast2600_memmap[] = {
>       [ASPEED_DEV_ADC]       = 0x1E6E9000,
>       [ASPEED_DEV_DP]        = 0x1E6EB000,
>       [ASPEED_DEV_SBC]       = 0x1E6F2000,
> +    [ASPEED_DEV_EMMC_BC]   = 0x1E6f5000,
>       [ASPEED_DEV_VIDEO]     = 0x1E700000,
>       [ASPEED_DEV_SDHCI]     = 0x1E740000,
>       [ASPEED_DEV_EMMC]      = 0x1E750000,
> @@ -267,6 +268,11 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>       create_unimplemented_device("aspeed.video", sc->memmap[ASPEED_DEV_VIDEO],
>                                   0x1000);
>   
> +    /* eMMC Boot Controller stub */
> +    create_unimplemented_device("aspeed.emmc-boot-controller",
> +                                sc->memmap[ASPEED_DEV_EMMC_BC],
> +                                0x1000);

We should add more of these for the controllers that QEMU doesn't model.
The "aspeed_soc.io" region is really too large to be useful.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> +
>       /* CPU */
>       for (i = 0; i < sc->num_cpus; i++) {
>           if (sc->num_cpus > 1) {


