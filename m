Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDFC6989D9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 02:33:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pST8O-0003Yk-Rn; Wed, 15 Feb 2023 20:32:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pST8M-0003YK-Cu
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:32:26 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pST8G-0003HY-6q
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 20:32:26 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 59B045C00F4;
 Wed, 15 Feb 2023 20:32:15 -0500 (EST)
Received: from imap44 ([10.202.2.94])
 by compute2.internal (MEProxy); Wed, 15 Feb 2023 20:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1676511135; x=
 1676597535; bh=JY9fe2GKOrCHxQ7zEllzVWgM9Wi5e7DJGFH3l4YtSmQ=; b=w
 2e8L9i3SsuGea9fpHIMsGQqjjt+35Rfx0zjkgqxUZv0/0IbbXg/mlQHdktVVCgNB
 7zXprsfegL4odXkJCrnBHQnTMoBSSL5G799NHekFUSigi6xVjfcZCziCpNt/iDBt
 Hgf/MDquVMSYddHbiDxjAh3fzVoZiLEaYcOSzkGVuz/211z2BG1ClZbFCINJ+Tq/
 kpr8/5telYQ+CjIf9PSVhkyESm/6Dm5M/BvNS1U9FIDqYNp6ur1KW6XWE+coSfXV
 Cpl+MBNysn2NXNXUe5IbNWkO/rBziQQkWiIzq2wSF8HRLI0COSu6lBSlJRPPOpFB
 Huk6h/1cRyxnsLRkG7H0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676511135; x=
 1676597535; bh=JY9fe2GKOrCHxQ7zEllzVWgM9Wi5e7DJGFH3l4YtSmQ=; b=F
 E38pXk4SNEmHy3mAeZKobKPjcmeiAAN8h0vlxcfrnsPJlTxY0/D1KPLt7sj1L7XH
 Yt9ohOUrLTdCedqoRegjcd4XqX2eBedx6wIqEBh2jTeeMK+FvN0e9i1iloGawiXF
 zObeSmTzSrYFGAr34EC4YLFB7l1VHp+Q+GmdGfg/uu1cB7TFGKGjyqIMCJWejPw1
 9Gz5UtCOu+PROeIXymuqrOyAQOvjdeptidajUHn+6ftu6yKOoVkLUctDfyibQKTA
 vbB4Nq3PS7zmVRw8oFxWq7gzM39kVsNY5I5qxarepSpxonZzR1TRlrG0aNkDyqUk
 jMikG0PbQuY1ooVmKyjxQ==
X-ME-Sender: <xms:noftY-jX2NCRkKaC2qdwBzNgIVT2bBhFnaAT4ig3JgfWbDXadA6ZMg>
 <xme:noftY_B5JEC-HJwwC0Rd3PZZHhqW2W20FbsRiapIqu9zMMIsUOsP93F8yy1_blktI
 H3qu4HMbRiOXZqLIqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeiiedgfeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
 ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
 hmqeenucggtffrrghtthgvrhhnpedufeegfeetudeghefftdehfefgveffleefgfehhfej
 ueegveethfduuddvieehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:noftY2HjtZX-hfCC0jlLwoSfwsRCElv8pn-idzbimKbyGL2JlS3tSg>
 <xmx:noftY3RiCik7MsVG902GD_u31zprAPH9jHRdKm4Jlmqoj-uNSYKAbg>
 <xmx:noftY7znE2UlgdoF82KekPvhH4ilsYo60UD8NWCDE-iIcw2-I6CHrw>
 <xmx:n4ftY7_i8gxXLXF_ZudoMNemdxGai-iOW1XaYeJ5hLo3fVyaRKplKQ>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C4ED336A0073; Wed, 15 Feb 2023 20:32:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <ff59a570-7e1a-43c9-bf7c-62f82d50451e@app.fastmail.com>
In-Reply-To: <92e0e4dd-0aee-7d12-06b5-eb087766e087@linaro.org>
References: <20230215084754.3816747-1-marcin.nowakowski@fungible.com>
 <20230215084754.3816747-2-marcin.nowakowski@fungible.com>
 <645427aa-2630-a2be-9f1a-bee60a2d2885@linaro.org>
 <92e0e4dd-0aee-7d12-06b5-eb087766e087@linaro.org>
Date: Thu, 16 Feb 2023 01:31:54 +0000
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Marcin Nowakowski" <marcin.nowakowski@fungible.com>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Cc: "Aurelien Jarno" <aurelien@aurel32.net>,
 "Aleksandar Rikalo" <aleksandar.rikalo@syrmia.com>
Subject: Re: [PATCH 1/3] target/mips: fix JALS32/J32 instruction handling for
 microMIPS
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.28; envelope-from=jiaxun.yang@flygoat.com;
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



=E5=9C=A82023=E5=B9=B42=E6=9C=8815=E6=97=A5=E4=BA=8C=E6=9C=88 =E4=B8=8B=E5=
=8D=888:50=EF=BC=8CPhilippe Mathieu-Daud=C3=A9=E5=86=99=E9=81=93=EF=BC=9A
> On 15/2/23 21:21, Richard Henderson wrote:
>> On 2/14/23 22:47, Marcin Nowakowski wrote:
>>> @@ -4860,6 +4860,7 @@ static void gen_compute_branch(DisasContext=20
>>> *ctx, uint32_t opc,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 target_ulong btgt =3D -1;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int blink =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int bcond_compute =3D 0;
>>> +=C2=A0=C2=A0=C2=A0 int jal_mask =3D 0;
>>=20
>> Better to limit the scope of the variable to the block below.
>>=20
>>> @@ -4917,6 +4918,11 @@ static void gen_compute_branch(DisasContext=20
>>> *ctx, uint32_t opc,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case OPC_J:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 case OPC_JAL:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Jump to immediate */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 jal_mask =3D ctx->hflags=
 & MIPS_HFLAG_M16 ? 0xF8000000 :=20
>>> 0xF0000000;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 btgt =3D ((ctx->base.pc_=
next + insn_bytes) & jal_mask) |
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(uint32_t)offset;
>>=20
>> Ideally we wouldn't have one huge helper function, and could pass dow=
n=20
>> the mask from the translator.=C2=A0 But that's on-going cleanup.
>
> Yes, this is the approach taken in decodetree conversion.
>
> I hope to rebase / respin incorporating Jiaxun patches some day...

Which series are you referring?
Just caught some time so I might able to help.

>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>=20
>>=20
>> r~

--=20
- Jiaxun

