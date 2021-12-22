Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C556647D829
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 21:11:16 +0100 (CET)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n07xD-0000Rn-D0
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 15:11:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n07dN-0002ta-SU
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:50:45 -0500
Received: from [2a00:1450:4864:20::435] (port=38520
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1n07dM-0002oR-1O
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 14:50:45 -0500
Received: by mail-wr1-x435.google.com with SMTP id e5so7030844wrc.5
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 11:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sm4pmbPi5K+Dndn7mDjjyDixB94TRk+9O7DtkYR/PCg=;
 b=Kr62CfC364r/CuwWKexc5f301qbS9Gom0u4hCRFiwg0B6gQfUE4stVgNS4WKIdz8Md
 gwvUl+KG+D+6yeI8BB+znDQU382xqUMM5NP5YSORm/ozAMSBg2uTwXIE/csgAdXczzQL
 Dmj0Xe1akruS8dxz7iVuvXuA9x3yjsP02vmkJadd2TXRaVcKqE2HZRDt0Bg/vtdK68V0
 qsFTigPEuQ08cD0VrNG24PEWG/IErAsC6jxgjE82jwlwjf1xa0c0vnA1rlvrUa/RuoUW
 Lxa02S7RNjl6WeIY2wE5Td+uig5hbFWQHppr0pZO2zjFTW6eNcBPQYwRhSZZ+am+aMc6
 muMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sm4pmbPi5K+Dndn7mDjjyDixB94TRk+9O7DtkYR/PCg=;
 b=saitb9/R57wtsMmQ8F2x+Pt0Sh1jdkHpo34Pr0Xiqzq0qdTeO9a7Cf7H0hGKDlLv9e
 F/GHG8tgEFhN2DPZicVmsabOJ8sC2sorPibHg1s0nSa6fVTingvc6Hb7pafbLoWaUZPY
 o5fPwPV+sWG4NSXxWStCX7K3wn0bmE+3zRF6delOFhSyUkZkCLXbdGLY94mKRw84c+TE
 KWWfETR5cODdcfpL5Jo5h5pXcBcqyyk41pbfNKRvOBShh8OKlj503+eEyL7yMo7uS50w
 GNA0HTJ7nuPBS0WgsL4ff9oo2s82/IXU1jiZHYPm+i18miC8enkkjqpzlrKwHfLDZGyV
 yyHw==
X-Gm-Message-State: AOAM530OP/y+no2IRgy3l+eXlcRFlLrQ+poaBjzKtJmz5yfU2VOIDkQ8
 kwSPuO0ts/Y9rMBxLGO01ocHMjuH5c7UavvoR4A=
X-Google-Smtp-Source: ABdhPJzprK9Z2Fj261vw/+tZ+lsQatINH41AdFYTofcvclPu2pO11bLaAYWqbQr5MI2Mpcxm8QKDGV0ICA8hcqxrSiw=
X-Received: by 2002:adf:9e49:: with SMTP id v9mr2975260wre.469.1640202642247; 
 Wed, 22 Dec 2021 11:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20211222010647.1332479-1-dpetroff@gmail.com>
 <CAJ+F1CLp_JABETwwu+hVG-iMT--5AKWH5qSOYm9rHA1vTi9Hfg@mail.gmail.com>
 <CADufsaRjkwDt_6Cihb1Q2fZHEHDN7v0hDQHcc25PBstyPz07wg@mail.gmail.com>
In-Reply-To: <CADufsaRjkwDt_6Cihb1Q2fZHEHDN7v0hDQHcc25PBstyPz07wg@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Dec 2021 23:50:29 +0400
Message-ID: <CAJ+F1CLBdLKA_TOE91x1s1aAk6g06n38+9reqUjX2Mu_d3wX2w@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ps2: Initial horizontal scroll support
To: Dmitry Petrov <dpetroff@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d9d62505d3c16f71"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d9d62505d3c16f71
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry

On Wed, Dec 22, 2021 at 7:11 PM Dmitry Petrov <dpetroff@gmail.com> wrote:

> Hi Marc-Andr=C3=A9,
>
> Thank you for the comments!
>
> The reason of adding the support there was because I've been working on
> horizontal scroll support for another os
> (serenity os - https://github.com/SerenityOS/serenity/pull/11246) and
> wanted to make sure that any changes I made
> worked fine and ps/2 mouse code was the most straightforward way I could
> find especially because I could test it
> both against linux and serenity os code.
>
> Did I get it right that the only changes needed for these patches are:
>
> - Drop unnecessary log line
> - Submit again as v3 with a cover letter?
>
>
Yes, that would be nice, so more tools and people can review easily.


> It's my first submission, still trying to get used to the tooling and
> requirements.
>

We have some documentation in
https://www.qemu.org/docs/master/devel/submitting-a-patch.html

(I'd recommend using git-publish, although it's good to understand and know
the underlying commands and workflow before using it).


>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d9d62505d3c16f71
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Dmitry<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 22, 2021 at 7:11=
 PM Dmitry Petrov &lt;<a href=3D"mailto:dpetroff@gmail.com">dpetroff@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div>Hi Marc-Andr=C3=A9,</div><div><br></div><div>Thank=
 you for the comments!<br></div><div><br></div><div>The reason of adding th=
e support there was because I&#39;ve been working on horizontal scroll supp=
ort for another os</div><div>(serenity os - <a href=3D"https://github.com/S=
erenityOS/serenity/pull/11246" target=3D"_blank">https://github.com/Serenit=
yOS/serenity/pull/11246</a>) and wanted to make sure that any changes I mad=
e</div><div>worked fine and ps/2 mouse code was the most straightforward wa=
y I could find especially because I could test it</div><div>both against li=
nux and serenity os code.</div><div><br></div><div>Did I get it right that =
the only changes needed for these patches are:</div><div><br></div><div>- D=
rop unnecessary log line</div><div>- Submit again as v3 with a cover letter=
?</div><div><br></div></div></blockquote><div>=C2=A0</div><div>Yes, that wo=
uld be nice, so more tools and people can review easily. <br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div></div><div>It&#39;s my first submission, still trying to get used to =
the tooling and requirements.</div></div></blockquote><div><br></div><div>W=
e have some documentation in <a href=3D"https://www.qemu.org/docs/master/de=
vel/submitting-a-patch.html">https://www.qemu.org/docs/master/devel/submitt=
ing-a-patch.html</a></div><div><br></div><div>(I&#39;d recommend using git-=
publish, although it&#39;s good to understand and know the underlying comma=
nds and workflow before using it).<br></div><div>=C2=A0<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
</blockquote></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d9d62505d3c16f71--

