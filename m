Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D833E8620
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 00:40:11 +0200 (CEST)
Received: from localhost ([::1]:34758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDaPq-0005MN-EK
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 18:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaOh-0004f0-QZ
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:38:59 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:39528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mDaOg-00049v-2Z
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 18:38:59 -0400
Received: by mail-qt1-x829.google.com with SMTP id d2so469241qto.6
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 15:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fPY2TLUHLAj38g221xWRfVifEnjOM4Uau3Qj/FVTnvM=;
 b=QuWwvQ8m4iK3iM42jy9wTlxUEYC9zA72XW+w1g6D+QmCf/t89cc9AN3of2P4Mt3OK4
 em12u2oKtqBzik9SffPn031+Kpn4EhRt+KvmWn48kV0ROCyl48x+Ep38laYTaii2Qyzw
 UJSlhTMKkmFDGa66+i89Wzq1TdFQ3ci3XlpHpnF5ei+zVNp31lnWw8OqSFn7kGiKh9Rw
 DxzqbTaPTJMtu11orQ3O5cGuz4TvbsXYmyaBnJvSAXF0r4VyICX1oeFueZO3sGIM6WzS
 OYVQ0wUi5MCDSUdfj287jwA8eKoRC4rXNZuUtMZM5OIzGRQtayx9Nulga+/u9a0F6Ae4
 hXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fPY2TLUHLAj38g221xWRfVifEnjOM4Uau3Qj/FVTnvM=;
 b=Fb6UjBWxapgBsyPzuTNPN3xwHCQqVnHos9SrucGUvtS93t5ghX1gsJ3gantsWFpm50
 ZC6JTjPKSAMczX8FBlyUG/zBj7vMCT0mo7cURi/fQWqY161pAaYo8QqiJJ3WmLo954a8
 RlGVfseImr4hifJ/gkilmHPCM+s5rV6J68HRwFiu4qtl4p2dsitlMKNFgw1TZDr6NsbM
 pB4cTkMaWvrC1tTkOrOAZNBkIpMcey9qSI4MZXgON/RBB/17LXqzVWA9PnTFI0fI9/KS
 M71LuS52nks8mBr8+X3f+FICtReOswkJzjdHhUbBRgt3Ru3C5JXR0sdNDmfR/FZh6J9T
 e8wA==
X-Gm-Message-State: AOAM532lt6L5lf9rKEtjmimMAxuh1ZsjzAOxZ5c9MES2ATZBjUfVyNeI
 nqltn/9elcpYqLwjmn5myVe3pFWoAHp0H0Ly9nLZ4A==
X-Google-Smtp-Source: ABdhPJw/5R59WL6hS1U6RG1S9wEtBTqDSP2rNPp67MG2wDq2Uy91Vk3EbcZKrHfprvtZpfsdqaM8a1lld3b4zOhFCh8=
X-Received: by 2002:ac8:6657:: with SMTP id j23mr15238281qtp.73.1628635137035; 
 Tue, 10 Aug 2021 15:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-39-imp@bsdimp.com>
 <e313acb9-b70f-c3f4-495c-db0c2b779ffb@linaro.org>
In-Reply-To: <e313acb9-b70f-c3f4-495c-db0c2b779ffb@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 10 Aug 2021 16:38:46 -0600
Message-ID: <CANCZdfqW03m1R0kfW8+9bUKsJCWOcmci4=QZNzKk1KnA-UF4KA@mail.gmail.com>
Subject: Re: [PATCH for 6.2 38/49] bsd-user: Update mapping to handle reserved
 and starting conditions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000cfe34305c93c2a3b"
Received-SPF: none client-ip=2607:f8b0:4864:20::829;
 envelope-from=wlosh@bsdimp.com; helo=mail-qt1-x829.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Mika=C3=ABl_Urankar?= <mikael.urankar@gmail.com>,
 Stacey Son <sson@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000cfe34305c93c2a3b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2021 at 10:27 AM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 8/7/21 11:42 AM, Warner Losh wrote:
> > From: Warner Losh <imp@FreeBSD.org>
> >
> > Update the reserved base based on what platform we're on, as well as th=
e
> > start of the mmap range. Update routines that find va ranges to interac=
t
> > with the reserved ranges as well as properly align the mapping (this is
> > especially important for targets whose page size does not match the
> > host's). Loop where appropriate when the initial address space offered
> > by mmap does not meet the contraints.
> >
> > Signed-off-by: Mika=C3=ABl Urankar <mikael.urankar@gmail.com>
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/main.c |  23 ++-
> >   bsd-user/mmap.c | 372 ++++++++++++++++++++++++++++++++++++++++-------=
-
> >   bsd-user/qemu.h |   5 +-
> >   3 files changed, 335 insertions(+), 65 deletions(-)
> >
> > diff --git a/bsd-user/main.c b/bsd-user/main.c
> > index 93ef9298b8..36852604f8 100644
> > --- a/bsd-user/main.c
> > +++ b/bsd-user/main.c
> > @@ -49,12 +49,29 @@
> >   #include "target_arch_cpu.h"
> >
> >   int singlestep;
> > -unsigned long mmap_min_addr;
> >   uintptr_t guest_base;
> >   static const char *cpu_model;
> >   static const char *cpu_type;
> >   bool have_guest_base;
> > +#if (TARGET_LONG_BITS =3D=3D 32) && (HOST_LONG_BITS =3D=3D 64)
> > +/*
> > + * When running 32-on-64 we should make sure we can fit all of the
> possible
> > + * guest address space into a contiguous chunk of virtual host memory.
> > + *
> > + * This way we will never overlap with our own libraries or binaries o=
r
> stack
> > + * or anything else that QEMU maps.
> > + */
> > +# ifdef TARGET_MIPS
> > +/* MIPS only supports 31 bits of virtual address space for user space =
*/
> > +unsigned long reserved_va =3D 0x77000000;
> > +# elif defined(TARGET_PPC64)
> > +unsigned long reserved_va =3D 0xfffff000;
> > +# else
> > +unsigned long reserved_va =3D 0xf7000000;
> > +# endif
> > +#else
> >   unsigned long reserved_va;
> > +#endif
>
> All of these 7's look to be copying an old linux-user bug.
> I cleaned this up in 18e80c55bb6.
>

Oh nice. I'd missed that one... a bit before I started hacking on bsd-user,
but quite nice indeed.


> Otherwise,
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
>
> I would hope one day this memory management could be shared between the
> user-only
> implementations.  It's complicated enough...
>

Honestly, one reason I want to get "caught up" with upstream is for such a
refactor. There's
so much duplication that it's hard to keep up.

Warner

--000000000000cfe34305c93c2a3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 10, 2021 at 10:27 AM Rich=
ard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.h=
enderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 8/7/21 11:42 AM, Warner Losh wrote:<br>
&gt; From: Warner Losh &lt;imp@FreeBSD.org&gt;<br>
&gt; <br>
&gt; Update the reserved base based on what platform we&#39;re on, as well =
as the<br>
&gt; start of the mmap range. Update routines that find va ranges to intera=
ct<br>
&gt; with the reserved ranges as well as properly align the mapping (this i=
s<br>
&gt; especially important for targets whose page size does not match the<br=
>
&gt; host&#39;s). Loop where appropriate when the initial address space off=
ered<br>
&gt; by mmap does not meet the contraints.<br>
&gt; <br>
&gt; Signed-off-by: Mika=C3=ABl Urankar &lt;<a href=3D"mailto:mikael.uranka=
r@gmail.com" target=3D"_blank">mikael.urankar@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0bsd-user/main.c |=C2=A0 23 ++-<br>
&gt;=C2=A0 =C2=A0bsd-user/mmap.c | 372 ++++++++++++++++++++++++++++++++++++=
++++--------<br>
&gt;=C2=A0 =C2=A0bsd-user/qemu.h |=C2=A0 =C2=A05 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 335 insertions(+), 65 deletions(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
&gt; index 93ef9298b8..36852604f8 100644<br>
&gt; --- a/bsd-user/main.c<br>
&gt; +++ b/bsd-user/main.c<br>
&gt; @@ -49,12 +49,29 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;target_arch_cpu.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0int singlestep;<br>
&gt; -unsigned long mmap_min_addr;<br>
&gt;=C2=A0 =C2=A0uintptr_t guest_base;<br>
&gt;=C2=A0 =C2=A0static const char *cpu_model;<br>
&gt;=C2=A0 =C2=A0static const char *cpu_type;<br>
&gt;=C2=A0 =C2=A0bool have_guest_base;<br>
&gt; +#if (TARGET_LONG_BITS =3D=3D 32) &amp;&amp; (HOST_LONG_BITS =3D=3D 64=
)<br>
&gt; +/*<br>
&gt; + * When running 32-on-64 we should make sure we can fit all of the po=
ssible<br>
&gt; + * guest address space into a contiguous chunk of virtual host memory=
.<br>
&gt; + *<br>
&gt; + * This way we will never overlap with our own libraries or binaries =
or stack<br>
&gt; + * or anything else that QEMU maps.<br>
&gt; + */<br>
&gt; +# ifdef TARGET_MIPS<br>
&gt; +/* MIPS only supports 31 bits of virtual address space for user space=
 */<br>
&gt; +unsigned long reserved_va =3D 0x77000000;<br>
&gt; +# elif defined(TARGET_PPC64)<br>
&gt; +unsigned long reserved_va =3D 0xfffff000;<br>
&gt; +# else<br>
&gt; +unsigned long reserved_va =3D 0xf7000000;<br>
&gt; +# endif<br>
&gt; +#else<br>
&gt;=C2=A0 =C2=A0unsigned long reserved_va;<br>
&gt; +#endif<br>
<br>
All of these 7&#39;s look to be copying an old linux-user bug.<br>
I cleaned this up in 18e80c55bb6.<br></blockquote><div><br></div><div>Oh ni=
ce. I&#39;d missed that one... a bit before I started hacking on bsd-user,<=
/div><div>but quite nice indeed.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Otherwise,<br>
Acked-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.=
org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
<br>
I would hope one day this memory management could be shared between the use=
r-only <br>
implementations.=C2=A0 It&#39;s complicated enough...<br></blockquote><div>=
<br></div><div>Honestly, one reason I want to get &quot;caught up&quot; wit=
h upstream is for such a refactor. There&#39;s</div><div>so much duplicatio=
n that it&#39;s hard to keep up.</div><div><br></div><div>Warner</div></div=
></div>

--000000000000cfe34305c93c2a3b--

