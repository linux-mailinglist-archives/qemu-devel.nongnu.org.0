Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 107425831F2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 20:26:02 +0200 (CEST)
Received: from localhost ([::1]:32934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGljM-0003AT-JS
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 14:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oGlVc-00041A-8k; Wed, 27 Jul 2022 14:11:48 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:50161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oGlVa-0005Fj-N3; Wed, 27 Jul 2022 14:11:47 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D266B58047C;
 Wed, 27 Jul 2022 14:11:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 27 Jul 2022 14:11:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1658945505; x=
 1658949105; bh=I6o5+aqKdGAf1PI13B0XJeL3DLZqir/p32rXy/Htx9M=; b=b
 XRaPGzVC+qmeQWxc2vw3Vi15ahxvAAf729w4dMHfBwvUKxcviApPt8Z5K+rCbbpz
 4PYRmB1cedU+vI+9+T0+Rs9OKKrA7N+GUvu239Gb0NdnJnod5zFku/6yGmKrEiB4
 JrO/aCaoAwZEZUAkeC0A+5IXWZu4J9UNfcAHcLMPLlSwiRfizcU7UXYGY85C1EjP
 NnXbpRLOmwNiRkliPRRKe7oz4RXs/D0Ra0v58gOdSKS6Ihb292FgeSkJFJR/Mt86
 ISAHd2RYpvN/k3/4MYn0gny8YhPnNH93MYN1laDfSnXuvAe86tWhJERmozidL3mS
 0yK4B0o4ENZ68cWxAX5Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658945505; x=
 1658949105; bh=I6o5+aqKdGAf1PI13B0XJeL3DLZqir/p32rXy/Htx9M=; b=G
 FI8R8pWTbckLK2J6vWM1ypi8xwkGfFrQD/P7+iR5CtGCsL0vURGsgZWbg/lT8EQ8
 tXBm3voyfXerzy6+mW2CxmDmjbUFx20gl/Tul9HQV1bSSWdfy4FpOwnZoS5YegTM
 c+pMALtBsTXCHQSnjK0hrrqceweeOZTU7cyh8rXxnyFHKHPIgnE08FnH7mAROXjs
 QS/FvLUxZrrPpzfJf/OFtyxGh8H5w0uDybNzubRtP2sbA+IiGyPAtfmjrvS5TzYq
 OgTRAzfeDOn/1pj1nHlf7UiH8h4HBSNIq5w7OmqKF4j4S9lJKSwMR2Ng7LHAkrUQ
 5dRazAOr1pMkFt69aQkSA==
X-ME-Sender: <xms:4X_hYpt2rIGcSwkT1RQd741RZmPpnZ08jAmuk409p_S6HLp-tCz_9w>
 <xme:4X_hYife1zGscQp9giGE-OiTZadT7ZpkDqh0cGIJVOYRYrKt5DanJJ3UYB3Ms_4F2
 dwGiS5AuT75EJp7VtI>
X-ME-Received: <xmr:4X_hYsz41L9sjPlq9rHG6R4EJIPNEie3EHJEFcT4AL9FgQZHkBWqTAnyEg1RwznT0jdVlawqwqx7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduvddguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhephfegffevudefveetgeekteeijefhhfduueejvdegvdehffehjeevtefh
 hffffeeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:4X_hYgOjKI4SumPotnqq9MKQlc-KI47hvolEuEDKwtt58IY9t3I4Tg>
 <xmx:4X_hYp_eySakimI-SWx1NOO33_2g6uKmiJht3HiY7JvYR-SMqdgnvg>
 <xmx:4X_hYgVAcX8roifjYXZrJjYDYEWzCy65e1djPvSfirdqwiLQi_5THQ>
 <xmx:4X_hYlbOi6bDDBZlBQj5OU039zksGxmR0WIu96VgDc4wPlvCGoHF6A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Jul 2022 14:11:44 -0400 (EDT)
Date: Wed, 27 Jul 2022 11:11:43 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH for 7.1 2/2] aspeed/fby35: Fix owner of the BMC RAM
 memory region
Message-ID: <YuF/34NFoBr4Ey6D@pdel-fedora-MJ0HJWH9>
References: <20220727102714.803041-1-clg@kaod.org>
 <20220727102714.803041-3-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220727102714.803041-3-clg@kaod.org>
Received-SPF: pass client-ip=66.111.4.221; envelope-from=peter@pjd.dev;
 helo=new1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Jul 27, 2022 at 12:27:14PM +0200, Cédric Le Goater wrote:
> A MachineState object is used as a owner of the RAM region and this
> asserts in memory_region_init_ram() when QEMU is built with
> CONFIG_QOM_CAST_DEBUG :
> 
>     /* This will assert if owner is neither NULL nor a DeviceState.
>      * We only want the owner here for the purposes of defining a
>      * unique name for migration. TODO: Ideally we should implement
>      * a naming scheme for Objects which are not DeviceStates, in
>      * which case we can relax this restriction.
>      */
>     owner_dev = DEVICE(owner);
> 
> Use the BMC and BIC objects as the owners of their memory regions.
> 
> Cc: Peter Delevoryas <peter@pjd.dev>
> Fixes: 778e14cc5cd5 ("aspeed: Add AST2600 (BMC) to fby35")
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---

Looks good to me, thanks for fixing this Cedric!
Peter

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

>  hw/arm/fby35.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/fby35.c b/hw/arm/fby35.c
> index 79605f306462..90c04bbc3389 100644
> --- a/hw/arm/fby35.c
> +++ b/hw/arm/fby35.c
> @@ -72,11 +72,13 @@ static void fby35_bmc_init(Fby35State *s)
>  {
>      DriveInfo *drive0 = drive_get(IF_MTD, 0, 0);
>  
> -    memory_region_init(&s->bmc_memory, OBJECT(s), "bmc-memory", UINT64_MAX);
> -    memory_region_init_ram(&s->bmc_dram, OBJECT(s), "bmc-dram",
> +    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
> +
> +    memory_region_init(&s->bmc_memory, OBJECT(&s->bmc), "bmc-memory",
> +                       UINT64_MAX);
> +    memory_region_init_ram(&s->bmc_dram, OBJECT(&s->bmc), "bmc-dram",
>                             FBY35_BMC_RAM_SIZE, &error_abort);
>  
> -    object_initialize_child(OBJECT(s), "bmc", &s->bmc, "ast2600-a3");
>      object_property_set_int(OBJECT(&s->bmc), "ram-size", FBY35_BMC_RAM_SIZE,
>                              &error_abort);
>      object_property_set_link(OBJECT(&s->bmc), "memory", OBJECT(&s->bmc_memory),
> @@ -120,9 +122,11 @@ static void fby35_bic_init(Fby35State *s)
>      s->bic_sysclk = clock_new(OBJECT(s), "SYSCLK");
>      clock_set_hz(s->bic_sysclk, 200000000ULL);
>  
> -    memory_region_init(&s->bic_memory, OBJECT(s), "bic-memory", UINT64_MAX);
> -
>      object_initialize_child(OBJECT(s), "bic", &s->bic, "ast1030-a1");
> +
> +    memory_region_init(&s->bic_memory, OBJECT(&s->bic), "bic-memory",
> +                       UINT64_MAX);
> +
>      qdev_connect_clock_in(DEVICE(&s->bic), "sysclk", s->bic_sysclk);
>      object_property_set_link(OBJECT(&s->bic), "memory", OBJECT(&s->bic_memory),
>                               &error_abort);
> -- 
> 2.37.1
> 

