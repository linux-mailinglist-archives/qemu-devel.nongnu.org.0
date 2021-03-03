Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD8F32B77E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 12:20:27 +0100 (CET)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHPYI-0007hN-4a
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 06:20:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHPXR-00078M-JA; Wed, 03 Mar 2021 06:19:33 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:45451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1lHPXP-0004RQ-Nk; Wed, 03 Mar 2021 06:19:33 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.123])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id DF98E8C9051C;
 Wed,  3 Mar 2021 12:19:27 +0100 (CET)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 3 Mar 2021
 12:19:27 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0018d7ed5bc-4788-49c5-8fbd-c5c69f5ff984,
 24CAEE7A76C7E725A9866EAA9907F8E378F99BC5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [PATCH] arm/ast2600: Fix SMP booting with -kernel
To: Joel Stanley <joel@jms.id.au>
References: <20210303010505.635621-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d079f85c-198f-c6c7-e4bf-e9dce2b9fbeb@kaod.org>
Date: Wed, 3 Mar 2021 12:19:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210303010505.635621-1-joel@jms.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 78a116f8-103f-4fd0-9e1e-c8db43ae99ec
X-Ovh-Tracer-Id: 8124212256302795683
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepjhhovghlsehjmhhsrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 2:05 AM, Joel Stanley wrote:
> The ast2600 machines do not have PSCI firmware, so this property should
> have never been set. Removing this node fixes SMP booting Linux kernels
> that have PSCI enabled, as Linux fails to find PSCI in the device tree
> and falls back to the soc-specific method for enabling secondary CPUs.
> 
> The comment is out of date as Qemu has supported -kernel booting since
> 9bb6d14081ce ("aspeed: Add boot stub for smp booting"), in v5.1.
> 
> Fixes: f25c0ae1079d ("aspeed/soc: Add AST2600 support")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>

Thanks

C.

> ---
>  hw/arm/aspeed_ast2600.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index bf31ca351feb..49b00763864c 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -241,8 +241,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>  
>      /* CPU */
>      for (i = 0; i < sc->num_cpus; i++) {
> -        object_property_set_int(OBJECT(&s->cpu[i]), "psci-conduit",
> -                                QEMU_PSCI_CONDUIT_SMC, &error_abort);
>          if (sc->num_cpus > 1) {
>              object_property_set_int(OBJECT(&s->cpu[i]), "reset-cbar",
>                                      ASPEED_A7MPCORE_ADDR, &error_abort);
> @@ -253,11 +251,6 @@ static void aspeed_soc_ast2600_realize(DeviceState *dev, Error **errp)
>          object_property_set_int(OBJECT(&s->cpu[i]), "cntfrq", 1125000000,
>                                  &error_abort);
>  
> -        /*
> -         * TODO: the secondary CPUs are started and a boot helper
> -         * is needed when using -kernel
> -         */
> -
>          if (!qdev_realize(DEVICE(&s->cpu[i]), NULL, errp)) {
>              return;
>          }
> 


