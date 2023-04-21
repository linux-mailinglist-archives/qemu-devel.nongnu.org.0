Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C89F6EAFD6
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:57:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppu4F-0008FS-6X; Fri, 21 Apr 2023 12:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4D-0008FH-9z
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:01 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppu4B-0005TI-Bg
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:57:01 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1a526aa3dd5so26748495ad.3
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682096218; x=1684688218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7Z+qgoE7Tm3AlY894cbgGHbLWLegepqtxG8QUEyMAwM=;
 b=OGbqMaAjBB3KVotQqMSkHhEst0vVuNiaYgdCN2sZSu8vsU4nl3SMCCa9O59h1/WBqS
 QoYlpyzD+NVdoEFWQ0svvd84wqFEkfHkFSTzW/zwhCqEP0CpRhjzRdmS+VWZBoEMakdA
 gEeh5Y/qnv+Wd84tGrOBy/6+VLPuHWAk+2rFAGu9GGamx9m3v5GHccbedU4As2LSsBBH
 w1whRePlIsxiF+h/ys2OeMOXhH1ah9oa9Q5RUNkb/Z39AZOeG9iqkAc0oUH/pH1vqUHO
 VDayGtow2Iv5zobSO9tQP3w3E8mqqiD8spGpQTeLsGIoA4QI+3d0NXc6hLApdh2ndPzR
 NBIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682096218; x=1684688218;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7Z+qgoE7Tm3AlY894cbgGHbLWLegepqtxG8QUEyMAwM=;
 b=KHu2Yo3I6XKD+KTKzf3OFPxvFwdpQpOTpO5Q1t/uPMsdkJkUyU8LKA5yQEZuNzVGen
 BXSpCtBSQvADFnlHe0lXYKYIUm37S06smFSIrOH9RcBbEajkHZDzmj+FnDH7Y+TSLzYR
 dtBVMgxV0Q5RawJPMwE08EMdTvLE+KpTbkvdWIHEKMWMJSWwtw27iOjpXTs2K79i6rwJ
 XdjsnaZkK48jc/iyp0j5YDvVGgpWb0Z91p0G2DcAlwdpqU4MLO8vJJ0UWc5RoVLTy4go
 VgI32KIF2XI+tNz69QV+KAXi3qWBABkWUdjmT3MJfPAd+YN8nWFmYSoiIMvEqD0j7fMO
 yggA==
X-Gm-Message-State: AAQBX9exCHGMxkb2Fx2CXMvoDeWd4l+9ojPfriB4udiCOWcxqnFb/xc0
 EurCcToJ6rpg9QVrCIE50+WNE4cmlMhFtOXK8x4=
X-Google-Smtp-Source: AKy350ZeEYNdLaLQcLKB7Et/vhdxoNK5TAA9W9u2ccdYJH6OjaS+QtphT805a1GNUPTGMjX/wMincRAq85bvLHtTANc=
X-Received: by 2002:a17:902:e5d1:b0:1a1:e237:5f0 with SMTP id
 u17-20020a170902e5d100b001a1e23705f0mr6820412plf.58.1682096217526; Fri, 21
 Apr 2023 09:56:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230421052255.5603-1-krm.taha@outlook.com>
 <20230421052255.5603-2-krm.taha@outlook.com>
 <ZEI4jQvHfU+JGFH9@redhat.com>
In-Reply-To: <ZEI4jQvHfU+JGFH9@redhat.com>
From: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:56:28 +0200
Message-ID: <CAHNti2dQnbmAO5hTyb6krd8tSMCqXDp80BEcd0ZUHXmk0LZS-w@mail.gmail.com>
Subject: Re: [PATCH 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>
Content-Type: multipart/alternative; boundary="000000000000861a0505f9db8b43"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000861a0505f9db8b43
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 9:17=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
wrote:

> On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:
> > From: Warner Losh <imp@bsdimp.com>
> >
> > Allow guest_base to be initialized on 64-bit hosts, the initial value i=
s
> used by g2h_untagged function defined in include/exec/cpu_ldst.h
>
> This commit message is all incorrectly structured I'm afraid.
>
> There needs to a short 1 line summary, then a blank line,
> then the full commit description text, then a blank line,
> then the Signed-off-by tag(s).
>
> Also if you're sending work done by Warner (as the From
> tag suggests), then we would expect to see Warner's own
> Signed-off-by tag, in addition to your own Signed-off-by.
>
> > ---
> >  bsd-user/main.c | 16 +++++++++++++++-
> >  1 file changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/bsd-user/main.c b/bsd-user/main.c
> > index babc3b009b..afdc1b5f3c 100644
> > --- a/bsd-user/main.c
> > +++ b/bsd-user/main.c
> > @@ -50,8 +50,22 @@
> >  #include "target_arch_cpu.h"
> >
> >  int singlestep;
> > -uintptr_t guest_base;
> > +
> > +/*
> > + * Going hand in hand with the va space needed (see below), we need
> > + * to find a host address to map the guest to. Assume that qemu
> > + * itself doesn't need memory above 32GB (or that we don't collide
> > + * with anything interesting). This is selected rather arbitrarily,
> > + * but seems to produce good results in tests to date.
> > + */
> > +# if HOST_LONG_BITS >=3D 64
> > +uintptr_t guest_base =3D 0x800000000ul;    /* at 32GB */
> > +bool have_guest_base =3D true;
> > +#else
> > +uintptr_t guest_base;    /* TODO: use sysctl to find big enough hole *=
/
> >  bool have_guest_base;
> > +#endif
> > +
> >  /*
> >   * When running 32-on-64 we should make sure we can fit all of the
> possible
> >   * guest address space into a contiguous chunk of virtual host memory.
> > --
> > 2.40.0
> >
> >
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
Alright, thanks for the commit formatting tips, I resent the patch series,
with my signed off by tag and the author signed off by tags as well.

Best regards,
Karim

--000000000000861a0505f9db8b43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 21, 2023 at 9:17=E2=80=AF=
AM Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berra=
nge@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:<b=
r>
&gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" target=3D"_bla=
nk">imp@bsdimp.com</a>&gt;<br>
&gt; <br>
&gt; Allow guest_base to be initialized on 64-bit hosts, the initial value =
is used by g2h_untagged function defined in include/exec/cpu_ldst.h<br>
<br>
This commit message is all incorrectly structured I&#39;m afraid.<br>
<br>
There needs to a short 1 line summary, then a blank line,<br>
then the full commit description text, then a blank line,<br>
then the Signed-off-by tag(s).<br>
<br>
Also if you&#39;re sending work done by Warner (as the From<br>
tag suggests), then we would expect to see Warner&#39;s own<br>
Signed-off-by tag, in addition to your own Signed-off-by.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/main.c | 16 +++++++++++++++-<br>
&gt;=C2=A0 1 file changed, 15 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
&gt; index babc3b009b..afdc1b5f3c 100644<br>
&gt; --- a/bsd-user/main.c<br>
&gt; +++ b/bsd-user/main.c<br>
&gt; @@ -50,8 +50,22 @@<br>
&gt;=C2=A0 #include &quot;target_arch_cpu.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int singlestep;<br>
&gt; -uintptr_t guest_base;<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Going hand in hand with the va space needed (see below), we need<b=
r>
&gt; + * to find a host address to map the guest to. Assume that qemu<br>
&gt; + * itself doesn&#39;t need memory above 32GB (or that we don&#39;t co=
llide<br>
&gt; + * with anything interesting). This is selected rather arbitrarily,<b=
r>
&gt; + * but seems to produce good results in tests to date.<br>
&gt; + */<br>
&gt; +# if HOST_LONG_BITS &gt;=3D 64<br>
&gt; +uintptr_t guest_base =3D 0x800000000ul;=C2=A0 =C2=A0 /* at 32GB */<br=
>
&gt; +bool have_guest_base =3D true;<br>
&gt; +#else<br>
&gt; +uintptr_t guest_base;=C2=A0 =C2=A0 /* TODO: use sysctl to find big en=
ough hole */<br>
&gt;=C2=A0 bool have_guest_base;<br>
&gt; +#endif<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* When running 32-on-64 we should make sure we can fit all=
 of the possible<br>
&gt;=C2=A0 =C2=A0* guest address space into a contiguous chunk of virtual h=
ost memory.<br>
&gt; -- <br>
&gt; 2.40.0<br>
&gt; <br>
&gt; <br>
<br>
With regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br></blockquote><div><br></div><div>Alright, thanks for the commit formatt=
ing tips, I resent the patch series, with my signed off by tag and the auth=
or signed off by tags as well.=C2=A0</div><div><br></div><div>Best regards,=
</div><div>Karim</div></div></div>

--000000000000861a0505f9db8b43--

