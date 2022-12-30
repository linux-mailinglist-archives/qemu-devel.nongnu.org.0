Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9F659C05
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 21:25:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBLv0-0006km-Op; Fri, 30 Dec 2022 15:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pBLuw-0006k1-RR; Fri, 30 Dec 2022 15:23:50 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pBLuu-0007vU-Pf; Fri, 30 Dec 2022 15:23:50 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 893C65C0116;
 Fri, 30 Dec 2022 15:23:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 30 Dec 2022 15:23:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672431826; x=
 1672518226; bh=12qgOzoiwIpO6NQ4VPYLcNp4k2NlRZisIN9v0W1ZADQ=; b=s
 M7AGyAJ9mubliRt5T5b7yWmnYbeKs/JEJlIoW4HoZsz5CF3mUW4YyRtcGOGjmbTJ
 55ZJvqmZx7yJ3z8cxxFibIqHpSoj1L00r4v/guiwqZvqvSNDBQ40j3oFdREz7cFH
 KcoUO2GGwfUvrmIHHThTze2J8bQOJQHAxsI6XkCecCNJ/viLF8P0QTOcX7CXJ52i
 RRTLyca1vL01wCLpvmitx0LtsJQyLrTowDiZivVgJns+A5j7lGxiW3Bt9G4aa7qT
 sSObYfSvjY9Yp9YwXW9JHrrW0plcmU0YhnF13BdW2Ks3jKu/xEYu9ndCtf6F60xZ
 dzUab62L1ExqOZJJs5vlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1672431826; x=
 1672518226; bh=12qgOzoiwIpO6NQ4VPYLcNp4k2NlRZisIN9v0W1ZADQ=; b=m
 O9ZdrDzfhh3VUs2kuMCwMgewmNDjjpHhRTlUb5GM7AiqN8z4h3HmdjiCcC/LwaaD
 n+myPC8F2mvyJcwQWeFH1D8TPne51o/Qv5NH5mrbWc9Ci7bq9wjCslG1XqXM/7xr
 BcW3sgxmLTz7VCLVKaMuETOE9vqgTi/qY2DyHOQtyIUQLZ9wTeQgqMrXbNuZL3Wf
 tkNZs23AUJOZqJHM9AjLSvOWvPVBsapRfpnMIWJKwboB3d87vHvxk+d9CCHXWM7T
 m3oERxE2CQQojQNbVvjv23+u60FAbZO9mf226fUiwzrUGV4NG7yCrrKlQDM3RQZl
 h22fcUpU63eWlQI7l20xg==
X-ME-Sender: <xms:0UivYwlYUz38intsHS8lyQwURMQKCmJcAMB9lXHQ6odop2t8_s2jqw>
 <xme:0UivY_2t1jthzVveEbG9gdZl0t4bM-eS7VReqtn04JiUVE5iTt1JhKOqrk1uZP7cw
 WrIsWiTywpREKOOCSs>
X-ME-Received: <xmr:0UivY-q6VR3wm7qp1gukg0_QdRbklHE7LEqXadb02vt6pmVu8uX5Ad1Fztx7sE2QJF1JLoI9c5EqMunQJXN9-k0DVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieeigddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpeeuteekfffgtdegveefveduteelgfduteffvdffveejlefffeehffffleel
 iedtgeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:0UivY8k9CgT7SKmFr0OERCFq8rcxfWOg0Q9aPiMsse7bfcJIui2a1g>
 <xmx:0UivY-2obmvgAWVDq2nHtmqsDjObt0JYxOgQ4dnbAy_q9ML4Wz5fGA>
 <xmx:0UivYzt3ResHAKUxhUdC2Woa9jXUT26Qpq5mHFfoKvyPsDHn3ubqpw>
 <xmx:0kivYx35s98MtkAPRnpyNClJ-cfMO_ZCqjqJ1VTQCAR4yq-rsjcTVA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Dec 2022 15:23:44 -0500 (EST)
Date: Fri, 30 Dec 2022 12:23:41 -0800
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
Message-ID: <Y69IzUapl4G6DXjo@pdel-mbp>
References: <20221229152325.32041-1-philmd@linaro.org>
 <20221229152325.32041-7-philmd@linaro.org>
 <Y63+CpM1zG9lNEPX@pdel-mbp.dhcp.thefacebook.com>
 <9de13ab3-beb6-a86e-5eb3-b4606b0f5b9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9de13ab3-beb6-a86e-5eb3-b4606b0f5b9b@linaro.org>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=peter@pjd.dev;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, Dec 30, 2022 at 09:13:29AM +0100, Philippe Mathieu-Daudé wrote:
> On 29/12/22 21:52, Peter Delevoryas wrote:
> > On Thu, Dec 29, 2022 at 04:23:22PM +0100, Philippe Mathieu-Daudé wrote:
> > > Since I don't have access to the datasheet, the relevant
> > > values were found in:
> > > https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi
> > > 
> > > Before on Zephyr:
> > > 
> > >    uart:~$ crypto aes256_cbc_vault
> > >    aes256_cbc vault key 1
> > >    [00:00:06.699,000] <inf> hace_global: aspeed_crypto_session_setup
> > >    [00:00:06.699,000] <inf> hace_global: data->cmd: 1c2098
> > >    [00:00:06.699,000] <inf> hace_global: crypto_data_src: 93340
> > >    [00:00:06.699,000] <inf> hace_global: crypto_data_dst: 93348
> > >    [00:00:06.699,000] <inf> hace_global: crypto_ctx_base: 93300
> > >    [00:00:06.699,000] <inf> hace_global: crypto_data_len: 80000040
> > >    [00:00:06.699,000] <inf> hace_global: crypto_cmd_reg:  11c2098
> > >    [00:00:09.743,000] <inf> hace_global: HACE_STS: 0
> > >    [00:00:09.743,000] <err> hace_global: HACE poll timeout
> > >    [00:00:09.743,000] <err> crypto: CBC mode ENCRYPT - Failed
> > >    [00:00:09.743,000] <inf> hace_global: aspeed_crypto_session_free
> > >    uart:~$
> > > 
> > > After:
> > > 
> > >    uart:~$ crypto aes256_cbc_vault
> > >    aes256_cbc vault key 1
> > >    Was waiting for:
> > >    6b c1 be e2 2e 40 9f 96 e9 3d 7e 11 73 93 17 2a
> > >    ae 2d 8a 57 1e 03 ac 9c 9e b7 6f ac 45 af 8e 51
> > >    30 c8 1c 46 a3 5c e4 11 e5 fb c1 19 1a 0a 52 ef
> > >    f6 9f 24 45 df 4f 9b 17 ad 2b 41 7b e6 6c 37 10
> > > 
> > >     But got:
> > >    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > > 
> > >    [00:00:05.771,000] <inf> hace_global: aspeed_crypto_session_setup
> > >    [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2098
> > >    [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
> > >    [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
> > >    [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
> > >    [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
> > >    [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2098
> > >    [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
> > >    [00:00:05.772,000] <inf> crypto: Output length (encryption): 80
> > >    [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_free
> > >    [00:00:05.772,000] <inf> hace_global: aspeed_crypto_session_setup
> > >    [00:00:05.772,000] <inf> hace_global: data->cmd: 1c2018
> > >    [00:00:05.772,000] <inf> hace_global: crypto_data_src: 93340
> > >    [00:00:05.772,000] <inf> hace_global: crypto_data_dst: 93348
> > >    [00:00:05.772,000] <inf> hace_global: crypto_ctx_base: 93300
> > >    [00:00:05.772,000] <inf> hace_global: crypto_data_len: 80000040
> > >    [00:00:05.772,000] <inf> hace_global: crypto_cmd_reg:  11c2018
> > >    [00:00:05.772,000] <inf> hace_global: HACE_STS: 1000
> > >    [00:00:05.772,000] <inf> crypto: Output length (decryption): 64
> > >    [00:00:05.772,000] <err> crypto: CBC mode DECRYPT - Mismatch between plaintext and decrypted cipher text
> > >    [00:00:05.774,000] <inf> hace_global: aspeed_crypto_session_free
> > >    uart:~$
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > 
> > Awesome!
> > 
> > Reviewed-by: Peter Delevoryas <peter@pjd.dev>
> > 
> > > ---
> > > Should we rename HACE 'dram' as 'secram' / 'secure-ram'?
> > 
> > Sure, sounds good to me.
> > 
> > > ---
> > >   hw/arm/aspeed_ast10x0.c | 15 +++++++++++++++
> > >   1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
> > > index 21a2e62345..02636705b6 100644
> > > --- a/hw/arm/aspeed_ast10x0.c
> > > +++ b/hw/arm/aspeed_ast10x0.c
> > > @@ -29,6 +29,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
> > >       [ASPEED_DEV_SPI1]      = 0x7E630000,
> > >       [ASPEED_DEV_SPI2]      = 0x7E640000,
> > >       [ASPEED_DEV_UDC]       = 0x7E6A2000,
> > > +    [ASPEED_DEV_HACE]      = 0x7E6D0000,
> > >       [ASPEED_DEV_SCU]       = 0x7E6E2000,
> > >       [ASPEED_DEV_JTAG0]     = 0x7E6E4000,
> > >       [ASPEED_DEV_JTAG1]     = 0x7E6E4100,
> > > @@ -166,6 +167,9 @@ static void aspeed_soc_ast1030_init(Object *obj)
> > >       snprintf(typename, sizeof(typename), "aspeed.gpio-%s", socname);
> > >       object_initialize_child(obj, "gpio", &s->gpio, typename);
> > > +    snprintf(typename, sizeof(typename), "aspeed.hace-%s", socname);
> > > +    object_initialize_child(obj, "hace", &s->hace, typename);
> > > +
> > >       object_initialize_child(obj, "iomem", &s->iomem, TYPE_UNIMPLEMENTED_DEVICE);
> > >       object_initialize_child(obj, "sbc-unimplemented", &s->sbc_unimplemented,
> > >                               TYPE_UNIMPLEMENTED_DEVICE);
> > > @@ -359,6 +363,17 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
> > >       }
> > >       aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->sbc), 0, sc->memmap[ASPEED_DEV_SBC]);
> > > +    /* HACE */
> > > +    object_property_set_link(OBJECT(&s->hace), "dram", OBJECT(&s->secsram),
> 
> We need to link the SRAM here, not the sec-SRAM.

Nice catch 😅

> 
> Doing so the hash test works:
> 
> uart:~$ hash test
> sha256_test
> tv[0]:PASS
> tv[1]:PASS
> tv[2]:PASS
> tv[3]:PASS
> tv[4]:PASS
> sha384_test
> tv[0]:PASS
> tv[1]:PASS
> tv[2]:PASS
> tv[3]:PASS
> tv[4]:PASS
> tv[5]:PASS
> sha512_test
> tv[0]:PASS
> tv[1]:PASS
> tv[2]:PASS
> tv[3]:PASS
> tv[4]:PASS
> tv[5]:PASS
> uart:~$
> 
> rsa / aes256_cbc tests still fail.
> 

Oh nice!!

