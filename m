Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B58C6493AE
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 11:41:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4JlH-0001js-JX; Sun, 11 Dec 2022 05:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p4Jl5-0001i5-Ey
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:40:38 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1p4Jl3-0002Tx-QQ
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 05:40:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 283E35C00D6;
 Sun, 11 Dec 2022 05:40:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 11 Dec 2022 05:40:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1670755233; x=
 1670841633; bh=4VrTx4nyhEck2DyKOQ4C7AD1h+sWiUppPEXwBq4JA+k=; b=T
 qVD8JqtRNxFEw3muyLuhRyaRMrY389CiJK5UfhOqGILCmhJQ2WX4p3rFq2B/+iHg
 p0B0+5BWS1Sm7QVJCqGEAOX3qg/dcjZC5coixURUP111fu1mnx6FIuLKYPhMhNCx
 T1tHkq8CISNVpLg8prvODgXJw9a71pHD+mdwVPpFDgV4qFVZ/G0uzN9sFkM13Y6s
 2TdPr1sPHRJcxPMNZITUE549cd+FTrkr7kw/ET9gy7qP2AX4hS9vRmyvC3t836DU
 Yy8pPcfZj6ePavmGNLlS565wTyNc7BaJ/z71DOMl7PALvK0q54yLp2XjLk1+pGcS
 +DofwpH4oOVwtTKUoD7ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1670755233; x=
 1670841633; bh=4VrTx4nyhEck2DyKOQ4C7AD1h+sWiUppPEXwBq4JA+k=; b=P
 RF1TmI7/+aCoYx2ClppLcp95IAey0/T0l3aEzDWV8eAdH3H8OwUBpGdPZwht3FUE
 Ri9ieznMxUICxSCr7f49+0/dr8o99Bl2KwZUGxgpjXLr2dyBOjh/vZ+FK/axtA12
 e0ptVtRTY2pXgL7ZWwDpxNDFnZasqskMzMxn5Y4kBgxfs/VmynB58dTFwYqwEXbm
 NROhpXTxhRM8sJeObK65QjRPiTAUrfC1vzwuAs6ZHhbjCF/v1nQrwkKcmuzrk35k
 HDshz0rWH8CJ/O0eQBkpGq6IEv5A2jM84pGW5CT/KGRuuNbu4zSj8OZKHb6tnc8E
 8pgAE+IXSwJibk3OGAR9A==
X-ME-Sender: <xms:oLOVY1JhsCIoWYyUE4wchsMAShwOCRNyjFb1uL8oznqbQ2TO774SSg>
 <xme:oLOVYxI4F1jfy4nXRihAF6X-63oaK9D7HuBnLCQplCGf0WK74rADuYhiowKuRIRuR
 tzbpzLujXC7lIoT1jQ>
X-ME-Received: <xmr:oLOVY9tjO6Lw1jLs60Ktw7yC3Hb1WLQAthG8vpea8wx8BzZEq3H4P-wy-olyAxCMKScU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpegtggfuhfgjffevgffkfhfvofesthhqmhdthhdtjeenucfhrhhomheplfhirgig
 uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpedutdejffetteefkeejieehfeeuieeguedtveeijeeviefhffel
 vdfgudeihfdvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:obOVY2ayx6u-DeQXx3JHabCrn0pWSJ4huYvzXmObu6piPAWDq6YptA>
 <xmx:obOVY8ZdmrQFib7UdJw6By9KKrNg0nUQ9ojicEr4OmKr-DkZu04djA>
 <xmx:obOVY6BtaD100BQsf8C46h7Eafu7gpiCVgSSgI6PKW4fCy04AqgIog>
 <xmx:obOVY7x2E3Kc6WWeAQxZNRPXtI-W8213PmjPI2-sjQcg_thUBC-TfA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Dec 2022 05:40:31 -0500 (EST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH-for-8.0 6/7] hw/mips/bootloader: Implement nanoMIPS SW
 opcode
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
In-Reply-To: <20221210155502.74609-7-philmd@linaro.org>
Date: Sun, 11 Dec 2022 10:40:20 +0000
Cc: BALATON Zoltan via <qemu-devel@nongnu.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Dragan Mladjenovic <Dragan.Mladjenovic@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Djordje Todorovic <djordje.todorovic@syrmia.com>,
 Bernhard Beschow <shentey@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0F927603-2DFB-486C-B61D-3CDBB0324F8A@flygoat.com>
References: <20221210155502.74609-1-philmd@linaro.org>
 <20221210155502.74609-7-philmd@linaro.org>
To: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
Received-SPF: pass client-ip=66.111.4.25; envelope-from=jiaxun.yang@flygoat.com;
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



> 2022=E5=B9=B412=E6=9C=8810=E6=97=A5 15:55=EF=BC=8CPhilippe =
Mathieu-Daud=C3=A9 <philmd@linaro.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
> hw/mips/bootloader.c | 25 ++++++++++++++++++++++++-
> 1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/mips/bootloader.c b/hw/mips/bootloader.c
> index cc3df385df..541b59bf84 100644
> --- a/hw/mips/bootloader.c
> +++ b/hw/mips/bootloader.c
> @@ -177,9 +177,32 @@ static void bl_gen_ori(void **p, bl_reg rt, =
bl_reg rs, uint16_t imm)
>     }
> }
>=20
> +static void bl_gen_sw_nm(void **ptr, bl_reg rt, uint8_t rs, uint16_t =
offset)
> +{
> +    uint16_t *p =3D (uint16_t *)*ptr;
> +    uint32_t insn =3D 0;
> +
> +    insn =3D deposit32(insn, 26, 6, 0b100001);
> +    insn =3D deposit32(insn, 21, 5, rt);
> +    insn =3D deposit32(insn, 16, 5, rs);
> +    insn =3D deposit32(insn, 12, 4, 0b1001);
> +    insn =3D deposit32(insn, 0, 12, offset);
> +
> +    stw_p(p, insn >> 16);
> +    p++;
> +    stw_p(p, insn >> 0);
> +    p++;

Think we can have a helper function like st_nm32_p.

Thanks
- Jiaxun

> +
> +    *ptr =3D p;
> +}
> +
> static void bl_gen_sw(void **p, bl_reg rt, uint8_t base, uint16_t =
offset)
> {
> -    bl_gen_i_type(p, 0x2b, base, rt, offset);
> +    if (bootcpu_supports_isa(ISA_NANOMIPS32)) {
> +        bl_gen_sw_nm(p, rt, base, offset);
> +    } else {
> +        bl_gen_i_type(p, 0x2b, base, rt, offset);
> +    }
> }
>=20
> static void bl_gen_sd(void **p, bl_reg rt, uint8_t base, uint16_t =
offset)
> --=20
> 2.38.1
>=20


