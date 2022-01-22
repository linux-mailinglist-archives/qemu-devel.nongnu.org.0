Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB32496CF6
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 17:47:12 +0100 (CET)
Received: from localhost ([::1]:56314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBJXj-0005OO-6A
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 11:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nBJV9-0003fj-Eo
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 11:44:31 -0500
Received: from [2607:f8b0:4864:20::932] (port=36596
 helo=mail-ua1-x932.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nBJV7-00018k-8I
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 11:44:31 -0500
Received: by mail-ua1-x932.google.com with SMTP id r15so22792092uao.3
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 08:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbD1X1nlKH1whlCvuXxJC1YO5sYlVO5uQp+eNd06aG8=;
 b=QoUzm2d0haSxoJdVZAXfzDhTa1qGrWTxU3mFkRSBtuM3clA8AuKAYXbd1785EJrma3
 TzCJidg096eyodNCn+rNn1oW0HOxBIqK+21V8xP2jmjXhMZ1HmVuWxXLYo9lgP+vXp4j
 jFr/9K16I05qcYd2BogbIu88AMrUuHxyQxjxKgt3IMLOwB5zhZFZBbRq9SiNcvQU4RqR
 qtdynYtT3cRtwSpoe9EFRczyoRUpkljbxS4CZTqjfnLniHosuYMbuOjc9Eks11SkH6Mk
 oj/drWm4d1yrUrB65Me59tNemkk0tyPQWZVrCYClSegYJUrWS2p5+1zpQnoyXSfA4OXS
 4wIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbD1X1nlKH1whlCvuXxJC1YO5sYlVO5uQp+eNd06aG8=;
 b=dEyuxpABA0cjf8T2m2HyZOhK3loubkGM9J9B6W5dKLaFyHW1CfybwqXFr3tSHqC0Ya
 jl/+VK03eN3mEmIJvbTk7bXbLKTRXoO8FP08V7BZyFhsxUKiqku8hbHJQK1aA6V4yGVI
 kGyXbhmb5WwwGutOgRkoLeknaLeqBi0V+s+7nlMDo7B6yzAbcnHM9fAxouUEvnfP1Yrv
 G/UvvZyd6U5S31Jjx0GoPLI+ikBYupkuCmHxpOohJApZU7iQZy6MdQmA66Gl12RWYmM7
 Ur0Be2LQlKX2N+5ANhLqWyIAun9d9QHRIAGKipwpNP8VxGR4S0kjsm9occ5FVCJnQIog
 oU4A==
X-Gm-Message-State: AOAM531ctkpFo+kHqgSwcxi+CwlW6cqIIlUs9XA6eBcwQh+vqfX1fZ+/
 o9jyYl0t6szq3lcdzn1y36lswIjH6IHUBjzJLnmUUg==
X-Google-Smtp-Source: ABdhPJxSeefL3WXSS7bAZo11f92nyewEeZP9LP+KsJM1YfS1rHrftJwpBEJVDWiufKV3/bEejoXexU06vmEdv/mzyzc=
X-Received: by 2002:a67:edc5:: with SMTP id e5mr3732456vsp.6.1642869867345;
 Sat, 22 Jan 2022 08:44:27 -0800 (PST)
MIME-Version: 1.0
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-24-imp@bsdimp.com>
 <CAFEAcA_fc_-qXoY07uZuMpT6kAUT+oT8RD_G=8vGgSQqDmH-WA@mail.gmail.com>
In-Reply-To: <CAFEAcA_fc_-qXoY07uZuMpT6kAUT+oT8RD_G=8vGgSQqDmH-WA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sat, 22 Jan 2022 09:44:16 -0700
Message-ID: <CANCZdfrOaptXXb7myYHJ5oVzcczoz48rretVaGZy5FT2rCgk0w@mail.gmail.com>
Subject: Re: [PATCH 23/30] bsd-user/signal.c: sigset manipulation routines.
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000db11a805d62e72cf"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::932
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::932;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x932.google.com
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

--000000000000db11a805d62e72cf
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 14, 2022 at 4:14 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sun, 9 Jan 2022 at 16:53, Warner Losh <imp@bsdimp.com> wrote:
> >
> > target_sigemptyset: resets a set to having no bits set
> > qemu_sigorset:      computes the or of two sets
> > target_sigaddset:   adds a signal to a set
> > target_sigismember: returns true when signal is a member
> > host_to_target_sigset_internal: convert host sigset to target
> > host_to_target_sigset: convert host sigset to target
> > target_to_host_sigset_internal: convert target sigset to host
> > target_to_host_sigset: convert target sigset to host
> >
> > Signed-off-by: Stacey Son <sson@FreeBSD.org>
> > Signed-off-by: Kyle Evans <kevans@freebsd.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/qemu.h   |  3 ++
> >  bsd-user/signal.c | 89 +++++++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 92 insertions(+)
> >
> > diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> > index e12617f5d69..e8c417c7c33 100644
> > --- a/bsd-user/qemu.h
> > +++ b/bsd-user/qemu.h
> > @@ -223,7 +223,10 @@ void queue_signal(CPUArchState *env, int sig,
> target_siginfo_t *info);
> >  abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,
> abi_ulong sp);
> >  int target_to_host_signal(int sig);
> >  int host_to_target_signal(int sig);
> > +void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);
> > +void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
> >  void QEMU_NORETURN force_sig(int target_sig);
> > +int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t
> *right);
> >
> >  /* mmap.c */
> >  int target_mprotect(abi_ulong start, abi_ulong len, int prot);
> > diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> > index 93c3b3c5033..8dadc9a39a7 100644
> > --- a/bsd-user/signal.c
> > +++ b/bsd-user/signal.c
> > @@ -32,6 +32,9 @@
> >
> >  static struct target_sigaction sigact_table[TARGET_NSIG];
> >  static void host_signal_handler(int host_sig, siginfo_t *info, void
> *puc);
> > +static void target_to_host_sigset_internal(sigset_t *d,
> > +        const target_sigset_t *s);
> > +
> >
> >  int host_to_target_signal(int sig)
> >  {
> > @@ -43,6 +46,44 @@ int target_to_host_signal(int sig)
> >      return sig;
> >  }
> >
> > +static inline void target_sigemptyset(target_sigset_t *set)
> > +{
> > +    memset(set, 0, sizeof(*set));
> > +}
> > +
> > +#include <signal.h>
>
> Don't include system headers halfway through the file like this,
> please : put the #include at the top of the file with the others.
>

Yea, this isn't even needed, so I just removed it.


> > +
> > +int
> > +qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t
> *right)
> > +{
> > +    sigset_t work;
> > +    int i;
> > +
> > +    sigemptyset(&work);
> > +    for (i = 1; i < NSIG; ++i) {
> > +        if (sigismember(left, i) || sigismember(right, i)) {
> > +            sigaddset(&work, i);
> > +        }
> > +    }
> > +
> > +    *dest = work;
> > +    return 0;
> > +}
>
> FreeBSD's manpage says it has a native sigorset() --
>
> https://www.freebsd.org/cgi/man.cgi?query=sigemptyset&sektion=3&apropos=0&manpath=freebsd
> can you just use that ?
>

Yes.


> > +
> > +static inline void target_sigaddset(target_sigset_t *set, int signum)
> > +{
> > +    signum--;
> > +    uint32_t mask = (uint32_t)1 << (signum % TARGET_NSIG_BPW);
> > +    set->__bits[signum / TARGET_NSIG_BPW] |= mask;
> > +}
> > +
> > +static inline int target_sigismember(const target_sigset_t *set, int
> signum)
> > +{
> > +    signum--;
> > +    abi_ulong mask = (abi_ulong)1 << (signum % TARGET_NSIG_BPW);
> > +    return (set->__bits[signum / TARGET_NSIG_BPW] & mask) != 0;
> > +}
> > +
> >  /* Adjust the signal context to rewind out of safe-syscall if we're in
> it */
> >  static inline void rewind_if_in_safe_syscall(void *puc)
> >  {
> > @@ -55,6 +96,54 @@ static inline void rewind_if_in_safe_syscall(void
> *puc)
> >      }
> >  }
> >
> > +static void host_to_target_sigset_internal(target_sigset_t *d,
> > +        const sigset_t *s)
> > +{
> > +    int i;
> > +
> > +    target_sigemptyset(d);
> > +    for (i = 1; i <= TARGET_NSIG; i++) {
>
> i here is iterating through host signal numbers, not target
> numbers, so TARGET_NSIG isn't the right upper bound.
> On Linux we iterate from 1 to _NSIG-1; on BSD I think
> you may want (i = 0; i < NSIG; i++), but you should check that.
>

You're correct. The values are the same, but logically NSIG is more correct.


> > +        if (sigismember(s, i)) {
> > +            target_sigaddset(d, host_to_target_signal(i));
> > +        }
> > +    }
> > +}
>
> These functions are a little odd when you compare them to their
> linux-user equivalents, because they're both written
> with a sort of abstraction between host and target signal
> numbers (they call host_to_target_signal() and
> target_to_host_signal()) but also written with baked-in
> assumptions that the mapping is basically 1:1 (they don't
> have the code that handles the possibility that the
> target signal isn't representable as a host signal or
> vice-versa). But assuming the BSDs don't change their
> signal numbering across architectures, this is fine.
>

I can assume that, at least for now, so I've just added a comment
about that.

Warner

--000000000000db11a805d62e72cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 14, 2022 at 4:14 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Sun, 9 Jan 2022 at 16:53, Warner Losh &lt;<a href=3D"mailto:imp@bs=
dimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; target_sigemptyset: resets a set to having no bits set<br>
&gt; qemu_sigorset:=C2=A0 =C2=A0 =C2=A0 computes the or of two sets<br>
&gt; target_sigaddset:=C2=A0 =C2=A0adds a signal to a set<br>
&gt; target_sigismember: returns true when signal is a member<br>
&gt; host_to_target_sigset_internal: convert host sigset to target<br>
&gt; host_to_target_sigset: convert host sigset to target<br>
&gt; target_to_host_sigset_internal: convert target sigset to host<br>
&gt; target_to_host_sigset: convert target sigset to host<br>
&gt;<br>
&gt; Signed-off-by: Stacey Son &lt;sson@FreeBSD.org&gt;<br>
&gt; Signed-off-by: Kyle Evans &lt;<a href=3D"mailto:kevans@freebsd.org" ta=
rget=3D"_blank">kevans@freebsd.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" targe=
t=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/qemu.h=C2=A0 =C2=A0|=C2=A0 3 ++<br>
&gt;=C2=A0 bsd-user/signal.c | 89 +++++++++++++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 2 files changed, 92 insertions(+)<br>
&gt;<br>
&gt; diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
&gt; index e12617f5d69..e8c417c7c33 100644<br>
&gt; --- a/bsd-user/qemu.h<br>
&gt; +++ b/bsd-user/qemu.h<br>
&gt; @@ -223,7 +223,10 @@ void queue_signal(CPUArchState *env, int sig, tar=
get_siginfo_t *info);<br>
&gt;=C2=A0 abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr,=
 abi_ulong sp);<br>
&gt;=C2=A0 int target_to_host_signal(int sig);<br>
&gt;=C2=A0 int host_to_target_signal(int sig);<br>
&gt; +void host_to_target_sigset(target_sigset_t *d, const sigset_t *s);<br=
>
&gt; +void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);<br=
>
&gt;=C2=A0 void QEMU_NORETURN force_sig(int target_sig);<br>
&gt; +int qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_=
t *right);<br>
&gt;<br>
&gt;=C2=A0 /* mmap.c */<br>
&gt;=C2=A0 int target_mprotect(abi_ulong start, abi_ulong len, int prot);<b=
r>
&gt; diff --git a/bsd-user/signal.c b/bsd-user/signal.c<br>
&gt; index 93c3b3c5033..8dadc9a39a7 100644<br>
&gt; --- a/bsd-user/signal.c<br>
&gt; +++ b/bsd-user/signal.c<br>
&gt; @@ -32,6 +32,9 @@<br>
&gt;<br>
&gt;=C2=A0 static struct target_sigaction sigact_table[TARGET_NSIG];<br>
&gt;=C2=A0 static void host_signal_handler(int host_sig, siginfo_t *info, v=
oid *puc);<br>
&gt; +static void target_to_host_sigset_internal(sigset_t *d,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const target_sigset_t *s);<br>
&gt; +<br>
&gt;<br>
&gt;=C2=A0 int host_to_target_signal(int sig)<br>
&gt;=C2=A0 {<br>
&gt; @@ -43,6 +46,44 @@ int target_to_host_signal(int sig)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return sig;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static inline void target_sigemptyset(target_sigset_t *set)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 memset(set, 0, sizeof(*set));<br>
&gt; +}<br>
&gt; +<br>
&gt; +#include &lt;signal.h&gt;<br>
<br>
Don&#39;t include system headers halfway through the file like this,<br>
please : put the #include at the top of the file with the others.<br></bloc=
kquote><div><br></div><div>Yea, this isn&#39;t even needed, so I just remov=
ed it.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt; +<br>
&gt; +int<br>
&gt; +qemu_sigorset(sigset_t *dest, const sigset_t *left, const sigset_t *r=
ight)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 sigset_t work;<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 sigemptyset(&amp;work);<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 1; i &lt; NSIG; ++i) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sigismember(left, i) || sigismember(r=
ight, i)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sigaddset(&amp;work, i);<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 *dest =3D work;<br>
&gt; +=C2=A0 =C2=A0 return 0;<br>
&gt; +}<br>
<br>
FreeBSD&#39;s manpage says it has a native sigorset() --<br>
<a href=3D"https://www.freebsd.org/cgi/man.cgi?query=3Dsigemptyset&amp;sekt=
ion=3D3&amp;apropos=3D0&amp;manpath=3Dfreebsd" rel=3D"noreferrer" target=3D=
"_blank">https://www.freebsd.org/cgi/man.cgi?query=3Dsigemptyset&amp;sektio=
n=3D3&amp;apropos=3D0&amp;manpath=3Dfreebsd</a><br>
can you just use that ?<br></blockquote><div><br></div><div>Yes.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +static inline void target_sigaddset(target_sigset_t *set, int signum)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 signum--;<br>
&gt; +=C2=A0 =C2=A0 uint32_t mask =3D (uint32_t)1 &lt;&lt; (signum % TARGET=
_NSIG_BPW);<br>
&gt; +=C2=A0 =C2=A0 set-&gt;__bits[signum / TARGET_NSIG_BPW] |=3D mask;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline int target_sigismember(const target_sigset_t *set, int =
signum)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 signum--;<br>
&gt; +=C2=A0 =C2=A0 abi_ulong mask =3D (abi_ulong)1 &lt;&lt; (signum % TARG=
ET_NSIG_BPW);<br>
&gt; +=C2=A0 =C2=A0 return (set-&gt;__bits[signum / TARGET_NSIG_BPW] &amp; =
mask) !=3D 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /* Adjust the signal context to rewind out of safe-syscall if we=
&#39;re in it */<br>
&gt;=C2=A0 static inline void rewind_if_in_safe_syscall(void *puc)<br>
&gt;=C2=A0 {<br>
&gt; @@ -55,6 +96,54 @@ static inline void rewind_if_in_safe_syscall(void *=
puc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; +static void host_to_target_sigset_internal(target_sigset_t *d,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 const sigset_t *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 target_sigemptyset(d);<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 1; i &lt;=3D TARGET_NSIG; i++) {<br>
<br>
i here is iterating through host signal numbers, not target<br>
numbers, so TARGET_NSIG isn&#39;t the right upper bound.<br>
On Linux we iterate from 1 to _NSIG-1; on BSD I think<br>
you may want (i =3D 0; i &lt; NSIG; i++), but you should check that.<br></b=
lockquote><div><br></div><div>You&#39;re correct. The values are the same, =
but logically NSIG is more correct.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sigismember(s, i)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_sigaddset(d, host_to=
_target_signal(i));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
<br>
These functions are a little odd when you compare them to their<br>
linux-user equivalents, because they&#39;re both written<br>
with a sort of abstraction between host and target signal<br>
numbers (they call host_to_target_signal() and<br>
target_to_host_signal()) but also written with baked-in<br>
assumptions that the mapping is basically 1:1 (they don&#39;t<br>
have the code that handles the possibility that the<br>
target signal isn&#39;t representable as a host signal or<br>
vice-versa). But assuming the BSDs don&#39;t change their<br>
signal numbering across architectures, this is fine.<br></blockquote><div><=
br></div><div>I can assume that, at least for now, so I&#39;ve just added a=
 comment</div><div>about that.</div><div><br></div><div>Warner=C2=A0</div><=
/div></div>

--000000000000db11a805d62e72cf--

