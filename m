Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9192F460E
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 09:15:41 +0100 (CET)
Received: from localhost ([::1]:41844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzbJc-00038o-Oq
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 03:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzbGz-0001qJ-Tg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:12:57 -0500
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:36215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kzbGu-0006mX-Cg
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 03:12:57 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 86DAC58073F;
 Wed, 13 Jan 2021 03:12:50 -0500 (EST)
Received: from imap1 ([10.202.2.51])
 by compute6.internal (MEProxy); Wed, 13 Jan 2021 03:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=qViSp
 756L2IQheskuY6voQo6wc7Kl9fJrph/4TIP8Ew=; b=fqopKDpw36g6KP09Jhc0K
 g/mim/Gy0L57nizbW72Gg9kodwcOfF7qLwYM+sX1Mt7ShBuP9BophsizNE1TybEO
 6uadxvghTu7KkDvWu4h+KYHobGPl93Xu61jEID6yqZQMyrZOBeqrTwRwbeivh/BZ
 HaRAz3xMjZHmjr0xkE8psHO8zzo4i6byeYH760PsVpFcGwS07f7yoV8TeOk51PH9
 fSHD7pz/PBdXUfF3qyBDYRTtc1l8kCbVFLQx988OVY74+vlZP7fS9vJInMryHtWP
 kQqfSV4ZnlucddeqtrfjekL/6vAv6bT+nZepjeYIZ/gpco7+WaQtITTIk1hyyNFG
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=qViSp756L2IQheskuY6voQo6wc7Kl9fJrph/4TIP8
 Ew=; b=M3nd3ukkyiGCxRw+zX7F8EoXMuJdSXzMpl1ERpRSgocAVZv0/QQi3zegn
 own9aDjqSDi4NWB+7qPxWzlmIrMTbuIEEUgAnPqiZvXkZB7pLLIPpq4HfEusrMSk
 Pw247vMno0CU7JaRAm6XgHUl9cazxW/c2lXZKZwDm9ZoARvcDeoAhrwZ/iBNUDn0
 gYsALCzzw/1HxiYRN5lIJt0oBeFO0Hz2EJfl7HJtuWil2/X1bApQJkU6maBroCPa
 Bue3WpqYpPGuzoVHYELec29LBVgj+Kj4GGTJKgw8ykiI3jk89zmzlVABgFFsBXRF
 Qv8a4XyP124vZEA4GI2CnpCvD1shw==
X-ME-Sender: <xms:gav-X6BLcCp3V_7AkexQ62NzsE0I45e_kVde3Sh-vqTwkiiffwaj6Q>
 <xme:gav-X0gPOLU3W3duVtPy39QOBeecEsfuey96yN81fZeeW0EbNym2sBzkqqmc1I4x_
 2HGXQwMkqEZNkKB7hk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
 rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
 feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:gav-X9mJWQRs_CCeMc3hu2cheW4VyIWFlEFhuNJXqa_lB8n8YTuoBQ>
 <xmx:gav-X4wT6NJZPralsA3opsCTGdA6kj33GvWB8nMWhaVGA_lFp6xykA>
 <xmx:gav-X_Tes_ecE6C2W63FnTRL36RLWbHW73Xrj9peflFUPlDAtis12g>
 <xmx:gqv-X5f4SUrb2_1PG-Lh46nKtWG9eMNDzQIefAsyF0fAoxBQh9kWOA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 774D2C204F9; Wed, 13 Jan 2021 03:12:49 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <7df96359-af2a-4db1-a9ba-f92dd233864b@www.fastmail.com>
In-Reply-To: <d58c8ba9-56e7-06da-c074-ea225fd45a39@amsat.org>
References: <20210112215504.2093955-1-f4bug@amsat.org>
 <0e1b22ca-7ca0-f92e-2d43-fc10eafd565f@flygoat.com>
 <d58c8ba9-56e7-06da-c074-ea225fd45a39@amsat.org>
Date: Wed, 13 Jan 2021 16:11:50 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "BALATON Zoltan via" <qemu-devel@nongnu.org>
Subject: =?UTF-8?Q?Re:_[PATCH_0/6]_target/mips:_Convert_Loongson_LEXT_opcodes_to_?=
 =?UTF-8?Q?decodetree?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.229;
 envelope-from=jiaxun.yang@flygoat.com; helo=new3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, Jan 13, 2021, at 4:06 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 1/13/21 3:15 AM, Jiaxun Yang wrote:
> > =E5=9C=A8 2021/1/13 =E4=B8=8A=E5=8D=885:54, Philippe Mathieu-Daud=C3=
=A9 =E5=86=99=E9=81=93:
> >> Loongson is next step in the "MIPS decodetree conversion" epic.
> >> Start with the simplest extension.
> >>
> >> The diffstat addition comes from the TCG functions expanded.
> >> The code is easier to review now.
> >> IMO this is also a good template to show how easy a decodetree
> >> conversion can be (and how nice the .decode file is to review) :P
> >>
> >> Please review,
> >>
> >> Phil.
> >>
> >> Based-on: <20210112184156.2014305-1-f4bug@amsat.org>
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "decod=
etree: Allow 'dot' in opcode names"
> >>
> >> Philippe Mathieu-Daud=C3=A9 (6):
> >> =C2=A0=C2=A0 target/mips: Re-introduce OPC_ADDUH_QB_DSP and OPC_MUL=
_PH_DSP
> >> =C2=A0=C2=A0 target/mips: Convert Loongson DDIV.G opcodes to decode=
tree
> >> =C2=A0=C2=A0 target/mips: Convert Loongson DIV.G opcodes to decodet=
ree
> >> =C2=A0=C2=A0 target/mips: Convert Loongson [D]DIVU.G opcodes to dec=
odetree
> >> =C2=A0=C2=A0 target/mips: Convert Loongson [D]MOD[U].G opcodes to d=
ecodetree
> >> =C2=A0=C2=A0 target/mips: Convert Loongson [D]MULT[U].G opcodes to =
decodetree
> >>
> >> =C2=A0 target/mips/translate.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 1 +
> >> =C2=A0 target/mips/godson2.decode=C2=A0=C2=A0=C2=A0 |=C2=A0 29 +++
> >> =C2=A0 target/mips/loong-ext.decode=C2=A0 |=C2=A0 30 +++
> >=20
> > Hi Philippe,
> >=20
> > Thanks for the template!
> >=20
> > Just a small question, where should we perform ISA availability chec=
k?
> > Before calling generated decoder or after decoded?
>=20
> The check is done before in decode_loongson:
>=20
>  bool decode_loongson(DisasContext *ctx, uint32_t insn)
>  {
>      if ((ctx->insn_flags & INSN_LOONGSON2E)
>          // if ISA available ...
>              && decode_godson2(ctx, ctx->opcode)) {
>              // and opcode supported
>          // return success
>          return true;
>      }
>      // else keep going ...
>=20
>      if ((ctx->insn_flags & ASE_LEXT)
>              && decode_loong_ext(ctx, ctx->opcode)) {
>          return true;
>      }
>=20
>      // finally return false, if nothing else decoded
>      // gen_reserved_instruction will be called in the
>      // main decode loop.
>      return false;
>  }
>=20
> >=20
> > Loong-EXT is a super set of Loongson2F's Godson2 and MMI instruction=
s,
> > how could we tell it?
>=20
> MMI instructions are currently handled by the ASE_LMMI flag,
> a different decoder (which will also be handled by this function,
> similarly to ASE_LEXT).

SWC2/LWC2/SDC2/LDC2 family of LEXT instructions do exist on LEXT but not=
 Loongson-2F.

Thanks.

>=20
> Regards,
>=20
> Phil.
>

--=20
- Jiaxun

