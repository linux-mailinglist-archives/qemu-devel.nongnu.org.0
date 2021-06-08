Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AE039FB67
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 17:58:57 +0200 (CEST)
Received: from localhost ([::1]:51562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqe80-0007GQ-TL
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 11:58:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqe4u-0004MK-Dc
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:55:44 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:33648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lqe4r-0006uP-PP
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 11:55:44 -0400
Received: by mail-ej1-x630.google.com with SMTP id g20so33480885ejt.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aHamhY3FlryEx+yGmmWMC9eFwQPLrTxCdwcrFbDT8Fo=;
 b=I0qSotesM5rsWJEcPXO5d5AQc3sUWyhNqrbniB+hK6qmkpmZPO+opFFDPi9OehHCUu
 Yxvoij6oBsBXcOXzOO7yH6vHnuxRyN/xLZzbhwGMpnEk72kWD2lCcTDwpi7UaAuwnh+Z
 q/6CpNARc34wh6hh/iQIHzQcqfFq3+TOAdnfdjSt7NsQObmgfvfOYHDwrD5bayfnScLi
 rfsjEt1vEuIDN2U6rUqbpvWt0Dx+au0XYL5kGmTOVaXu15Ma+EBUn+XFr44LXVdfAnyX
 qkj82BUrHYDzIVKOO1G8aQzR01ESVwYdTjcvuqj+qNEtv2rkDWeeTfaDGOnvKGDIFR7c
 lOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aHamhY3FlryEx+yGmmWMC9eFwQPLrTxCdwcrFbDT8Fo=;
 b=PAF6te8RLdwVIIzf4vr2l1GQuNq5dw3rs/atFbLu2SZNBwcjXv9G033112ZHQ+eb+u
 KBi0yMqouCMwUNqzNSgSZpbSr5c42FRU8Td8XU1hBn9GGkGng5Z4yIE1yZDu5tSphrs1
 5f4ALXVLhxmiKLbwmG9AG6+LzBRapkon7fPS5uutB4f5gtWb0Qs7X2JVOA1dNQsRLHOu
 458z8frC+xVnscH8FnvZX5RRCls/3WM64/eLFFpNssP6rtu1BCHsPYl2F+8ku8jFu0LX
 InxXiFlrSzCY3eAYTFVmIAFtDO9unHd9OehB8+0pyMESge9kQ07Zj9gNmnF6xQyOOLQL
 FaJA==
X-Gm-Message-State: AOAM531v53/mxO4Y4Y8R5FU70e9GVxfMScO0KEDVjWniOJYACJZVcv5I
 M09Z5vZhhP8rX14tfTNZX9uE4y4RmuUnh40xh58=
X-Google-Smtp-Source: ABdhPJymnrRLg78xFkXoUQKP9S+1T54saPWrkEY24/1b/aSZfISecNBEXoa9nicVPzbjWAztKDSYKHuqMaIoWr3Qcd8=
X-Received: by 2002:a17:907:988a:: with SMTP id
 ja10mr23862559ejc.527.1623167740255; 
 Tue, 08 Jun 2021 08:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210529185522.78816-1-marcandre.lureau@redhat.com>
 <CAFEAcA-8DyG7iywZVi0LAiS7RZ_d3Omd2QAn1-32iTHdKR5QZQ@mail.gmail.com>
 <CAJ+F1CK-S+diFf8fGXe-Drfz6JoNSXzxzmYQ6muRuQw76TRHkA@mail.gmail.com>
 <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
In-Reply-To: <CAFEAcA9x3w3jvbGoZ66Xs2dhgJDnkyDVnqy45tpCjYv1uq0vYQ@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Jun 2021 19:55:27 +0400
Message-ID: <CAJ+F1CLxaLHgLCM=7V=uaGyBSpCMqrD-Ktn2UsiNQHf8=CWNfg@mail.gmail.com>
Subject: Re: [PULL 0/2] Libslirp patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000091a3b005c443305a"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000091a3b005c443305a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Mon, Jun 7, 2021 at 4:17 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 1 Jun 2021 at 12:01, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi Peter
> >
> > On Tue, Jun 1, 2021 at 1:17 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> >>
> >> On Sat, 29 May 2021 at 19:55, <marcandre.lureau@redhat.com> wrote:
> >> >
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > The following changes since commit
> 62c0ac5041e9130b041adfa13a41583d3c3ddd24:
> >> >
> >> >   Merge remote-tracking branch
> 'remotes/rth-gitlab/tags/pull-tcg-20210526' into staging (2021-05-28
> 16:25:21 +0100)
> >> >
> >> > are available in the Git repository at:
> >> >
> >> >   git@github.com:elmarco/qemu.git tags/libslirp-pull-request
> >> >
> >> > for you to fetch changes up to
> b060428091c758781acc4d42849accc036d3c816:
> >> >
> >> >   build-sys: make libslirp a meson subproject (2021-05-29 22:52:37
> +0400)
> >> >
> >> > ----------------------------------------------------------------
> >> > Update libslirp & make it a subproject
> >> >
> >> > ----------------------------------------------------------------
> >>
> >> All hosts, odd warnings on checkout and running configure:
> >>
> >> warning: unable to rmdir 'slirp': Directory not empty
> >
> >
> > This one is from git itself. It doesn't clean up old submodule
> locations, even though they are actually "clean". git submodule "(re)move=
"
> has its limits I guess.
>
> Yeah, I guess we have to live with this one.
>
> >> make: Entering directory '/home/pm/qemu/build/all'
> >> config-host.mak is out-of-date, running configure
> >>   GIT     ui/keycodemapdb meson tests/fp/berkeley-testfloat-3
> >> tests/fp/berkeley-softfloat-3 dtc capstone slirp
> >> warn: ignoring non-existent submodule slirp
> >
> >
> >  However, I don't get this when simply running make. Maybe you run make
> in parallel, and config-host.mak didn't have the time to regenerate with =
a
> new GIT_SUBMODULES.
> >
> > I wonder if we miss a dependency like "git-submodule-update:
> config-host.mak" ?
>
> Something looks like it's still using an old list of submodules.
>

Yes, but I don't see how I could tell git-submodule-update until after
config-host.mak is regenerated and read again.

Paolo, any idea?

It's a transient issue, similar to the git warning.


> > Running configure before make should also prevent this from happening.
>
> Incremental build needs to keep working.
>
>
Sure, but one-step warnings during incremental build are blockers?


> >>
> >> BSD VMs: error message just before launching the VM (though the VM did
> >> seem to then launch OK):
> >>
> >> Found ninja-1.8.2 at /usr/bin/ninja
> >> ninja: no work to do.
> >> (GIT=3D"git" "/home/peter.maydell/qemu-netbsd/scripts/git-submodule.sh=
"
> >> update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/fp/be
> >> rkeley-softfloat-3 dtc capstone slirp)
> >> warn: ignoring non-existent submodule slirp
> >> /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbsd
> >> --debug  --jobs 8 --verbose    --image
> >> "/home/peter.maydell/.cache/qemu
> >> -vm/images/netbsd.img"  --snapshot --build-qemu
> >> /home/peter.maydell/qemu-netbsd --
> >> DEBUG:root:Creating archive
> >>
> /home/peter.maydell/qemu-netbsd/build/vm-test-6kefrq76.tmp/data-f706c.tar
> >> for src_dir dir: /home/peter.maydell/q
> >> emu-netbsd
> >> error: pathspec 'slirp' did not match any file(s) known to git.
>
>
> Maybe this is something needing updating in the "create the archive"
> script?
>

Correct, my bad. No idea why I couldn't reproduce this before..

I guess we should run scripts/archive-source.sh in CI.


> >>
> >> clang sanitizer build: link failure:
> >> subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In
> >> function `arp_table_add':
> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:51:
> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:34:
> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >>
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../subprojects/libsl=
irp/src/arp_table.c:34:
> >> undefined reference to `__ubsan_handle_type_mismatch_v1'
> >> (and lots more similar)
>
> > I don't get this  when running make vm-build-netbsd. What else am I
> missing?
>
>
This isn't NetBSD related, it's just a clang sanitizer build on Linux.
>


I am running configure with '--enable-sanitizers' --cc=3Dclang --cxx=3Dclan=
g++
--host-cc=3Dclang, I can't reproduce.

What's your distro? (or meson + clang versions)


> >> OSX: linker warnings linking libslirp.0.dylib:
> >>
> >>
> >> [34/1977] Linking target subprojects/libslirp/libslirp.0.dylib
> >> ld: warning: dylib
> >> (/usr/local/Cellar/glib/2.68.0/lib/libgthread-2.0.dylib) was built for
> >> newer macOS version (10.15) than being linked (10.4)
> >> ld: warning: dylib
> >> (/usr/local/Cellar/glib/2.68.0/lib/libglib-2.0.dylib) was built for
> >> newer macOS version (10.15) than being linked (10.4)
> >> ld: warning: dylib (/usr/local/opt/gettext/lib/libintl.dylib) was
> >> built for newer macOS version (10.14) than being linked (10.4)
> >>
> >
> > This looks related to:
> >
> https://gitlab.freedesktop.org/slirp/libslirp/-/commit/410e296a52fb274648=
f8ecf53561eaab4b33c52c
> >
> > It could be that we need to use the version information from glib (or
> from any libraries used).
> >
> > It looks safe to ignore although I re-opened:
> >  https://gitlab.freedesktop.org/slirp/libslirp/-/issues/36#note_940695
>
> I'm not generally a fan of ignoring warnings. I would prefer it if
> we understood why it was happening and how shared libraries are
> supposed to be being built.
>


I reverted the change. MacOS build can override the macosx-version-min with
CFLAGS.
See also https://gitlab.freedesktop.org/slirp/libslirp/-/issues/36 why this
was introduced.

thanks

--=20
Marc-Andr=C3=A9 Lureau

--00000000000091a3b005c443305a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 7, 2021 at 4:17 PM Pete=
r Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lin=
aro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">On Tue, 1 Jun 2021 at 12:01, Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Peter<br>
&gt;<br>
&gt; On Tue, Jun 1, 2021 at 1:17 PM Peter Maydell &lt;<a href=3D"mailto:pet=
er.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt; w=
rote:<br>
&gt;&gt;<br>
&gt;&gt; On Sat, 29 May 2021 at 19:55, &lt;<a href=3D"mailto:marcandre.lure=
au@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:=
<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; The following changes since commit 62c0ac5041e9130b041adfa13a=
41583d3c3ddd24:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/rth-git=
lab/tags/pull-tcg-20210526&#39; into staging (2021-05-28 16:25:21 +0100)<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; are available in the Git repository at:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0git@github.com:elmarco/qemu.git tags/libslirp-pul=
l-request<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; for you to fetch changes up to b060428091c758781acc4d42849acc=
c036d3c816:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 =C2=A0build-sys: make libslirp a meson subproject (2021=
-05-29 22:52:37 +0400)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -------------------------------------------------------------=
---<br>
&gt;&gt; &gt; Update libslirp &amp; make it a subproject<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -------------------------------------------------------------=
---<br>
&gt;&gt;<br>
&gt;&gt; All hosts, odd warnings on checkout and running configure:<br>
&gt;&gt;<br>
&gt;&gt; warning: unable to rmdir &#39;slirp&#39;: Directory not empty<br>
&gt;<br>
&gt;<br>
&gt; This one is from git itself. It doesn&#39;t clean up old submodule loc=
ations, even though they are actually &quot;clean&quot;. git submodule &quo=
t;(re)move&quot; has its limits I guess.<br>
<br>
Yeah, I guess we have to live with this one.<br>
<br>
&gt;&gt; make: Entering directory &#39;/home/pm/qemu/build/all&#39;<br>
&gt;&gt; config-host.mak is out-of-date, running configure<br>
&gt;&gt;=C2=A0 =C2=A0GIT=C2=A0 =C2=A0 =C2=A0ui/keycodemapdb meson tests/fp/=
berkeley-testfloat-3<br>
&gt;&gt; tests/fp/berkeley-softfloat-3 dtc capstone slirp<br>
&gt;&gt; warn: ignoring non-existent submodule slirp<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 However, I don&#39;t get this when simply running make. Maybe yo=
u run make in parallel, and config-host.mak didn&#39;t have the time to reg=
enerate with a new GIT_SUBMODULES.<br>
&gt;<br>
&gt; I wonder if we miss a dependency like &quot;git-submodule-update: conf=
ig-host.mak&quot; ?<br>
<br>
Something looks like it&#39;s still using an old list of submodules.<br></b=
lockquote><div><br></div><div>Yes, but I don&#39;t see how I could tell git=
-submodule-update until after config-host.mak is regenerated and read again=
.</div><div><br></div><div>Paolo, any idea?</div><div><br></div><div>It&#39=
;s a transient issue, similar to the git warning.</div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; Running configure before make should also prevent this from happening.=
<br>
<br>
Incremental build needs to keep working.<br>
<br></blockquote><div><br></div><div>Sure, but one-step warnings during inc=
remental build are blockers?<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt;&gt;<br>
&gt;&gt; BSD VMs: error message just before launching the VM (though the VM=
 did<br>
&gt;&gt; seem to then launch OK):<br>
&gt;&gt;<br>
&gt;&gt; Found ninja-1.8.2 at /usr/bin/ninja<br>
&gt;&gt; ninja: no work to do.<br>
&gt;&gt; (GIT=3D&quot;git&quot; &quot;/home/peter.maydell/qemu-netbsd/scrip=
ts/git-submodule.sh&quot;<br>
&gt;&gt; update ui/keycodemapdb meson tests/fp/berkeley-testfloat-3 tests/f=
p/be<br>
&gt;&gt; rkeley-softfloat-3 dtc capstone slirp)<br>
&gt;&gt; warn: ignoring non-existent submodule slirp<br>
&gt;&gt; /usr/bin/python3 -B /home/peter.maydell/qemu-netbsd/tests/vm/netbs=
d<br>
&gt;&gt; --debug=C2=A0 --jobs 8 --verbose=C2=A0 =C2=A0 --image<br>
&gt;&gt; &quot;/home/peter.maydell/.cache/qemu<br>
&gt;&gt; -vm/images/netbsd.img&quot;=C2=A0 --snapshot --build-qemu<br>
&gt;&gt; /home/peter.maydell/qemu-netbsd --<br>
&gt;&gt; DEBUG:root:Creating archive<br>
&gt;&gt; /home/peter.maydell/qemu-netbsd/build/vm-test-6kefrq76.tmp/data-f7=
06c.tar<br>
&gt;&gt; for src_dir dir: /home/peter.maydell/q<br>
&gt;&gt; emu-netbsd<br>
&gt;&gt; error: pathspec &#39;slirp&#39; did not match any file(s) known to=
 git.<br>
<br>
<br>
Maybe this is something needing updating in the &quot;create the archive&qu=
ot;<br>
script?<br></blockquote><div><br></div><div>Correct, my bad. No idea why I =
couldn&#39;t reproduce this before..</div><div><br></div><div>I guess we sh=
ould run scripts/archive-source.sh in CI.<br></div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt;<br>
&gt;&gt; clang sanitizer build: link failure:<br>
&gt;&gt; subprojects/libslirp/libslirp.so.0.3.0.p/src_arp_table.c.o: In<br>
&gt;&gt; function `arp_table_add&#39;:<br>
&gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../subproject=
s/libslirp/src/arp_table.c:51:<br>
&gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
&gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../subproject=
s/libslirp/src/arp_table.c:51:<br>
&gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
&gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../subproject=
s/libslirp/src/arp_table.c:51:<br>
&gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
&gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../subproject=
s/libslirp/src/arp_table.c:34:<br>
&gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
&gt;&gt; /home/petmay01/linaro/qemu-for-merges/build/clang/../../subproject=
s/libslirp/src/arp_table.c:34:<br>
&gt;&gt; undefined reference to `__ubsan_handle_type_mismatch_v1&#39;<br>
&gt;&gt; (and lots more similar)<br>
<br>
&gt; I don&#39;t get this=C2=A0 when running make vm-build-netbsd. What els=
e am I missing?<br>=C2=A0 <br></blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
This isn&#39;t NetBSD related, it&#39;s just a clang sanitizer build on Lin=
ux.<br></blockquote><div><br></div><div>=C2=A0</div><div>I am running confi=
gure with &#39;--enable-sanitizers&#39; --cc=3Dclang --cxx=3Dclang++ --host=
-cc=3Dclang, I can&#39;t reproduce.</div><div><br></div><div>What&#39;s you=
r distro? (or meson + clang versions)<br></div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; OSX: linker warnings linking libslirp.0.dylib:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; [34/1977] Linking target subprojects/libslirp/libslirp.0.dylib<br>
&gt;&gt; ld: warning: dylib<br>
&gt;&gt; (/usr/local/Cellar/glib/2.68.0/lib/libgthread-2.0.dylib) was built=
 for<br>
&gt;&gt; newer macOS version (10.15) than being linked (10.4)<br>
&gt;&gt; ld: warning: dylib<br>
&gt;&gt; (/usr/local/Cellar/glib/2.68.0/lib/libglib-2.0.dylib) was built fo=
r<br>
&gt;&gt; newer macOS version (10.15) than being linked (10.4)<br>
&gt;&gt; ld: warning: dylib (/usr/local/opt/gettext/lib/libintl.dylib) was<=
br>
&gt;&gt; built for newer macOS version (10.14) than being linked (10.4)<br>
&gt;&gt;<br>
&gt;<br>
&gt; This looks related to:<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/commit/410e=
296a52fb274648f8ecf53561eaab4b33c52c" rel=3D"noreferrer" target=3D"_blank">=
https://gitlab.freedesktop.org/slirp/libslirp/-/commit/410e296a52fb274648f8=
ecf53561eaab4b33c52c</a><br>
&gt;<br>
&gt; It could be that we need to use the version information from glib (or =
from any libraries used).<br>
&gt;<br>
&gt; It looks safe to ignore although I re-opened:<br>
&gt;=C2=A0 <a href=3D"https://gitlab.freedesktop.org/slirp/libslirp/-/issue=
s/36#note_940695" rel=3D"noreferrer" target=3D"_blank">https://gitlab.freed=
esktop.org/slirp/libslirp/-/issues/36#note_940695</a><br>
<br>
I&#39;m not generally a fan of ignoring warnings. I would prefer it if<br>
we understood why it was happening and how shared libraries are<br>
supposed to be being built.<br></blockquote><div><br></div><div><br></div><=
div>I reverted the change. MacOS build can override the macosx-version-min =
with CFLAGS.<br></div><div>See also <a href=3D"https://gitlab.freedesktop.o=
rg/slirp/libslirp/-/issues/36">https://gitlab.freedesktop.org/slirp/libslir=
p/-/issues/36</a> why this was introduced. <br></div></div><br clear=3D"all=
"><div>thanks</div><div><br></div><div>-- <br><div dir=3D"ltr" class=3D"gma=
il_signature">Marc-Andr=C3=A9 Lureau<br></div></div></div>

--00000000000091a3b005c443305a--

