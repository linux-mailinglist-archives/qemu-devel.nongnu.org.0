Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD4565ABA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 18:14:05 +0200 (CEST)
Received: from localhost ([::1]:57208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Oi5-00047s-1V
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 12:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o8Od3-0008Nd-An
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:08:54 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:44651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1o8Od1-0001Hu-1q
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 12:08:53 -0400
Received: by mail-vs1-xe29.google.com with SMTP id h7so9420921vsr.11
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 09:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wK6Bj2eOl357gc0F3ypwExYErlcQylVaqDUBXl3Iv9Y=;
 b=B2boOE3sL79A8ACaPsK3WuhWnIr09sGdP3ZluqdpaX9MDY4AzL2ijphvHaXsd/0Lr/
 Ke/t0EVpl83A73OH835zqCFNRs/yCFtpnbca2ZIZqkHFs2BXVGKQ2azrhOgTnxb25jHd
 9my9IMVdba6pKCbXQodYiRYlQkJryj9rHrng6WVQ/6nJvQ5ahJajyHZPNcosN59V9c1C
 lZnDJTTp/Vl6VGyEHAnqvjw56ToiZ8Bnvc2Vhk+lByK5SayNOF0IRanImXSYTZ5dUtJr
 Yy2UmEuGefbqAAzZzVunoxq5kRRrrdWOwRTO+2ALqsL9aFZYZaeAbFNzdun72fZ1nJCb
 gUzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wK6Bj2eOl357gc0F3ypwExYErlcQylVaqDUBXl3Iv9Y=;
 b=RuZeQ489GZGW47MRDOffyCLrkQ7elbPx4OLzezEAKPjFIPTgqEb9ZsO8SFh7Q1V7OG
 RBB52kkNaR4iEIzXK9LxD5b94LpJmRx04SUy3ByzRcGmEwtxj2NVCIA1SeLTsX9e4z3E
 TUgEI0iFDwjvK2UexxUixZhPTjcGPlhNRjvh22FzjBD+EeUYwDNOAyu5RMymzoDXvZi0
 LELfDaT/yjqEh6yu4QduyU03I6PK8s1DAdixpzOwQX5JZcgKijhWyFvWDwu87CEdlNsM
 wMsJrHGY2FK1jtHZOef6aejm3T4ee6eegkjCxGOtp50XxYlPFHUH+1uEeUZ7dcN/Kf+F
 7S3A==
X-Gm-Message-State: AJIora8xzpWDM6HnXlh5+Baw4nU8QGK8Cubr0xAnC9OMP3fcD1Z/ub5m
 vwNgewRKZmmxnSbXSszzTm4OzCb3+myOoxPOyH7JGA==
X-Google-Smtp-Source: AGRyM1tq5A22DAxGHCAPigqTvq6xFFGL1oauEOrpwiggs539pxxJo8ePvP8HfVapE9OBH4qD0yC2A3HqC3731uxyjX4=
X-Received: by 2002:a67:b207:0:b0:356:51a5:993e with SMTP id
 b7-20020a67b207000000b0035651a5993emr16960412vsf.12.1656950929430; Mon, 04
 Jul 2022 09:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220704152303.760983-1-berrange@redhat.com>
 <20220704152303.760983-7-berrange@redhat.com>
 <CANCZdfqrdocFr9N3e2dvWq7=HDD=Va9d4dq4miB5Ss6Wvf26ig@mail.gmail.com>
 <YsMLVfllBE8cqIt/@redhat.com>
In-Reply-To: <YsMLVfllBE8cqIt/@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 4 Jul 2022 10:08:39 -0600
Message-ID: <CANCZdfogARXmNRBroK+SFJ4B33JqRmdm-L3TftNVmGoTWBCzeA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] misc: ensure qemu/osdep.h is included in all .c
 files
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="0000000000008f378405e2fcf3ef"
Received-SPF: none client-ip=2607:f8b0:4864:20::e29;
 envelope-from=wlosh@bsdimp.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

--0000000000008f378405e2fcf3ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022, 9:46 AM Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Mon, Jul 04, 2022 at 09:38:46AM -0600, Warner Losh wrote:
> > On Mon, Jul 4, 2022 at 9:28 AM Daniel P. Berrang=C3=A9 <berrange@redhat=
.com>
> > wrote:
> >
> > > A few files relied on qemu/osdep.h being included via a common
> > > header. Another file didn't need it because it was actually an
> > > included file, so ought to have been named .c.inc
> > >
> > > Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > > ---
> > >  bsd-user/arm/signal.c                 | 2 ++
> > >  bsd-user/arm/target_arch_cpu.c        | 3 +++
> > >  bsd-user/{elfcore.c =3D> elfcore.c.inc} | 0
> > >  bsd-user/elfload.c                    | 2 +-
> > >  bsd-user/freebsd/os-sys.c             | 2 ++
> > >  bsd-user/i386/signal.c                | 2 ++
> > >  bsd-user/qemu.h                       | 1 -
> > >  bsd-user/x86_64/signal.c              | 2 ++
> > >  crypto/rsakey.c                       | 1 +
> > >  qga/cutils.c                          | 2 ++
> > >  10 files changed, 15 insertions(+), 2 deletions(-)
> > >  rename bsd-user/{elfcore.c =3D> elfcore.c.inc} (100%)
> > >
> >
> > The change to bsd-user is fine, though will cause many ripples in the
> > upstream
> > branch when I merge it. The ripples likely are worth it in the long run=
,
> > and knowing
> > they are coming and helps me prepare the tree for the merge.
>
> If you prefer to delay these changes I don't mind. It just means that
> it would need a 'bsd-user/.*' exclude rule in the next patch to
> temporarily skip this chck for bsd-user code.
>

No. Go ahead. I know I need to do something when I do the next merge.
And it shouldn't be a big deal to do now, otherwise I'll forget...

Warner


> It also reminds me that once I'm done upstreaming, there's likely benefit
> > from having
> > a common elf loader / core generator as much of this code is copied fro=
m
> > linux-user
> > with the qemu style layered on top....
> >
> > Reviewed-by: Warner Losh <imp@bsdimp.com>
>
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000008f378405e2fcf3ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Mon, Jul 4, 2022, 9:46 AM Daniel P. Berrang=C3=A9 &=
lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Mon, Jul 04, 2022 at 09:38:46A=
M -0600, Warner Losh wrote:<br>
&gt; On Mon, Jul 4, 2022 at 9:28 AM Daniel P. Berrang=C3=A9 &lt;<a href=3D"=
mailto:berrange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@r=
edhat.com</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; A few files relied on qemu/osdep.h being included via a common<br=
>
&gt; &gt; header. Another file didn&#39;t need it because it was actually a=
n<br>
&gt; &gt; included file, so ought to have been named .c.inc<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berr=
ange@redhat.com" target=3D"_blank" rel=3D"noreferrer">berrange@redhat.com</=
a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 bsd-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt; &gt;=C2=A0 bsd-user/arm/target_arch_cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 3 +++<br>
&gt; &gt;=C2=A0 bsd-user/{elfcore.c =3D&gt; elfcore.c.inc} | 0<br>
&gt; &gt;=C2=A0 bsd-user/elfload.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt; &gt;=C2=A0 bsd-user/freebsd/os-sys.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| 2 ++<br>
&gt; &gt;=C2=A0 bsd-user/i386/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; &gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt; &gt;=C2=A0 bsd-user/x86_64/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 ++<br>
&gt; &gt;=C2=A0 crypto/rsakey.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
&gt; &gt;=C2=A0 qga/cutils.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; &gt;=C2=A0 10 files changed, 15 insertions(+), 2 deletions(-)<br>
&gt; &gt;=C2=A0 rename bsd-user/{elfcore.c =3D&gt; elfcore.c.inc} (100%)<br=
>
&gt; &gt;<br>
&gt; <br>
&gt; The change to bsd-user is fine, though will cause many ripples in the<=
br>
&gt; upstream<br>
&gt; branch when I merge it. The ripples likely are worth it in the long ru=
n,<br>
&gt; and knowing<br>
&gt; they are coming and helps me prepare the tree for the merge.<br>
<br>
If you prefer to delay these changes I don&#39;t mind. It just means that<b=
r>
it would need a &#39;bsd-user/.*&#39; exclude rule in the next patch to<br>
temporarily skip this chck for bsd-user code.<br></blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">No. Go ahead. I know I need to=
 do something when I do the next merge.</div><div dir=3D"auto">And it shoul=
dn&#39;t be a big deal to do now, otherwise I&#39;ll forget...=C2=A0</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">Warner</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
&gt; It also reminds me that once I&#39;m done upstreaming, there&#39;s lik=
ely benefit<br>
&gt; from having<br>
&gt; a common elf loader / core generator as much of this code is copied fr=
om<br>
&gt; linux-user<br>
&gt; with the qemu style layered on top....<br>
&gt; <br>
&gt; Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=
=3D"_blank" rel=3D"noreferrer">imp@bsdimp.com</a>&gt;<br>
<br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--0000000000008f378405e2fcf3ef--

