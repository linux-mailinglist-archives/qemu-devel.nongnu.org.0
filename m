Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DDF37FC0D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:03:19 +0200 (CEST)
Received: from localhost ([::1]:42544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEk2-0005cA-AB
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:03:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1lhEQP-0006Nn-Pk
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:43:02 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:36468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1lhEQM-0002y9-SU
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:43:01 -0400
Received: by mail-lf1-x132.google.com with SMTP id m11so22958130lfg.3
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fbBg60Ij63Cc99F46O/+OZm7xYI1W6JwarO1kn0gOHQ=;
 b=jyLU3xHU0scAGh9/GxSoZhAlNZle4cVwhBkchMKcxNUNn379aentLgtMoFmUCPEQUB
 iAXpC5TDACNvbY6hQ92Fra2p6Eegd/rEokuHJVcuW9dUKYeuOQJWsLuqqOebHTBxK1/Z
 PIkQHhp23adVuYpqOtDirEm8jywRWSirPS/VUcF7YRbeOsUFJaBAkyUD+5B6ADMQCoP4
 Rnfmg+KdiajwDX6SihJtBQAZzf2tcGAB0xZVknfBly/XWpZmEgmIkAH2uVMBCTb1NBsX
 DBlQWovAqOCbY5I4Lq2obarHzRmBENjU88i1d7aq6hDwvygqHulfAjZgpNfHpZb7Mvjs
 dttQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fbBg60Ij63Cc99F46O/+OZm7xYI1W6JwarO1kn0gOHQ=;
 b=qmPRyo4a9qGFnjIDSbmYRberuA6dRoyhPGhCPMscAW9T4tI+TwBumORmW2Un7Ej3fx
 uc7ufFfA+0LeNglS0imwjpIpwxvwAxgwEI/OGxuBJdaJYxTCN5GZXFWrU1p2RFnsYNCo
 Ird1myxDUwto1ZzF5l0jT1ouvLkdCp2AfC+Uen7SpRYz4r/q3utJBsU0FjE+g6HP+zFn
 SvbT68qAKRdfUkcaoo/LJeRCZN16W+SvYKRSwtHNLqTH3PFvMf5JxaaulOfTfKyzqJXs
 eK5ClsxpSyJAWtwp7zhDffh+hmjiDc3fJ/S0aPO9NGPNKGkLlv8w6dByMU1L4mmrzyMq
 rn9A==
X-Gm-Message-State: AOAM5334FtZwNtcSCiJXpdsfnIbrkaInUdy+EzACk5Pz4YAeyQtuFAaT
 EmBT3jyMLAFLL8lSNpVM/IHvWsKmCPw5yKPpgPbAnQ==
X-Google-Smtp-Source: ABdhPJw32fOpHi2cbzWPUNZ47PiBCGz1lLHF0Y91yk419dN3ZhgEBn8zsmReivFD4c0whvw5cwxcacLdrexO2rDEhqc=
X-Received: by 2002:a19:6b07:: with SMTP id d7mr29823626lfa.551.1620924174339; 
 Thu, 13 May 2021 09:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210513163858.3928976-1-philmd@redhat.com>
 <20210513163858.3928976-4-philmd@redhat.com>
In-Reply-To: <20210513163858.3928976-4-philmd@redhat.com>
From: Hao Wu <wuhaotsh@google.com>
Date: Thu, 13 May 2021 09:42:41 -0700
Message-ID: <CAGcCb13n+Ju9XnVcY_QQve6YhgOFiYrhAvk2Uz9cp8w8wTMARw@mail.gmail.com>
Subject: Re: [PATCH 03/10] hw/arm/Kconfig: Add missing dependency NPCM7XX ->
 SMBUS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Doug Evans <dje@google.com>, Tyrong Ting <kfting@nuvoton.com>,
 Corey Minyard <cminyard@mvista.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009f080d05c238d1d1"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009f080d05c238d1d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Hao Wu <wuhaotsh@google.com>

On Thu, May 13, 2021 at 9:39 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but
> this isn't advertised with proper Kconfig symbol, leading
> to an early build failure when building NPCM7XX machines
> standalone:
>
>   The following clauses were found for AT24C
>
>       config AT24C depends on I2C
>       select AT24C if NPCM7XX
>
> Fix by adding SMBUS to NPCM7XX.
>
> Fixes: 94e77879395 ("hw/i2c: Implement NPCM7XX SMBus Module Single Mode")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
> Cc: Doug Evans<dje@google.com>
> Cc: Hao Wu <wuhaotsh@google.com>
> Cc: Tyrong Ting<kfting@nuvoton.com>
> Cc: Corey Minyard <cminyard@mvista.com>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 67723d9ea6a..85c6a1a088c 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -373,6 +373,7 @@ config NPCM7XX
>      bool
>      select A9MPCORE
>      select ARM_GIC
> +    select SMBUS
>      select AT24C  # EEPROM
>      select PL310  # cache controller
>      select SERIAL
> --
> 2.26.3
>
>

--0000000000009f080d05c238d1d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.=
com">wuhaotsh@google.com</a>&gt;</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Thu, May 13, 2021 at 9:39 AM Philippe Ma=
thieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
The TYPE_NPCM7XX_SMBUS device model exposes an SMBus, but<br>
this isn&#39;t advertised with proper Kconfig symbol, leading<br>
to an early build failure when building NPCM7XX machines<br>
standalone:<br>
<br>
=C2=A0 The following clauses were found for AT24C<br>
<br>
=C2=A0 =C2=A0 =C2=A0 config AT24C depends on I2C<br>
=C2=A0 =C2=A0 =C2=A0 select AT24C if NPCM7XX<br>
<br>
Fix by adding SMBUS to NPCM7XX.<br>
<br>
Fixes: 94e77879395 (&quot;hw/i2c: Implement NPCM7XX SMBus Module Single Mod=
e&quot;)<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@red=
hat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
---<br>
Cc: Doug Evans&lt;<a href=3D"mailto:dje@google.com" target=3D"_blank">dje@g=
oogle.com</a>&gt;<br>
Cc: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=3D"_blank">wuh=
aotsh@google.com</a>&gt;<br>
Cc: Tyrong Ting&lt;<a href=3D"mailto:kfting@nuvoton.com" target=3D"_blank">=
kfting@nuvoton.com</a>&gt;<br>
Cc: Corey Minyard &lt;<a href=3D"mailto:cminyard@mvista.com" target=3D"_bla=
nk">cminyard@mvista.com</a>&gt;<br>
---<br>
=C2=A0hw/arm/Kconfig | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig<br>
index 67723d9ea6a..85c6a1a088c 100644<br>
--- a/hw/arm/Kconfig<br>
+++ b/hw/arm/Kconfig<br>
@@ -373,6 +373,7 @@ config NPCM7XX<br>
=C2=A0 =C2=A0 =C2=A0bool<br>
=C2=A0 =C2=A0 =C2=A0select A9MPCORE<br>
=C2=A0 =C2=A0 =C2=A0select ARM_GIC<br>
+=C2=A0 =C2=A0 select SMBUS<br>
=C2=A0 =C2=A0 =C2=A0select AT24C=C2=A0 # EEPROM<br>
=C2=A0 =C2=A0 =C2=A0select PL310=C2=A0 # cache controller<br>
=C2=A0 =C2=A0 =C2=A0select SERIAL<br>
-- <br>
2.26.3<br>
<br>
</blockquote></div>

--0000000000009f080d05c238d1d1--

