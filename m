Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1423E410D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 09:47:26 +0200 (CEST)
Received: from localhost ([::1]:48490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD00K-0004Yb-Mr
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 03:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mCzyC-0003WE-Er
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:45:12 -0400
Received: from 8.mo52.mail-out.ovh.net ([46.105.37.156]:57058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mCzyA-0006KF-CX
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 03:45:12 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 6EDF228E7C9;
 Mon,  9 Aug 2021 09:44:58 +0200 (CEST)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Mon, 9 Aug
 2021 09:44:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0047da2b7bb-6430-4523-be2e-a1fa655c8335,
 12D865CA04D90D97A6A977E4DA2B50F9FD60493E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: [PATCH] hw: arm: aspeed: Enable eth0 interface for
 aspeed-ast2600-evb
To: Guenter Roeck <linux@roeck-us.net>
References: <20210808200457.889955-1-linux@roeck-us.net>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7f49fccc-fb76-cd50-02d2-aa47f410d73e@kaod.org>
Date: Mon, 9 Aug 2021 09:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210808200457.889955-1-linux@roeck-us.net>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: aa669f09-dd6c-46ab-9379-60ca2c905a87
X-Ovh-Tracer-Id: 15922757961430371110
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrjeeigdduudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepgedvieejfedvhfduhfffueevheeludffhfdvkeehleegtddttdfhieegveeghfffnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigsehrohgvtghkqdhushdrnhgvth
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/8/21 10:04 PM, Guenter Roeck wrote:
> Commit 7582591ae7 ("aspeed: Support AST2600A1 silicon revision") switched
> the silicon revision for AST2600 to revision A1. On revision A1, the first
> Ethernet interface is operational. Enable it.

Indeed. 

I see that commit ba56f464f0c ("ARM: dts: aspeed: ast2600evb: Add MAC0")
reintroduced it a while ago. But my A0 doesn't support it. I am missing
something.

Joel, why this patch didn't reach the OpenBMC kernel ? 

Thanks,

C.  


> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/aspeed.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9d43e26c51..ecf0c9cfac 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -959,7 +959,8 @@ static void aspeed_machine_ast2600_evb_class_init(ObjectClass *oc, void *data)
>      amc->fmc_model = "w25q512jv";
>      amc->spi_model = "mx66u51235f";
>      amc->num_cs    = 1;
> -    amc->macs_mask  = ASPEED_MAC1_ON | ASPEED_MAC2_ON | ASPEED_MAC3_ON;
> +    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON |
> +                     ASPEED_MAC3_ON;
>      amc->i2c_init  = ast2600_evb_i2c_init;
>      mc->default_ram_size = 1 * GiB;
>      mc->default_cpus = mc->min_cpus = mc->max_cpus =
> 


