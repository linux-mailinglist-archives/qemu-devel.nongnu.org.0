Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B31374C43
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 02:16:50 +0200 (CEST)
Received: from localhost ([::1]:58132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leRhA-0000Du-GT
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 20:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leRfD-0007lj-Jy
 for qemu-devel@nongnu.org; Wed, 05 May 2021 20:14:47 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:33725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1leRfA-0005PO-2o
 for qemu-devel@nongnu.org; Wed, 05 May 2021 20:14:47 -0400
Received: by mail-qt1-x832.google.com with SMTP id 1so2754194qtb.0
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 17:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SM87EJU0uHLSzhFuAQsm9p7D/pou8dLkdaPKFesU43g=;
 b=H3Cw7j3O5Y7hiIZ+ZpUV60m9DJUrM+37PQ2shMh5E7yA8c/i5SL69SeU1lEW5J6c2t
 ebyoU4iUtVgzdjjE2ojvVZyDLyShNEd4lLowUtaNl4arDn55g2vKp0WMGW7fszpFPCUx
 Xa9IVT4jrIT2mSPdXIq06azhETGIdIOpClv2CA2oOP47Ch2IMvnq550cUWhO3ZS94L2h
 eX/fYDdNvwOZwjjjhv/Lm4zlXDnWTwAPEhP/g/hKP9k8DyU6g+4tnjAbSPPPv9Nq2wbn
 Icsmtdfsc1XsoKAcw6aeyvWEsbSk4zJKW5fhWBtVd55yPRLoiem5QVewJCvR6FNA8ecV
 DMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SM87EJU0uHLSzhFuAQsm9p7D/pou8dLkdaPKFesU43g=;
 b=gQLgXcApEzvtS5rUqKwDx+uP/EI88dox1EdJVXoGT+2yrCWpN6R58dvxGXEX+ztVdS
 IpQ+xG4IlxB68iihd9Kljo5Qo0t4GWA2Iq2LIvFoqVPJPayL2wQCi6DPCktQSjGxBANj
 Xs01UrA2gBlMpr0a0KNib6WGW9YqLZfSIvRm8huEsxKnRmrR0zKg5b7Bg553brRTlf9y
 c1zfwkjaUfldQHmCwmdhwqbpW25nMFE2WeApyobZBm1xyRmZ+wyukdx+bWde0W7UT+IN
 ZD4b6FEsSaLl/CiepTt1VYlNm1DVmbBjisOvVDg9oISES3N+39zq6Stjo9ZbW997YBdX
 PIfg==
X-Gm-Message-State: AOAM5312Z4Q6qBgHTvCoz/dwbJnoJW1dvLnrOqUpOkzaCZGfOxQsEGXs
 WYKYarorvzWOAYlJUsihXqGT7mJlCzUeHE2j0FzZig==
X-Google-Smtp-Source: ABdhPJw4c7doZDA08/PaKbgKzNpwR3cJVH/zhkUvPEIGAs/with1Gu+OKv40K/czcS2iUvUsLiMIWC1VEQ+a2493TiM=
X-Received: by 2002:ac8:675a:: with SMTP id n26mr1320286qtp.101.1620260081704; 
 Wed, 05 May 2021 17:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-8-philmd@redhat.com>
 <20210505212238.GA1186879@dhcp-10-100-145-180.wdc.com>
 <285e17d3-93fb-7317-8aba-689fda772f84@redhat.com>
 <c72ab9cd-e958-ee21-ef18-bd84c9dfd39c@redhat.com>
In-Reply-To: <c72ab9cd-e958-ee21-ef18-bd84c9dfd39c@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Wed, 5 May 2021 18:14:29 -0600
Message-ID: <CANCZdfpxqeWRUkEW5MtgpS-r7zPGdMTGnwzL7ni0umMG8NPsGQ@mail.gmail.com>
Subject: Re: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic
 stack allocation
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009d353905c19e3237"
Received-SPF: none client-ip=2607:f8b0:4864:20::832;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009d353905c19e3237
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021, 5:10 PM Eric Blake <eblake@redhat.com> wrote:

> On 5/5/21 5:07 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > +Eric
> >
> > On 5/5/21 11:22 PM, Keith Busch wrote:
> >> On Wed, May 05, 2021 at 11:10:31PM +0200, Philippe Mathieu-Daud=C3=A9 =
wrote:
> >>> The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
> >>> a constant! Help it by using a definitions instead.
> >>
> >> I don't understand.
> >
> > Neither do I TBH...
> >
> >> It's labeled 'const', so any reasonable compiler
> >> will place it in the 'text' segment of the executable rather than on t=
he
> >> stack. While that's compiler specific, is there really a compiler doin=
g
> >> something bad with this? If not, I do prefer the 'const' here if only
> >> because it limits the symbol scope ('static const' is also preferred i=
f
> >> that helps).
> >
> > Using: gcc version 10.2.1 20201125 (Red Hat 10.2.1-9) (GCC)
> >
> > Both static+const / const trigger:
> >
> > hw/block/nvme.c: In function =E2=80=98nvme_map_sgl=E2=80=99:
> > hw/block/nvme.c:818:5: error: ISO C90 forbids variable length array
> > =E2=80=98segment=E2=80=99 [-Werror=3Dvla]
> >   818 |     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgl=
d;
> >       |     ^~~~~~~~~~~~~~~~~
> > cc1: all warnings being treated as errors
>
> C99 6.7.5.2 paragraph 4:
> "If the size is an integer constant expression and the element type has
> a known constant size, the array type is not a variable length array
> type; otherwise, the array type is a variable length array type."
>
> 6.6 paragraph 6:
> "An integer constant expression shall have integer type and shall only
> have operands that are integer constants, enumeration constants,
> character constants, sizeof expressions whose results are integer
> constants, and floating constants that are the immediate operands of
> casts. Cast operators in an integer constant expression shall only
> convert arithmetic types to integer types, except as part of an operand
> to the sizeof operator."
>
> Notably absent from that list are 'const int' variables, which even
> though they act as constants (in that the name always represents the
> same value), do not actually qualify as such under C99 rules.  Yes, it's
> a pain.  What's more, 6.6 paragraph 10:
>
> "An implementation may accept other forms of constant expressions."
>
> which means it _should_ be possible for the compiler to do what we want.
>  But just because it is permitted does not make it actually work. :(
>
> And while C17 expands the list of integer constant expressions to
> include _Alignof expressions, it does not add any wording to permit
> const variables.
>
>
> https://stackoverflow.com/questions/62354105/why-is-const-int-x-5-not-a-c=
onstant-expression-in-c
> helps with this explanation:
> "The thing to remember (and yes, this is a bit counterintuitive) is that
> const doesn't mean constant. A constant expression is, roughly, one that
> can be evaluated at compile time (like 2+2 or 42). The const type
> qualifier, even though its name is obviously derived from the English
> word "constant", really means "read-only".
>
> Consider, for example, that these are a perfectly valid declarations:
>
> const int r =3D rand();
> const time_t now =3D time(NULL);
>
> The const just means that you can't modify the value of r or now after
> they've been initialized. Those values clearly cannot be determined
> until execution time."
>
> And C++ _does_ support named constants, but we're using C, not C++.
>

Enum is as close as it gets in C if you are eschewing #define.

Warner

--=20
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org
>
>
>

--0000000000009d353905c19e3237
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, May 5, 2021, 5:10 PM Eric Blake &lt;<a href=3D=
"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">On 5/5/21 5:07 PM, Philippe Mathieu-Daud=C3=A9 wro=
te:<br>
&gt; +Eric<br>
&gt; <br>
&gt; On 5/5/21 11:22 PM, Keith Busch wrote:<br>
&gt;&gt; On Wed, May 05, 2021 at 11:10:31PM +0200, Philippe Mathieu-Daud=C3=
=A9 wrote:<br>
&gt;&gt;&gt; The compiler isn&#39;t clever enough to figure &#39;SEG_CHUNK_=
SIZE&#39; is<br>
&gt;&gt;&gt; a constant! Help it by using a definitions instead.<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t understand.<br>
&gt; <br>
&gt; Neither do I TBH...<br>
&gt; <br>
&gt;&gt; It&#39;s labeled &#39;const&#39;, so any reasonable compiler<br>
&gt;&gt; will place it in the &#39;text&#39; segment of the executable rath=
er than on the<br>
&gt;&gt; stack. While that&#39;s compiler specific, is there really a compi=
ler doing<br>
&gt;&gt; something bad with this? If not, I do prefer the &#39;const&#39; h=
ere if only<br>
&gt;&gt; because it limits the symbol scope (&#39;static const&#39; is also=
 preferred if<br>
&gt;&gt; that helps).<br>
&gt; <br>
&gt; Using: gcc version 10.2.1 20201125 (Red Hat 10.2.1-9) (GCC)<br>
&gt; <br>
&gt; Both static+const / const trigger:<br>
&gt; <br>
&gt; hw/block/nvme.c: In function =E2=80=98nvme_map_sgl=E2=80=99:<br>
&gt; hw/block/nvme.c:818:5: error: ISO C90 forbids variable length array<br=
>
&gt; =E2=80=98segment=E2=80=99 [-Werror=3Dvla]<br>
&gt;=C2=A0 =C2=A0818 |=C2=A0 =C2=A0 =C2=A0NvmeSglDescriptor segment[SEG_CHU=
NK_SIZE], *sgld, *last_sgld;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~~<br>
&gt; cc1: all warnings being treated as errors<br>
<br>
C99 6.7.5.2 paragraph 4:<br>
&quot;If the size is an integer constant expression and the element type ha=
s<br>
a known constant size, the array type is not a variable length array<br>
type; otherwise, the array type is a variable length array type.&quot;<br>
<br>
6.6 paragraph 6:<br>
&quot;An integer constant expression shall have integer type and shall only=
<br>
have operands that are integer constants, enumeration constants,<br>
character constants, sizeof expressions whose results are integer<br>
constants, and floating constants that are the immediate operands of<br>
casts. Cast operators in an integer constant expression shall only<br>
convert arithmetic types to integer types, except as part of an operand<br>
to the sizeof operator.&quot;<br>
<br>
Notably absent from that list are &#39;const int&#39; variables, which even=
<br>
though they act as constants (in that the name always represents the<br>
same value), do not actually qualify as such under C99 rules.=C2=A0 Yes, it=
&#39;s<br>
a pain.=C2=A0 What&#39;s more, 6.6 paragraph 10:<br>
<br>
&quot;An implementation may accept other forms of constant expressions.&quo=
t;<br>
<br>
which means it _should_ be possible for the compiler to do what we want.<br=
>
=C2=A0But just because it is permitted does not make it actually work. :(<b=
r>
<br>
And while C17 expands the list of integer constant expressions to<br>
include _Alignof expressions, it does not add any wording to permit<br>
const variables.<br>
<br>
<a href=3D"https://stackoverflow.com/questions/62354105/why-is-const-int-x-=
5-not-a-constant-expression-in-c" rel=3D"noreferrer noreferrer" target=3D"_=
blank">https://stackoverflow.com/questions/62354105/why-is-const-int-x-5-no=
t-a-constant-expression-in-c</a><br>
helps with this explanation:<br>
&quot;The thing to remember (and yes, this is a bit counterintuitive) is th=
at<br>
const doesn&#39;t mean constant. A constant expression is, roughly, one tha=
t<br>
can be evaluated at compile time (like 2+2 or 42). The const type<br>
qualifier, even though its name is obviously derived from the English<br>
word &quot;constant&quot;, really means &quot;read-only&quot;.<br>
<br>
Consider, for example, that these are a perfectly valid declarations:<br>
<br>
const int r =3D rand();<br>
const time_t now =3D time(NULL);<br>
<br>
The const just means that you can&#39;t modify the value of r or now after<=
br>
they&#39;ve been initialized. Those values clearly cannot be determined<br>
until execution time.&quot;<br>
<br>
And C++ _does_ support named constants, but we&#39;re using C, not C++.<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Enum=
 is as close as it gets in C if you are eschewing #define.=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Warner=C2=A0</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3226<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer norefer=
rer" target=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D=
"noreferrer noreferrer" target=3D"_blank">libvirt.org</a><br>
<br>
<br>
</blockquote></div></div></div>

--0000000000009d353905c19e3237--

