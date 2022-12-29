Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB846591CF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 21:53:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAztF-00068s-8D; Thu, 29 Dec 2022 15:52:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAztB-00067e-1I; Thu, 29 Dec 2022 15:52:35 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pAzt8-0005vi-Py; Thu, 29 Dec 2022 15:52:32 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E861D5C0090;
 Thu, 29 Dec 2022 15:52:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Dec 2022 15:52:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672347149; x=
 1672433549; bh=E6EvTKgna5YgMRU4bsiePeAxjabvHCd7y7yJUegz5zE=; b=g
 F4BIWee5FXeNeF6qiHf3AvNd7YtXj1gvJXdGr7/qUHTYr0jy30MUIRYB4DWHyuSm
 nKA9JAyxI3BGuYhBPo+YiAP5DZk5vjq/17GRX+U0ARgdBsa/A1EnKziTew6+3lfq
 rpG0J2Y02GdByfc7DHnEIc3ZLigurMKK7C0HX51LVuqdViGLqS4B8CNTh14PN6zO
 eZG4f9/Gsp1U21wvp8nHe9LZhm/hMiOZgGiulPpz2p9TGr78Bq7g7kZ3DGXqNBPN
 M68OfpTkqXPM7O4c/8ctsnjCDOVdSl+mQjKoLRdkMAkXiGhhWSejFv373+l216Ny
 eztcjAmNHVG2EfKXbGPnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672347149; x=
 1672433549; bh=E6EvTKgna5YgMRU4bsiePeAxjabvHCd7y7yJUegz5zE=; b=k
 bG+gVx+xow+858Rlnywc6HOPWe+G1MAPHHVS0mzJyphRDDO55eCCBxxwI+XCm2Kw
 Y60KufQJoUIZFKNKSLl30CO4SKEnnkT6vX708JevCOX0dOA7B8ZYUiEcwzqeXTlQ
 TDxHvWvmYGnFG3cDngCAWDHYXhZwEz1Wgbp3hC4z4JcrPQv0lES7Wxla3zdig7XU
 kRJU9uTQ5sY5JS+xIG91ygZZzRODJbpvSqbUMs/maCGMJFOKMBDio9Ef7AxUAwjP
 g96SQvOEWsGjXheojmgHrhc/evuroy7/pTm3JsjvEGGVBQddfin9/k8xk1RbpmJJ
 nkGZSajg3ZyJDYCdoFb9A==
X-ME-Sender: <xms:Df6tY0FA2IcNYPrcMBmo37TmRIFYD0UO8E-0t3qqNBXCWTkCS6YK2w>
 <xme:Df6tY9XdrwKaU7Oh7cnrmZ_qLaCRIFyrbqKCo9K83DR7pCWeVKA3CGEE_GSgbS3nU
 7EfIXjl1Mkxb8YDQLE>
X-ME-Received: <xmr:Df6tY-Ip61M-WbSL05QX9t54gjkJ8Jqo85cpViZnP90v2oID4N5CDBZMD6kjxBUBOmuQmpHxQgyoCt_wK1ijow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeggddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefgueekffdtueetgfehteffledtueehgfehgeelfedujeefhfffteekvddt
 feetteenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:Df6tY2FN_d8oW6qFAAS1iPUDB7dS0RKHFAD3uoTZRVs1yfG82FcCww>
 <xmx:Df6tY6XcDqIIA_uWdWDVrjjMcLl3j329TqR90yVRiMNBt3CKNDrGMQ>
 <xmx:Df6tY5PMkll-WhHGWsr0A3IEJik8FV7k670zfThLEiT3vLN4DOSJdg>
 <xmx:Df6tYzXg32CoLwDfm_kvd86KCGd5ZuFC41ekSsKyqe0l7OoFAkml3A>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Dec 2022 15:52:27 -0500 (EST)
Date: Thu, 29 Dec 2022 12:52:26 -0800
From: Peter Delevoryas <peter@pjd.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Steven Lee <steven_lee@aspeedtech.com>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: Re: [PATCH 6/9] hw/arm/aspeed_ast10x0: Map HACE peripheral
Message-ID: <Y63+CpM1zG9lNEPX@pdel-mbp.dhcp.thefacebook.com>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-7-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221229152325.32041-7-philmd@linaro.org>
Received-SPF: pass client-ip=66.111.4.29; envelope-from=peter@pjd.dev;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Dec 29, 2022 at 04:23:22PM +0100, Philippe Mathieu-Daudé wrote:
> Since I don't have access to the datasheet, the relevant
> values were found in:
> https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
> 
> Before on Zephyr:
> 
>   uart:~$ crypto aes256_cbc_vault
>   aes256_cbc vault key 1
>   [00:00:06.699,000] <inf> hace_global: aspeed_crypto_session_setup
>   [00:00:06.699,000] <inf> hace_global: data->cmd: 1c2098
>   [00:00:06.699,000] <inf> hace_global: crypto_data_src: 93340
>   [00:00:06.699,000] <inf> hace_global: crypto_data_dst: 93348
>   [00:00:06.699,000] <inf> hace_global: crypto_ctx_base: 93300
>   [00:00:06.699,000] <inf> hace_global: crypto_data_len: 80000040
>   [00:00:06.699,000] <inf> hace_global: crypto_cmd_reg:  11c2098
>   [00:00:09.743,000] <inf> hace_global: HACE_STS: 0
>   [00:00:09.743,000] <err> hace_global: HACE poll timeout
>   [00:00:09.743,000] <err> crypto: CBC mode ENCRYPT - Failed
>   [00:00:09.743,000] <inf> hace_global: aspeed_crypto_session_free
>   uart:~$
> 
> After:
> 
>   uart:~$ crypto aes256_cbc_vault
>   aes256_cbc vault key 1
>   Was waiting for:
>   6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
>   ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
>   30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
>   f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10
> 
>    But got:
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> 
>   [00:00:05.771,000] <inf> hace_global: aspeed_crypto_session_setup
>   [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2098
>   [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
>   [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
>   [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
>   [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
>   [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2098
>   [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
>   [00:00:05.772,000] <inf> crypto: Output length (encryption): 80
>   [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_free
>   [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_setup
>   [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2018
>   [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
>   [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
>   [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
>   [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
>   [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2018
>   [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
>   [00:00:05.772,000] <inf> crypto: Output length (decryption): 64
>   [00:00:05.772,000] <err> crypto: CBC mode DECRYPT - Mismatch between plaintext and decrypted cipher text
>   [00:00:05.774,000] <inf> hace_global: aspeed_crypto_session_free
>   uart:~$
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Awesome!

Reviewed-by: Peter Delevoryas <peter@pjd.dev>

> ---
> Should we rename HACE 'dram' as 'secram' / 'secure-ram'?

Sure, sounds good to me.

> ---
>  hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> index 21a2e62345..02636705b6 100644
> --- a/hw/arm/aspeed_ast10x0.c
> +++ b/hw/arm/aspeed_ast10x0.c
> @@ -29,6 +29,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
>      [ASPEED_DEV_SPI1]      = 0x7E630000,
>      [ASPEED_DEV_SPI2]      = 0x7E640000,
>      [ASPEED_DEV_UDC]       = 0x7E6A2000,
> +    [ASPEED_DEV_HACE]      = 0x7E6D0000,
>      [ASPEED_DEV_SCU]       = 0x7E6E2000,
>      [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
>      [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
> @@ -166,6 +167,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
>      snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
>      object_initialize_child(obj, "gpio", &s->gpio, typename);
>  
> +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> +    object_initialize_child(obj, "hace", &s->hace, typename);
> +
>      object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
>      object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
>                              TYPE_UNIMPLEMENTED_DEVICE);
> @@ -359,6 +363,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
>      }
>      aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
>  
> +    /* HACE */
> +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(&s->secsram),
> +                             &error_abort);
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->hace), errp)) {
> +        return;
> +    }
> +    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->hace), 0,
> +                    sc->memmap[ASPEED_DEV_HACE]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->hace), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_HACE));
> +
>      /* Watch dog */
>      for (i = 0; i < sc->wdts_num; i++) {
>          AspeedWDTClass *awc = ASPEED_WDT_GET_CLASS(&s->wdt[i]);
> -- 
> 2.38.1
> 

