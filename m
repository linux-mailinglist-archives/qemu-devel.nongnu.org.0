Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 173BA431F11
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:12:03 +0200 (CEST)
Received: from localhost ([::1]:57736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTMw-0000YW-7J
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:12:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mcTKq-0007h8-Qs
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:09:53 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:39511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mcTKo-0002Ki-JH
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 10:09:52 -0400
Received: by mail-ua1-x933.google.com with SMTP id f3so8090765uap.6
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6CRu6EWat1nSDt/0yaBBhVIn3dqNZaTqTwUApGs3zg0=;
 b=dB+imnzNbEfnK2AyIAT7k/c92WQjMepXiGwrRLM7oVauob7ou27UcLegTRgpaxjFgi
 EW3eO/eRbbEmRxyBslvMauJzFrcVbFiAve6LrDz1gyAqizqv2YSeByT+hwVTbIRKTil3
 vJs6/amhTQEmXnlVlA/oxTyMJc57QysyrpLs0gX30u4v2ncxFHFO50SSG4gpFJf+Oavp
 Ley2mQHGruIs/lGnzLMw9uJjTdE18Yw+zHxobGVN0qu4KVfsLlmC1E+/yz5vCmHUfFfw
 n0hY9rK//FS/HhuP35voI11dUe+Ay7SLFjRTlpQB3ZouQ4oKjsuLuGSSm8LBlFYvvK/q
 q3+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6CRu6EWat1nSDt/0yaBBhVIn3dqNZaTqTwUApGs3zg0=;
 b=VNfo5LCCfB7cx5Yy8n7g+jyo8CvVbaQmvuWMvPP3BC4l9w3YhrPVU8tUiC9LzUM9mk
 GgMl2dbWopNrX3E0vLYIaXacqipaH/GZSB0fXrTLXF1teR31OqhpKQWfO57TAHjza1j3
 fUnPjbr3vyCtqBvdwkbLYu3X9uuyGliZatGeaXpumbtDY1iMVsqRCn8SL5j8TBjwu+CW
 tjK86PkjTZBANTSOQsfiRD5P0LRLC7byie63ydyrK8UMpyS8NkTjX8vBfYVGVhYmBjak
 gpCDVhyCqxQesWoixc2ypVntY/ozgyiMrfcvbROqoG0BMZkC+6/w586TS5zimm15sQnI
 Qjjw==
X-Gm-Message-State: AOAM5320A2ZZUKMuAPHbss99PVTuPcB0KbTiYIDHsiWEEogKzrJVQpFe
 2xiT49cHXdzMESmU06nXElRorg7M7h4dUTjk9ZmGX215ZiYTQg==
X-Google-Smtp-Source: ABdhPJzOPfwSZr2YXxMfIpNdz/M/ziJ+CILlplxr+DokiBxYM3XTM2391MtSsrlu5as/KAwZgySIIygKArGo28cKDAQ=
X-Received: by 2002:a67:ab48:: with SMTP id k8mr27938234vsh.30.1634566189094; 
 Mon, 18 Oct 2021 07:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-2-imp@bsdimp.com>
 <CACNAnaFu1uX=pcsjwmYxKAPLX=JdsPHTnrJmjRD2U+aX79KhZQ@mail.gmail.com>
 <CANCZdfqPp4aZzx_kzTW87mu9Q2iQWo=kD5FeJaBmFQuM5Sqbww@mail.gmail.com>
 <CANCZdfqBk0DBhujcMmM-rup90jeF3iM5Nu69SZq5wbKGjzK0+g@mail.gmail.com>
 <CACNAnaES5e8Df32KxGW1Aip2iP8hSWn9DW1U87S3P6EM9VTTdA@mail.gmail.com>
In-Reply-To: <CACNAnaES5e8Df32KxGW1Aip2iP8hSWn9DW1U87S3P6EM9VTTdA@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 18 Oct 2021 08:09:38 -0600
Message-ID: <CANCZdfqiXgaBSpXB=QH9vLsQKpf3OPwQG2S+nURRNptxsjQBMg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] meson: *-user: only descend into *-user when
 configured
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000102c9405cea1197a"
Received-SPF: none client-ip=2607:f8b0:4864:20::933;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x933.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000102c9405cea1197a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 17, 2021 at 11:26 PM Kyle Evans <kevans@freebsd.org> wrote:

> On Mon, Oct 18, 2021 at 12:02 AM Warner Losh <imp@bsdimp.com> wrote:
> >
> >
> >
> > On Sun, Oct 17, 2021 at 10:29 PM Warner Losh <imp@bsdimp.com> wrote:
> >>
> >>
> >>
> >> On Sun, Oct 17, 2021 at 9:43 PM Kyle Evans <kevans@freebsd.org> wrote:
> >>>
> >>> On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
> >>> >
> >>> > To increase flexibility, only descend into *-user when that is
> >>> > configured. This allows *-user to selectively include directories
> based
> >>> > on the host OS which may not exist on all hosts. Adopt Paolo's
> >>> > suggestion of checking the configuration in the directories that kn=
ow
> >>> > about the configuration.
> >>> >
> >>> > Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
> >>> > Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
> >>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >>> > Signed-off-by: Warner Losh <wlosh@bsdimp.com>
> >>> > Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
> >>> >
> >>> > Sponsored by:           Netflix
> >>> > ---
> >>> >  bsd-user/meson.build   | 4 ++++
> >>> >  linux-user/meson.build | 4 ++++
> >>> >  meson.build            | 3 +--
> >>> >  3 files changed, 9 insertions(+), 2 deletions(-)
> >>> >
> >>> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> >>> > index 0369549340..243fb78930 100644
> >>> > --- a/bsd-user/meson.build
> >>> > +++ b/bsd-user/meson.build
> >>> > @@ -1,3 +1,7 @@
> >>> > +if not config_target.has_key('CONFIG_BSD_USER')
> >>> > +   subdir_done()
> >>> > +endif
> >>> > +
> >>> >  bsd_user_ss.add(files(
> >>> >    'bsdload.c',
> >>> >    'elfload.c',
> >>> > diff --git a/linux-user/meson.build b/linux-user/meson.build
> >>> > index 9549f81682..602255a3d6 100644
> >>> > --- a/linux-user/meson.build
> >>> > +++ b/linux-user/meson.build
> >>> > @@ -1,3 +1,7 @@
> >>> > +if not config_target.has_key('CONFIG_LINUX_USER')
> >>> > +   subdir_done()
> >>> > +endif
> >>> > +
> >>> >  linux_user_ss.add(files(
> >>> >    'elfload.c',
> >>> >    'exit.c',
> >>> > diff --git a/meson.build b/meson.build
> >>> > index 99a0a3e689..1f2da5f7d9 100644
> >>> > --- a/meson.build
> >>> > +++ b/meson.build
> >>> > @@ -2303,10 +2303,9 @@ subdir('ebpf')
> >>> >
> >>> >  common_ss.add(libbpf)
> >>> >
> >>> > -bsd_user_ss.add(files('gdbstub.c'))
> >>> >  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> >>> >
> >>> > -linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
> >>> > +linux_user_ss.add(files('thunk.c'))
> >>> >  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true:
> linux_user_ss)
> >>> >
> >>> >  # needed for fuzzing binaries
> >>> > --
> >>> > 2.32.0
> >>> >
> >>>
> >>> I don't understand the gdbstub.c removal  here; don't we still want t=
o
> >>> be compiling it in, just only if the appropriate
> >>> CONFIG_{BSD,LINUX}_USER knob is set? I note that it doesn't appear to
> >>> be added in individual *-user/meson.build, I assume it's uncommon to
> >>> add in ../foo.c in meson-land...
> >>
> >>
> >> It's added to specific_ss at line 2536
> >> specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)
> >>
> >> so we don't need to add it again here.
> >
> >
> > I've also confirmed that it's built as both
> libqemu-i386-bsd-user.fa.p/gdbstub.c.o
> > and libqemu-x86_64-bsd-user.fa.p/gdbstub.c.o, which is what I'd expect
> given
> > the current upstream supported architectures are only i386 and x86_64.
> >
> > Warner
>
> Ah, ok, thanks! So that looks like a kind-of tangential cleanup, but
> related enough that it makes sense.
>

Yes. Paolo suggested it to further clean things up. Plus it had to be done
at the top level of meson.build rather than the subdirectories because
that's where gdbstub.c lived. I had to also introduce the have_bsd_user
and have_linux_user variables because we had to note that in one context
and use it in another context where the info was otherwise hard to get
at from Philippe's original patch.


> Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
>

Thanks!

Warner

--000000000000102c9405cea1197a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 17, 2021 at 11:26 PM Kyle=
 Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, =
Oct 18, 2021 at 12:02 AM Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" =
target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Sun, Oct 17, 2021 at 10:29 PM Warner Losh &lt;<a href=3D"mailto:imp=
@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Sun, Oct 17, 2021 at 9:43 PM Kyle Evans &lt;<a href=3D"mailto:k=
evans@freebsd.org" target=3D"_blank">kevans@freebsd.org</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Fri, Oct 8, 2021 at 6:15 PM Warner Losh &lt;<a href=3D"mail=
to:imp@bsdimp.com" target=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; To increase flexibility, only descend into *-user when th=
at is<br>
&gt;&gt;&gt; &gt; configured. This allows *-user to selectively include dir=
ectories based<br>
&gt;&gt;&gt; &gt; on the host OS which may not exist on all hosts. Adopt Pa=
olo&#39;s<br>
&gt;&gt;&gt; &gt; suggestion of checking the configuration in the directori=
es that know<br>
&gt;&gt;&gt; &gt; about the configuration.<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Message-Id: &lt;<a href=3D"mailto:20210926220103.1721355-=
2-f4bug@amsat.org" target=3D"_blank">20210926220103.1721355-2-f4bug@amsat.o=
rg</a>&gt;<br>
&gt;&gt;&gt; &gt; Message-Id: &lt;<a href=3D"mailto:20210926220103.1721355-=
3-f4bug@amsat.org" target=3D"_blank">20210926220103.1721355-3-f4bug@amsat.o=
rg</a>&gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D=
"mailto:f4bug@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt;&gt;&gt; &gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:wlosh@bs=
dimp.com" target=3D"_blank">wlosh@bsdimp.com</a>&gt;<br>
&gt;&gt;&gt; &gt; Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzinni@r=
edhat.com" target=3D"_blank">pbonzinni@redhat.com</a>&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Sponsored by:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Net=
flix<br>
&gt;&gt;&gt; &gt; ---<br>
&gt;&gt;&gt; &gt;=C2=A0 bsd-user/meson.build=C2=A0 =C2=A0| 4 ++++<br>
&gt;&gt;&gt; &gt;=C2=A0 linux-user/meson.build | 4 ++++<br>
&gt;&gt;&gt; &gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 3 +--<br>
&gt;&gt;&gt; &gt;=C2=A0 3 files changed, 9 insertions(+), 2 deletions(-)<br=
>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; diff --git a/bsd-user/meson.build b/bsd-user/meson.build<=
br>
&gt;&gt;&gt; &gt; index 0369549340..243fb78930 100644<br>
&gt;&gt;&gt; &gt; --- a/bsd-user/meson.build<br>
&gt;&gt;&gt; &gt; +++ b/bsd-user/meson.build<br>
&gt;&gt;&gt; &gt; @@ -1,3 +1,7 @@<br>
&gt;&gt;&gt; &gt; +if not config_target.has_key(&#39;CONFIG_BSD_USER&#39;)<=
br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0subdir_done()<br>
&gt;&gt;&gt; &gt; +endif<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt;=C2=A0 bsd_user_ss.add(files(<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 &#39;bsdload.c&#39;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 &#39;elfload.c&#39;,<br>
&gt;&gt;&gt; &gt; diff --git a/linux-user/meson.build b/linux-user/meson.bu=
ild<br>
&gt;&gt;&gt; &gt; index 9549f81682..602255a3d6 100644<br>
&gt;&gt;&gt; &gt; --- a/linux-user/meson.build<br>
&gt;&gt;&gt; &gt; +++ b/linux-user/meson.build<br>
&gt;&gt;&gt; &gt; @@ -1,3 +1,7 @@<br>
&gt;&gt;&gt; &gt; +if not config_target.has_key(&#39;CONFIG_LINUX_USER&#39;=
)<br>
&gt;&gt;&gt; &gt; +=C2=A0 =C2=A0subdir_done()<br>
&gt;&gt;&gt; &gt; +endif<br>
&gt;&gt;&gt; &gt; +<br>
&gt;&gt;&gt; &gt;=C2=A0 linux_user_ss.add(files(<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 &#39;elfload.c&#39;,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 &#39;exit.c&#39;,<br>
&gt;&gt;&gt; &gt; diff --git a/meson.build b/meson.build<br>
&gt;&gt;&gt; &gt; index 99a0a3e689..1f2da5f7d9 100644<br>
&gt;&gt;&gt; &gt; --- a/meson.build<br>
&gt;&gt;&gt; &gt; +++ b/meson.build<br>
&gt;&gt;&gt; &gt; @@ -2303,10 +2303,9 @@ subdir(&#39;ebpf&#39;)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 common_ss.add(libbpf)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -bsd_user_ss.add(files(&#39;gdbstub.c&#39;))<br>
&gt;&gt;&gt; &gt;=C2=A0 specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;=
, if_true: bsd_user_ss)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; -linux_user_ss.add(files(&#39;gdbstub.c&#39;, &#39;thunk.=
c&#39;))<br>
&gt;&gt;&gt; &gt; +linux_user_ss.add(files(&#39;thunk.c&#39;))<br>
&gt;&gt;&gt; &gt;=C2=A0 specific_ss.add_all(when: &#39;CONFIG_LINUX_USER&#3=
9;, if_true: linux_user_ss)<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 # needed for fuzzing binaries<br>
&gt;&gt;&gt; &gt; --<br>
&gt;&gt;&gt; &gt; 2.32.0<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I don&#39;t understand the gdbstub.c removal=C2=A0 here; don&#=
39;t we still want to<br>
&gt;&gt;&gt; be compiling it in, just only if the appropriate<br>
&gt;&gt;&gt; CONFIG_{BSD,LINUX}_USER knob is set? I note that it doesn&#39;=
t appear to<br>
&gt;&gt;&gt; be added in individual *-user/meson.build, I assume it&#39;s u=
ncommon to<br>
&gt;&gt;&gt; add in ../foo.c in meson-land...<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; It&#39;s added to specific_ss at line 2536<br>
&gt;&gt; specific_ss.add(files(&#39;cpu.c&#39;, &#39;disas.c&#39;, &#39;gdb=
stub.c&#39;), capstone)<br>
&gt;&gt;<br>
&gt;&gt; so we don&#39;t need to add it again here.<br>
&gt;<br>
&gt;<br>
&gt; I&#39;ve also confirmed that it&#39;s built as both libqemu-i386-bsd-u=
ser.fa.p/gdbstub.c.o<br>
&gt; and libqemu-x86_64-bsd-user.fa.p/gdbstub.c.o, which is what I&#39;d ex=
pect given<br>
&gt; the current upstream supported architectures are only i386 and x86_64.=
<br>
&gt;<br>
&gt; Warner<br>
<br>
Ah, ok, thanks! So that looks like a kind-of tangential cleanup, but<br>
related enough that it makes sense.<br></blockquote><div><br></div><div>Yes=
. Paolo suggested it to further clean things up. Plus it had to be done</di=
v><div>at the top level of meson.build rather than the subdirectories becau=
se</div><div>that&#39;s where gdbstub.c lived. I had to also introduce the =
have_bsd_user</div><div>and have_linux_user variables because we had to not=
e that in one context</div><div>and use it in another context where the inf=
o was otherwise hard to get</div><div>at from Philippe&#39;s original patch=
.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Reviewed-by: Kyle Evans &lt;kevans@FreeBSD.org&gt;<br></blockquote><div><br=
></div><div>Thanks!</div><div><br></div><div>Warner=C2=A0</div></div></div>

--000000000000102c9405cea1197a--

