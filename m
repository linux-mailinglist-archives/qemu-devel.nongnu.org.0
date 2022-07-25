Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613757F832
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 04:11:53 +0200 (CEST)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFnZY-0005MH-4X
	for lists+qemu-devel@lfdr.de; Sun, 24 Jul 2022 22:11:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oFnWp-0002cr-Ub; Sun, 24 Jul 2022 22:09:03 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:34921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@aj.id.au>)
 id 1oFnWn-0008Lx-Qg; Sun, 24 Jul 2022 22:09:03 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 294675C007D;
 Sun, 24 Jul 2022 22:08:58 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Sun, 24 Jul 2022 22:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1658714938; x=
 1658801338; bh=NEa/j/2SB2pKHYtzCnkefYFBHS8ZAQ2nhbnYIYpEzME=; b=T
 LfVffHLVRBymSt4CypQYaicG4srHhaGxxvYFkzgbUQuyDu2uhmmiDVtYob+ild15
 YNgJedo6ow23P9b08bgy51FmSIYsGv+N9cjbw7urTR5e2qghqKthF3MvAVWEeC7q
 CyB3UJ6XdMkInBHFnrnmouPmIEN4xL8XS+oJoVsH1KBmr/4WSLdkn3KconutO5oI
 n3445VYJ4M7tU03pI6s8tLOVoepR8uO8hTe9BatYrNN++AUrfMmPGspxDVywR2T+
 j0AVVN5UAhc+0Yp3dbWlRz4E3bUJqlVsoMUeWfqh2pr1JPeME9EgrR9kbkIbUZhH
 FjF0bRVOBRW8ANwha2iKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658714938; x=
 1658801338; bh=NEa/j/2SB2pKHYtzCnkefYFBHS8ZAQ2nhbnYIYpEzME=; b=a
 kU1jMdrOM5tI+wztQpvp9h72A2YDxrnXTORnnvkuSr4ny2/r9Z7XJrNkLenQFEyd
 2+hW9E/StCbjYavN/nFeFQMMmEanTnojKKpjsIM7dO/MRQKVgpmVAF2B/1YR8/o7
 yLjbjfLdy3jPHw0Ypm+TatFIKKcMhAp1K+8mOPiNYWKwewUcvTgnSBDeWety6bdj
 SORcknUsNUddjmV/6vhx2n6t1jOsPwh3vUuggfFaXhKK46JWMe/OmzPL/NXEoZKw
 KUbhJD5m9V52DiBcKzahsr26PulE9OYpgCH2p2QKxdOx3w0ae5cWQU05yAxAAgJb
 x+7SWWUfCQAkWv8XG6MoQ==
X-ME-Sender: <xms:OfvdYh2bVf2hi_s4YxnR6yCQuRklmFNrOzGsmXZTxs2MqeEB5Ybxxg>
 <xme:OfvdYoE1gTOHuJ9qUG-AV6jS3L6rxcwpV8CjOj49XPhONrTZrOZQJvl8fQ3LWtNSt
 EUDxFcM0OkhhQTs6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtjedgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
 ftrfgrthhtvghrnhepgfeiieettdelkeehffevieetgeejgeffveefhfffkedvudefuddv
 veejgeehheevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:OfvdYh4GYixpTX4JckyehXsc2qJYJZNO-QAGC03kph08mfeAOcNgLA>
 <xmx:OfvdYu36xuMWznYzLdw_jKel8ubBq62CiWLb3GDnRvDsu9qNhukvjQ>
 <xmx:OfvdYkGJ6dUVX4x-oYrz9pnTy0QEuPrLsXboB_Ea5R6xBjDJxWhA8Q>
 <xmx:OvvdYv0hF6cRPBq1luKOpWTZhyTyt8o5CGkQGNA6UMjxDn95B2XGdA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1B69E170007E; Sun, 24 Jul 2022 22:08:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-757-gc3ad9c75d3-fm-20220722.001-gc3ad9c75
Mime-Version: 1.0
Message-Id: <e98735a4-19ae-4628-bacb-549511821c41@www.fastmail.com>
In-Reply-To: <20220722063602.128144-9-clg@kaod.org>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-9-clg@kaod.org>
Date: Mon, 25 Jul 2022 11:38:36 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 "Cameron Esfahani via" <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9_via?= <qemu-arm@nongnu.org>,
 qemu-block@nongnu.org, "Peter Maydell" <peter.maydell@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Alistair Francis" <alistair@alistair23.me>, 
 "Francisco Iglesias" <frasse.iglesias@gmail.com>,
 "Iris Chen" <irischenlj@fb.com>, "Michael Walle" <michael@walle.cc>
Subject: Re: [PATCH v3 8/8] arm/aspeed: Replace mx25l25635e chip model
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.26; envelope-from=andrew@aj.id.au;
 helo=out2-smtp.messagingengine.com
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



On Fri, 22 Jul 2022, at 16:06, C=C3=A9dric Le Goater wrote:
> A mx25l25635f chip model is generally found on these machines. It's
> newer and uses 4B opcodes which is better to exercise the support in
> the Linux kernel.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 1c611284819d..7e95abc55b09 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1157,7 +1157,7 @@ static void=20
> aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
>      amc->soc_name  =3D "ast2400-a1";
>      amc->hw_strap1 =3D PALMETTO_BMC_HW_STRAP1;
>      amc->fmc_model =3D "n25q256a";
> -    amc->spi_model =3D "mx25l25635e";
> +    amc->spi_model =3D "mx25l25635f";

Hmm, dmesg reported mx25l25635e on the palmetto I checked

>      amc->num_cs    =3D 1;
>      amc->i2c_init  =3D palmetto_bmc_i2c_init;
>      mc->default_ram_size       =3D 256 * MiB;
> @@ -1208,7 +1208,7 @@ static void=20
> aspeed_machine_ast2500_evb_class_init(ObjectClass *oc, void *data)
>      amc->soc_name  =3D "ast2500-a1";
>      amc->hw_strap1 =3D AST2500_EVB_HW_STRAP1;
>      amc->fmc_model =3D "mx25l25635e";
> -    amc->spi_model =3D "mx25l25635e";
> +    amc->spi_model =3D "mx25l25635f";
>      amc->num_cs    =3D 1;
>      amc->i2c_init  =3D ast2500_evb_i2c_init;
>      mc->default_ram_size       =3D 512 * MiB;
> @@ -1258,7 +1258,7 @@ static void=20
> aspeed_machine_witherspoon_class_init(ObjectClass *oc, void *data)
>      mc->desc       =3D "OpenPOWER Witherspoon BMC (ARM1176)";
>      amc->soc_name  =3D "ast2500-a1";
>      amc->hw_strap1 =3D WITHERSPOON_BMC_HW_STRAP1;
> -    amc->fmc_model =3D "mx25l25635e";
> +    amc->fmc_model =3D "mx25l25635f";

The witherspoon I checked also reported mx25l25635e in dmesg for the=20
FMC.

You do say "generally" in the commit message though.

Andrew

