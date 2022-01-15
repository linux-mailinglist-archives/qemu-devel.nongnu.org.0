Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A40E48F57C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 07:23:36 +0100 (CET)
Received: from localhost ([::1]:56572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8cTP-000751-5K
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 01:23:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8cPZ-0005b2-BT
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 01:19:37 -0500
Received: from [2607:f8b0:4864:20::a2f] (port=39680
 helo=mail-vk1-xa2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1n8cPW-0008It-KB
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 01:19:37 -0500
Received: by mail-vk1-xa2f.google.com with SMTP id n14so5906140vkk.6
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 22:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5jkTa5H4X2L0/JPCKYn4JKtmF0fNULM1mN2QL0UOVEw=;
 b=kKu/50iMI57ZMmXHkq+vN20PdpJoiYRRvd1CYKAo9bQ8FCp8K/6qt2ZL3GWWyq+Jgw
 0ud9oKgaMgM60VVByegsgDWWzWcPcAmJbYF+Q/VZ+N+zhq5uwjRQijKVRsviVVvOAFNy
 vHF0Ad3hFEv+j6GxjfYlOHZ/YTQXa/SwsSkPrkpL9b5/NZpZSfOdANLwto8B/XjVyaj/
 v8rGIqP/+OyGclTzz3K5pWJ9IUxyG/mG2ZxAz7+BMGRQoX41Sysj5vEEnZL11HAt1HTI
 jjBUcecKJK0ozPXf4BnbVXocrXb3hyBEoX70FK9+FmZ3EqWO8vG8wVp8FJSavCk3dhgH
 hu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5jkTa5H4X2L0/JPCKYn4JKtmF0fNULM1mN2QL0UOVEw=;
 b=V2ZZaKT7vaf1Rn367oEQg116pERYBKsuInm/pvCFEzv2NQH9/dOSKmSh098rI1PMHn
 nDKzlhkm+kfRE0BHoD8+hIEy4lrYHKWBgIAqKHImWF3kPHQQO1uJBynaoDt156mrSf3E
 /WAHPL0xpJtcF7XkYJVKtkV5Rlp2bXYLzm9jWR0mJlDUB80UWB4n6ud406OWQNHFNFci
 9XpJN8ngbZnpkC/oKBCuWGL1wZ5Og431YmZAJ1Ytng3oE47CHYyRERMqseKeBqC6t/2x
 nBGMTB14APItOdzE+e8I/3nSnuQb+NiAFY53hZN3AdMoTJmFQlZAAqSuSMWeaPdbnSdm
 e3Iw==
X-Gm-Message-State: AOAM533DPdIH1v+3TiSaDANVDNPKWpqapQP7XHGtLQoVSEUbOpBMXDz7
 SFlJRALt6k5Sv1n2GEcJR59TJqepzkO8Pbr6FQ4W5A==
X-Google-Smtp-Source: ABdhPJwz4UjTifqxJnWK9pVy0vGyv7JxUFjLJT/2Fa+UpJAoAEBmQkEJ4H+G3dsgiTEk8D6qVPHPMSB7mU+bYiED1CM=
X-Received: by 2002:a05:6122:130d:: with SMTP id
 e13mr93551vkp.26.1642227573023; 
 Fri, 14 Jan 2022 22:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-17-imp@bsdimp.com>
 <CAFEAcA9ikK-GV6fy35wZHpTKZkQ8jD8=xm1z+25OdPG56yS=Ow@mail.gmail.com>
In-Reply-To: <CAFEAcA9ikK-GV6fy35wZHpTKZkQ8jD8=xm1z+25OdPG56yS=Ow@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Fri, 14 Jan 2022 23:19:27 -0700
Message-ID: <CANCZdfroBqUPuu8SU5-WzbFP25ansqgmf==XTcoMRsRGim5WJw@mail.gmail.com>
Subject: Re: [PATCH 16/30] bsd-user/signal.c: host_to_target_siginfo_noswap
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000217e2105d598e7c4"
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

--000000000000217e2105d598e7c4
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 13, 2022 at 12:43 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:41, Warner Losh <imp@bsdimp.com> wrote:
> >
> > Implement conversion of host to target siginfo.
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/signal.c | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index 7168d851be8..3fe8b2d9898 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -43,6 +43,43 @@ int target_to_host_signal(int sig)
> >      return sig;
> >  }
> >
> > +/* Siginfo conversion. */
> > +static inline void host_to_target_siginfo_noswap(target_siginfo_t
> *tinfo,
> > +        const siginfo_t *info)
> > +{
> > +    int sig, code;
> > +
> > +    sig = host_to_target_signal(info->si_signo);
> > +    /* XXX should have host_to_target_si_code() */
> > +    code = tswap32(info->si_code);
> > +    tinfo->si_signo = sig;
> > +    tinfo->si_errno = info->si_errno;
> > +    tinfo->si_code = info->si_code;
> > +    tinfo->si_pid = info->si_pid;
> > +    tinfo->si_uid = info->si_uid;
> > +    tinfo->si_status = info->si_status;
> > +    tinfo->si_addr = (abi_ulong)(unsigned long)info->si_addr;
> > +    /* si_value is opaque to kernel */
> > +    tinfo->si_value.sival_ptr =
> > +        (abi_ulong)(unsigned long)info->si_value.sival_ptr;
> > +    if (SIGILL == sig || SIGFPE == sig || SIGSEGV == sig || SIGBUS ==
> sig ||
>
> Don't use yoda-conditions, please. sig == SIGILL, etc.
>
> > +            SIGTRAP == sig) {
> > +        tinfo->_reason._fault._trapno = info->_reason._fault._trapno;
> > +    }
> > +#ifdef SIGPOLL
> > +    if (SIGPOLL == sig) {
> > +        tinfo->_reason._poll._band = info->_reason._poll._band;
> > +    }
> > +#endif
> > +    if (SI_TIMER == code) {
> > +        int timerid;
> > +
> > +        timerid = info->_reason._timer._timerid;
> > +        tinfo->_reason._timer._timerid = timerid;
> > +        tinfo->_reason._timer._overrun = info->_reason._timer._overrun;
> > +    }
> > +}
>
> I think this will only compile on FreeBSD (the other BSDs having
> notably different target_siginfo_t structs); I guess we're OK
> with that ?
>

Yes. bsd-user fork does not compile on the other BSDs. There's too many
things missing, and too few places where specific code is in place. I'm
thinking
that it won't be possible to implement running NetBSD binaries on FreeBSD
or vice versa since they are so different. OpenBSD and NetBSD are a lot
closer to each other, with fewer critical differences in areas like
threads, so
it may be possible there. There's a lot of rework that's needed in this area
to take what's even in bsd-user fork and make it work on NetBSD or
OpenBSD, exactly for reasons like this. I've been ignoring the elephant
in the room for a while now, ever since I realized this fundamental
shift.


> I also commented on the general setup linux-user has for this
> function back in patch 2; I'll let you figure out whether what
> you have here is the right thing for BSD.
>

Yea. I'm still thinking through what you said there (and elsewhere). These
issues may be the root cause of some regressions in arm binaries between
6.1 and 6.2 as I tried to adopt the sigsegv/sigbus changes.

I need to work through those things in our development branch before trying
to fold them into this series. And I'm not yet sure the right way to do
that because
many of the things are likely to be largish changes that may be tough to
manage
keeping this patch series in sync. So I'm going to do all the trivial style
and
tiny bug things first, then tackle this more fundamental issue. I've thought
about it enough to understand that the code in this patch series has some
conceptual mistakes that must be addressed. Having this very detailed
feedback
is quite helpful in laying out the path for me to fix these issues (even if
I don't
ultimately do everything like linux-user, I'll know why it's different
rather than
the current situation where there's much inherited code and the best answer
I could give is 'well linux-user was like that 5 years ago and we needed to
make
these hacks to make things work' which is completely unsatisfying to give
and
to hear.

Warner

--000000000000217e2105d598e7c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 13, 2022 at 12:43 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Sun, 9 Jan 2022 at 16:41, Warner Losh &lt;<a href=3D"mailto:imp@b=
sdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Implement conversion of host to target siginfo.<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/signal.c | 37 +++++++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 37 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index 7168d851be8..3fe8b2d9898 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -43,6 +43,43 @@ int target_to_host_signal(int sig)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return sig;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +/* Siginfo conversion. */<br>
&gt; +static inline void host_to_target_siginfo_noswap(target_siginfo_t *ti=
nfo,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const siginfo_t *info)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int sig, code;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sig =3D host_to_target_signal(info-&gt;si_signo);<br>
&gt; +=C2=A0 =C2=A0 /* XXX should have host_to_target_si_code() */<br>
&gt; +=C2=A0 =C2=A0 code =3D tswap32(info-&gt;si_code);<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_signo =3D sig;<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_errno =3D info-&gt;si_errno;<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_code =3D info-&gt;si_code;<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_pid =3D info-&gt;si_pid;<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_uid =3D info-&gt;si_uid;<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_status =3D info-&gt;si_status;<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_addr =3D (abi_ulong)(unsigned long)info-&g=
t;si_addr;<br>
&gt; +=C2=A0 =C2=A0 /* si_value is opaque to kernel */<br>
&gt; +=C2=A0 =C2=A0 tinfo-&gt;si_value.sival_ptr =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (abi_ulong)(unsigned long)info-&gt;si_val=
ue.sival_ptr;<br>
&gt; +=C2=A0 =C2=A0 if (SIGILL =3D=3D sig || SIGFPE =3D=3D sig || SIGSEGV =
=3D=3D sig || SIGBUS =3D=3D sig ||<br>
<br>
Don&#39;t use yoda-conditions, please. sig =3D=3D SIGILL, etc.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 SIGTRAP =3D=3D sig) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfo-&gt;_reason._fault._trapno =3D info=
-&gt;_reason._fault._trapno;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#ifdef SIGPOLL<br>
&gt; +=C2=A0 =C2=A0 if (SIGPOLL =3D=3D sig) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfo-&gt;_reason._poll._band =3D info-&g=
t;_reason._poll._band;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 if (SI_TIMER =3D=3D code) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 int timerid;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 timerid =3D info-&gt;_reason._timer._time=
rid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfo-&gt;_reason._timer._timerid =3D tim=
erid;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 tinfo-&gt;_reason._timer._overrun =3D inf=
o-&gt;_reason._timer._overrun;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
I think this will only compile on FreeBSD (the other BSDs having<br>
notably different target_siginfo_t structs); I guess we&#39;re OK<br>
with that ?<br></blockquote><div><br></div><div>Yes. bsd-user fork does not=
 compile on the other BSDs. There&#39;s too many</div><div>things missing, =
and too few places where specific code is in place. I&#39;m thinking</div><=
div>that it won&#39;t be possible to implement running NetBSD binaries on F=
reeBSD</div><div>or vice versa since they are so different. OpenBSD and Net=
BSD are a lot</div><div>closer to each other, with fewer critical differenc=
es in areas like threads, so</div><div>it may be possible there. There&#39;=
s a lot of rework that&#39;s needed in this area</div><div>to take what&#39=
;s even in bsd-user fork and make it work on NetBSD or</div><div>OpenBSD, e=
xactly for reasons like this. I&#39;ve been ignoring the elephant</div><div=
>in the room for a while now, ever since I realized this fundamental</div><=
div>shift.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
I also commented on the general setup linux-user has for this<br>
function back in patch 2; I&#39;ll let you figure out whether what<br>
you have here is the right thing for BSD.<br></blockquote><div><br></div><d=
iv>Yea. I&#39;m still thinking through what you said there (and elsewhere).=
 These</div><div>issues may be the root cause of some regressions in arm bi=
naries between</div><div>6.1 and 6.2 as I tried to adopt the sigsegv/sigbus=
 changes.</div><div><br></div><div>I need to work through those things in o=
ur development branch before trying</div><div>to fold them into this series=
. And I&#39;m not yet sure the right way to do that because</div><div>many =
of the things are likely to be largish changes that may be tough to manage<=
/div><div>keeping this patch series in sync. So I&#39;m going to do all the=
 trivial style and</div><div>tiny bug things first, then tackle this more f=
undamental issue. I&#39;ve thought</div><div>about it enough to understand =
that the code in this patch series has some</div><div>conceptual mistakes t=
hat must be addressed. Having this very detailed feedback</div><div>is quit=
e helpful in laying out the path for me to fix these issues (even if I don&=
#39;t</div><div>ultimately do everything like linux-user, I&#39;ll know why=
 it&#39;s different rather than</div><div>the current situation where there=
&#39;s much inherited code and the best answer</div><div>I could give is &#=
39;well linux-user was like that 5 years ago and we needed to make</div><di=
v>these hacks to make things work&#39; which is completely unsatisfying to =
give and</div><div>to hear.</div><div><br></div><div>Warner<br></div></div>=
</div>

--000000000000217e2105d598e7c4--

