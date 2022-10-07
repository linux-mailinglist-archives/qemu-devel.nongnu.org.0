Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94045F7A28
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 16:59:10 +0200 (CEST)
Received: from localhost ([::1]:54756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogoof-0005EH-Of
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 10:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ognAq-00050O-1z
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:13:56 -0400
Received: from 3.mo552.mail-out.ovh.net ([178.33.254.192]:39757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ognAn-0001ny-1S
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 09:13:55 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.114])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id B992929A6A;
 Fri,  7 Oct 2022 13:13:48 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Fri, 7 Oct
 2022 15:13:48 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0046e35eb97-5fe7-4fe7-a214-752ce9903440,
 72EF84A86A0CAB1F8CEB0FBBC9371DA6A893A50B) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <97d016d5-802b-41db-0a6e-e1c03dc8dd67@kaod.org>
Date: Fri, 7 Oct 2022 15:13:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] hw/arm/aspeed: increase Bletchley memory size
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
CC: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery
 <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
References: <20221006225232.3558794-1-patrick@stwcx.xyz>
 <20221007110529.3657749-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20221007110529.3657749-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG4EX1.mxp5.local (172.16.2.31) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 7c8190a8-6fbe-4d01-ae62-d275511db632
X-Ovh-Tracer-Id: 2741566275865447206
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeijedgiedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdlvdefmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvd
Received-SPF: pass client-ip=178.33.254.192; envelope-from=clg@kaod.org;
 helo=3.mo552.mail-out.ovh.net
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.699,
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

On 10/7/22 13:05, Patrick Williams wrote:
> For the PVT-class hardware we have increased the memory size of
> this device to 2 GiB.  Adjust the device model accordingly.
> 
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   hw/arm/aspeed.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 7d2162c6ed..f8bc6d4a14 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1330,6 +1330,13 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
>           aspeed_soc_num_cpus(amc->soc_name);
>   };
>   
> +/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
> +#if HOST_LONG_BITS == 32
> +#define BLETCHLEY_BMC_RAM_SIZE (1 * GiB)
> +#else
> +#define BLETCHLEY_BMC_RAM_SIZE (2 * GiB)
> +#endif
> +
>   static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>   {
>       MachineClass *mc = MACHINE_CLASS(oc);
> @@ -1344,7 +1351,7 @@ static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
>       amc->num_cs    = 2;
>       amc->macs_mask = ASPEED_MAC2_ON;
>       amc->i2c_init  = bletchley_bmc_i2c_init;
> -    mc->default_ram_size = 512 * MiB;
> +    mc->default_ram_size = BLETCHLEY_BMC_RAM_SIZE;
>       mc->default_cpus = mc->min_cpus = mc->max_cpus =
>           aspeed_soc_num_cpus(amc->soc_name);
>   }


