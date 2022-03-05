Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57D4CE385
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 08:57:06 +0100 (CET)
Received: from localhost ([::1]:36308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQPHk-0003r8-Qs
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 02:57:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPEZ-0002x4-S1
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 02:53:48 -0500
Received: from 9.mo552.mail-out.ovh.net ([87.98.180.222]:52121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nQPEX-0007MA-U1
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 02:53:47 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.90])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 73F7224CBB;
 Sat,  5 Mar 2022 07:53:42 +0000 (UTC)
Received: from kaod.org (37.59.142.99) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 5 Mar
 2022 08:53:41 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G00300b8a430-81b6-4193-8351-ce48e25b2c71,
 A4EA2D8AEBB64B4F793E8EC0AE0C67A6646D724C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.1.230.64
Message-ID: <ac68dba6-32e0-908c-c98f-7c95102b5b43@kaod.org>
Date: Sat, 5 Mar 2022 08:53:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] hw/arm/aspeed: allow missing spi_model
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <20220305000656.1944589-1-patrick@stwcx.xyz>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220305000656.1944589-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 7abd9f0a-3290-47f9-ad87-4a0903c6ac04
X-Ovh-Tracer-Id: 1659013514891332390
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -77
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtledguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddvfedmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=87.98.180.222; envelope-from=clg@kaod.org;
 helo=9.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/22 01:06, Patrick Williams wrote:
> Generally all BMCs will use the fmc_model to hold their own flash
> and most will have a spi_model to hold the managed system's flash,
> but not all systems do.  Add a simple NULL check to allow a system
> to set the spi_model as NULL to indicate it should not be instantiated.


OK. Let's do it that way for now but we need to rework 'num_cs' in the
Aspeed SMC model and the Aspeed machines. We started with a simple
requirement (1 FMC and 1 SPI) but since, things have become more complex.

1. we should get rid of AspeedSMCState::num_cs and simply use
    AspeedSMCState::max_peripherals in the SMC model. There is no need to
    restrict the number devices of the controller to match the board layout.

2. aspeed_board_init_flashes() needs a better interface. May be, something
    like :

    static void aspeed_board_init_flashes(AspeedSMCState *s,
                                          const char **flashtype, int count,
                                          int unit0)

and change ->fmc_model and ->spi_model to be arrays. Ideas welcome.

Anyhow,

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>   hw/arm/aspeed.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 11558b327b..617a1ecbdc 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -276,7 +276,11 @@ static void aspeed_board_init_flashes(AspeedSMCState *s,
>                                         const char *flashtype,
>                                         int unit0)
>   {
> -    int i ;
> +    int i;
> +
> +    if (!flashtype) {
> +        return;
> +    }
>   
>       for (i = 0; i < s->num_cs; ++i) {
>           DriveInfo *dinfo = drive_get(IF_MTD, 0, unit0 + i);


