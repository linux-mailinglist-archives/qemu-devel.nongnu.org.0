Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A341848EFF7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 19:32:49 +0100 (CET)
Received: from localhost ([::1]:45482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8RNY-0000cu-P1
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 13:32:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8RIA-0005Qp-7i
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:27:14 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=39931
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8RI8-0003My-DH
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 13:27:13 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id n14so5150018vkk.6
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 10:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0N4qmRwAxcXo5yKCRUsfBEJ6I+nZ8Mg0rONGxWTmjsM=;
 b=wJa8AsNc+g3ce4srOGsX9AchiESVCC9eNx1N513Mi53MCJe+fohus2NhOVMBt0G7bZ
 2JHyMtk/R7NBwBmjO/49vb6VbaKuIdIRcpzhiqrDYp0w8W0d0Dxw6np4oCFZxexXFvqw
 nShuh7cGHUGCmUeYJ50GB1j68ZEnyGJKfy/9zIm+dmTCyqyaoH3RHOhK/iup27jb4RKg
 fCWTRiLsVEcWU2UGXW2SR1oQdbdKvO1RFZs0eJZXqm5jEavP3hVHKUw5Uhx98i1BtU3w
 FedKPo49HoddBUGeDNKL70g4aRYAHQ5ipIUJUyqlfJF4OORN9hfWAoQFzlLtAz8Wu6Vf
 CokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0N4qmRwAxcXo5yKCRUsfBEJ6I+nZ8Mg0rONGxWTmjsM=;
 b=C2crsNZd8AkJaML7rEVl+EMq66zEeGnOUZqdTYZj/MKHi5THWQ9+baS6gh0B+ovN/a
 YoNJ1d1s/Nkdwk275gMdTzy0rxQlFzPRoccRhTlx71N8p1/DwxkJCwpCRbhg742swpcW
 dq/0NRBBQFhpLvK57fouKAtG981laTYDHEd6g9jQocxiPVsqHoTr95v6edzRiEdga4Kn
 FJ2OTWRrwnAoR21TxKo88i4yQhgqbTc0KgAfN6HiI+zlSYibqMbVChAQv4ldk7c3QA4c
 Idwa7LIe+6XEojdnMziHo2PtM9B0GCjV19D64n4tHcTzCBP5Sf0LPoCryuS0zixD/WLl
 FGkQ==
X-Gm-Message-State: AOAM5335kKlNqvOFbxIWLgyxyW3SMGmpo0iD5vm8Y+i6mjd4TW9rhvRN
 wrsyAoWFbeNwyCsMIxitS5NNi+0PhebHMu3UrkzOVQ==
X-Google-Smtp-Source: ABdhPJywBwdQoh6t303AHo8Yzokhpq/CpYQ1SXBdgSnr92wfPiNBBzUivrkXfSsho5AbIFFsjcrEkLM9fQDTJIIjDbg=
X-Received: by 2002:a1f:1fd3:: with SMTP id f202mr4927303vkf.27.1642184831252; 
 Fri, 14 Jan 2022 10:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-10-imp@bsdimp.com>
 <CAFEAcA-Qy0YuhovTtVApJxz0=-5QCfjZjxEMBideKWzGoCTyQg@mail.gmail.com>
In-Reply-To: <CAFEAcA-Qy0YuhovTtVApJxz0=-5QCfjZjxEMBideKWzGoCTyQg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 14 Jan 2022 11:27:00 -0700
Message-ID: <CANCZdfoorHDEgmN6g=nVsN=kUTWxdufeCHRmUetEaLBVfiycig@mail.gmail.com>
Subject: Re: [PATCH 09/30] bsd-user/signal.c: implement abstract target / host
 signal translation
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000085ce6905d58ef3ea"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a2f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::a2f;
 envelope-from=wlosh@bsdimp.com; helo=mail-vk1-xa2f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000085ce6905d58ef3ea
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 10:45 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:29, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement host_to_target_signal and target_to_host_signal.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/qemu.h   |  2 ++
> >  bsd-user/signal.c | 11 +++++++++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index 1b3b974afe9..334f8b1d715 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -210,6 +210,8 @@ long do_sigreturn(CPUArchState *env);
> >  long do_rt_sigreturn(CPUArchState *env);
> >  void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
> >  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
> abi_ulong sp);
> > +int target_to_host_signal(int sig);
> > +int host_to_target_signal(int sig);
> >
> >  /* mmap.c */
> >  int target_mprotect(abi_ulong start, abi_ulong len, int prot);
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index 844dfa19095..7ea86149981 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -2,6 +2,7 @@
> >   *  Emulation of BSD signals
> >   *
> >   *  Copyright (c) 2003 - 2008 Fabrice Bellard
> > + *  Copyright (c) 2013 Stacey Son
> >   *
> >   *  This program is free software; you can redistribute it and/or modify
> >   *  it under the terms of the GNU General Public License as published by
> > @@ -27,6 +28,16 @@
> >   * fork.
> >   */
> >
> > +int host_to_target_signal(int sig)
> > +{
> > +    return sig;
> > +}
> > +
> > +int target_to_host_signal(int sig)
> > +{
> > +    return sig;
> > +}
> > +
>
> This could use a comment:
>
> /*
>  * For the BSDs signal numbers are always the same regardless of
>  * CPU architecture, so (unlike Linux) these functions are just
>  * the identity mapping.
>  */
>
> (assuming that is correct, of course!)
>

It's true enough. Even though there's code to run FooBSD on BarBSD,
that code doesn't work (at all really) today. It would take some doing to
get that working, so I've added a comment that the encoding might not
be the same in that case, but otherwise is the same.

This is issue is one I'm deferring doing anything on until I can get things
upstreamed... It's a bit of a mess if you aren't on FreeBSD, but neither the
NetBSD nor OpenBSD communities are using bsd-user because it's so
broken and incomplete in implementing their ABIs.


> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

Thanks!

Warner

--00000000000085ce6905d58ef3ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 10:45 AM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, 9 Jan 2022 at 16:29, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Implement host_to_target_signal and target_to_host_signal.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0|=C2=A0 2 ++<br>
&gt;=C2=A0 bsd-user/signal.c | 11 +++++++++++<br>
&gt;=C2=A0 2 files changed, 13 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index 1b3b974afe9..334f8b1d715 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -210,6 +210,8 @@ long do_sigreturn(CPUArchState *env);<br>
&gt;=C2=A0 long do_rt_sigreturn(CPUArchState *env);<br>
&gt;=C2=A0 void queue_signal(CPUArchState *env, int sig, target_siginfo_t *=
info);<br>
&gt;=C2=A0 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,=
 abi_ulong sp);<br>
&gt; +int target_to_host_signal(int sig);<br>
&gt; +int host_to_target_signal(int sig);<br>
&gt;<br>
&gt;=C2=A0 /* mmap.c */<br>
&gt;=C2=A0 int target_mprotect(abi_ulong start, abi_ulong len, int prot);<b=
r>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index 844dfa19095..7ea86149981 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -2,6 +2,7 @@<br>
&gt;=C2=A0 =C2=A0*=C2=A0 Emulation of BSD signals<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0*=C2=A0 Copyright (c) 2003 - 2008 Fabrice Bellard<br>
&gt; + *=C2=A0 Copyright (c) 2013 Stacey Son<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0*=C2=A0 This program is free software; you can redistribut=
e it and/or modify<br>
&gt;=C2=A0 =C2=A0*=C2=A0 it under the terms of the GNU General Public Licen=
se as published by<br>
&gt; @@ -27,6 +28,16 @@<br>
&gt;=C2=A0 =C2=A0* fork.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;<br>
&gt; +int host_to_target_signal(int sig)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return sig;<br>
&gt; +}<br>
&gt; +<br>
&gt; +int target_to_host_signal(int sig)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return sig;<br>
&gt; +}<br>
&gt; +<br>
<br>
This could use a comment:<br>
<br>
/*<br>
=C2=A0* For the BSDs signal numbers are always the same regardless of<br>
=C2=A0* CPU architecture, so (unlike Linux) these functions are just<br>
=C2=A0* the identity mapping.<br>
=C2=A0*/<br>
<br>
(assuming that is correct, of course!)<br></blockquote><div><br></div><div>=
It&#39;s true enough. Even though there&#39;s code to run FooBSD on BarBSD,=
</div><div>that code doesn&#39;t work (at all really) today. It would take =
some doing to</div><div>get that working, so I&#39;ve added a comment that =
the encoding might not</div><div>be the same in that case, but otherwise is=
 the same.</div><div><br></div><div>This is issue is one I&#39;m deferring =
doing anything on until I can get things</div><div>upstreamed... It&#39;s a=
 bit of a mess if you aren&#39;t on FreeBSD, but neither the</div><div>NetB=
SD nor OpenBSD communities are using bsd-user because it&#39;s so</div><div=
>broken and incomplete in implementing their ABIs.</div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Otherwise<br>
Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" =
target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br></blockquote><div><br=
></div><div>Thanks!</div><div><br></div><div>Warner</div></div></div>

--00000000000085ce6905d58ef3ea--

