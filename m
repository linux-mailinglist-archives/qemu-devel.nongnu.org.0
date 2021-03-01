Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F10329410
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 22:48:43 +0100 (CET)
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGqPC-0007Gl-T9
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 16:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGqNg-0006TU-LN; Mon, 01 Mar 2021 16:47:10 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1lGqNe-0002nI-FS; Mon, 01 Mar 2021 16:47:08 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CBD8E5C0143;
 Mon,  1 Mar 2021 16:47:04 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 01 Mar 2021 16:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=GknQ2
 UYUFzxEKEJMsF7yxlDNRK339wb7h8EKsuFS8lM=; b=olA5Cl8dYz6AlDk959Bvv
 LvWGGjtPAiJ3Pplbf4BQ8zN+zTmMYm3VCSheha6E/jrZCMz5WL86fz6NpDD2nSYw
 82H4Ed9ysuU37F8G8l3zA3/XDfgnP1hzNe3uJbRWYRNJX8qbiT2dfPYklDkwt5uV
 kxcfaDnW6Jyekho/K50s/XE+Z21Bxbo38t8g1zxzCr7UWnrS4ebTluWGuUJSwChT
 UvmfZOHhLVatBN9MsynB4baQ5peQ3+wXWUt4hdhntGf7oafm3h6cMqYuGDcMxQuS
 PL0BOQKqfoPgEoXab4aF3oWJd94BJO3ctc9Nw+X77P0IEtLnbMfp01MIC2+aiRcg
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=GknQ2UYUFzxEKEJMsF7yxlDNRK339wb7h8EKsuFS8
 lM=; b=Np7PxXmNPqB+9H+dr7LMtJHZWgBgL5R6fXaatThb20CCiUdsjo1E6DU6O
 Xqz8/cAlAi6Mrnw/E4rYpBUc1NXZnegXYdDacVf0EsYOMckdM0D1Xtc3yKDzDtas
 VUhk2UrYFQi/4feiSst7a/7iJFMCldNdfCxaeKHr+gtN7vv08q2yRVM2J6FVVIi0
 FtZnNaRIIzIHyyoIfkMUA/Eegf2E+ew/dgFmKub1WSflhsDohVepqT/SvGqyEYIl
 VyhyC4icvrQRZtGTZqrRGJC0tBK/cxhLPdb2aue7WAiiiT2ue5W6vZrytVEHAPLj
 kPvKC3gNcHkpfGhyRtXKm0da3XrSA==
X-ME-Sender: <xms:12A9YJb_E51kaaLPSWK0XbRpyYTjE_V6PbDIQctk2dJQvKFR1cT18g>
 <xme:12A9YAazYtNgf1a9Ft1efEpiPBCRjrmFjFWTM_YahYN6BW-FLpIWcWCPQ-8v02Aws
 G_no9P--BCcByuMlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdduheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:12A9YL_1xeKK2TjIyWLJ-rx8IripjyEb97vQYVEmSZ8auRUlGUhLLA>
 <xmx:12A9YHqoCtzeG_E_TOH1JZltOPsHwfUmw66AI1_IxA8Q2syXNJJudg>
 <xmx:12A9YEoco5wy4IXuIZy9NeYdenEi9d9_UEZLDBEAkueGTwfu9gThfw>
 <xmx:2GA9YJDQNEuJCBWfn119JyHMb11cMLJ28q2ARXF7r__QwqZDvfEQaQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 65589A00064; Mon,  1 Mar 2021 16:47:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <19d389df-c9e8-499e-b691-7b6c9e2da1d7@www.fastmail.com>
In-Reply-To: <20210301010610.355702-5-andrew@aj.id.au>
References: <20210301010610.355702-1-andrew@aj.id.au>
 <20210301010610.355702-5-andrew@aj.id.au>
Date: Tue, 02 Mar 2021 08:16:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH v2 4/5] hw/misc: Add a basic Aspeed LPC controller model
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=andrew@aj.id.au;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Corey Minyard <minyard@acm.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 1 Mar 2021, at 11:36, Andrew Jeffery wrote:
> From: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> This is a very minimal framework to access registers which are used to=

> configure the AHB memory mapping of the flash chips on the LPC HC
> Firmware address space.
>=20
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  docs/system/arm/aspeed.rst   |   2 +-
>  hw/arm/aspeed_ast2600.c      |  10 +++
>  hw/arm/aspeed_soc.c          |  10 +++
>  hw/misc/aspeed_lpc.c         | 131 ++++++++++++++++++++++++++++++++++=
+
>  hw/misc/meson.build          |   7 +-
>  include/hw/arm/aspeed_soc.h  |   2 +
>  include/hw/misc/aspeed_lpc.h |  32 +++++++++
>  7 files changed, 192 insertions(+), 2 deletions(-)
>  create mode 100644 hw/misc/aspeed_lpc.c
>  create mode 100644 include/hw/misc/aspeed_lpc.h
>=20
> diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
> index 690bada7842b..2f6fa8938d02 100644
> --- a/docs/system/arm/aspeed.rst
> +++ b/docs/system/arm/aspeed.rst
> @@ -48,6 +48,7 @@ Supported devices
>   * UART
>   * Ethernet controllers
>   * Front LEDs (PCA9552 on I2C bus)
> + * LPC Peripheral Controller (a subset of subdevices are supported)
> =20
> =20
>  Missing devices
> @@ -56,7 +57,6 @@ Missing devices
>   * Coprocessor support
>   * ADC (out of tree implementation)
>   * PWM and Fan Controller
> - * LPC Bus Controller
>   * Slave GPIO Controller
>   * Super I/O Controller
>   * Hash/Crypto Engine
> diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> index 2125a96ef317..60152de001e6 100644
> --- a/hw/arm/aspeed_ast2600.c
> +++ b/hw/arm/aspeed_ast2600.c
> @@ -211,6 +211,8 @@ static void aspeed_soc_ast2600_init(Object *obj)
> =20
>      object_initialize_child(obj, "emmc-controller.sdhci", &s->emmc.sl=
ots[0],
>                              TYPE_SYSBUS_SDHCI);
> +
> +    object_initialize_child(obj, "lpc", &s->lpc, TYPE_ASPEED_LPC);
>  }
> =20
>  /*
> @@ -469,6 +471,14 @@ static void aspeed_soc_ast2600_realize(DeviceStat=
e=20
> *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->emmc), 0,=20
> sc->memmap[ASPEED_DEV_EMMC]);
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
>                         aspeed_soc_get_irq(s, ASPEED_DEV_EMMC));
> +
> +    /* LPC */
> +    if (!sysbus_realize(SYS_BUS_DEVICE(&s->lpc), errp)) {
> +        return;
> +    }
> +    sysbus_mmio_map(SYS_BUS_DEVICE(&s->lpc), 0,=20
> sc->memmap[ASPEED_DEV_LPC]);
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->emmc), 0,
> +                       aspeed_soc_get_irq(s, ASPEED_DEV_LPC));

Hah, this isn't right! We don't notice it wrt LPC devices because the=20=

LPC IRQ is unused right now, but it will impact the eMMC.

Let me do a v3.

Andrew

