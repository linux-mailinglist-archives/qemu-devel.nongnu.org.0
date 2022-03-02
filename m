Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73274CAFA3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 21:22:40 +0100 (CET)
Received: from localhost ([::1]:48640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPVUd-00009I-EV
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 15:22:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nPVTG-0007fR-Cm; Wed, 02 Mar 2022 15:21:14 -0500
Received: from [2607:f8b0:4864:20::336] (port=38845
 helo=mail-ot1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1nPVTE-0004nb-Qi; Wed, 02 Mar 2022 15:21:14 -0500
Received: by mail-ot1-x336.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so2683522oti.5; 
 Wed, 02 Mar 2022 12:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iWr6RcZAHp74gh8XFEqloNiCHSR9dGphWGw8LODkNTE=;
 b=ezvoXmoWzCWUbHyQh7gFYZOn3Hq5tSouSgF+Ot7zBLKT66tQPs63mxNvLAnCZUaOuf
 PBaCzMuMkSUkFGj7srgIjXBf8nDQFiGqX8/mFE/9Pp/Nq0liB9mU0bI6xbVADInTy6xP
 BlD12RKytLj7tjWfn7ywT3pR+QrIGfH38WfRhnQphByCP/dnW5HCJ6TdCn0EWHW16pjq
 mpFEwqHlE3oGamZRoiHHCuqHACqB3ssciY78fZIwSOTJgtzpw05t2m9KueuMnHu3JhZu
 PbKM1kV5/xUmfwU4qsUTyOYRraml0rUNYuTNn2vWnFROewJ4LW5Q92gto8e0z6UBC4DN
 SUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iWr6RcZAHp74gh8XFEqloNiCHSR9dGphWGw8LODkNTE=;
 b=gGsa7hcBxHNDj2cocbggbgGbKcF05oVevDFnwwU+Eliae1dljvR9ubR8oWjGfotXDj
 qtIRKNnKd3CMkJ2nVMX0zbxiG9GIn84/1TEg4HpVSQcabkK4+SXrlyUlDUF0Qzq2V9Vx
 caQ66HD3No7gTQsOIr+dW1Lqa4XpJhve5ZBoygFv4SulGuDf8aXPI/YjfO10c6/fzHs2
 jNqyB369it4jPhY4WF4/OCgl3hdc1eCJKnLeuFK3crHj/CH7WAZ64PMcEyButGZtkgnK
 PH040ELc1+2YE3+w3t8pjzOHSN+W6zNGnGDB5JKXBy7MvEMSKouEahzeLwU8fu8eKsc0
 nBRg==
X-Gm-Message-State: AOAM531+qq6s17polrz53wafXkzDgQFf9N0P0HZdH0qy8xWtoWiljSeq
 3alQHsZHryg0sohuevTfOdtwwAOQDXvj9+5Lzgtsz50AKMQ=
X-Google-Smtp-Source: ABdhPJwxSv5vcp4sxqYN7m70QDQ2EQcl1/NHQhJoTbyUUv0/jUXkGnGl6ObXHCyCn7acUcmiSns4WPUJ3PEgwZXpeZU=
X-Received: by 2002:a05:6830:118e:b0:5af:a7b:a03f with SMTP id
 u14-20020a056830118e00b005af0a7ba03fmr16545735otq.123.1646252471314; Wed, 02
 Mar 2022 12:21:11 -0800 (PST)
MIME-Version: 1.0
References: <CABLmASFbowE4Cu8gHk9eD+_h8ZrdupE8MHKAfpW+T8Oe=-3=Wg@mail.gmail.com>
 <e2dd457d-29b3-32be-72e2-315e686dff69@eik.bme.hu>
In-Reply-To: <e2dd457d-29b3-32be-72e2-315e686dff69@eik.bme.hu>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Wed, 2 Mar 2022 21:21:00 +0100
Message-ID: <CABLmASH5tFs86Dq+1e+ByMF43jZL5UZ7MempVVhtKCwjdpa7aw@mail.gmail.com>
Subject: Re: Issue with qemu-system-ppc running OSX guests
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: multipart/alternative; boundary="000000000000c36b0e05d942056f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::336
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=hsp.cat7@gmail.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lucas.castro@eldorado.org.br, qemu-ppc <qemu-ppc@nongnu.org>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c36b0e05d942056f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 2, 2022 at 9:11 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:

> On Wed, 2 Mar 2022, Howard Spoelstra wrote:
> > Hi all,
> >
> > I noticed qemu-system-ppc running OSX guests does not get to the deskto=
p
> or
> > does not display the menu bars.
>
> Cc-ing the relevant people and the PPC list might help, I've added them.
> Also telling which OSX guest version can reproduce the problem could help
> debugging. Is it any OSX version?
>
> Regards,
> BALATON Zoltan
>

Oops, Qemu running on Fedora 35 host,
Reproducer:

./qemu-system-ppc \
-M mac99 \
-m 512 \
-L pc-bios \
-display sdl -serial stdio \
-boot c \
-drive file=3D10.1.img,format=3Draw,media=3Ddisk

The issue affects all supported Mac OSX guests: 10.0 to 10.5

Best,
Howard


> > Bisecting lead to this commit:
> >
> > 80eca687c8513a7e1611e0441abdd68b0c02a1d6 is the first bad commit
> > commit 80eca687c8513a7e1611e0441abdd68b0c02a1d6
> > Author: Lucas Mateus Castro (alqotel) <lucas.castro@eldorado.org.br>
> > Date:   Wed Mar 2 06:51:36 2022 +0100
> >
> >    target/ppc: moved vector even and odd multiplication to decodetree
> >
> >    Moved the instructions vmulesb, vmulosb, vmuleub, vmuloub,
> >    vmulesh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,
> >    muleuw and vmulouw from legacy to decodetree. Implemented
> >    the instructions vmulesd, vmulosd, vmuleud, vmuloud.
> >
> >    Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >    Signed-off-by: Lucas Mateus Castro (alqotel) <
> > lucas.araujo@eldorado.org.br>
> >    Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> >    Message-Id: <20220225210936.1749575-3-matheus.ferst@eldorado.org.br>
> >    Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >
> > target/ppc/helper.h                 | 24 ++++++------
> > target/ppc/insn32.decode            | 22 +++++++++++
> > target/ppc/int_helper.c             | 20 +++++-----
> > target/ppc/translate/vmx-impl.c.inc | 77
> > ++++++++++++++++++++++++++++---------
> > target/ppc/translate/vmx-ops.c.inc  | 15 ++------
> > tcg/ppc/tcg-target.c.inc            |  6 +++
> > 6 files changed, 112 insertions(+), 52 deletions(-)
> >
> > Best,
> > Howard
> >

--000000000000c36b0e05d942056f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 2, 2022 at 9:11 PM BALATO=
N Zoltan &lt;<a href=3D"mailto:balaton@eik.bme.hu">balaton@eik.bme.hu</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed=
, 2 Mar 2022, Howard Spoelstra wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I noticed qemu-system-ppc running OSX guests does not get to the deskt=
op or<br>
&gt; does not display the menu bars.<br>
<br>
Cc-ing the relevant people and the PPC list might help, I&#39;ve added them=
. <br>
Also telling which OSX guest version can reproduce the problem could help <=
br>
debugging. Is it any OSX version?<br>
<br>
Regards,<br>
BALATON Zoltan<br></blockquote><div><br></div><div>Oops, Qemu running on Fe=
dora 35 host,<br></div><div>Reproducer:</div><div><br></div><div>./qemu-sys=
tem-ppc \<br>-M mac99 \</div><div>-m 512 \<br>-L pc-bios \<br>-display sdl =
-serial stdio \<br>-boot c \<br>-drive file=3D10.1.img,format=3Draw,media=
=3Ddisk</div><div><br></div><div>The issue affects all supported Mac OSX gu=
ests: 10.0 to 10.5</div><div><br></div><div>Best,</div><div>Howard <br></di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Bisecting lead to this commit:<br>
&gt;<br>
&gt; 80eca687c8513a7e1611e0441abdd68b0c02a1d6 is the first bad commit<br>
&gt; commit 80eca687c8513a7e1611e0441abdd68b0c02a1d6<br>
&gt; Author: Lucas Mateus Castro (alqotel) &lt;<a href=3D"mailto:lucas.cast=
ro@eldorado.org.br" target=3D"_blank">lucas.castro@eldorado.org.br</a>&gt;<=
br>
&gt; Date:=C2=A0 =C2=A0Wed Mar 2 06:51:36 2022 +0100<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 target/ppc: moved vector even and odd multiplication to d=
ecodetree<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Moved the instructions vmulesb, vmulosb, vmuleub, vmuloub=
,<br>
&gt;=C2=A0 =C2=A0 vmulesh, vmulosh, vmuleuh, vmulouh, vmulesw, vmulosw,<br>
&gt;=C2=A0 =C2=A0 muleuw and vmulouw from legacy to decodetree. Implemented=
<br>
&gt;=C2=A0 =C2=A0 the instructions vmulesd, vmulosd, vmuleud, vmuloud.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:rich=
ard.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 Signed-off-by: Lucas Mateus Castro (alqotel) &lt;<br>
&gt; <a href=3D"mailto:lucas.araujo@eldorado.org.br" target=3D"_blank">luca=
s.araujo@eldorado.org.br</a>&gt;<br>
&gt;=C2=A0 =C2=A0 Signed-off-by: Matheus Ferst &lt;<a href=3D"mailto:matheu=
s.ferst@eldorado.org.br" target=3D"_blank">matheus.ferst@eldorado.org.br</a=
>&gt;<br>
&gt;=C2=A0 =C2=A0 Message-Id: &lt;<a href=3D"mailto:20220225210936.1749575-=
3-matheus.ferst@eldorado.org.br" target=3D"_blank">20220225210936.1749575-3=
-matheus.ferst@eldorado.org.br</a>&gt;<br>
&gt;=C2=A0 =C2=A0 Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailt=
o:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt;<br>
&gt;<br>
&gt; target/ppc/helper.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 24 ++++++------<br>
&gt; target/ppc/insn32.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 22=
 +++++++++++<br>
&gt; target/ppc/int_helper.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 20 +++++-----<br>
&gt; target/ppc/translate/vmx-impl.c.inc | 77<br>
&gt; ++++++++++++++++++++++++++++---------<br>
&gt; target/ppc/translate/vmx-ops.c.inc=C2=A0 | 15 ++------<br>
&gt; tcg/ppc/tcg-target.c.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 6 +++<br>
&gt; 6 files changed, 112 insertions(+), 52 deletions(-)<br>
&gt;<br>
&gt; Best,<br>
&gt; Howard<br>
&gt;</blockquote></div></div>

--000000000000c36b0e05d942056f--

