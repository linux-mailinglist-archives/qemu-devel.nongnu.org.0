Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4BB430F58
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 06:50:57 +0200 (CEST)
Received: from localhost ([::1]:40518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcKbu-0006zU-Ao
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 00:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mcKHi-0002Rc-GJ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 00:30:03 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933]:34752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1mcKHR-0004iR-L1
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 00:30:02 -0400
Received: by mail-ua1-x933.google.com with SMTP id h4so1993768uaw.1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 21:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8ZXQ/rATjg2oZj1nNEdS9KBq6B+eMe3GFeam4jmfYew=;
 b=BR8vVOP98PcuL8ml4oe05PBXAwHnPtzI1KW5XaIT/XdsFJnLI8wMYlegDTAwCrwfYY
 8c6w1mdHXMqiBy6ICSQB5JLOV49SSfSf9+Zz6HgGX72J7PUArVf0GcEreRrnWJx79Xkb
 hPvg7Y7nTBE9uk7WL8VV7mad/tN5icphaktI89RKN2XHINNYaPPAKP0IuZuUCodqnA0u
 JopcGxhY2noqN9i8UqDoDt9MW4ZPH5YXqisXcS2HpZlsXupyo7JcFyPCan40rCxvZ45l
 Nv/kB+9HFQOTR/p98/w7szsC+m1wDQQTKxE2wc+5yje8DwzX1HhQ3E7FnOf3/KxXRe3U
 Y+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8ZXQ/rATjg2oZj1nNEdS9KBq6B+eMe3GFeam4jmfYew=;
 b=Ypv6s1aDJ6dqb+VlSpXQAY4k83RcRglaDWJdP0jdfJhWwxV/tk381jSXESkdU8T5FR
 BiKy3XxnXTA78DZGuQAoTsQ2jqwNzGJ6K/PRGYGkroGe9Dwf9Mu1+nBiFuB8iua343fr
 b5IIychVIvbQmqvSdsZXhUdNd6ECfmaMS8tfcqylm37OTIYRcPCAONDhd719nJ3xQ14/
 5vavGImYbc7MvFHxGveURlvdhNkUbxWbU3DWyQnfAmGa7SgHhocawpe0B1dpIfGOnJVG
 TIIS7xDZVXmPMh9QFMPcNk+/Sd+kxpTumKCoPSNwMz9L5B9zODg59PJvqw7L+JHIJ16A
 uVWg==
X-Gm-Message-State: AOAM531yYRfSivvYuQlfHYek+mnhduGhkHp2CUsvt84xM5i2EVs+C3G9
 7yrdVCO4JoBKUPf5HWl2c75ISbCpmXbtDtIMpq64Og==
X-Google-Smtp-Source: ABdhPJzcXZ8RlUttfRBfmSB7g9h2J6jYeSzE/skQn5Y+9dStotIY3dqfW7rhSgI82pn7PaQHmgjlb9jhb2TJHCJKxVc=
X-Received: by 2002:a67:fbc9:: with SMTP id o9mr12169563vsr.42.1634531383749; 
 Sun, 17 Oct 2021 21:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211008231506.17471-1-imp@bsdimp.com>
 <20211008231506.17471-2-imp@bsdimp.com>
 <CACNAnaFu1uX=pcsjwmYxKAPLX=JdsPHTnrJmjRD2U+aX79KhZQ@mail.gmail.com>
In-Reply-To: <CACNAnaFu1uX=pcsjwmYxKAPLX=JdsPHTnrJmjRD2U+aX79KhZQ@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Sun, 17 Oct 2021 22:29:32 -0600
Message-ID: <CANCZdfqPp4aZzx_kzTW87mu9Q2iQWo=kD5FeJaBmFQuM5Sqbww@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] meson: *-user: only descend into *-user when
 configured
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="00000000000080bf1e05ce98fedf"
Received-SPF: none client-ip=2607:f8b0:4864:20::933;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x933.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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

--00000000000080bf1e05ce98fedf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 17, 2021 at 9:43 PM Kyle Evans <kevans@freebsd.org> wrote:

> On Fri, Oct 8, 2021 at 6:15 PM Warner Losh <imp@bsdimp.com> wrote:
> >
> > To increase flexibility, only descend into *-user when that is
> > configured. This allows *-user to selectively include directories based
> > on the host OS which may not exist on all hosts. Adopt Paolo's
> > suggestion of checking the configuration in the directories that know
> > about the configuration.
> >
> > Message-Id: <20210926220103.1721355-2-f4bug@amsat.org>
> > Message-Id: <20210926220103.1721355-3-f4bug@amsat.org>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Warner Losh <wlosh@bsdimp.com>
> > Acked-by: Paolo Bonzini <pbonzinni@redhat.com>
> >
> > Sponsored by:           Netflix
> > ---
> >  bsd-user/meson.build   | 4 ++++
> >  linux-user/meson.build | 4 ++++
> >  meson.build            | 3 +--
> >  3 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> > index 0369549340..243fb78930 100644
> > --- a/bsd-user/meson.build
> > +++ b/bsd-user/meson.build
> > @@ -1,3 +1,7 @@
> > +if not config_target.has_key('CONFIG_BSD_USER')
> > +   subdir_done()
> > +endif
> > +
> >  bsd_user_ss.add(files(
> >    'bsdload.c',
> >    'elfload.c',
> > diff --git a/linux-user/meson.build b/linux-user/meson.build
> > index 9549f81682..602255a3d6 100644
> > --- a/linux-user/meson.build
> > +++ b/linux-user/meson.build
> > @@ -1,3 +1,7 @@
> > +if not config_target.has_key('CONFIG_LINUX_USER')
> > +   subdir_done()
> > +endif
> > +
> >  linux_user_ss.add(files(
> >    'elfload.c',
> >    'exit.c',
> > diff --git a/meson.build b/meson.build
> > index 99a0a3e689..1f2da5f7d9 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -2303,10 +2303,9 @@ subdir('ebpf')
> >
> >  common_ss.add(libbpf)
> >
> > -bsd_user_ss.add(files('gdbstub.c'))
> >  specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
> >
> > -linux_user_ss.add(files('gdbstub.c', 'thunk.c'))
> > +linux_user_ss.add(files('thunk.c'))
> >  specific_ss.add_all(when: 'CONFIG_LINUX_USER', if_true: linux_user_ss)
> >
> >  # needed for fuzzing binaries
> > --
> > 2.32.0
> >
>
> I don't understand the gdbstub.c removal  here; don't we still want to
> be compiling it in, just only if the appropriate
> CONFIG_{BSD,LINUX}_USER knob is set? I note that it doesn't appear to
> be added in individual *-user/meson.build, I assume it's uncommon to
> add in ../foo.c in meson-land...
>

It's added to specific_ss at line 2536
specific_ss.add(files('cpu.c', 'disas.c', 'gdbstub.c'), capstone)

so we don't need to add it again here.

Warner

--00000000000080bf1e05ce98fedf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 17, 2021 at 9:43 PM Kyle =
Evans &lt;<a href=3D"mailto:kevans@freebsd.org">kevans@freebsd.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, O=
ct 8, 2021 at 6:15 PM Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" tar=
get=3D"_blank">imp@bsdimp.com</a>&gt; wrote:<br>
&gt;<br>
&gt; To increase flexibility, only descend into *-user when that is<br>
&gt; configured. This allows *-user to selectively include directories base=
d<br>
&gt; on the host OS which may not exist on all hosts. Adopt Paolo&#39;s<br>
&gt; suggestion of checking the configuration in the directories that know<=
br>
&gt; about the configuration.<br>
&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20210926220103.1721355-2-f4bug@amsat=
.org" target=3D"_blank">20210926220103.1721355-2-f4bug@amsat.org</a>&gt;<br=
>
&gt; Message-Id: &lt;<a href=3D"mailto:20210926220103.1721355-3-f4bug@amsat=
.org" target=3D"_blank">20210926220103.1721355-3-f4bug@amsat.org</a>&gt;<br=
>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug=
@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; Signed-off-by: Warner Losh &lt;<a href=3D"mailto:wlosh@bsdimp.com" tar=
get=3D"_blank">wlosh@bsdimp.com</a>&gt;<br>
&gt; Acked-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzinni@redhat.com" ta=
rget=3D"_blank">pbonzinni@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Sponsored by:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Netflix<br>
&gt; ---<br>
&gt;=C2=A0 bsd-user/meson.build=C2=A0 =C2=A0| 4 ++++<br>
&gt;=C2=A0 linux-user/meson.build | 4 ++++<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3 +--<br>
&gt;=C2=A0 3 files changed, 9 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/bsd-user/meson.build b/bsd-user/meson.build<br>
&gt; index 0369549340..243fb78930 100644<br>
&gt; --- a/bsd-user/meson.build<br>
&gt; +++ b/bsd-user/meson.build<br>
&gt; @@ -1,3 +1,7 @@<br>
&gt; +if not config_target.has_key(&#39;CONFIG_BSD_USER&#39;)<br>
&gt; +=C2=A0 =C2=A0subdir_done()<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 bsd_user_ss.add(files(<br>
&gt;=C2=A0 =C2=A0 &#39;bsdload.c&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;elfload.c&#39;,<br>
&gt; diff --git a/linux-user/meson.build b/linux-user/meson.build<br>
&gt; index 9549f81682..602255a3d6 100644<br>
&gt; --- a/linux-user/meson.build<br>
&gt; +++ b/linux-user/meson.build<br>
&gt; @@ -1,3 +1,7 @@<br>
&gt; +if not config_target.has_key(&#39;CONFIG_LINUX_USER&#39;)<br>
&gt; +=C2=A0 =C2=A0subdir_done()<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 linux_user_ss.add(files(<br>
&gt;=C2=A0 =C2=A0 &#39;elfload.c&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;exit.c&#39;,<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 99a0a3e689..1f2da5f7d9 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -2303,10 +2303,9 @@ subdir(&#39;ebpf&#39;)<br>
&gt;<br>
&gt;=C2=A0 common_ss.add(libbpf)<br>
&gt;<br>
&gt; -bsd_user_ss.add(files(&#39;gdbstub.c&#39;))<br>
&gt;=C2=A0 specific_ss.add_all(when: &#39;CONFIG_BSD_USER&#39;, if_true: bs=
d_user_ss)<br>
&gt;<br>
&gt; -linux_user_ss.add(files(&#39;gdbstub.c&#39;, &#39;thunk.c&#39;))<br>
&gt; +linux_user_ss.add(files(&#39;thunk.c&#39;))<br>
&gt;=C2=A0 specific_ss.add_all(when: &#39;CONFIG_LINUX_USER&#39;, if_true: =
linux_user_ss)<br>
&gt;<br>
&gt;=C2=A0 # needed for fuzzing binaries<br>
&gt; --<br>
&gt; 2.32.0<br>
&gt;<br>
<br>
I don&#39;t understand the gdbstub.c removal=C2=A0 here; don&#39;t we still=
 want to<br>
be compiling it in, just only if the appropriate<br>
CONFIG_{BSD,LINUX}_USER knob is set? I note that it doesn&#39;t appear to<b=
r>
be added in individual *-user/meson.build, I assume it&#39;s uncommon to<br=
>
add in ../foo.c in meson-land...<br></blockquote><div><br></div><div>It&#39=
;s added to specific_ss at line 2536<br></div><div>specific_ss.add(files(&#=
39;cpu.c&#39;, &#39;disas.c&#39;, &#39;gdbstub.c&#39;), capstone)</div><div=
><br></div><div>so we don&#39;t need to add it again here.</div><div><br></=
div><div>Warner<br></div></div></div>

--00000000000080bf1e05ce98fedf--

