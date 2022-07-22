Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AEA57E29F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:53:35 +0200 (CEST)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEt5z-0004o1-39
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:53:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oEt0z-0005Qa-4U
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:48:25 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f]:44866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oEt0w-00065l-UL
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:48:24 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-10bd4812c29so6315588fac.11
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 06:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pgd2sJWSw/BM3VL9Nan8RQjGO+j3gq11aWSs3GBQhlk=;
 b=l4gZV9xJt0VzHDUCN2Cf0ycnClHza09gF/PFfT42EAWyqG659ryG/R7M6I8z1QEne/
 jAOD/T8dngVVOgqWRDaCSLcqRFDS/1s7c9zeuPNZwQ7h5f16sIMV8vkXwGCkcdZKZBDU
 vlnK2dWgQqhMjLA9EP5eP42fnQK4XDKIP0nmObs/gQrCpn2p5sYf4pmkTMrH2Fj9wog9
 cxDHZochcDFH3JEGRVNku8dBaEDvMHmY4qRLm9LVjlAjp/yDqHaIVWwxWjyUylpVWpy/
 Qc9NJWI8gMgCQEUzZMY8cjgFHfJ2rbMjWbD+YPe1joIivKEFJOc57x8aNVNwl8p7QJ9m
 1sOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pgd2sJWSw/BM3VL9Nan8RQjGO+j3gq11aWSs3GBQhlk=;
 b=K8k6IDZ4un9BoK2L1y5Hff4EMXcsqHarQWCEzoXxWQ+47FCAsHQhxCiGVA8MsabBtU
 NG23LBwC0r34zhepWTuZsW2xa4w2NUB5BVNV3V322fCil9msnt9KpsW40QP8Z1L5uBXc
 uFTxdUapxaqcGK2H4LFiX0+XQfeR+TBggrhm0t0VthhTpZia4kMR4zVkTfubVMoXRVzc
 BK7UBLvDk9Yk5gwNYTmYqJlugw7GT1F2DOJYOeDTwBMrYqmoco3OwzbpQbnTAEVFJ70D
 gvXbF0cHwmhvtanfZhTGuTwaHjZFmdLEfzsjF8pdawH+HxuYqt5H3f1cZTEYyUpvg1xM
 UXuw==
X-Gm-Message-State: AJIora9wlH4KrDzRV8cMSLG0k9TAVps5naBYpKQzVmfhm8ifgrGEFvdA
 w70Jt9LylyNgJRUyL47ttKvbbZrFTrwfWSkiHwU=
X-Google-Smtp-Source: AGRyM1uNJPQGmslj7pnEwyz0jX1s78dh9nmYuaPrIcYjSLR3ZLKvOLgc7f86I/DJi1sMvyTSDgv9dUxO9wpwz0IJTfo=
X-Received: by 2002:a05:6870:612c:b0:10b:fde7:773f with SMTP id
 s44-20020a056870612c00b0010bfde7773fmr33294oae.82.1658497701457; Fri, 22 Jul
 2022 06:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
 <87y1woyxvo.fsf@linaro.org>
 <CAK7rcp-Ts=3JNoYRak-Zddb0NDjdgSqbGD32xFEguw0yLqydyw@mail.gmail.com>
 <CAFEAcA8sWMD1eZCZyiMPz_SNKRn6J--Gm53aQuTo-KO5bWyFrQ@mail.gmail.com>
 <CAK7rcp8pvQfn=x1DsFwmr2GbK-tqmCxh8stkA8+QmfdC-peXPA@mail.gmail.com>
 <87pmhxze6g.fsf@linaro.org>
In-Reply-To: <87pmhxze6g.fsf@linaro.org>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Fri, 22 Jul 2022 09:48:10 -0400
Message-ID: <CAK7rcp_yhCLJCEgMBRyrZFfwWRSmAah=BSLeDLPYtQyhdo8SgA@mail.gmail.com>
Subject: Re: Access target TranslatorOps
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000005b332705e465168d"
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000005b332705e465168d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oh whoa, I thought I could have an architecture neutral way to interface
with the TCG to find this out.

Yes, I do have to use the decode tree, and converting the script to output
the codes would suffice for my case. However, I do not know how to do that
at the moment. I've tried my best to understand the TCG documentation but
this appears to not be too straightforward.


On Fri, Jul 22, 2022 at 5:31 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Kenneth Adam Miller <kennethadammiller@gmail.com> writes:
>
> > I need to determine the set of instruction encodings that the TCG can
> support for a given platform. I am not bothered
> > whether the target runs at all, and in fact it is better if it
> > doesn't, so runtime or translate time doesn't bother me.
>
> Which architectures are you interested in? For the ones that have been
> converted to use decode tree it should be easy enough to update the
> script to emit the uncovered opcode space. However decode tree targets
> regular encoding - I think it has gained support for multiple encoding
> modes but I don't know if it can handle the irregular madness of x86.
>
> > Imagine I were adding support for more instructions for a given
> platform. I would like to check that I'm using the API
> > right. It's amazing that it's been so far and there's no way to check
> that the correct behavior occurs when a given
> > encoding is encountered regarding the TCG. A boolean result from a
> can_translate called just when the target encounters
> > the instruction would be good.
>
> Generally when the translator encounters an instruction it can't
> translate it would emit a illegal instruction exception. While you might
> be able to peek into the TCG opcode stream to see such calls to the
> relevant helpers I doubt it would be up-streamable as each front end
> will deal with illegal instructions their own way (including
> instructions that are illegal due to the current CPU operating mode).
>
> > Additionally, the ability to force the translation of arbitrary
> encodings would be good. I
> > would like to not have to engineer some binary file format.
>
> You don't need a new binary file format - just to construct an ELF with
> the stream you want. A possibly adjacent project you might want to look
> at is RISU:
>
>   https://git.linaro.org/people/peter.maydell/risu.git/about/
>
> which we've used for testing the range of the translator for a number of
> architectures.
>
> >
> > On Wed, Jul 20, 2022 at 1:37 PM Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >
> >  On Wed, 20 Jul 2022 at 17:39, Kenneth Adam Miller
> >  <kennethadammiller@gmail.com> wrote:
> >  > That I know of, the TCG plugins do not allow me to feed the
> >  > QEMU instance dynamically changing opcodes. I wouldn't use
> >  > TranslatorOps if I don't have to. I want to facilitate a
> >  > use case in which the contents of the target being emulated
> >  > are changing, but it is not a self modifying target. I have
> >  > to query and interact with the TCG to find out what opcodes
> >  > are supported or not.
> >
> >  I agree that feeding opcodes into the translator isn't what
> >  TCG plugins are intended for.
> >
> >  I'm definitely not clear on what you're trying to do here,
> >  so it's hard to suggest some other approach, but linux-user
> >  code shouldn't be messing with the internals of the translator
> >  by grabbing the TranslatorOps struct. Among other things,
> >  linux-user code is runtime and TranslatorOps is for
> >  translate-time.
> >
> >  Sometimes code in linux-user needs to be a bit over-familiar
> >  with the CPU state, but we try to keep that to a minimum.
> >  Generally that involves code in target/foo/ providing some
> >  set of interface functions that code in linux-user/foo/
> >  can work with, typically passing it the CPU state struct.
> >
> >  thanks
> >  -- PMM
>
>
> --
> Alex Benn=C3=A9e
>

--0000000000005b332705e465168d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Oh whoa, I thought I could have an architecture neutral wa=
y to interface with the TCG to find this out.=C2=A0<br><br>Yes, I do have t=
o use the decode tree, and converting the script to output the codes would =
suffice for my case. However, I do not know how to do that at the moment. I=
&#39;ve tried my best to understand the TCG documentation but this appears =
to not be too straightforward.<br><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 22, 2022 at 5:31 AM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmail.com" targ=
et=3D"_blank">kennethadammiller@gmail.com</a>&gt; writes:<br>
<br>
&gt; I need to determine the set of instruction encodings that the TCG can =
support for a given platform. I am not bothered<br>
&gt; whether the target runs at all, and in fact it is better if it<br>
&gt; doesn&#39;t, so runtime or translate time doesn&#39;t bother me.<br>
<br>
Which architectures are you interested in? For the ones that have been<br>
converted to use decode tree it should be easy enough to update the<br>
script to emit the uncovered opcode space. However decode tree targets<br>
regular encoding - I think it has gained support for multiple encoding<br>
modes but I don&#39;t know if it can handle the irregular madness of x86.<b=
r>
<br>
&gt; Imagine I were adding support for more instructions for a given platfo=
rm. I would like to check that I&#39;m using the API<br>
&gt; right. It&#39;s amazing that it&#39;s been so far and there&#39;s no w=
ay to check that the correct behavior occurs when a given<br>
&gt; encoding is encountered regarding the TCG. A boolean result from a can=
_translate called just when the target encounters<br>
&gt; the instruction would be good.<br>
<br>
Generally when the translator encounters an instruction it can&#39;t<br>
translate it would emit a illegal instruction exception. While you might<br=
>
be able to peek into the TCG opcode stream to see such calls to the<br>
relevant helpers I doubt it would be up-streamable as each front end<br>
will deal with illegal instructions their own way (including<br>
instructions that are illegal due to the current CPU operating mode).<br>
<br>
&gt; Additionally, the ability to force the translation of arbitrary encodi=
ngs would be good. I<br>
&gt; would like to not have to engineer some binary file format.<br>
<br>
You don&#39;t need a new binary file format - just to construct an ELF with=
<br>
the stream you want. A possibly adjacent project you might want to look<br>
at is RISU:<br>
<br>
=C2=A0 <a href=3D"https://git.linaro.org/people/peter.maydell/risu.git/abou=
t/" rel=3D"noreferrer" target=3D"_blank">https://git.linaro.org/people/pete=
r.maydell/risu.git/about/</a><br>
<br>
which we&#39;ve used for testing the range of the translator for a number o=
f<br>
architectures.<br>
<br>
&gt;<br>
&gt; On Wed, Jul 20, 2022 at 1:37 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; =
wrote:<br>
&gt;<br>
&gt;=C2=A0 On Wed, 20 Jul 2022 at 17:39, Kenneth Adam Miller<br>
&gt;=C2=A0 &lt;<a href=3D"mailto:kennethadammiller@gmail.com" target=3D"_bl=
ank">kennethadammiller@gmail.com</a>&gt; wrote:<br>
&gt;=C2=A0 &gt; That I know of, the TCG plugins do not allow me to feed the=
<br>
&gt;=C2=A0 &gt; QEMU instance dynamically changing opcodes. I wouldn&#39;t =
use<br>
&gt;=C2=A0 &gt; TranslatorOps if I don&#39;t have to. I want to facilitate =
a<br>
&gt;=C2=A0 &gt; use case in which the contents of the target being emulated=
<br>
&gt;=C2=A0 &gt; are changing, but it is not a self modifying target. I have=
<br>
&gt;=C2=A0 &gt; to query and interact with the TCG to find out what opcodes=
<br>
&gt;=C2=A0 &gt; are supported or not.<br>
&gt;<br>
&gt;=C2=A0 I agree that feeding opcodes into the translator isn&#39;t what<=
br>
&gt;=C2=A0 TCG plugins are intended for.<br>
&gt;<br>
&gt;=C2=A0 I&#39;m definitely not clear on what you&#39;re trying to do her=
e,<br>
&gt;=C2=A0 so it&#39;s hard to suggest some other approach, but linux-user<=
br>
&gt;=C2=A0 code shouldn&#39;t be messing with the internals of the translat=
or<br>
&gt;=C2=A0 by grabbing the TranslatorOps struct. Among other things,<br>
&gt;=C2=A0 linux-user code is runtime and TranslatorOps is for<br>
&gt;=C2=A0 translate-time.<br>
&gt;<br>
&gt;=C2=A0 Sometimes code in linux-user needs to be a bit over-familiar<br>
&gt;=C2=A0 with the CPU state, but we try to keep that to a minimum.<br>
&gt;=C2=A0 Generally that involves code in target/foo/ providing some<br>
&gt;=C2=A0 set of interface functions that code in linux-user/foo/<br>
&gt;=C2=A0 can work with, typically passing it the CPU state struct.<br>
&gt;<br>
&gt;=C2=A0 thanks<br>
&gt;=C2=A0 -- PMM<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div>

--0000000000005b332705e465168d--

